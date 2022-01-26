-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 02:55 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rawatjalan`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `alamatID` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `negeriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `apointmentID` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `nurseID` int(11) NOT NULL,
  `physicianID` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `examination_room` text NOT NULL,
  `appointment_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandID` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fact rawatjalan`
--

CREATE TABLE `fact rawatjalan` (
  `rawatjalanID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `waktuID` int(11) NOT NULL,
  `medicationCode` int(11) NOT NULL,
  `physicianID` int(11) NOT NULL,
  `nurseID` int(11) NOT NULL,
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medicationCode` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `brandID` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `negeri`
--

CREATE TABLE `negeri` (
  `negeriID` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseID` int(11) NOT NULL,
  `name` text NOT NULL,
  `position` text NOT NULL,
  `registered` int(11) NOT NULL,
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `SSN` int(11) NOT NULL,
  `name` text NOT NULL,
  `alamatID` int(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `isuranceID` int(11) NOT NULL,
  `PCP` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `umur` int(11) NOT NULL,
  `kategoriUmur` varchar(30) NOT NULL,
  `pekerjaanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `pekerjaanID` int(11) NOT NULL,
  `name` text NOT NULL,
  `kategori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `physicianID` int(11) NOT NULL,
  `name` text NOT NULL,
  `position` text NOT NULL,
  `SSN` int(11) NOT NULL,
  `status` text NOT NULL,
  `regionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `regionID` int(11) NOT NULL,
  `name` text NOT NULL,
  `alamatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `waktuID` int(11) NOT NULL,
  `tanggal` int(11) NOT NULL,
  `bulan` text NOT NULL,
  `quarter` int(11) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`alamatID`),
  ADD KEY `fk_negeriID_alamat` (`negeriID`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apointmentID`),
  ADD KEY `fk_SSN_appointment` (`SSN`),
  ADD KEY `fk_nurseID_appointment` (`nurseID`),
  ADD KEY `fk_physicianID_appointment` (`physicianID`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandID`);

--
-- Indexes for table `fact rawatjalan`
--
ALTER TABLE `fact rawatjalan`
  ADD PRIMARY KEY (`rawatjalanID`),
  ADD KEY `fk_apointmentID` (`appointmentID`),
  ADD KEY `fk_waktuID` (`waktuID`),
  ADD KEY `fk_medicationCode` (`medicationCode`),
  ADD KEY `fk_physicianID` (`physicianID`),
  ADD KEY `fk_nurseID` (`nurseID`),
  ADD KEY `fk_SSN` (`SSN`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medicationCode`),
  ADD KEY `fk_brandID_medication` (`brandID`);

--
-- Indexes for table `negeri`
--
ALTER TABLE `negeri`
  ADD PRIMARY KEY (`negeriID`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseID`),
  ADD KEY `fk_SSN_nurse` (`SSN`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `fk_alamatID_pasien` (`alamatID`),
  ADD KEY `fk_pekerjaanID_pasien` (`pekerjaanID`),
  ADD KEY `fk_PCP_pasien` (`PCP`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`pekerjaanID`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`physicianID`),
  ADD KEY `fk_SSN_physician` (`SSN`),
  ADD KEY `fk_regionID_physician` (`regionID`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`regionID`),
  ADD KEY `fk_alamatID_region` (`alamatID`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`waktuID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `alamatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apointmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fact rawatjalan`
--
ALTER TABLE `fact rawatjalan`
  MODIFY `rawatjalanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `medicationCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `negeri`
--
ALTER TABLE `negeri`
  MODIFY `negeriID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `SSN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `pekerjaanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physician`
--
ALTER TABLE `physician`
  MODIFY `physicianID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `regionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `waktuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `fk_negeriID_alamat` FOREIGN KEY (`negeriID`) REFERENCES `negeri` (`negeriID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_SSN_appointment` FOREIGN KEY (`SSN`) REFERENCES `fact rawatjalan` (`appointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nurseID_appointment` FOREIGN KEY (`nurseID`) REFERENCES `fact rawatjalan` (`nurseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_physicianID_appointment` FOREIGN KEY (`physicianID`) REFERENCES `fact rawatjalan` (`physicianID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fact rawatjalan`
--
ALTER TABLE `fact rawatjalan`
  ADD CONSTRAINT `fk_SSN` FOREIGN KEY (`SSN`) REFERENCES `pasien` (`SSN`),
  ADD CONSTRAINT `fk_apointmentID` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`apointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_medicationCode` FOREIGN KEY (`medicationCode`) REFERENCES `medication` (`medicationCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nurseID` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`nurseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_physicianID` FOREIGN KEY (`physicianID`) REFERENCES `physician` (`physicianID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_waktuID` FOREIGN KEY (`waktuID`) REFERENCES `waktu` (`waktuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medication`
--
ALTER TABLE `medication`
  ADD CONSTRAINT `fk_brandID_medication` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `fk_SSN_nurse` FOREIGN KEY (`SSN`) REFERENCES `fact rawatjalan` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `fk_PCP_pasien` FOREIGN KEY (`PCP`) REFERENCES `fact rawatjalan` (`physicianID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alamatID_pasien` FOREIGN KEY (`alamatID`) REFERENCES `alamat` (`alamatID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pekerjaanID_pasien` FOREIGN KEY (`pekerjaanID`) REFERENCES `pekerjaan` (`pekerjaanID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `physician`
--
ALTER TABLE `physician`
  ADD CONSTRAINT `fk_SSN_physician` FOREIGN KEY (`SSN`) REFERENCES `fact rawatjalan` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_regionID_physician` FOREIGN KEY (`regionID`) REFERENCES `region` (`regionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `fk_alamatID_region` FOREIGN KEY (`alamatID`) REFERENCES `alamat` (`alamatID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
