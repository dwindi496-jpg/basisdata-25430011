# Laporan Praktikum Basis Data - Pertemuan 1

Ya, **sekarang kita isi laporan Modul 1**. Struktur ini mengikuti format laporan wajib dari buku: 10 bagian, termasuk Titik Analisis 1–4 dan bukti Git. Buku_Praktikum_Basis_Data_Edisi…

Di VS Code, buka **`laporan/p01_laporan_123.md`**, lalu **tempel seluruh isi ini**:

```markdown
# Laporan Praktikum Basis Data - Pertemuan 1

**Nama:** Windi Dwi Hartati  
**NIM:** [isi NIM lengkap]  
**Kelas:** [isi kelas]  
**Tanggal:** [isi tanggal praktikum]  
**Pertemuan:** 1  
**Asisten/Dosen:** [isi nama]

## 1. Tujuan Praktikum

Praktikum Pertemuan 1 bertujuan menyiapkan lingkungan kerja basis data MariaDB menggunakan XAMPP, mengatur akun dan hak akses, menggunakan phpMyAdmin, serta menyiapkan repositori Git yang terhubung dengan GitHub.

## 2. Ringkasan Dasar Teori

MariaDB merupakan server basis data yang menerima perintah dari klien seperti command line dan phpMyAdmin. XAMPP menyediakan MariaDB, PHP, Apache, dan phpMyAdmin dalam satu lingkungan. Pada praktikum ini digunakan XAMPP 8.2.12 dengan MariaDB 10.4.32 dan phpMyAdmin 5.2.1.

Penggunaan akun dengan hak akses terbatas diperlukan agar pekerjaan pada basis data lebih terkontrol. Git digunakan untuk mencatat perubahan pekerjaan dan GitHub digunakan sebagai tempat penyimpanan repositori.

## 3. Hasil Langkah Percobaan

### 3.1 Menjalankan MariaDB

MariaDB berhasil dijalankan melalui XAMPP Control Panel. Layanan yang digunakan ditampilkan dengan label MySQL pada XAMPP, tetapi server basis data yang berjalan adalah MariaDB.

**Bukti:**  
[Tambahkan tangkapan layar XAMPP dengan MariaDB berjalan]

### 3.2 Verifikasi MariaDB

Perintah berikut digunakan untuk memeriksa versi server dan akun yang sedang digunakan:

```sql
SELECT VERSION(), CURRENT_USER();
```

Hasil yang diperoleh menunjukkan MariaDB 10.4.32 dan akun yang sedang digunakan.

**Bukti:**  
[Tambahkan tangkapan layar hasil SELECT VERSION(), CURRENT_USER()]

### 3.3 Pemeriksaan SQL Mode

Perintah yang digunakan:

```sql
SELECT @@sql_mode;
```

Hasil pemeriksaan digunakan untuk memastikan konfigurasi SQL mode server.

**Bukti:**  
[Tambahkan tangkapan layar hasil SELECT @@sql_mode]

### 3.4 Membuat Basis Data dan Akun Kerja

Basis data yang digunakan adalah:

```text
kopma_123
```

Akun kerja yang digunakan adalah:

```text
mhs_123
```

Akun kerja diberikan hak akses pada basis data `kopma_123`.

### 3.5 Pengujian Hak Akses Akun Kerja

Sebagai `mhs_123`, perintah:

```sql
SHOW DATABASES;
```

berhasil dijalankan.

Ketika mencoba:

```sql
USE mysql;
```

server menolak akses dengan ERROR 1044. Hal ini menunjukkan bahwa akun kerja tidak memiliki hak untuk menggunakan basis data sistem `mysql`.

**Bukti:**  
[Tambahkan tangkapan layar SHOW DATABASES dan ERROR 1044]

### 3.6 Pengujian Akun Dev

Akun `dev_123` dibuat dengan hak akses terbatas untuk membaca data pada basis data proyek.

Ketika akun tersebut mencoba membuat tabel:

```sql
CREATE TABLE tes_akses (
    id INT
);
```

server menolak perintah dengan ERROR 1142 karena akun tersebut tidak memiliki hak CREATE.

**Bukti:**  
[Tambahkan tangkapan layar ERROR 1142]

### 3.7 Pengaturan phpMyAdmin

Mode autentikasi phpMyAdmin diubah menjadi:

```text
cookie
```

Dengan mode cookie, pengguna harus memasukkan akun dan password ketika masuk ke phpMyAdmin.

Akun yang digunakan untuk masuk adalah:

```text
mhs_123@localhost
```

**Bukti:**  
[Tambahkan tangkapan layar halaman login phpMyAdmin dan halaman setelah berhasil masuk]

### 3.8 Verifikasi Database di phpMyAdmin

Database yang digunakan:

```text
kopma_123
```

Perintah:

```sql
SELECT DATABASE();
```

menghasilkan database aktif `kopma_123`.

**Bukti:**  
[Tambahkan tangkapan layar hasil SELECT DATABASE()]

### 3.9 Menyiapkan Git dan GitHub

Repositori lokal dibuat pada folder:

```text
basisdata-123
```

Git dikonfigurasi menggunakan nama dan email pengguna.

Repositori kemudian dihubungkan dengan GitHub:

```text
https://github.com/dwindi496-jpg/basisdata-123.git
```

Commit pertama berhasil dibuat dengan pesan:

```text
p01: inisialisasi repositori dan skrip lingkungan
```

Branch utama digunakan dengan nama:

```text
main
```

Push pertama ke GitHub berhasil dilakukan.

**Bukti:**  
[Tambahkan tangkapan layar commit dan push pertama]

## 4. Jawaban Titik Analisis

### Titik Analisis 1

**Pertanyaan:** Label tombol XAMPP bertuliskan MySQL, tetapi yang berjalan adalah MariaDB. Apa konsekuensinya ketika mencari solusi galat di internet?

**Jawaban:**

Konsekuensinya adalah solusi yang ditemukan perlu diperiksa terlebih dahulu agar sesuai dengan MariaDB yang digunakan. Dokumentasi MySQL masih dapat relevan untuk konsep dan sintaks SQL yang umum karena MariaDB memiliki banyak kesamaan dengan MySQL. Namun, untuk perilaku khusus MariaDB, versi server, fitur, dan pesan galat yang berbeda, dokumentasi MariaDB lebih tepat dijadikan rujukan.

### Titik Analisis 2

**Pertanyaan:** Mengapa ketika root diberi password, masuk tanpa opsi `-p` menghasilkan galat?

**Jawaban:**

Opsi `-p` digunakan agar klien meminta password kepada pengguna. Setelah akun root diberi password, login tanpa mengirim password menyebabkan autentikasi gagal. Galat tersebut menunjukkan bahwa server menolak akses karena informasi autentikasi yang diberikan tidak sesuai.

### Titik Analisis 3

**Pertanyaan:** Mengapa `information_schema` tetap terlihat oleh `mhs_123`, sedangkan database `mysql` ditolak dengan ERROR 1044? Apa perbedaan ERROR 1044 dengan 1045?

**Jawaban:**

`information_schema` merupakan basis data khusus yang menyediakan informasi metadata tentang server dan objek basis data sehingga dapat terlihat oleh pengguna. Sementara itu, `mysql` merupakan basis data sistem yang tidak dapat digunakan oleh akun `mhs_123` karena hak aksesnya dibatasi.

ERROR 1044 menunjukkan bahwa pengguna sudah dikenali tetapi tidak memiliki hak untuk mengakses database yang diminta. Sedangkan ERROR 1045 berkaitan dengan kegagalan autentikasi, misalnya username atau password tidak sesuai.

### Titik Analisis 4

**Pertanyaan:** Mengapa mode cookie lebih aman daripada mode config pada phpMyAdmin?

**Jawaban:**

Mode cookie meminta pengguna memasukkan kredensial saat login sehingga password tidak disimpan langsung di dalam konfigurasi phpMyAdmin. Pada mode config, informasi autentikasi disimpan dalam berkas konfigurasi sehingga orang yang dapat membaca berkas tersebut berpotensi mengetahui kredensial. Oleh karena itu, mode cookie lebih sesuai untuk lingkungan praktikum yang membutuhkan login pengguna secara langsung.

## 5. Hasil Latihan dan Modifikasi

Hasil latihan Modul 1 adalah:

1. MariaDB berhasil dijalankan melalui XAMPP.
2. Akun root berhasil diamankan dengan password.
3. Database `kopma_123` berhasil dibuat.
4. Akun kerja `mhs_123` berhasil dibuat dan diberi hak akses pada database `kopma_123`.
5. Akun `dev_123` berhasil dibuat dengan hak akses terbatas.
6. Pembatasan hak akses berhasil diuji dengan ERROR 1044 dan ERROR 1142.
7. phpMyAdmin berhasil menggunakan autentikasi cookie.
8. Repositori Git berhasil dibuat dan dihubungkan dengan GitHub.

## 6. Tugas Mandiri: Milestone Proyek 1

Milestone proyek yang telah disiapkan:

- Database: `kopma_123`
- Akun kerja: `mhs_123`
- Akun pengembang: `dev_123`
- Folder proyek: `basisdata-123`
- File SQL: `p01_lingkungan_123.sql`
- README: `README.md`
- Repositori GitHub: `basisdata-123`

File SQL menyimpan struktur dasar pembuatan database dan akun kerja tanpa menyimpan password asli.

## 7. Pembahasan dan Kendala

Pada praktikum ini terdapat beberapa bagian yang perlu diperhatikan, terutama perbedaan antara MariaDB dan label MySQL pada XAMPP serta perbedaan jenis kode galat.

Kendala yang ditemui adalah pengaturan akses phpMyAdmin setelah password root dibuat. Masalah tersebut diselesaikan dengan mengubah metode autentikasi phpMyAdmin menjadi cookie.

Selain itu, pengujian akun kerja dan akun dev membantu memastikan bahwa setiap akun hanya dapat melakukan operasi sesuai hak akses yang diberikan.

## 8. Kesimpulan

Praktikum Pertemuan 1 berhasil menyiapkan lingkungan kerja MariaDB menggunakan XAMPP dan phpMyAdmin. Database serta akun kerja berhasil dibuat dengan pembatasan hak akses yang sesuai. Repositori Git juga berhasil disiapkan dan dihubungkan dengan GitHub sebagai tempat pencatatan pekerjaan.

## 9. Pernyataan Penggunaan AI

AI digunakan sebagai alat bantu dalam memahami langkah praktikum, merapikan dokumentasi, dan membantu menyusun laporan berdasarkan hasil praktikum yang telah dikerjakan. Pengujian dan hasil praktikum tetap dilakukan pada lingkungan MariaDB, phpMyAdmin, Git, dan GitHub yang digunakan.

## 10. Bukti Git

Repositori GitHub:

```text
https://github.com/dwindi496-jpg/basisdata-123.git
```

Commit Modul 1:

```text
769795c
```

Pesan commit:

```text
p01: inisialisasi repositori dan skrip lingkungan
```

Push pertama ke GitHub berhasil dilakukan.

## Checklist

- [x] Berkas `p01_lingkungan_123.sql`
- [x] `README.md` berisi identitas proyek
- [x] Database dan akun kerja berhasil dibuat
- [x] Akun dev dengan hak akses terbatas berhasil diuji
- [x] phpMyAdmin menggunakan mode cookie
- [x] Repositori Git berhasil dibuat
- [x] Push pertama ke GitHub berhasil
- [ ] Tangkapan layar hasil `SELECT VERSION(), CURRENT_USER()`
- [ ] Tangkapan layar `SELECT @@sql_mode`
- [ ] Tangkapan layar `SHOW DATABASES` sebagai `mhs_123`
- [ ] Tangkapan layar `SHOW DATABASES` sebagai `dev_123`
- [ ] Tangkapan layar ERROR 1044
- [ ] Tangkapan layar ERROR 1142
- [ ] Tangkapan layar login phpMyAdmin mode cookie
- [ ] Tangkapan layar Git push pertama
```

**Penting:** bagian `[ ]` yang belum ada jangan dicentang kalau kamu memang belum punya screenshot-nya. Buku memang mensyaratkan bukti tangkapan layar untuk bagian-bagian tersebut. :chatgpt-content-reference{index="1"}

Setelah ditempel, **Ctrl + S** saja dulu. Jangan commit dulu.