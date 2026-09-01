# P3NR — GitHub Pages + Supabase

Versi ini memakai GitHub Pages sebagai website dan Supabase sebagai database online.

## 1. Buat project Supabase

Buat satu project baru di Supabase.

## 2. Buat database

Buka **SQL Editor** di Supabase, lalu jalankan seluruh isi `schema.sql`.

## 3. Buat akun petugas

Di **Authentication > Users**, buat user dengan email dan password. Pendaftaran umum tidak dipakai oleh aplikasi.

## 4. Isi konfigurasi

Buka `supabase-config.js`, lalu ganti:

- `YOUR_SUPABASE_PROJECT_URL` dengan Project URL.
- `YOUR_SUPABASE_PUBLISHABLE_KEY` dengan Publishable/anon key.

Jangan masukkan `service_role` key ke file ini.

## 5. Upload ke GitHub

Upload minimal:

- `index.html`
- `supabase-config.js`
- `.nojekyll`
- `schema.sql` (boleh disimpan untuk dokumentasi; tidak dibutuhkan website)

Aktifkan **Settings > Pages > Deploy from a branch > main > /(root)**.

## 6. Cara kerja

Jika `supabase-config.js` masih berisi placeholder, aplikasi berjalan dalam mode lokal browser.

Jika konfigurasi Supabase sudah benar, aplikasi menampilkan halaman login dan data register disimpan pada database Supabase sehingga dapat diakses dari perangkat yang berbeda setelah login.

## Catatan keamanan

RLS pada `schema.sql` hanya memberikan akses database kepada user yang sudah login. Jangan pernah memasukkan `service_role` key ke website.

Karena data register dapat berisi NIK dan data pribadi, repository publik sebaiknya hanya berisi kode aplikasi dan konfigurasi publishable key, bukan file backup JSON atau dokumen warga.
