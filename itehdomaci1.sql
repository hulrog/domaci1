-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2022 at 11:00 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itehdomaci1`
--

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `houseID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `seat` varchar(20) NOT NULL,
  `region` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`houseID`, `name`, `seat`, `region`) VALUES
(1, 'Targaryen', 'King\'s Landing', 'Crownlands'),
(2, 'Baratheon', 'Storm\'s End', 'Stormlands'),
(3, 'Tully', 'Riverrun', 'Riverlands'),
(4, 'Tyrell', 'Highgarden', 'The Reach'),
(5, 'Lannister', 'Casterly Rock', 'Westerlands'),
(6, 'Arryn', 'The Eyrie', 'The Vale'),
(7, 'Stark', 'Winterfell', 'The North'),
(8, 'Greyjoy', 'Pyke', 'Iron Islands'),
(9, 'Martell', 'Sunspear', 'Dorne'),
(10, 'Mooton', 'Maidenpool', 'Riverlands'),
(11, 'Umber', 'Last Hearth', 'The North'),
(17, 'Uller', 'Hellholt', 'Dorne'),
(18, 'Redwyne', 'The Arbor', 'The Reach'),
(24, 'Celtigar', 'Claw Isle', 'Crownlands'),
(25, 'Bolton', 'The Dreadfort', 'The North'),
(26, 'Hightower', 'Oldtown', 'The Reach'),
(27, 'Tarth', 'Evenfall Hall', 'Stormlands'),
(28, 'Velaryon', 'Driftmark', 'Crownlands'),
(29, 'Blackfyre', 'Tyrosh', 'Crownlands'),
(30, 'Manderly', 'White Harbor', 'The North'),
(31, 'Tarly', 'Horn Hill', 'The Reach'),
(32, 'Westerling', 'The Crag', 'Westerlands'),
(33, 'Mormont', 'Bear Island', 'The North'),
(34, 'Clegane', 'Clegane\'s Keep', 'Westerlands'),
(35, 'Florent', 'Brightwater Keep', 'Crownlands'),
(36, 'Sunderland', 'Sisterton', 'The Vale'),
(39, 'Rosby', 'Rosby', 'Crownlands'),
(43, 'Baelish', 'The Fingers', 'The Vale'),
(45, 'Glover', 'Deepwood Motte', 'The North');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `personID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `house` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`personID`, `name`, `house`, `title`, `gender`) VALUES
(1, 'Daemon', 1, 'Prince', 'Male'),
(3, 'Robert', 2, 'King', 'Male'),
(4, 'Daenerys', 1, 'Queen', 'Female'),
(5, 'Margaery', 4, 'Lady', 'Female'),
(6, 'Edmure', 3, 'Lord', 'Male'),
(7, 'Euron', 8, 'King', 'Male'),
(8, 'Jon', 6, 'Lord ', 'Male'),
(9, 'Oberyn', 9, 'Prince', 'Male'),
(10, 'Catelyn', 3, 'Lady', 'Female'),
(11, 'Elia', 9, 'Princess', 'Female'),
(12, 'Jon', 11, 'Lord', 'Male'),
(13, 'Eddard', 7, 'Lord', 'Male'),
(16, 'Rhaenyra', 1, 'Queen', 'Female'),
(17, 'Sansa', 7, 'Lady', 'Female'),
(20, 'Rhaenys', 1, 'Princess', 'Female'),
(21, 'Visenya', 1, 'Queen', 'Female'),
(23, 'Ryam', 18, 'Ser', 'Male'),
(24, 'Harmen', 17, 'Lord', 'Male'),
(25, 'Uthor', 17, 'Lord', 'Male'),
(27, 'Rickon', 7, 'Lord', 'Male'),
(28, 'Aemon', 1, 'Maester', 'Male'),
(30, 'Cersei', 5, 'Queen', 'Female'),
(31, 'Rhaenys', 1, 'Queen', 'Female'),
(32, 'Victarion', 8, 'Prince', 'Male'),
(33, 'Stannis', 2, 'King', 'Male'),
(34, 'Shireen', 2, 'Princess', 'Female'),
(35, 'Robert', 6, 'Lord', 'Male'),
(36, 'Orys', 2, 'Lord', 'Male'),
(37, 'Arya', 7, 'Princess', 'Female'),
(39, 'Baelor', 1, 'King', 'Male'),
(40, 'Renly', 2, 'King', 'Male'),
(42, 'Rhaena', 1, 'Princess', 'Female'),
(43, 'Mors', 11, 'Lord', 'Male'),
(45, 'Lysa', 3, 'Lady', 'Female'),
(46, 'Elmo', 3, 'Lord', 'Male'),
(47, 'Daeron', 1, 'King', 'Male'),
(49, 'Daemon', 29, 'King', 'Male'),
(50, 'Aegon', 29, 'King', 'Male'),
(51, 'Roose', 25, 'Lord', 'Male'),
(52, 'Sandor', 34, 'Ser', 'Male'),
(53, 'Selyse', 35, 'Queen', 'Female'),
(54, 'Jeor', 33, 'Lord', 'Male'),
(55, 'Robb', 7, 'King', 'Male'),
(56, 'Jeyne', 32, 'Queen', 'Female'),
(57, 'Marla', 36, 'Queen', 'Female'),
(58, 'Randyll', 31, 'Lord', 'Male'),
(59, 'Wyman', 30, 'Lord', 'Male'),
(60, 'Wylla', 30, 'Lady', 'Female'),
(62, 'Gregor', 34, 'Ser', 'Male'),
(63, 'Axel', 35, 'Ser', 'Male'),
(64, 'Ramsay', 25, 'Lord', 'Male'),
(65, 'Theomore', 30, 'Lord', 'Male'),
(66, 'Jorah', 33, 'Ser', 'Male'),
(67, 'Dickon', 31, 'Ser', 'Male'),
(68, 'Haegon', 29, 'King', 'Male'),
(69, 'Maelys', 29, 'King', 'Male'),
(70, 'Doran', 9, 'Prince', 'Male'),
(71, 'Torrhen', 7, 'King', 'Male'),
(72, 'Triston', 36, 'Lord', 'Male'),
(73, 'Asha', 8, 'Princess', 'Female'),
(74, 'Selwyn', 27, 'Lord', 'Male'),
(75, 'Royce', 25, 'King', 'Male'),
(76, 'Gawen', 32, 'Lord', 'Male'),
(77, 'Meria', 9, 'Princess', 'Female'),
(78, 'Aerys', 1, 'King', 'Male'),
(79, 'Maege', 33, 'Lady', 'Female'),
(80, 'Alicent', 26, 'Queen', 'Female'),
(81, 'Tyrion', 5, 'Lord', 'Male'),
(82, 'Otto', 26, 'Ser', 'Male'),
(83, 'Daenaera', 28, 'Queen', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`houseID`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personID`),
  ADD KEY `house` (`house`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `houseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `personID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`house`) REFERENCES `houses` (`houseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
