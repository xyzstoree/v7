#!/bin/bash
# limit.sh - FIXED: chmod absolute path + wget --max-time
REPO="${REPO:-https://raw.githubusercontent.com/xyzstoree/v7/main/}"
WGET="wget -q --timeout=15 --tries=2"

$WGET -O /etc/systemd/system/limitvmess.service       "${REPO}limit/limitvmess.service"
$WGET -O /etc/systemd/system/limitvless.service       "${REPO}limit/limitvless.service"
$WGET -O /etc/systemd/system/limittrojan.service      "${REPO}limit/limittrojan.service"
$WGET -O /etc/systemd/system/limitshadowsocks.service "${REPO}limit/limitshadowsocks.service"

$WGET -O /etc/xray/limit.vmess        "${REPO}limit/vmess"
$WGET -O /etc/xray/limit.vless        "${REPO}limit/vless"
$WGET -O /etc/xray/limit.trojan       "${REPO}limit/trojan"
$WGET -O /etc/xray/limit.shadowsocks  "${REPO}limit/shadowsocks"

# .service files do NOT need +x; only the limit scripts
chmod 0644 /etc/systemd/system/limitvmess.service \
           /etc/systemd/system/limitvless.service \
           /etc/systemd/system/limittrojan.service \
           /etc/systemd/system/limitshadowsocks.service 2>/dev/null

chmod +x /etc/xray/limit.vmess /etc/xray/limit.vless \
         /etc/xray/limit.trojan /etc/xray/limit.shadowsocks 2>/dev/null

mkdir -p /etc/kyt/limit/vmess/ip /etc/kyt/limit/vless/ip \
         /etc/kyt/limit/trojan/ip /etc/kyt/limit/shadowsocks/ip
mkdir -p /var/log/xray && touch /var/log/xray/access.log

systemctl daemon-reload
for s in limitvmess limitvless limittrojan limitshadowsocks; do
  systemctl enable --now "$s" >/dev/null 2>&1
done
