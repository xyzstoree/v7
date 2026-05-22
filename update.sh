#!/bin/bash
# update.sh
#
# FIX:
#   - unzip tanpa -P → semua entry di-skip dengan "unable to get password"
#     (zip pakai ZipCrypto password, sama dengan install.sh). Akibatnya
#     menu/ kosong, mv gagal sunyi, dan progress bar jalan selamanya.
#     Sekarang pakai -P + cek ulang isi setelah extract.
#   - wget tanpa timeout → bisa hang tanpa batas saat koneksi bermasalah.
#     Sekarang pakai --timeout=30 --tries=2 dengan log file.
#   - fun_bar menelan semua error → kalau gagal, user lihat bar terus tanpa
#     tahu apa yang salah. Sekarang error di-tulis ke /tmp/xyz-update.log
#     dan di-tampilkan kalau update gagal.
#   - touch fim DIPASTIKAN jalan walaupun command gagal — bar tidak hang
#     forever.
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
ZIP_PASS='coding_sendiri_lah_goblok_cuman_bisa_nyuri'
LOG=/tmp/xyz-update.log
: >"$LOG"
fun_bar() {
    CMD[0]="$1"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]}
        touch $HOME/fim
    ) >>"$LOG" 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    rm -rf menu menu.zip
    # wget dengan timeout agar tidak hang kalau koneksi bermasalah.
    wget --timeout=30 --tries=2 -q https://raw.githubusercontent.com/xyzstoree/v7/main/limit/menu.zip
    if [ ! -s menu.zip ]; then
        echo "FATAL: gagal download menu.zip dari GitHub" >&2
        return 1
    fi
    # unzip dengan password (zip pakai ZipCrypto, sama dengan install.sh).
    unzip -o -P "$ZIP_PASS" -q menu.zip
    # Sanity check: pastikan setidaknya 1 file ter-extract.
    if [ ! -d menu ] || [ -z "$(ls -A menu 2>/dev/null)" ]; then
        echo "FATAL: extract menu.zip gagal — folder menu/ kosong (password salah?)" >&2
        return 1
    fi
    chmod +x menu/*
    mv -f menu/* /usr/local/sbin/
    sudo dos2unix /usr/local/sbin/* 2>/dev/null || true
    rm -rf menu menu.zip update.sh
    # Auto-fix /etc/profile: hapus SEMUA referensi botapi.conf (baik yang
    # unguarded `source ...` maupun duplikat guarded yang sudah numpuk dari
    # run sebelumnya), lalu tambah satu baris guarded. Idempoten.
    # Catatan bug sebelumnya: sed `-E` dengan delimiter `\|...|` konflik
    # karena `|` adalah operator alternation di ERE; sed gagal silent
    # sehingga line unguarded tidak terhapus dan baris guarded di-append
    # berulang kali.
    if [ -f /etc/profile ] && grep -q 'botapi\.conf' /etc/profile; then
        sed -i '/botapi\.conf/d' /etc/profile
        echo '[ -r /etc/botapi.conf ] && . /etc/botapi.conf' >> /etc/profile
    fi
    # Hapus profile.d lama biar ga double
    rm -f /etc/profile.d/xyz-welcome.sh
    # Fix .profile: ganti auto-call menu jadi welcome (hanya 1 tempat yg panggil)
    if grep -q "command -v menu" /root/.profile 2>/dev/null; then
        sed -i 's|command -v menu >/dev/null 2>&1 && menu|command -v welcome >/dev/null 2>\&1 \&\& welcome|g' /root/.profile
    elif ! grep -q "command -v welcome" /root/.profile 2>/dev/null; then
        # Kalau .profile tidak ada sama sekali (fresh install baru), tambahkan
        echo 'command -v welcome >/dev/null 2>&1 && welcome' >> /root/.profile
    fi
}
netfilter-persistent
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;96m              UPDATE SCRIPT              \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar 'res1'
# Kalau ada FATAL di log, surface ke user (sebelumnya ditelan diam-diam).
if grep -q '^FATAL' "$LOG" 2>/dev/null; then
    echo ""
    echo -e "\033[0;31m  Update GAGAL. Detail error:\033[0m"
    tail -n 20 "$LOG"
    echo ""
fi
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu

###########- COLOR CODE -##############
