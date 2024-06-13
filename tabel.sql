-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 06:54 PM
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
-- Database: `uts_312310052`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `HitungTOTALBIAYA` (`ID_Transaksi` INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
DECLARE Total DECIMAL (10,2);
SELECT SUM (Layanan.Harga * Detail_Transaksi.Jumlah)
INTO total
FROM Detail_Transaksi
JOIN Layanan ON Detail_Transaksi.ID_Layanan = Layanan.ID_Layanan
WHERE Detail_Transaksi.ID_Transaksi = ID_Transaksi;
RETURN total;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `HitungTotal_Biaya` (`ID_Transaksi` INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
DECLARE Total DECIMAL (10,2);
SELECT SUM (Layanan.Harga * Detail_Transaksi.Jumlah)
INTO Total
FROM Detail_Transaksi
JOIN Layanan ON Detail_Transaksi.ID_Layanan = Layanan.ID_Layanan
WHERE Detail_Transaksi.ID_Transaksi = ID_Transaksi;
RETURN Total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `ID_Transaksi` int(11) NOT NULL,
  `ID_Layanan` int(11) NOT NULL,
  `Jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`ID_Transaksi`, `ID_Layanan`, `Jumlah`) VALUES
(1, 111, 200000),
(2, 222, 300000),
(3, 333, 400000),
(4, 444, 500000),
(5, 555, 700000);

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `ID_Layanan` int(11) NOT NULL,
  `Nama_Layanan` varchar(20) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`ID_Layanan`, `Nama_Layanan`, `Harga`) VALUES
(111, 'Cuci Baju', 30000.00),
(222, 'Cuci dan setrika', 40000.00),
(333, 'Cuci Sepatu', 50000.00),
(444, 'Setrika pakaian', 15000.00),
(555, 'Cuci Celana', 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_Pegawai` int(11) NOT NULL,
  `Nama` varchar(20) DEFAULT NULL,
  `Jabatan` varchar(20) DEFAULT NULL,
  `No_Telpon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`ID_Pegawai`, `Nama`, `Jabatan`, `No_Telpon`) VALUES
(1, 'Naufal', 'President', '089511334455'),
(2, 'Ikbal', 'HRD', '085711334455'),
(3, 'Farras', 'SPV', '089133442211'),
(4, 'Riyan', 'Leader', '085744553311'),
(5, 'Abel', 'Staff', '081344556677');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL,
  `Nama` varchar(20) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `TGL_Lahir` date DEFAULT NULL,
  `Nomor_Telepon` varchar(12) DEFAULT NULL,
  `Nama_Paket` varchar(20) DEFAULT NULL,
  `Durasi_Paket` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_Pelanggan`, `Nama`, `Alamat`, `TGL_Lahir`, `Nomor_Telepon`, `Nama_Paket`, `Durasi_Paket`) VALUES
(202400, 'Naufal', 'Bekasi', '2004-11-02', '081317135566', 'Paket Bronze', 10),
(202401, 'Farras', 'Jakarta', '2004-11-05', '089655443311', 'Paket Silver', 20),
(202402, 'Riyan', 'Bogor', '2003-12-06', '089655443322', 'Paket Gold', 30),
(202403, 'Abel', 'Bali', '2002-12-06', '089655444331', 'Paket Platinum', 40),
(202404, 'Ikbal', 'Depok', '2005-11-06', '085755444331', 'Paket Titanium', 50);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `ID_Pegawai` int(11) DEFAULT NULL,
  `Tgl_Transaksi` date DEFAULT NULL,
  `Total_Biaya` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_Transaksi`, `ID_Pelanggan`, `ID_Pegawai`, `Tgl_Transaksi`, `Total_Biaya`) VALUES
(1, 202400, 1, '2024-03-05', 500000.00),
(2, 202401, 2, '2024-05-11', 300000.00),
(3, 202402, 3, '2023-01-23', 900000.00),
(4, 202403, 4, '2022-11-02', 100000.00),
(5, 202404, 5, '2024-01-22', 300000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`ID_Transaksi`,`ID_Layanan`),
  ADD KEY `ID_Layanan` (`ID_Layanan`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID_Layanan`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_Pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_Transaksi`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID_Layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `ID_Pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `ID_Pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202405;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`ID_Layanan`) REFERENCES `layanan` (`ID_Layanan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_Pegawai`) REFERENCES `pegawai` (`ID_Pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
