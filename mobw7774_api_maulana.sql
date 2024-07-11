-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 12 Jul 2024 pada 03.12
-- Versi server: 10.3.39-MariaDB-cll-lve
-- Versi PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobw7774_api_maulana`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `spesialis` varchar(50) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `jam` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `dokter`, `spesialis`, `hari`, `jam`) VALUES
(1, 'Dr.Rahaya Anisa', 'Spesialis Anak', 'Senin - Rabu', '09.00 - 11.00'),
(2, 'Dr.M.Mulyohadi Ali', 'Spesialis Gigi', 'Selasa - Kamis', '09.00 - 11.00'),
(3, 'Dr.Robert Carlos', 'Spesialis Imunisasi', 'Kamis - Sabtu', '13.00 - 16.00'),
(4, 'Dr.Alexander Wisnu', 'Spesialis Umum', 'Senin - Jumat', '08.00 - 16.00'),
(5, 'Dr.Maulana Hanif', 'Spesialis Mata', 'Kamis - Sabtu', '10.00 - 14.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `imunisasi`
--

CREATE TABLE `imunisasi` (
  `id` int(11) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `manfaat` text NOT NULL,
  `dosis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `imunisasi`
--

INSERT INTO `imunisasi` (`id`, `jenis`, `manfaat`, `dosis`) VALUES
(1, 'BCG', 'melindungi terhadap tuberculosis.', '1 kali'),
(2, 'POLIO', 'melindungi terhadap polio', '1 kali'),
(3, 'MMR', 'melindungi terhadap campak', '1 kali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `janji`
--

CREATE TABLE `janji` (
  `id` int(11) NOT NULL,
  `dokter` varchar(255) DEFAULT NULL,
  `spesialis` varchar(255) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `jam` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `manfaat` text DEFAULT NULL,
  `dosis` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`) VALUES
(20, 'ule', 'ule', 'ule'),
(26, 'jaki', 'jaki', 'jaki'),
(27, 'maulana', 'maul', 'maul'),
(28, 'amrullh', 'amru', '123'),
(29, 'elly', 'elly', '123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `janji`
--
ALTER TABLE `janji`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `janji`
--
ALTER TABLE `janji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
