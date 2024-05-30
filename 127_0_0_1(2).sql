-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 11:13 AM
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
-- Database: `hobo2024`
--
CREATE DATABASE IF NOT EXISTS `hobo2024` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hobo2024`;

-- --------------------------------------------------------

--
-- Table structure for table `abonnement`
--

CREATE TABLE `abonnement` (
  `AboID` int(10) NOT NULL,
  `AboNaam` varchar(50) DEFAULT NULL,
  `MaxDevices` int(10) DEFAULT NULL,
  `StreamKwaliteit` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aflevering`
--

CREATE TABLE `aflevering` (
  `AfleveringID` int(10) NOT NULL,
  `SeizID` int(10) NOT NULL,
  `Rang` int(10) DEFAULT NULL,
  `AflTitel` varchar(100) DEFAULT NULL,
  `Duur` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GenreID` int(10) NOT NULL,
  `GenreNaam` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `KlantNr` int(10) NOT NULL,
  `AboID` int(10) NOT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `Tussenvoegsel` varchar(10) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seizoen`
--

CREATE TABLE `seizoen` (
  `SeizoenID` int(10) NOT NULL,
  `SerieID` int(10) NOT NULL,
  `Rang` int(11) DEFAULT NULL,
  `Jaar` int(4) DEFAULT NULL,
  `IMDBRating` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `SerieID` int(10) NOT NULL,
  `SerieTitel` varchar(100) DEFAULT NULL,
  `IMDBLink` varchar(100) DEFAULT NULL,
  `Actief` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serie_genre`
--

CREATE TABLE `serie_genre` (
  `SerieID` int(10) NOT NULL,
  `GenreID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE `stream` (
  `StreamID` int(10) NOT NULL,
  `KlantID` int(10) NOT NULL,
  `AflID` int(10) NOT NULL,
  `d_start` datetime DEFAULT NULL,
  `d_eind` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`AboID`);

--
-- Indexes for table `aflevering`
--
ALTER TABLE `aflevering`
  ADD PRIMARY KEY (`AfleveringID`),
  ADD KEY `FKAflevering938760` (`SeizID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`KlantNr`),
  ADD KEY `FKKlant` (`AboID`);

--
-- Indexes for table `seizoen`
--
ALTER TABLE `seizoen`
  ADD PRIMARY KEY (`SeizoenID`),
  ADD KEY `FKSeizoen` (`SerieID`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`SerieID`);

--
-- Indexes for table `serie_genre`
--
ALTER TABLE `serie_genre`
  ADD PRIMARY KEY (`SerieID`,`GenreID`),
  ADD KEY `FKSerie_Genre` (`GenreID`);

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
  ADD PRIMARY KEY (`StreamID`),
  ADD KEY `FKStream1` (`AflID`),
  ADD KEY `FKStream2` (`KlantID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `AboID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aflevering`
--
ALTER TABLE `aflevering`
  MODIFY `AfleveringID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `GenreID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klant`
--
ALTER TABLE `klant`
  MODIFY `KlantNr` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seizoen`
--
ALTER TABLE `seizoen`
  MODIFY `SeizoenID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `SerieID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
  MODIFY `StreamID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
