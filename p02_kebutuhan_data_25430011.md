sudah buat file
# Kebutuhan Data Sistem Informasi Kopma

## 1. Gambaran Umum

Kopma merupakan koperasi mahasiswa yang menjual alat tulis, makanan ringan, dan minuman di lingkungan kampus. Sistem membutuhkan pengelolaan data anggota, barang, penjualan, pembelian, petugas, dan pemasok.

## 2. Proses Bisnis

| Kode | Proses Bisnis | Aktor |
|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir |
| PB-02 | Mencatat penjualan | Kasir |
| PB-03 | Memesan barang kepada pemasok | Petugas gudang |
| PB-04 | Menerima barang dari pemasok | Petugas gudang |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi |

## 3. Entitas Data

Entitas yang dibutuhkan:
1. Anggota
2. Barang
3. Penjualan
4. Detail Penjualan
5. Petugas
6. Pemasok
7. Pembelian
8. Detail Pembelian

## 4. Aturan Bisnis

| Kode | Aturan |
|---|---|
| AB-01 | Setiap nota memiliki nomor unik dan minimal satu item. |
| AB-02 | Penjualan dapat dilakukan tanpa anggota. |
| AB-03 | Anggota harus aktif untuk mendapatkan diskon 5%. |
| AB-04 | Stok barang tidak boleh negatif. |
| AB-05 | Penjualan ditolak jika jumlah barang melebihi stok. |
| AB-06 | Harga pada transaksi disimpan berdasarkan harga saat transaksi. |
| AB-07 | NIM anggota harus unik. |
| AB-08 | Pemesanan barang dilakukan ketika stok berada di bawah batas minimum. |

## 5. Kebutuhan Informasi

| Kode | Kebutuhan Informasi |
|---|---|
| KI-01 | Mengetahui omzet dan jumlah nota per hari atau per bulan. |
| KI-02 | Mengetahui lima barang terlaris setiap bulan. |
| KI-03 | Mengetahui barang yang stoknya di bawah batas minimum. |
| KI-04 | Mengetahui sepuluh anggota dengan belanja terbesar setiap bulan. |
| KI-05 | Mengetahui jumlah pembelian barang dari pemasok. |

## 6. Matriks CRUD

| Proses | Anggota | Barang | Penjualan | Detail Penjualan | Petugas | Pemasok | Pembelian |
|---|---|---|---|---|---|---|---|
| PB-01 | C | - | - | - | R | - | - |
| PB-02 | R | R,U | C | C | R | - | - |
| PB-03 | - | R | - | - | R | R | C |
| PB-04 | - | U | - | - | R | R | R |
| PB-05 | R | R | R | R | R | R | R |

## 7. Kamus Data Awal

| Data | Deskripsi | Penanggung Jawab |
|---|---|---|
| no_anggota | Nomor identitas anggota | Ketua |
| nim_anggota | Nomor induk mahasiswa | Ketua |
| nama_anggota | Nama lengkap anggota | Ketua |
| program_studi | Program studi anggota | Ketua |
| no_hp_anggota | Nomor telepon anggota | Ketua |
| status_anggota | Status aktif anggota | Ketua |
| kode_barang | Kode barang | Petugas gudang |
| nama_barang | Nama barang | Petugas gudang |
| kategori_barang | Kategori barang | Petugas gudang |
| harga_jual | Harga jual barang | Petugas gudang |
| stok_barang | Jumlah stok barang | Petugas gudang |
| minimum_stok | Batas minimum stok | Petugas gudang |
| no_nota_penjualan | Nomor nota penjualan | Kasir |
| tanggal_penjualan | Tanggal dan waktu transaksi | Kasir |
| kode_petugas | Kode petugas | Ketua |
| nama_petugas | Nama petugas | Ketua |
| peran_petugas | Peran petugas | Ketua |
| qty_penjualan | Jumlah barang terjual | Kasir |
| harga_satuan_detail_penjualan | Harga barang saat transaksi | Kasir |
| kode_pemasok | Kode pemasok | Petugas gudang |
| nama_pemasok | Nama pemasok | Petugas gudang |
| no_faktur_pembelian | Nomor faktur pembelian | Petugas gudang |

## 8. Kebutuhan Non-Fungsional Data

- Data transaksi diperkirakan sebanyak 55 transaksi per hari.
- Data transaksi disimpan minimal selama 5 tahun.
- Data nomor HP anggota hanya dapat dilihat oleh Ketua koperasi.
- Stok barang tidak boleh bernilai negatif.
- Data transaksi harus menyimpan harga pada saat transaksi.

### Perhitungan Parameter P

Dua digit terakhir NPM = 11.

P = (11 mod 9) + 1  
P = 2 + 1  
P = 3

Dengan P = 3:
- Maksimal item per transaksi = 5 item.
- Persentase diskon atau denda = 3%.
- Perkiraan transaksi per hari = 55 transaksi.

## 9. Pernyataan Kebutuhan yang Dapat Diuji

### a. Keamanan data anggota
Data pribadi anggota, khususnya nomor HP, hanya dapat dilihat oleh Ketua koperasi.

### b. Kecepatan pencarian barang
Sistem harus dapat menampilkan hasil pencarian barang berdasarkan kode atau nama barang dalam waktu maksimal 3 detik.

### c. Keakuratan laporan stok
Jumlah stok pada sistem harus sesuai dengan hasil perhitungan stok masuk dikurangi stok keluar dan tidak boleh bernilai negatif.

## 10. Penambahan Program Loyalitas

Setiap anggota memperoleh 1 poin untuk setiap Rp10.000 nilai belanja. Sebanyak 50 poin dapat ditukarkan dengan diskon sebesar Rp5.000.

Aturan tambahan:
- AB-09: Poin hanya diberikan kepada anggota yang melakukan transaksi.
- AB-10: Setiap kelipatan Rp10.000 belanja memberikan 1 poin.
- AB-11: Sebanyak 50 poin dapat ditukarkan dengan diskon Rp5.000.
- AB-12: Jumlah poin anggota harus tercatat dan dapat diperbarui setelah transaksi atau penukaran poin.

Kebutuhan informasi tambahan:
- KI-06: Mengetahui jumlah poin yang dimiliki setiap anggota.
- KI-07: Mengetahui anggota yang memenuhi syarat penukaran poin.

## 11. Isu Kualitas Data

- NIM dan nomor anggota harus unik.
- Data stok harus selalu diperbarui setelah penjualan dan penerimaan barang.
- Harga transaksi harus tetap tersimpan meskipun harga barang berubah.
- Data pribadi anggota harus dibatasi aksesnya.
- Kesalahan jumlah barang dapat menyebabkan ketidaksesuaian stok.