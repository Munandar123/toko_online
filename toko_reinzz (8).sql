-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 11:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_reinzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(220) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(37, 'reinzz t-shirt29', 'kualitas bagus dan bahan tebal', 'Casual', 75000, 29, '71Oip1Hhr4L._AC_SX679_.jpg'),
(38, 'Casual Reinzz29', 'kualitas bagus dan bahan tebal', 'Casual', 95000, 29, '61U8HNja1FL._AC_UL330_SR330,330_.jpg'),
(39, 'Sport T-shirt', 'adem dan menyerap keringat', 'Sport', 120000, 29, '71UeMIvCZ-L._AC_UL480_FMwebp_QL65_.webp'),
(40, 'reinxxxx T-shirt', 'adem dan menyerap keringat', 'Sport', 95000, 28, '81gh5qY6BxL._AC_UL480_FMwebp_QL65_.webp'),
(41, 'Casual 29', 'kualitas bagus dan bahan tebal', 'Casual', 95000, 29, '81Y6r7df7OL._AC_UL480_FMwebp_QL65_.webp'),
(42, 'STUSSxReinzz', 'kualitas bagu', 'Casual', 120000, 23, '71d0BWecNcL._AC_SY741_.jpg'),
(43, 'STICKXReinzz', 'adem dan menyerap keringat', 'Sport', 170000, 29, '91-S7d5LBNL._AC_UL480_FMwebp_QL65_.webp'),
(44, 'Sportt299', 'adem dan menyerap keringat', 'Sport', 75000, 28, '71iXdORykrL._AC_UL480_FMwebp_QL65_.webp');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(65) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(16, 'brian', 'bantul', '2024-12-31 09:48:03', '2025-01-01 09:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 5, 'baju23', 3, 700000, ''),
(2, 2, 5, 'baju23', 1, 700000, ''),
(3, 1, 5, 'baju23', 1, 700000, ''),
(4, 1, 29, 'reinzz', 2, 35000, ''),
(5, 2, 5, 'baju23', 3, 700000, ''),
(6, 2, 29, 'reinzz', 1, 35000, ''),
(7, 3, 5, 'baju23', 3, 700000, ''),
(8, 4, 5, 'baju23', 3, 700000, ''),
(9, 4, 29, 'reinzz', 4, 35000, ''),
(10, 5, 29, 'reinzz', 7, 35000, ''),
(11, 7, 5, 'baju23', 7, 700000, ''),
(12, 7, 29, 'reinzz', 3, 35000, ''),
(13, 9, 5, 'baju23', 2, 700000, ''),
(14, 10, 31, 'baju23', 2, 700000, ''),
(15, 12, 31, 'baju23', 3, 700000, ''),
(16, 13, 31, 'baju23', 1, 700000, ''),
(17, 13, 32, 'brian', 1, 700000, ''),
(18, 13, 33, 'baju23', 1, 700000, ''),
(19, 15, 33, 'baju23', 1, 700000, ''),
(20, 16, 44, 'Sportt299', 1, 75000, ''),
(21, 16, 40, 'reinxxxx T-shirt', 1, 95000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
UPDATE tb_barang SET stok = stok-new.jumlah
WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(7, 'brian', 'brian', 'brian29', 1),
(10, 'brian', 'briannn', 'brian29', 2),
(11, 'brian', 'brian', 'admin123', 2),
(12, 'brian', 'brian', 'admin123', 2),
(13, 'ejet', 'ejet26', 'maju29', 2),
(29, 'brian29', 'brian29', 'Brian29', 1),
(30, 'rama', 'rama', 'rama123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
