-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 03:57 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pess_nicole`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentId` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incidentId`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(12, 'QX2222G', '2014-05-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'QX2222G', '2014-05-29 00:00:00', '0000-00-00 00:00:00', NULL),
(14, 'QX4444P', '2014-05-29 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentId` int(11) NOT NULL,
  `caller_name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(10) CHARACTER SET latin1 NOT NULL,
  `incident_type_id` varchar(3) CHARACTER SET latin1 NOT NULL,
  `incident_location` varchar(50) CHARACTER SET latin1 NOT NULL,
  `incident_Desc` varchar(100) CHARACTER SET latin1 NOT NULL,
  `incident_status_id` varchar(1) CHARACTER SET latin1 NOT NULL,
  `time_called` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentId`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_Desc`, `incident_status_id`, `time_called`) VALUES
(12, 'PETER LEOW', '81234567', '010', 'Junction of North Bridge Rd and Middle Rd', 'A bus collided with a Taxi\r\n2 injuries', '1', '2021-03-11 03:53:09'),
(13, 'qwerty', '12345678', '030', 'cck', 'qwerty', '3', '2021-03-11 03:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `incidentstatus`
--

CREATE TABLE `incidentstatus` (
  `incident_status_id` varchar(1) CHARACTER SET latin1 NOT NULL,
  `incident_status_desc` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incidentstatus`
--

INSERT INTO `incidentstatus` (`incident_status_id`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `incidenttype`
--

CREATE TABLE `incidenttype` (
  `incident_type_id` varchar(3) CHARACTER SET latin1 NOT NULL,
  `incident_type_desc` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incidenttype`
--

INSERT INTO `incidenttype` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX2222G', '1'),
('QX4444P', '1'),
('QX45545', '1'),
('QX1234', '3'),
('QX4321R', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcarstatus`
--

CREATE TABLE `patrolcarstatus` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcarstatus`
--

INSERT INTO `patrolcarstatus` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('2', 'patrol'),
('3', 'free'),
('4', 'on-site'),
('5', 'NA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentId`,`patrolcar_id`),
  ADD KEY `patrolcarId` (`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentId`),
  ADD KEY `incidentTypeId` (`incident_type_id`),
  ADD KEY `incidentStatusId` (`incident_status_id`);

--
-- Indexes for table `incidentstatus`
--
ALTER TABLE `incidentstatus`
  ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incidenttype`
--
ALTER TABLE `incidenttype`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`),
  ADD KEY `patrolcarStatusId` (`patrolcar_status_id`);

--
-- Indexes for table `patrolcarstatus`
--
ALTER TABLE `patrolcarstatus`
  ADD PRIMARY KEY (`patrolcar_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`patrolcar_id`) REFERENCES `patrolcar` (`patrolcar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`incidentId`) REFERENCES `dispatch` (`incidentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`incident_type_id`) REFERENCES `incidenttype` (`incident_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incident_ibfk_3` FOREIGN KEY (`incident_status_id`) REFERENCES `incidentstatus` (`incident_status_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD CONSTRAINT `patrolcar_ibfk_1` FOREIGN KEY (`patrolcar_status_id`) REFERENCES `patrolcarstatus` (`patrolcar_status_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
