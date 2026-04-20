<p align="center">
    <img src="https://readme-typing-svg.demolab.com?font=Capriola&size=40&duration=4000&pause=450&color=F70069&background=FFFFAA00&center=true&random=false&width=600&height=100&lines=XYZ+STORE+AUTOSCRIPT+!;Explore+the+world+of+features!" />
  </p>

  ---

  ## ⚙️ PERSIAPAN VPS (OPSIONAL — REINSTALL OS)

  > Gunakan salah satu perintah di bawah jika ingin reinstall OS VPS terlebih dahulu.

  **Debian 10**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 10 && reboot
  ```

  **Debian 11**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 11 && reboot
  ```

  **Debian 12**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 12 && reboot
  ```

  **Ubuntu 20.04**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 20.04 && reboot
  ```

  **Ubuntu 22.04**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 22 && reboot
  ```

  **Ubuntu 24.04**
  ```bash
  curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 24.04 && reboot
  ```

  ---

  ## 🚀 LANGKAH INSTALL SCRIPT

  ### Langkah 1 — Pastikan OS yang didukung
  - Ubuntu 20.04 / 22.04 / 24.04
  - Debian 10 / 11 / 12

  ### Langkah 2 — Daftarkan IP VPS
  > IP VPS kamu harus terdaftar terlebih dahulu sebelum bisa install.
  > Hubungi admin untuk mendaftarkan IP VPS kamu.

  ### Langkah 3 — Jalankan perintah install

  ```bash
  apt update -y && apt install -y wget curl && wget -q https://raw.githubusercontent.com/xyzstoree/v7/main/setup.sh && chmod +x setup.sh && ./setup.sh
  ```

  ### Langkah 4 — Ikuti proses instalasi
  Setelah script berjalan, kamu akan diminta:
  1. **Pilih domain** — gunakan domain sendiri atau domain random otomatis
  2. **Tunggu proses instalasi** selesai (estimasi 5–15 menit tergantung koneksi VPS)
  3. Setelah selesai, **informasi akun dan port** akan ditampilkan

  ---

  ## 🔄 PERINTAH UPDATE SCRIPT

  ```bash
  wget -q https://raw.githubusercontent.com/xyzstoree/v7/main/menu/update.sh && chmod +x update.sh && ./update.sh
  ```

  ---

  ## 🌐 SETTING CLOUDFLARE (WAJIB)

  ```
  SSL/TLS Mode        : Full
  SSL/TLS Recommender : OFF
  gRPC                : ON
  WebSocket           : ON
  Always Use HTTPS    : OFF
  Under Attack Mode   : OFF
  ```

  ---

  ## 📡 INFO PORT

  | Protokol | Port |
  |---|---|
  | TROJAN WS / gRPC | 443 |
  | VLESS WS / gRPC | 443 |
  | VLESS Non-TLS | 80 |
  | VMESS WS / gRPC | 443 |
  | VMESS Non-TLS | 80 |
  | SHADOWSOCKS WS / gRPC | 443 |
  | SSH WS / TLS | 443 |
  | SSH Non-TLS | 80, 8080, 8880, 2080, 2082 |
  | SlowDNS | 5300 |

  ---

  ## ✅ FITUR SCRIPT

  - ✔ Xray Core (VLESS / VMESS / Trojan / Shadowsocks)
  - ✔ SSH + OpenVPN
  - ✔ WebSocket SSH
  - ✔ SlowDNS
  - ✔ UDP Custom
  - ✔ Pointing Domain Otomatis
  - ✔ Auto Delete Expired User
  - ✔ Limit IP per Akun
  - ✔ Limit Kuota Xray
  - ✔ Tambah Swap 2 GiB
  - ✔ Auto Clear Log (setiap 10 menit)
  - ✔ fail2ban
  - ✔ Auto Block Ads
  - ✔ Bot Telegram Notifikasi

  ---

  ## 📞 KONTAK ADMIN

  <a href="https://t.me/xyztunnn" target="_blank"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=Telegram&label=Telegram&message=Click%20Here&color=blue"></a>
  
