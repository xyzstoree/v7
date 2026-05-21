# Bug-Fix Pass: Account Management (create/trial/renew/delete/lock/unlock)

Branch ini memperbaiki sekelompok bug serius di skrip pengelolaan akun di
`limit/menu.zip`. Source per-file tersedia di `limit/menu-src/` (di-zip ulang
ke `limit/menu.zip` saat dibuild — install.sh tetap meng-extract dari zip).

## 🔴 Bug Kritis Yang Diperbaiki

| # | Bug | File Asli | Perbaikan |
|---|-----|-----------|-----------|
| 1 | Lock/Unlock VLESS/Trojan/Vmess **tidak berfungsi** dan UNLOCK **merusak xray** karena memakai prefix komentar JSONC tidak valid (`#&` / `#!` / `###`) sebagai pengganti `//vl` / `//tr` / `//vm` yang sebenarnya dipakai oleh skrip create. | `m-vless`, `m-trojan`, `m-vmess` | Semua fungsi `lock` / `unlock` / `modify_uuid` / `change` sekarang memakai prefix yang sama dengan skrip `add*`. Ditambah idempotency-check, regex-escape, dan force-disconnect. |
| 2 | `renewssh` **memperpendek** masa aktif (reset ke `today + N`) bukan memperpanjang dari sisa exp. | `renewssh` | Ambil exp lama via `chage`, clamp ke `today` kalau sudah expired, lalu tambah `N` hari. Plus update `.ssh.db`. |
| 3 | Renew VLESS/Trojan/Vmess akun yang sudah expired menghasilkan exp **negatif** → akun tetap expired setelah renew. | `renewvless`, `renewtr`, `renewws` | Clamp `exp2 >= 0`. |
| 4 | `delws` menjalankan `rm -rf /etc/kyt/limit/vmess/ip` (TANPA `/$user`) → **menghapus folder limit IP semua user vmess**. | `delws` | `rm -f /etc/kyt/limit/vmess/ip/$user` saja, plus guard username valid. |
| 5 | `deltr` `sed range` di `.trojan.db` tidak menemukan baris `},{`, sehingga **menghapus semua entry setelah user yang dihapus**. | `deltr` | Single-line delete dengan anchor end-of-line. |
| 6 | Sed pattern di seluruh `del*` / `renew*` / `lock_*` cocok ke partial-match → menghapus user `tes` juga ikut menghapus `testing`. | semua del/renew/lock | Anchor regex ke end-of-line dan exp; escape karakter regex-special di `$user`/`$exp`. |
| 7 | `tendang` (autokill multilogin) menjalankan `userdel -f $user` (dengan `$user` tidak terdefinisi awalnya, lalu loop iterator terakhir) ditambah `service ssh restart` setiap eksekusi cron → **menghapus user permanen** dan memutus SEMUA user SSH lain setiap menit. | `tendang` | Hanya `kill -KILL <PID>` per sesi yang melanggar; tidak ada `userdel`, tidak ada `service ssh restart`. |

## 🟠 Bug Serius Yang Diperbaiki

- **Trial SSH password hardcoded `Pass=1`** → sekarang random 8 karakter alfanumerik (`trial`).
- **Trial username hanya 3 digit** (~1000 kemungkinan, tabrakan rawan) → 6 karakter alfanumerik + retry kalau bertabrakan (`trial`, `trialvless`, `trialtr`, `trialws`, `trialss`).
- **Trial Telegram curl dengan `$TEXT` masih kosong** → curl awal dihapus, hanya curl setelah `$TEXT` di-set yang dieksekusi (`trialvless`).
- **Inkonsistensi prefix DB** antara `add*` dan `trial*` (mis. addvless: `###`, trialvless: `#&`) → semua trial sekarang pakai `###` sehingga listing/cek/lock konsisten.
- **`addssh` tidak cek user existing** → tambah `id -u` check + validasi input (alfanumerik + non-empty password + numeric expired days).
- **`delssh` tidak bersih-bersih** → sekarang `pkill -KILL -u` dulu, `userdel -r`, lalu hapus `/etc/ssh/$user`, `/etc/kyt/limit/ssh/ip/$user`, `/var/www/html/ssh-$user.txt`, dan baris `.ssh.db`.
- **`delexp` quoting & path log salah** (`echo "echo "..."" >> /usr/local/bin/alluser`) → log dipindah ke `/var/log/xyz/`, quoting benar, plus cleanup file pendukung SSH.
- **`delss` tidak panggil `systemctl reload xray` & tidak update DB** → keduanya ditambahkan.
- **Renew VLESS/Trojan menulis ke path DB salah** (`/root/akun/vless/.vless.conf`, `/root/akun/trojan/.trojan.conf`) → diarahkan ke path yang benar `/etc/{vless,trojan,vmess}/.X.db`.
- **Unlock VMess** otomatis generate UUID baru kalau user tidak ditemukan di DB → memutus client. Sekarang refuse + tampilkan error jelas.
- **Unlock tidak idempoten** → cek dulu apakah user masih ada di config, baru insert.
- **`addtr` & `addss` melakukan `systemctl reload xray` 2x** dalam satu eksekusi → konsolidasi ke 1x di akhir.
- **`service cron restart` yang tidak relevan** dipanggil di `addtr`, `addws`, `addss`, `trialtr`, `trialws`, `trialss` (job `at` dilayani `atd`, bukan cron) → dihapus.
- **`kill-xray-user` dengan `ps aux | grep $user | kill -9`** berbahaya (bisa membunuh proses tidak terkait) dan tidak efektif untuk akun xray (xray = single process) → diganti wrapper ke `xyz-disconnect-user`.

## ✨ Fitur Baru: Force-Disconnect Tanpa Restart Xray

**Alasan:** `systemctl reload xray` tidak memutus koneksi TCP yang sudah
authenticated. User trial yang expired tetap connected sampai client putus
sendiri — bug yang dilaporkan customer.

Solusi: 2 helper baru di `/usr/local/sbin/`:

### `xyz-disconnect-user <user> [proto]`

Memutus paksa socket TCP user TANPA me-restart xray:
- Baca daftar IP user dari `/etc/kyt/limit/<proto>/ip/<user>`.
- Untuk tiap IP: `ss -K dst <ip>` (kernel ≥ 4.9 — kebanyakan VPS modern OK).
- Untuk user OS (SSH): `pkill -KILL -u $user`.

Hasil: hanya IP user target yang putus; user lain tidak terganggu. Setelah
`systemctl reload xray`, user yang reconnect dari IP yang sama akan ditolak
(config sudah update).

### `xyz-trial-cleanup <proto> <user> <exp>`

Helper terpadu untuk at-job ekspirasi trial. Sebelumnya at-job berisi
inline `sed` yang harus di-escape 4 level (bash → at spool → sh → sed) dan
salah escape menyebabkan partial-match. Sekarang at-job cuma:

```bash
echo "/usr/local/sbin/xyz-trial-cleanup vless 'USER' 'EXP'" | at now + 30 minutes
```

Helper akan:
1. Hapus dari `/etc/xray/config.json` (anchored).
2. Hapus dari DB protokol terkait.
3. Cleanup file pendukung (limit IP, quota, html).
4. Force-disconnect via `xyz-disconnect-user`.
5. `systemctl reload xray`.

## ⚠️ Tindakan Manual Yang Masih Disarankan

Bot Telegram secondary (KEY2/CHATID2 untuk notif transaksi) masih hardcoded
di `addssh`, `addvless`, `addtr`, `addws`. Token tersebut sudah ter-commit
di public history → secara teknis ter-leak. Disarankan:

1. Revoke token via `@BotFather` di Telegram.
2. Pindahkan ke file config seperti `/etc/bot/.bot2.db` (analog dengan
   `#bot#` untuk bot utama).
3. Force-rewrite git history untuk menghapus token lama.

Saya **tidak** mengubah ini di PR ini karena:
- Butuh koordinasi dengan Anda untuk revoke token dulu.
- Force-rewrite history butuh persetujuan eksplisit.

## Files Modified

- `limit/menu.zip` (binary; dibuild dari `limit/menu-src/`)
- `limit/menu-src/` (folder baru — source asli per-file untuk review)
