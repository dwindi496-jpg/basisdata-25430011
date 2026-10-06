# Dokumen Kebutuhan Data - Koperasi Mahasiswa Sejahtera (Kopma)

## 1. Latar belakang dan aktivitas organisasi

Koperasi Mahasiswa Sejahtera (Kopma) merupakan koperasi yang menjual alat tulis, makanan ringan, dan minuman di lingkungan kampus. Pembeli dapat berasal dari anggota maupun masyarakat umum.

Aktivitas utama Kopma meliputi pendaftaran anggota, pencatatan penjualan, pemesanan barang kepada pemasok, penerimaan barang dari pemasok, dan penyusunan laporan bulanan.

Data yang dikelola meliputi data anggota, barang, penjualan, detail penjualan, petugas, pemasok, serta pembelian. Data tersebut diperlukan untuk mendukung kegiatan operasional dan menghasilkan informasi seperti omzet, barang terlaris, stok yang menipis, dan anggota dengan belanja terbesar.## 2. Aktor dan proses bisnis

| Kode | Proses Bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli melakukan pembayaran |
| PB-03 | Memesan barang ke pemasok | Petugas gudang | Stok barang berada di bawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur pemasok |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |## 3. Dokumen sumber yang dianalisis

Dokumen sumber yang dianalisis adalah nota penjualan. Nota penjualan digunakan untuk mencatat transaksi yang dilakukan oleh pembeli.

Elemen data yang terdapat pada nota penjualan antara lain nomor nota, tanggal dan waktu transaksi, kasir, anggota, barang, jumlah barang, harga satuan, subtotal, diskon, dan total pembayaran.

Harga satuan pada nota penjualan perlu disimpan sebagai harga saat transaksi agar riwayat harga tetap dapat diketahui meskipun harga barang berubah di kemudian hari.

Subtotal dan total merupakan data yang dapat dihitung kembali dari jumlah barang, harga satuan, dan diskon. Penyimpanan data tersebut perlu dipertimbangkan agar tidak terjadi ketidaksesuaian data.## 4. Entitas kandidat dan elemen data

### 4.1 Anggota
- Nomor anggota
- NIM
- Nama
- Program studi
- Nomor HP
- Status aktif

### 4.2 Barang
- Kode barang
- Nama barang
- Kategori
- Harga jual
- Stok
- Batas minimum stok

### 4.3 Penjualan
- Nomor nota
- Tanggal dan waktu
- Kasir
- Anggota
- Jumlah pembayaran

### 4.4 Detail Penjualan
- Nomor nota
- Kode barang
- Jumlah barang
- Harga saat transaksi

### 4.5 Petugas
- Kode petugas
- Nama petugas
- Peran

### 4.6 Pemasok
- Kode pemasok
- Nama pemasok
- Nomor telepon
- Alamat

### 4.7 Pembelian
- Nomor faktur
- Tanggal pembelian
- Pemasok
- Barang
- Jumlah barang
- Harga beli## 5. Aturan bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap nota penjualan memiliki nomor yang unik dan minimal memiliki satu detail barang. |
| AB-02 | Penjualan dapat dilakukan tanpa anggota. Jika menggunakan anggota, anggota harus berstatus aktif untuk mendapatkan diskon 5%. |
| AB-03 | Stok barang tidak boleh bernilai negatif. Penjualan ditolak jika jumlah barang melebihi stok yang tersedia. |
| AB-04 | Harga jual yang digunakan pada nota disimpan berdasarkan harga saat transaksi dan tidak berubah meskipun harga barang berubah. |
| AB-05 | NIM anggota harus unik. Pencarian anggota dapat dilakukan menggunakan nomor anggota atau NIM. |
| AB-06 | Pemesanan barang kepada pemasok dilakukan ketika stok berada di bawah batas minimum. |## 6. Kebutuhan informasi

| Kode | Kebutuhan Informasi | Data yang Digunakan |
|---|---|---|
| KI-01 | Mengetahui omzet dan jumlah nota per hari atau per bulan | Penjualan, Detail Penjualan |
| KI-02 | Mengetahui lima barang terlaris setiap bulan berdasarkan jumlah terjual | Detail Penjualan, Barang |
| KI-03 | Mengetahui barang yang stoknya berada di bawah batas minimum | Barang |
| KI-04 | Mengetahui sepuluh anggota dengan jumlah belanja terbesar setiap bulan | Penjualan, Detail Penjualan, Anggota |## 7. Matriks CRUD

| Proses Bisnis | Anggota | Barang | Penjualan | Detail Penjualan | Petugas | Pemasok | Pembelian |
|---|---|---|---|---|---|---|---|
| PB-01 Mendaftarkan anggota | C | - | - | - | R | - | - |
| PB-02 Mencatat penjualan | R | R, U | C | C | R | - | - |
| PB-03 Memesan barang | - | R | - | - | R | R | C |
| PB-04 Menerima barang | - | U | - | - | R | R | R |
| PB-05 Menyusun laporan | R | R | R | R | R | R | R |## 8. Kamus data awal

| Nama Data | Deskripsi | Contoh | Aturan | Penanggung Jawab |
|---|---|---|---|---|
| no_anggota | Nomor identitas anggota | A-0457 | Unik, format A-4 digit | Ketua |
| nim_anggota | Nomor induk mahasiswa anggota | 2301010123 | Unik, 10 digit | Ketua |
| nama_anggota | Nama lengkap anggota | Windi Dwi Hartati | Wajib diisi | Ketua |
| program_studi | Program studi anggota | Sistem Informasi | Wajib diisi | Ketua |
| no_hp_anggota | Nomor telepon anggota | 081234567890 | Data pribadi | Ketua |
| status_anggota | Status keaktifan anggota | Aktif | Aktif atau tidak aktif | Ketua |
| kode_barang | Kode identitas barang | BRG001 | Unik | Petugas gudang |
| nama_barang | Nama barang | Buku Tulis | Wajib diisi | Petugas gudang |
| kategori_barang | Kategori barang | Alat Tulis | Wajib diisi | Petugas gudang |
| harga_jual | Harga jual barang | 4000 | Bilangan >= 0 | Petugas gudang |
| stok_barang | Jumlah stok tersedia | 35 | Bilangan >= 0 | Petugas gudang |
| minimum_stok | Batas minimum stok | 10 | Bilangan >= 0 | Petugas gudang |
| no_nota_penjualan | Nomor nota penjualan | PJ-2609-0142 | Unik | Kasir |
| tanggal_penjualan | Tanggal dan waktu transaksi | 2026-10-05 10:00 | Wajib diisi | Kasir |
| kode_petugas | Kode petugas | PTG001 | Unik | Ketua |
| nama_petugas | Nama petugas | Andi | Wajib diisi | Ketua |
| peran_petugas | Peran petugas | Kasir | Kasir, gudang, atau ketua | Ketua |
| qty_penjualan | Jumlah barang yang terjual | 2 | Bilangan > 0 | Kasir |
| harga_satuan_detail_penjualan | Harga barang saat transaksi | 4000 | Bilangan >= 0 | Kasir |
| kode_pemasok | Kode identitas pemasok | SPL001 | Unik | Petugas gudang |
| nama_pemasok | Nama pemasok | PT Sumber Jaya | Wajib diisi | Petugas gudang |
| no_faktur_pembelian | Nomor faktur pembelian | FP-001 | Unik | Petugas gudang |## 9. Kebutuhan non-fungsional data

- Volume transaksi diperkirakan sekitar 40 + (5 × P) transaksi per hari.
- Data transaksi penjualan harus disimpan minimal selama 5 tahun.
- Data nomor HP anggota merupakan data pribadi dan hanya boleh dilihat oleh Ketua koperasi.
- Sistem harus mampu menjaga agar stok barang tidak bernilai negatif.
- Data transaksi harus tetap menyimpan harga barang pada saat transaksi untuk menjaga riwayat harga.## 10. Isu kualitas data yang diantisipasi

Beberapa masalah kualitas data yang mungkin terjadi adalah:

1. Data anggota dapat tercatat lebih dari satu kali sehingga perlu memastikan NIM dan nomor anggota bersifat unik.
2. Data stok dapat menjadi tidak akurat jika transaksi penjualan atau penerimaan barang tidak dicatat dengan benar.
3. Harga barang dapat berubah sehingga harga pada saat transaksi harus tetap disimpan.
4. Data nomor HP anggota merupakan data pribadi sehingga aksesnya harus dibatasi.
5. Data barang dan pemasok harus diperbarui apabila terjadi perubahan informasi.
6. Kesalahan input jumlah barang dapat menyebabkan perbedaan antara stok sistem dan stok fisik.