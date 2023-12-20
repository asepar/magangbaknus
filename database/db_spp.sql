CREATE TABLE `siswa` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nama_siswa` varchar(255),
  `nis` integer UNIQUE,
  `id_kelas` integer,
  `alamat` text,
  `no_telp` varchar(255),
  `id_spp` integer,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `pembayaran` (
  `id_pembayaran` integer UNIQUE,
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_petugas` integer,
  `id_siswa` integer,
  `tgl_bayar` date,
  `bulan_bayar` varchar(255),
  `jumlah_bayar` integer,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `petugas` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_petugas` integer,
  `username` varchar(255),
  `password` varchar(255),
  `nama_petugas` varchar(255),
  `level` enum,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `spp` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_spp` integer,
  `tahun` integer,
  `bulan` integer,
  `nominal` integer,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `kelas` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_kelas` integer,
  `nama_kelas` varchar(255),
  `kompetensi_keahlian` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `pembayaran` ADD FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

ALTER TABLE `pembayaran` ADD FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`nis`);

ALTER TABLE `siswa` ADD FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`);

ALTER TABLE `siswa` ADD FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);
