-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2020 at 05:54 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hi-fi`
--

-- --------------------------------------------------------

--
-- Table structure for table `hifi_zvocniki`
--

CREATE TABLE `hifi_zvocniki` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ime` varchar(50) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `opis` text COLLATE utf8mb4_slovenian_ci NOT NULL,
  `slika` varchar(255) COLLATE utf8mb4_slovenian_ci DEFAULT NULL,
  `uporabnik_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

--
-- Dumping data for table `hifi_zvocniki`
--

INSERT INTO `hifi_zvocniki` (`id`, `ime`, `opis`, `slika`, `uporabnik_id`) VALUES
(13, 'Titanic', 'ok', 'uploads/titanic1.jpg', 5),
(14, 'Joker', 'ok', 'uploads/joker.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ocene`
--

CREATE TABLE `ocene` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hifi_zvocniki_id` bigint(20) UNSIGNED NOT NULL,
  `uporabnik_id` bigint(20) UNSIGNED NOT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ocena` varchar(2) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `prednosti` varchar(100) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `slabosti` varchar(100) COLLATE utf8mb4_slovenian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

--
-- Dumping data for table `ocene`
--

INSERT INTO `ocene` (`id`, `hifi_zvocniki_id`, `uporabnik_id`, `datum`, `ocena`, `prednosti`, `slabosti`) VALUES
(21, 13, 4, '2020-06-29 15:45:29', '', 'koko', 'koko'),
(20, 10, 5, '2020-06-29 15:17:31', '', 'ok', 'ok'),
(18, 9, 0, '2020-06-29 13:55:24', '4', 'k', 'k'),
(19, 12, 4, '2020-06-29 15:00:36', '3', 'xvfc', 'xvfc'),
(17, 9, 5, '2020-06-29 13:54:54', '3', 'lol', 'lol'),
(22, 13, 4, '2020-06-29 15:45:33', '', 'kokook', 'kokook'),
(23, 13, 4, '2020-06-29 15:51:19', '', 'vdf', 'vdf'),
(24, 13, 4, '2020-06-29 15:51:23', '', 'fsdfsd', 'fsdfsd');

-- --------------------------------------------------------

--
-- Table structure for table `uporabniki`
--

CREATE TABLE `uporabniki` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ime` varchar(50) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `priimek` varchar(50) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_slovenian_ci NOT NULL,
  `tip` varchar(100) COLLATE utf8mb4_slovenian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

--
-- Dumping data for table `uporabniki`
--

INSERT INTO `uporabniki` (`id`, `ime`, `priimek`, `pass`, `email`, `tip`) VALUES
(5, 'Anonymous', ' ', 'superhardpassword', 'Anonymous@gmail.com', '0'),
(4, 'test', 'test', 'aa5e16c3cf524125ec46c2dcfcf6b6cf14594f72', 'test@gmail.com', '0'),
(6, 'Tilen', 'Krivec', 'c484f3a8cf4627d8c3e816d72ac929614a94ff26', 'pegasus221krivec@gmail.com', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hifi_zvocniki`
--
ALTER TABLE `hifi_zvocniki`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ocene`
--
ALTER TABLE `ocene`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `hifi_zvocniki_id` (`hifi_zvocniki_id`),
  ADD KEY `uporabnik_id` (`uporabnik_id`);

--
-- Indexes for table `uporabniki`
--
ALTER TABLE `uporabniki`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hifi_zvocniki`
--
ALTER TABLE `hifi_zvocniki`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ocene`
--
ALTER TABLE `ocene`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `uporabniki`
--
ALTER TABLE `uporabniki`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
