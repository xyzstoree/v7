<h1 align="center">Autoscript Tunneling v7</h1>

## 🚀 INSTALL SCRIPT

### 1. Persiapan Sistem

Jalankan perintah berikut untuk setup awal:

```bash
rm -f /etc/resolv.conf
touch /etc/sysctl.conf
sed -i '/disable_ipv6/d' /etc/sysctl.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p
```

---

### 2. Update Package

```bash
apt update -y && apt upgrade -y --fix-missing && apt install --reinstall wget curl screen -y
```

---

### 3. Install Script

```bash
screen -S setup-session bash -c "wget -q https://raw.githubusercontent.com/xyzstoree/v7/main/install.sh && chmod +x install.sh && ./install.sh"
```
---

### Jika koneksi terputus saat instalasi

Gunakan perintah berikut untuk masuk kembali ke session:

```bash
screen -r -d setup-session
```

---

## UPDATE SCRIPT

Untuk melakukan update ke versi terbaru, gunakan:

```bash
wget https://raw.githubusercontent.com/xyzstoree/v7/main/update.sh && chmod +x update.sh && ./update.sh
```

---

## TESTED ON OS

Script ini sudah diuji pada sistem berikut:

* Ubuntu 24.04.5 LTS
* Debian 12 (Bookworm)
* Ubuntu 20.04.5 LTS
* Debian 10 (Buster)

---

## FITUR UTAMA

* Auto swap 1GB
* Instalasi otomatis & dinamis
* Optimasi konfigurasi server
* Core Xray by @BangToyibbz
* Fail2ban security system
* Auto block sebagian iklan Indonesia
* Auto clean log tiap 3 menit
* Auto delete akun expired
* Detail user management

---

## PORT YANG DIGUNAKAN

```
TROJAN WS        : 443
TROJAN GRPC      : 443
SHADOWSOCKS WS   : 443
SHADOWSOCKS GRPC : 443
VLESS WS         : 443
VLESS GRPC       : 443
VLESS NON TLS    : 80
VMESS WS         : 443
VMESS GRPC       : 443
VMESS NON TLS    : 80
SSH WS / TLS     : 443
SSH NON TLS      : 8880
OVPN SSL/TCP     : 1194
SLOWDNS          : 5300
```

---

## SETTING CLOUDFLARE

```
SSL/TLS                : FULL
SSL/TLS Recommender    : OFF
gRPC                   : ON
WebSocket              : ON
Always Use HTTPS       : OFF
Under Attack Mode      : OFF
```

---

## SUPPORTED SYSTEM

### Debian

* 9 (Stretch) – Unstable
* 10 (Buster) – Stable
* 11 (Bullseye) – Stable
* 12 (Bookworm) – Stable
* 13 (Trixie) – Coming Soon
* 14 (Forky) – Coming Soon

### Ubuntu

* 18.04, 23.10 (various status)
* 20.04 LTS, 22.04 LTS, 24.04 LTS – Stable recommended

### Kali Linux

* Kali Rolling – Stable

---

## VIRTUALIZATION SUPPORT

* Xen
* KVM
* VMware
* XenServer
* LXC
* OpenVZ 7
* Proxmox
* Virtuozzo
* ZFS environments

---

## MINIMUM REQUIREMENTS

* RAM: 512MB
* SSD: 10GB
* CPU: 1 vCPU

---

## RECOMMENDED SPEC

* 1 vCPU
* 1GB RAM
* 10GB SSD
* Ubuntu / Debian LTS version

---

## ARCHITECTURE

* x86_64 (64-bit) ✅ Supported
* ARM / i386 ❌ Not supported

---

## CONTACT & AUTHOR

<p align="center">
<a href="https://t.me/BangToyibbz"><img src="https://img.shields.io/badge/Telegram-Contact-blue?style=for-the-badge&logo=telegram"></a>
</p>

<p align="center">
<a href="wa.me/6285960592386"><img src="https://img.shields.io/badge/WhatsApp-Contact-green?style=for-the-badge&logo=whatsapp"></a>
</p>
```

