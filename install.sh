#!/bin/bash
clear
export DEBIAN_FRONTEND=noninteractive

FONT='\033[0m'
Green="\e[92;1m"
YELLOW='\033[1;33m'
RED='\033[0;31m'W
BLUE="\033[36m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
IGreen="\033[0;92m"
OK="${LIME}--->${NC}"
EROR="${RED}[ERROR]${NC}"
BIYellow="\033[0;34m"
BICyan="\033[1;96m"
BIWhite="\033[1;97m"
GRAY="\e[1;30m"
WHITE='\033[1;37m'
LIME='\e[38;5;155m'
ungu="\e[38;5;99m"
NC='\033[0m'
TIMES="10"
CHATID="1962241851"
KEY="8681894724:AAEH_ZDs98e8rbs9_4_NXlYoDYdf2JMjEKE"
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
export IP=$( curl -sS icanhazip.com )
clear
clear && clear && clear
clear;clear;clear
echo -e "${BIWhite}----------------------------------------------------------${NC}"  
echo -e "${LIME}Script Tunneling VPN Premium Ari Project${NC}"
echo -e "${BIWhite}----------------------------------------------------------${NC}"
echo ""
sleep 2

# Cek arsitektur
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
  echo -e "${BIWhite} Your Architecture Is Supported ( ${ungu}$ARCH ${BIWhite})${NC}"
else
  echo -e "${BIWhite} Your Architecture Is Not Supported ( ${BIYellow}$ARCH ${BIWhite})${NC}"
  exit 1
fi

# Ambil info OS
OS_ID=$(grep -w ID /etc/os-release | head -n1 | cut -d= -f2 | tr -d '"')
OS_NAME=$(grep -w PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# Cek OS (tambah kali)
if [[ "$OS_ID" == "ubuntu" || "$OS_ID" == "debian" || "$OS_ID" == "kali" ]]; then
  echo -e "${BIWhite} Your OS Is Supported ( ${ungu}$OS_NAME ${BIWhite})${NC}"
else
  echo -e "${BIWhite} Your OS Is Not Supported ( ${BIYellow}$OS_NAME ${BIWhite})${NC}"
  exit 1
fi

# Cek IP
if [[ -z "$IP" ]]; then
  echo -e "${BIWhite} IP Address ( ${BIYellow}Not Detected ${BIWhite})${NC}"
else
  echo -e "${BIWhite} IP Address ( ${ungu}$IP ${BIWhite})${NC}"
fi
echo ""
#read -p "$( echo -e "${BIWhite}Tekan ${BIYellow}[ ${NC}${ungu}Enter${NC} ${BIYellow}]${NC} ${BIWhite}Untuk Memulai Pemasangan${NC}")"
echo -e "${BIWhite}Memulai pemasangan otomatis...${NC}"
sleep 2
# TAMBAH AN UNTUK KALI LINUX
if [[ "$OS_ID" == "kali" ]]; then
echo "[INFO] Kali Linux detected, installing special dependencies..."
apt install -y libcrypt-dev
apt install -y git
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
fi
echo ""
clear
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(curl -sS ipv4.icanhazip.com)

clear
MYIP=$(curl -sS ipv4.icanhazip.com)

clear
clear
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/xyzstoree/izin/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
expx=$(curl https://raw.githubusercontent.com/xyzstoree/izin/main/ip | grep $MYIP | awk '{print $3}')
echo "$expx" >/usr/bin/e
username=$(cat /usr/bin/user)
#oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/xyzstoree/izin/main/ip | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi

clear
REPO="https://raw.githubusercontent.com/xyzstoree/v7/main/"
start=$(date +%s)
secs_to_human() {
echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
function print_ok() {
echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
echo -e "${BIWhite}┌──────────────────────────────────────┐${NC}"
echo -e "${BIYellow}» $1 ${NC}"
echo -e "${BIWhite}└──────────────────────────────────────┘${NC}"
sleep 1
}
function print_error() {
echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}
function print_success() {
if [[ 0 -eq $? ]]; then
echo -e "${BIWhite}┌──────────────────────────────────────┐${NC}"
echo -e "${LIME}» $1 berhasil dipasang ${NC}"
echo -e "${BIWhite}└──────────────────────────────────────┘${NC}"
sleep 2
fi
}
function is_root() {
if [[ 0 == "$UID" ]]; then
print_ok "Root user Start installation process"
else
print_error "The current user is not the root user, please switch to the root user and run the script again"
fi
}
print_install "Membuat direktori xray"
mkdir -p /etc/xray
curl -s ifconfig.me > /etc/xray/ipvps
touch /etc/xray/domain
mkdir -p /var/log/xray
chown www-data.www-data /var/log/xray
chmod +x /var/log/xray
touch /var/log/xray/access.log
touch /var/log/xray/error.log
mkdir -p /var/lib/kyt >/dev/null 2>&1
while IFS=":" read -r a b; do
case $a in
"MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
"Shmem") ((mem_used+=${b/kB}))  ;;
"MemFree" | "Buffers" | "Cached" | "SReclaimable")
mem_used="$((mem_used-=${b/kB}))"
;;
esac
done < /proc/meminfo
Ram_Usage="$((mem_used / 1024))"
Ram_Total="$((mem_total / 1024))"
export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
export Kernel=$( uname -r )
export Arch=$( uname -m )
export IP=$( curl -s https://ipinfo.io/ip/ )
function first_setup(){
timedatectl set-timezone Asia/Jakarta
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
print_success "Directory Xray"
# upgrade force
apt upgrade -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold"
apt install -y xxd bzip2 wget curl sudo jq lsof socat net-tools bc coreutils build-essential bsdmainutils screen dos2unix openvpn
apt dist-upgrade -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold"
update-grub
# upgrade force
apt install -y --no-install-recommends software-properties-common
apt install haproxy -y
apt install dos2unix -y
apt install sudo -y
}
clear
function nginx_install() {
    clear
    print_install "Memasang Nginx & konfigurasinya"
    apt install nginx -y
    cat <<EOL | sudo tee /etc/nginx/mime.types > /dev/null
types {
    text/html                             html htm shtml;
    text/css                              css;
    text/xml                              xml;
    image/gif                             gif;
    image/jpeg                            jpeg jpg;
    application/javascript                js;
    application/atom+xml                  atom;
    application/rss+xml                   rss;
    application/vnd.ms-fontobject         eot;
    font/ttf                              ttf;
    font/opentype                         otf;
    font/woff                             woff;
    font/woff2                            woff2;
    application/octet-stream              bin exe dll;
    application/x-shockwave-flash         swf;
    application/pdf                       pdf;
    application/json                      json;
    application/zip                       zip;
    application/x-7z-compressed           7z;
}
EOL
}
function base_package() {
clear
print_install "Memasang Paket Dasar"
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt install -y at zip pwgen openssl htop netcat-openbsd socat cron bash-completion figlet ruby wondershaper
gem install lolcat
apt install -y iptables iptables-persistent
apt install -y ntpdate chrony
ntpdate pool.ntp.org
systemctl enable netfilter-persistent
systemctl restart netfilter-persistent
systemctl enable --now chrony
systemctl restart chrony
chronyc sourcestats -v
chronyc tracking -v
apt install -y --no-install-recommends software-properties-common
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
apt install -y \
  speedtest-cli vnstat libnss3-dev libnspr4-dev pkg-config libpam0g-dev \
  libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools \
  libevent-dev bc rsyslog dos2unix zlib1g-dev libssl-dev libsqlite3-dev sed dirmngr \
  libxml-parser-perl build-essential gcc g++ python3 htop lsof tar wget  curl git \
  unzip p7zip-full libc6 util-linux msmtp-mta ca-certificates bsd-mailx \
  netfilter-persistent net-tools gnupg lsb-release cmake screen xz-utils apt-transport-https dnsutils jq easy-rsa
apt clean
apt autoremove -y
apt remove --purge -y exim4 ufw firewalld
print_success "Paket Dasar"
}
function pasang_domain() {
clear

# 🔥 CEK DOMAIN SUDAH ADA
if [[ -s /root/domain ]]; then
domain=$(cat /root/domain)

echo -e "${BIWhite}Domain terdeteksi: ${ungu}$domain${NC}"
echo -e "${BIWhite}Menggunakan domain lama...${NC}"
sleep 2

# 🔥 AUTO APPLY KE SEMUA FILE
echo "IP=" > /var/lib/kyt/ipvps.conf
echo $domain > /etc/xray/domain
echo $domain > /root/domain

echo -e "${BIWhite}Konfigurasi domain berhasil di-sync${NC}"
sleep 2
return
fi

print_install "Silahkan Atur Domain Anda"
echo -e "${BIWhite}┌──────────────────────────────────────┐${NC}"
echo -e "${LIME}Setup domain Menu ${NC}"
echo -e "${BIWhite}└──────────────────────────────────────┘${NC}"
echo -e "${LIME}[${BIWhite}01${LIME}]${BIWhite} Menggunakan Domain Sendiri${NC}"
echo -e "${LIME}[${BIWhite}02${LIME}]${BIWhite} Menggunakan Domain Bawaan Dari Script${NC}"
echo -e "${BIWhite}└──────────────────────────────────────┘${NC}"
echo -e ""

while true; do
read -p "Silahkan Pilih Opsi 1 Atau 2: " host
echo ""

if [[ $host == "1" ]]; then
read -p "Silahkan Masukan Domain Mu: " host1

echo "IP=" > /var/lib/kyt/ipvps.conf
echo $host1 > /etc/xray/domain
echo $host1 > /root/domain

echo -e "${BIWhite}Subdomain $host1 berhasil diatur${NC}"
break

elif [[ $host == "2" ]]; then
echo -e "${BIWhite}Mengatur Subdomain otomatis...${NC}"
wget -q ${REPO}limit/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cloudflare

# ambil domain hasil script cf.sh (kalau disimpan di /root/domain)
domain=$(cat /root/domain)

echo "IP=" > /var/lib/kyt/ipvps.conf
echo $domain > /etc/xray/domain

echo -e "${BIWhite}Subdomain berhasil diatur${NC}"
break

else
echo -e "${RED}Pilihan tidak valid!${NC}"
fi
done

print_success "Hore Domain Mu"
}
clear
restart_system(){
USRSC=$(curl -sS https://raw.githubusercontent.com/xyzstoree/izin/main/ip | grep $MYIP | awk '{print $2}')
EXPSC=$(curl -sS https://raw.githubusercontent.com/xyzstoree/izin/main/ip | grep $MYIP | awk '{print $3}')
TIMEZONE=$(printf '%(%H:%M:%S)T')
TEXT="
<code>────────────────────</code>
<b> ❇️AUTOSCRIPT PREMIUM❇️</b>
<code>────────────────────</code>
🏷️ » <code>Client :</code><code>$username</code>
🏷️ » <code>Domain :</code><code>$domain</code>
🏷️ » <code>IP VPS :</code><code>$IP</code>
<code>────────────────────</code>
<b> SCRIPT NOTIF </b>
<code>────────────────────</code>
<i>Automatic Notifications From Github</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://t.me/BangToyibbz"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
clear
function pasang_ssl() {
clear
print_install "Memasang SSL Pada Domain"
rm -rf /etc/xray/xray.key
rm -rf /etc/xray/xray.crt
domain=$(cat /root/domain)
STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
systemctl stop $STOPWEBSERVER
systemctl stop nginx
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key
print_success "SSL Certificate"
}
function make_folder_xray() {
rm -rf /etc/vmess/.vmess.db
rm -rf /etc/vless/.vless.db
rm -rf /etc/trojan/.trojan.db
rm -rf /etc/shadowsocks/.shadowsocks.db
rm -rf /etc/ssh/.ssh.db
rm -rf /etc/bot/.bot.db
mkdir -p /etc/bot
mkdir -p /etc/xray
mkdir -p /etc/vmess
mkdir -p /etc/vless
mkdir -p /etc/trojan
mkdir -p /etc/shadowsocks
mkdir -p /etc/ssh
mkdir -p /usr/bin/xray/
mkdir -p /var/log/xray/
mkdir -p /var/www/html
mkdir -p /etc/kyt/limit/vmess/ip
mkdir -p /etc/kyt/limit/vless/ip
mkdir -p /etc/kyt/limit/trojan/ip
mkdir -p /etc/kyt/limit/ssh/ip
mkdir -p /etc/limit/vmess
mkdir -p /etc/limit/vless
mkdir -p /etc/limit/trojan
mkdir -p /etc/limit/ssh
chmod +x /var/log/xray
touch /etc/xray/domain
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /etc/vmess/.vmess.db
touch /etc/vless/.vless.db
touch /etc/trojan/.trojan.db
touch /etc/shadowsocks/.shadowsocks.db
touch /etc/ssh/.ssh.db
touch /etc/bot/.bot.db
echo "& plughin Account" >>/etc/vmess/.vmess.db
echo "& plughin Account" >>/etc/vless/.vless.db
echo "& plughin Account" >>/etc/trojan/.trojan.db
echo "& plughin Account" >>/etc/shadowsocks/.shadowsocks.db
echo "& plughin Account" >>/etc/ssh/.ssh.db
}
function install_xray() {
clear
print_install "Core Xray Latest Version"
domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
chown www-data.www-data $domainSock_dir
#latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
#bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version $latest_version
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version 25.8.31
wget  -O /etc/xray/config.json "${REPO}limit/config.json" >/dev/null 2>&1
wget  -O /etc/systemd/system/runn.service "${REPO}limit/runn.service" >/dev/null 2>&1
domain=$(cat /etc/xray/domain)
IPVS=$(cat /etc/xray/ipvps)
print_success "Core Xray Latest Version"
clear
curl -s ipinfo.io/city >>/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >>/etc/xray/isp
print_install "Memasang Konfigurasi Packet"
wget  -O /etc/haproxy/haproxy.cfg "${REPO}limit/haproxy.cfg" >/dev/null 2>&1
wget  -O /etc/nginx/conf.d/xray.conf "${REPO}limit/xray.conf" >/dev/null 2>&1
sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
curl ${REPO}limit/nginx.conf > /etc/nginx/nginx.conf
cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
chmod +x /etc/systemd/system/runn.service
rm -rf /etc/systemd/system/xray.service.d
cat >/etc/systemd/system/xray.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF
print_success "Konfigurasi Packet"
}
function ssh(){
clear
print_install "Memasang Password SSH"
wget  -O /etc/pam.d/common-password "${REPO}limit/password"
chmod +x /etc/pam.d/common-password
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "
cd
# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
print_success "Password SSH"
}
function udp_mini(){
clear
print_install "Memasang Service Limit Quota"
wget  ${REPO}limit/limit.sh && chmod +x limit.sh && ./limit.sh
cd
wget  -q -O /usr/bin/limit-ip "${REPO}limit/limit-ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit-ip
cd
clear
cat >/etc/systemd/system/vmip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vmip
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vmip
systemctl enable vmip
cat >/etc/systemd/system/vlip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vlip
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vlip
systemctl enable vlip
cat >/etc/systemd/system/trip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip trip
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart trip
systemctl enable trip
mkdir -p /usr/local/kyt/
wget  -q -O /usr/local/kyt/udp-mini "${REPO}limit/udp-mini"
chmod +x /usr/local/kyt/udp-mini
wget  -q -O /etc/systemd/system/udp-mini-1.service "${REPO}limit/udp-mini-1.service"
wget  -q -O /etc/systemd/system/udp-mini-2.service "${REPO}limit/udp-mini-2.service"
wget  -q -O /etc/systemd/system/udp-mini-3.service "${REPO}limit/udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
print_success "Limit Quota Service"
}
function ssh_slow(){
clear
print_install "Memasang modul SlowDNS Server"
wget  -q -O /tmp/nameserver "${REPO}limit/nameserver" >/dev/null 2>&1
chmod +x /tmp/nameserver
bash /tmp/nameserver | tee /root/install.log
print_success "SlowDNS"
}
clear
function ins_SSHD(){
clear
print_install "Memasang SSHD"
wget  -q -O /etc/ssh/sshd_config "${REPO}limit/sshd" >/dev/null 2>&1
chmod 700 /etc/ssh/sshd_config
systemctl restart ssh
/etc/init.d/ssh status
print_success "SSHD"
}
clear
function ins_dropbear(){
clear
print_install "Menginstall Dropbear"
apt install dropbear -y
wget  -q -O /etc/default/dropbear "${REPO}limit/dropbear.conf"
chmod +x /etc/default/dropbear
systemctl restart dropbear
/etc/init.d/dropbear status
print_success "Dropbear"
}
clear
function ins_vnstat(){
clear
print_install "Menginstall Vnstat"
apt -y install vnstat > /dev/null 2>&1
systemctl restart vnstat
apt -y install libsqlite3-dev > /dev/null 2>&1
wget  https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
systemctl restart vnstat
/etc/init.d/vnstat status
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
print_success "Vnstat"
}
function ins_openvpn(){
clear
print_install "Menginstall OpenVPN"
wget  ${REPO}limit/openvpn &&  chmod +x openvpn && ./openvpn
systemctl restart openvpn
print_success "OpenVPN"
}
function ins_backup(){
clear
print_install "Memasang Backup Server"
apt install rclone -y
printf "q\n" | rclone config
wget  -O /root/.config/rclone/rclone.conf "${REPO}limit/rclone.conf"
cd /bin
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat <<EOF > /etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user oceantestdigital@gmail.com
from oceantestdigital@gmail.com
password jokerman77
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
wget  -q -O /etc/ipserver "${REPO}limit/ipserver" && bash /etc/ipserver
print_success "Backup Server"
}
clear
function ins_swab(){
clear
print_install "Memasang Swap 1 G"
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile >/dev/null 2>&1
swapon /swapfile >/dev/null 2>&1
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
chronyd -q 'server 0.id.pool.ntp.org iburst'
chronyc sourcestats -v
chronyc tracking -v
wget  ${REPO}limit/bbr.sh &&  chmod +x bbr.sh && ./bbr.sh
print_success "Swap 1 G"
}
function ins_Fail2ban(){
clear
print_install "Menginstall Fail2ban"
apt update -y 
apt install -y fail2ban 
systemctl enable --now fail2ban 
systemctl restart fail2ban 
clear
echo "Banner /etc/kyt.txt" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/kyt.txt"@g' /etc/default/dropbear
wget  -O /etc/kyt.txt "${REPO}limit/issue.net"
print_success "Fail2ban"
}
function ins_epro(){
clear
print_install "Menginstall ePro WebSocket Proxy"
wget  -O /usr/bin/ws "${REPO}limit/ws" >/dev/null 2>&1
wget  -O /usr/bin/tun.conf "${REPO}limit/tun.conf" >/dev/null 2>&1
wget  -O /etc/systemd/system/ws.service "${REPO}limit/ws.service" >/dev/null 2>&1
chmod +x /etc/systemd/system/ws.service
chmod +x /usr/bin/ws
chmod 644 /usr/bin/tun.conf
systemctl disable ws
systemctl stop ws
systemctl enable ws
systemctl start ws
systemctl restart ws
wget  -q -O /usr/local/share/xray/geosite.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat" >/dev/null 2>&1
wget  -q -O /usr/local/share/xray/geoip.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat" >/dev/null 2>&1
wget  -O /usr/sbin/ftvpn "${REPO}limit/ftvpn" >/dev/null 2>&1
chmod +x /usr/sbin/ftvpn
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
cd
apt autoclean -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
print_success "ePro WebSocket Proxy"
}
function install_plugin(){
wget  -q ${REPO}limit/plugin-lite && chmod +x plugin-lite && ./plugin-lite
rm plugin-lite
}
function ins_restart(){
clear
print_install "Restarting  All Packet"
systemctl restart nginx
systemctl restart openvpn
systemctl restart ssh
systemctl restart dropbear
systemctl restart fail2ban
systemctl restart vnstat
systemctl restart haproxy
systemctl restart cron
systemctl daemon-reload
systemctl start netfilter-persistent
systemctl enable --now nginx
systemctl enable --now xray
systemctl enable --now rc-local
systemctl enable --now dropbear
systemctl enable --now openvpn
systemctl enable --now cron
systemctl enable --now haproxy
systemctl enable --now netfilter-persistent
systemctl enable --now ws
systemctl enable --now fail2ban
history -c
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/openvpn
rm -f /root/key.pem
rm -f /root/cert.pem
print_success "All Packet"
}
function menu(){
clear
print_install "Memasang Menu Packet"
rm -f menu.zip
wget  ${REPO}limit/menu.zip
7z x menu.zip -p'coding_sendiri_lah_goblok_cuman_bisa_nyuri'
chmod +x menu/*
mv -f menu/* /usr/local/sbin/
dos2unix /usr/local/sbin/install-plugin 2>/dev/null
rm -rf menu menu.zip update.sh
}
function profile(){
clear
cat >/root/.profile <<EOF
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
menu
EOF
cat >/etc/cron.d/xp_all <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/local/sbin/xp
END
cat >/etc/cron.d/logclean <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/20 * * * * root /usr/local/sbin/clearlog
END
chmod 644 /root/.profile
cat >/etc/cron.d/daily_reboot <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3 * * * root /sbin/reboot
END
echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >>/etc/cron.d/log.xray
service cron restart
cat >/home/daily_reboot <<-END
3
END
cat >/etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
EOF

echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
cat >/etc/rc.local <<EOF
#!/bin/sh -e
# rc.local
# By default this script does nothing.
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
systemctl restart netfilter-persistent
exit 0
EOF

    chmod +x /etc/rc.local
    
    AUTOREB=$(cat /home/daily_reboot)
    SETT=11
    if [ $AUTOREB -gt $SETT ]; then
        TIME_DATE="PM"
    else
        TIME_DATE="AM"
    fi
print_success "Menu Packet"
}
function enable_services(){
clear
print_install "Enable Service"
systemctl daemon-reload
systemctl start netfilter-persistent
systemctl enable --now rc-local
systemctl enable --now cron
systemctl enable --now netfilter-persistent
systemctl restart nginx
systemctl restart xray
systemctl restart cron
systemctl restart haproxy
print_success "Enable Service"
clear
}
function instal(){
clear
first_setup
nginx_install
base_package
make_folder_xray
pasang_domain
password_default
pasang_ssl
install_xray
ssh
udp_mini
ssh_slow
ins_SSHD
ins_dropbear
ins_vnstat
ins_openvpn
ins_backup
ins_swab
ins_Fail2ban
ins_epro
install_plugin
ins_restart
menu
profile

restart_system
}
function dnsxx(){
# ==========================================
# SETUP DNS
# ==========================================
sudo systemctl disable systemd-resolved > /dev/null 2>&1
sudo systemctl stop systemd-resolved > /dev/null 2>&1
sudo rm -rf /etc/resolv.config > /dev/null 2>&1
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf
sudo chattr +i /etc/resolv.conf > /dev/null 2>&1
sudo systemctl start systemd-resolved > /dev/null 2>&1
sudo systemctl enable systemd-resolved > /dev/null 2>&1
}
instal
echo ""
function dropbear2019(){
wget  -q -O /etc/dropbear2019 "${REPO}limit/dropbear2019" >/dev/null 2>&1
chmod +x /etc/dropbear2019
bash /etc/dropbear2019
}
echo ""
print_install "Changing Dropbear Version"
dropbear2019
clear
print_success "Change Dropbear 2019 Complete"
clear
print_install "Setting Up DNS"
dnsxx
clear
print_success "DNS Setup Complete"
history -c
rm -rf /root/menu
rm -rf /root/*.zip
rm -rf /root/*.sh
rm -rf /root/LICENSE
rm -rf /root/README.md
rm -rf /root/domain
secs_to_human "$(($(date +%s) - ${start}))"
sudo hostnamectl set-hostname $username
echo -e "${green} Script Successfull Installed"
echo ""
echo -e "Menu akan dibuka..."
sleep 2
/usr/local/sbin/menu
