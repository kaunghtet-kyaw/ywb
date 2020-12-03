-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2019 at 05:25 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ywb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BID` int(11) NOT NULL COMMENT 'Booking ID',
  `SID` int(11) NOT NULL COMMENT 'Schedule ID',
  `UID` int(11) NOT NULL COMMENT 'User ID',
  `Confirmation` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Booking Confirmation',
  `BQty` int(11) NOT NULL COMMENT 'Ticket Quantity',
  `BRating` int(11) NOT NULL COMMENT 'Rating',
  `BDueDate` date NOT NULL COMMENT 'Booking Due Date',
  `BookedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Booked Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`BID`, `SID`, `UID`, `Confirmation`, `BQty`, `BRating`, `BDueDate`, `BookedDate`, `ModifiedDate`) VALUES
(1, 6, 30, 'Cancel', 5, 5, '2019-09-13', '2019-09-12 11:33:04', '2019-09-12 15:28:48'),
(2, 12, 18, 'Confirm', 5, 5, '2019-09-13', '2019-09-12 11:33:04', '2019-09-12 15:06:13'),
(3, 5, 6, 'Cancel', 5, 5, '2019-09-11', '2019-09-12 11:33:04', '2019-09-12 15:31:03'),
(4, 16, 25, 'Cancel', 5, 5, '2019-09-11', '2019-09-12 11:33:04', '2019-09-12 15:31:03'),
(5, 16, 18, 'Cancel', 5, 5, '2019-09-11', '2019-09-12 11:33:04', '2019-09-12 15:22:09'),
(6, 16, 18, 'Cancel', 5, 5, '2019-09-11', '2019-09-12 11:33:04', '2019-09-12 15:31:03'),
(7, 5, 6, '0', 5, 5, '2019-09-14', '2019-09-12 11:33:04', '2019-09-12 15:40:10'),
(8, 9, 25, 'Cancel', 5, 5, '2019-09-11', '2019-09-12 11:33:04', '2019-09-12 15:22:39'),
(9, 17, 9, '0', 3, 4, '2019-09-14', '2019-09-12 20:48:27', '2019-09-12 20:49:36'),
(10, 45, 9, '0', 5, 4, '2019-09-18', '2019-09-12 20:59:38', '2019-09-12 21:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomment`
--

CREATE TABLE `tblcomment` (
  `CID` int(11) NOT NULL COMMENT 'Comment ID',
  `CDescription` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Comment Description',
  `UID` int(11) NOT NULL COMMENT 'User ID',
  `IID` int(11) NOT NULL COMMENT 'Information ID',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinfo`
--

CREATE TABLE `tblinfo` (
  `IID` int(11) NOT NULL COMMENT 'Information ID',
  `ITitle` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Information Title',
  `IDescription` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Detail Description',
  `IType` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'News or Events',
  `IImg` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Image location',
  `PostedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Posted Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblinfo`
--

INSERT INTO `tblinfo` (`IID`, `ITitle`, `IDescription`, `IType`, `IImg`, `PostedDate`, `ModifiedDate`) VALUES
(1, 'Exclusive Sunset cruise trip from Botahtaung jetty to Thanlyin River!', '<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This service will run only on Sunday for people to enjoy the best of their holiday on a cruise provided by the Yangon Waterbus.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This service is special occasion and a special trip without passage scheduling.&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Drinks and food w</span><span data-contrast=\"auto\">ill be served to the passengers as a buffet.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Native passengers will cost 15000 </span><span data-contrast=\"auto\">MMK</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Foreign passengers will got $25</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">B</span><span data-contrast=\"auto\">ooking period can be within 5 </span><span data-contrast=\"auto\">to 7pm or the passenger can go to the jetty to personally purchase them for themselves. </span><span data-contrast=\"auto\">There are three cruise and each going out respectively at 5pm, 6pm and 7pm. </span><span data-contrast=\"auto\">Booked</span><span data-contrast=\"auto\"> tickets can only be confirmed by getting to the water bus 15 minutes before the departure. Any late booking tickets will have the risk of getting declined. Overall services include </span><span data-contrast=\"auto\">an exclusive cruise, exquisite service, buffet, wine </span><span data-contrast=\"auto\">and life insurance.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><em><span data-contrast=\"auto\">Let&rsquo;s all enjoy the reasonable cost of the waterbus service to see the beautiful</span></em><span data-contrast=\"auto\"> Yangon Waterbus Cruise</span><span data-contrast=\"auto\">!!</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>', 'Event', 'Yangon_sunset_1.jpg', '2019-09-11 09:24:12', '2019-09-13 09:51:45'),
(2, 'Dawn midstream kyaunktan pagoda visit', '<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Morning sunrise</span><span data-contrast=\"auto\"> sightseei</span><span data-contrast=\"auto\">ng trips are finally available now!</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">The dawn sunrise</span><span data-contrast=\"auto\"> service will always run on the weekends just for the lucky passengers to watch the beautiful sunsets that occur every day in Yangon city.&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This service is </span><span data-contrast=\"auto\">special occasion and a special trip without passage scheduling.</span><span data-contrast=\"auto\">&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Drinks and food will be served to the passengers.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Native passengers will cost 6</span><span data-contrast=\"auto\">000MMK</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Foreign passengers will got $10</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This opportun</span><span data-contrast=\"auto\">ity to see the sunrise </span><span data-contrast=\"auto\">in a reasonable</span><span data-contrast=\"auto\"> cost and a few pa</span><span data-contrast=\"auto\">ssenger is hard these days.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Booking period can be within 7am to 7pm or the passenger can go to the jetty to personally purchase them for themselves. Booked tickets can only be confirme</span><span data-contrast=\"auto\">d by getting to the water bus 15</span><span data-contrast=\"auto\"> minutes before the departure. Any late booking tickets will have the risk of getting declined. Overall services include water, coffee, lunch and life insurance.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><em><span data-contrast=\"auto\">Let&rsquo;s all enjoy the reasonable cost of the waterbus service to see the beautiful</span></em><span data-contrast=\"auto\"> Yangon sunrise</span><span data-contrast=\"auto\">!!</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>', 'Event', 'pagoda.jpg', '2019-09-11 09:25:55', '2019-09-13 09:51:49'),
(3, 'One Year Anniversary of the Yangon Waterbus Transportation System ', '<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">To all the customers of our Yangon Waterbus Transportation System, we are happy to announce that it has been a year we have been travelling each other. We are proud to celebrate the success of the Yangon Waterbus Transportation system with our beloved customers at the Botahtaung Jetty. There will be a buffet and lucky draw events for the people who will give the time to attend there.</span><span data-contrast=\"auto\"> In order to participate in this lucky draw event&hellip;.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<ol>\r\n<li aria-setsize=\"-1\" data-leveltext=\"(%1)\" data-font=\"\" data-listid=\"1\" data-aria-posinset=\"1\" data-aria-level=\"1\"><span data-contrast=\"auto\">Like and share the Yangon Waterbus Facebook page</span><span data-ccp-props=\"{&quot;134233279&quot;:true,&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></li>\r\n</ol>\r\n<ol>\r\n<li aria-setsize=\"-1\" data-leveltext=\"(%1)\" data-font=\"\" data-listid=\"1\" data-aria-posinset=\"2\" data-aria-level=\"1\"><span data-contrast=\"auto\">Bring any ticket coupons as a drawing ticket</span><span data-ccp-props=\"{&quot;134233279&quot;:true,&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></li>\r\n</ol>\r\n<ol>\r\n<li aria-setsize=\"-1\" data-leveltext=\"(%1)\" data-font=\"\" data-listid=\"1\" data-aria-posinset=\"3\" data-aria-level=\"1\"><span data-contrast=\"auto\">Only the ticket coupons bought within September 19</span><span data-contrast=\"auto\">th</span><span data-contrast=\"auto\"> to 20</span><span data-contrast=\"auto\">th</span><span data-contrast=\"auto\"> is counted</span><span data-ccp-props=\"{&quot;134233279&quot;:true,&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></li>\r\n</ol>\r\n<ol>\r\n<li aria-setsize=\"-1\" data-leveltext=\"(%1)\" data-font=\"\" data-listid=\"1\" data-aria-posinset=\"4\" data-aria-level=\"1\"><span data-contrast=\"auto\">If any inconvenience would come up </span><span data-contrast=\"auto\">regarding the tickets, </span><span data-contrast=\"auto\">come and consult the Yangon water bus.</span><span data-ccp-props=\"{&quot;134233279&quot;:true,&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></li>\r\n</ol>', 'Event', 'one_year.png', '2019-09-11 09:50:21', '2019-09-13 09:51:51'),
(4, 'Evening Trips', '<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">The evening sunset service will always run on the weekends just for the lucky passengers to watch the beautiful sunsets that occur every day in Yangon city.&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This service is only av</span><span data-contrast=\"auto\">ailable only from the B</span><span data-contrast=\"auto\">otataung jetty.&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Drinks and food will be served to the passengers.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Native passengers will cost 3000MMK</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Foreign passengers will got $5</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">This opportun</span><span data-contrast=\"auto\">ity to see the sunset in a reasonable</span><span data-contrast=\"auto\"> cost is not something to let go.&nbsp;</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Booking period can be within 7am to 7pm or the passenger can go to the jetty to personally purchase them for themselves. Booked tickets can only be confirmed by getting to the water bus 45 minutes before the departure. Any late booking tickets will have the risk of getting declined. Overall services include water, coffee, lunch and life insurance.</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>\r\n<p style=\"font-weight: 400;\"><span data-contrast=\"auto\">Let&rsquo;s all enjoy the reasonable cost of the waterbus service to see the beautiful Yangon sunset!!</span><span data-ccp-props=\"{&quot;201341983&quot;:0,&quot;335559739&quot;:160,&quot;335559740&quot;:259}\">&nbsp;</span></p>', 'News', 'evening.jpg', '2019-09-11 09:51:41', '2019-09-13 09:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbljetty`
--

CREATE TABLE `tbljetty` (
  `JID` int(11) NOT NULL COMMENT 'Jetty ID',
  `JettyName` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Jetty Name',
  `BusStop` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Nearby Bus Stop',
  `RID` int(11) NOT NULL COMMENT 'Route ID',
  `JOrder` int(11) NOT NULL COMMENT 'Jetty Order Number',
  `JettyAdd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Jetty Address',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tbljetty`
--

INSERT INTO `tbljetty` (`JID`, `JettyName`, `BusStop`, `RID`, `JOrder`, `JettyAdd`, `CreatedDate`, `ModifiedDate`) VALUES
(5, 'Botahtaung Terminal', 'Botahtaung Bus stop, Botahtaung Zay Bus stop', 1, 1, '<p>At the Botahtaung Pagoda Road near Pigeon Square</p>', '2019-09-05 10:10:57', '2019-09-05 10:10:57'),
(6, 'Pansodan Terminal', '30 Street Bus Stop, Bogalay Zay Bus Stop', 1, 2, '<p>At the Strand Road near Seikkantha Park</p>', '2019-09-05 10:14:10', '2019-09-05 10:14:10'),
(7, 'Lan Thit Terminal', 'Maw Tin Bus Stop, Ki li Bus stop', 1, 3, '<p>At the Lan Thit Street near Mapco</p>', '2019-09-05 10:16:32', '2019-09-05 10:16:32'),
(8, 'Kyi Myin Daing Terminal', 'Nya Zay Bus Stop, Nat Sin bus stop', 1, 4, '<p>At the corner of Kyi Myin Daing kanner road and Zay Gyee street</p>', '2019-09-05 10:17:52', '2019-09-05 10:17:52'),
(9, 'Hlaing Terminal', 'BuTaTone Bus Stop, Chaung Wa bus stop', 1, 5, '<p>At the Hlaing Strand Street near Concorde</p>', '2019-09-05 10:19:00', '2019-09-05 10:19:00'),
(10, 'Insein Terminal', '48 Mini Bus Stop, Nyaung Pin Gate Bus Stop', 1, 6, '<p>At the Hlaing River Road near with Northern Park</p>', '2019-09-05 10:20:24', '2019-09-05 10:20:24'),
(11, 'Insein Terminal', '48 Mini bus stop, Nyaung Pin Gate bus stop', 12, 7, '<p>At the Hlaing River Road near with Northern Park</p>', '2019-09-05 10:43:40', '2019-09-05 10:43:40'),
(12, 'Pansodan Terminal', '30 Street Bus Stop, Bogalay Zay Bus Stop', 12, 8, '<p>At the Strand road near Seikkantha park</p>', '2019-09-05 10:45:47', '2019-09-05 10:45:47'),
(13, 'Ant Gyi Terminal', '-', 12, 9, '<p style=\"text-align: center;\">-</p>', '2019-09-05 10:46:35', '2019-09-05 10:46:35'),
(14, 'Botahtaung Terminal', 'Botahtaung Bus stop, Botahtaung Zay Bus stop', 3, 10, '<p>At the Btahtaung Pagoda road near Pigeon Square</p>', '2019-09-05 10:48:53', '2019-09-05 10:48:53'),
(15, 'Thamada Terminal', '-', 3, 10, '<p style=\"text-align: center;\">-</p>', '2019-09-05 10:49:58', '2019-09-05 10:49:58'),
(16, 'LanThit Terminal', 'Maw Tin Bus Stop, Ki li bus stop', 4, 12, '<p>At the Lan Thit street near Mapco</p>', '2019-09-05 10:55:13', '2019-09-05 10:55:13'),
(17, 'Sarparchaung Terminal', '-', 4, 13, '<p style=\"text-align: center;\">-</p>', '2019-09-05 10:55:36', '2019-09-05 10:55:36'),
(18, 'Insein Terminal', '48 Mini bus stop, Nyaung Pin Gate bus stop', 13, 1, '<p>At the Hlaing River Road</p>\r\n<p>&nbsp;</p>', '2019-09-10 13:34:28', '2019-09-10 15:37:36'),
(19, 'Hlaing Terminal', 'BuTaYone Bus stop, Chaung Wa bus stop', 13, 2, '<p>At the Hlaing River Road near with Northern Park</p>', '2019-09-10 13:35:00', '2019-09-10 15:41:18'),
(20, 'Kyi Myin Daing Terminal', 'Nya Zay bus stop, Nat Sin bus stop', 13, 3, '<p>At the corner of Kyi Myin Daing kanner road and Zay Gyee street</p>', '2019-09-10 13:35:57', '2019-09-10 15:42:17'),
(21, 'Lan Thit Terminal', 'Maw Tin bus stop, Ki li bus stop', 13, 4, '<p>At the Lan Thit street near Mapco</p>', '2019-09-10 13:36:36', '2019-09-10 15:43:56'),
(22, 'Pansodan Terminal', '30 Street Bus stop, Bogalay Zay bus stop', 13, 5, '<p>At the Strand Road near Seikantha park</p>', '2019-09-10 13:37:08', '2019-09-10 15:45:03'),
(23, 'Botahtaung Terminal', 'Botahtaung bus stop, Botahtaung Zay bus stop', 13, 6, '<p>At the Botahtaung Pagoda Road near Pigeon Square</p>', '2019-09-10 13:37:27', '2019-09-10 15:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblmailbox`
--

CREATE TABLE `tblmailbox` (
  `MailID` int(11) NOT NULL COMMENT 'Mail Inbox ID',
  `Subject` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Mail Subject',
  `Message` longtext COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Detail Message',
  `UserName` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Sender Name',
  `EmailAdd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Sender Email Address',
  `MCheck` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'MailReadUnread',
  `PostedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Posted Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblmailbox`
--

INSERT INTO `tblmailbox` (`MailID`, `Subject`, `Message`, `UserName`, `EmailAdd`, `MCheck`, `PostedDate`, `ModifiedDate`) VALUES
(3, 'Feedback', 'Thank you for your good services.', 'Kyaw Kyaw', 'kyawkyaw@gmail.com', '1', '2019-09-05 09:19:36', '2019-09-05 09:19:36'),
(4, 'Feedback', 'Good enough', 'Kyaw Thi', 'kt@gmail.com', '1', '2019-09-05 09:28:57', '2019-09-05 09:28:57'),
(6, 'Feedback', 'Hello Yangon water bus admin, I dont have much time but i have to spend some time to submit this feedback because your services move my heart and your employees are well trained and good at hostpitality.', 'HoneyNwayOo', 'honeyoo@gmail.com', '1', '2019-09-05 09:34:34', '2019-09-05 09:34:34'),
(7, 'Complaint', 'The waterbus I get on is very unsanitary and the service is very poorly handled. Not to mention it is late by 10 minutes.', 'Kelvin', 'Kelvin@gmail.com', '0', '2019-09-05 09:44:45', '2019-09-05 09:44:45'),
(9, 'Feedback', 'A', 'Ko Swet', 'amily@gmail.com', '1', '2019-09-05 14:45:47', '2019-09-05 14:45:47'),
(10, 'Feedback', 'A', 'Ko Swet', 'amily@gmail.com', '0', '2019-09-05 18:34:45', '2019-09-05 18:34:45'),
(11, 'Complaint', 'kaunge', 'Kong Burmese', 'kb@burma.com', '0', '2019-09-06 02:11:55', '2019-09-06 02:11:55'),
(12, 'Feedback', 'erfe', 'Kaung', 'kah@gmail.com', '0', '2019-09-06 02:14:42', '2019-09-06 02:14:42'),
(13, 'Feedback', 'Kaung', 'Kong Burmese', 'kb@burma.com', '0', '2019-09-06 02:15:07', '2019-09-06 02:15:07'),
(14, 'Complaint', 'Hello', 'Kong Harry Burmese', 'kb@harry.com', '0', '2019-09-06 02:15:37', '2019-09-06 02:15:37'),
(15, 'Feedback', 'Good servcies', 'Amily', 'amily@gmail.com', '0', '2019-09-06 02:18:04', '2019-09-06 02:18:04'),
(16, 'Feedback', 'KKK', 'Emily', 'emily@gmail.com', '0', '2019-09-06 02:19:23', '2019-09-06 02:19:23'),
(17, 'Feedback', 'KKK', 'Emily', 'emily@gmail.com', '0', '2019-09-06 02:21:00', '2019-09-06 02:21:00'),
(18, 'Suggestion', 'Good', 'Kaung Khant Kyaw', 'kaungkhant@gmail.com', '0', '2019-09-06 02:35:34', '2019-09-06 02:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `tblmanagement`
--

CREATE TABLE `tblmanagement` (
  `MID` int(11) NOT NULL COMMENT 'Management User ID',
  `FullName` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'User Full Name',
  `EmailAdd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Email Address',
  `MPwd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'User Password',
  `Role` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'User Role to differentiate permissions',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblmanagement`
--

INSERT INTO `tblmanagement` (`MID`, `FullName`, `EmailAdd`, `MPwd`, `Role`, `CreatedDate`, `ModifiedDate`) VALUES
(1, 'Administrator', 'admin@ywb.com.mm', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Admin', '2019-08-27 14:03:35', '2019-09-10 11:46:35'),
(2, 'Staff', 'staff1@ywb.com.mm', '1562206543da764123c21bd524674f0a8aaf49c8a89744c97352fe677f7e4006', 'Staff', '2019-08-27 14:04:45', '2019-09-10 11:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `tblroute`
--

CREATE TABLE `tblroute` (
  `RID` int(11) NOT NULL COMMENT 'Route ID',
  `RouteName` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Route Name',
  `RDescription` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Route Description',
  `RPrice` double NOT NULL COMMENT 'Route for price',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblroute`
--

INSERT INTO `tblroute` (`RID`, `RouteName`, `RDescription`, `RPrice`, `CreatedDate`, `ModifiedDate`) VALUES
(1, 'Botahtaung - Insein', '<p>swsdv</p>', 300, '2019-09-03 14:06:07', '2019-09-05 09:04:06'),
(2, 'Ant Gyi - Pansodan', '<p>dfvhp</p>', 200, '2019-09-03 14:07:21', '2019-09-05 09:04:10'),
(3, 'Thamada - Botahtaung', '<p>fsvu</p>', 300, '2019-09-03 14:08:08', '2019-09-05 09:11:04'),
(4, 'Sarparchaung - Lan Thit', '<p>rfkvuh</p>', 200, '2019-09-03 14:09:13', '2019-09-05 09:04:14'),
(12, 'Insein - Pansodan', '<p>ewrger</p>', 200, '2019-09-05 10:40:32', '2019-09-10 13:23:04'),
(13, 'Insein - Botahtaung', '<p>cusbv</p>', 300, '2019-09-10 13:24:13', '2019-09-10 13:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblschedule`
--

CREATE TABLE `tblschedule` (
  `SID` int(11) NOT NULL COMMENT 'Schedule ID',
  `STime` time NOT NULL COMMENT 'Schedule Time',
  `SType` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Schedule Time',
  `JID` int(11) NOT NULL COMMENT 'Jetty ID',
  `PostedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Posted Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tblschedule`
--

INSERT INTO `tblschedule` (`SID`, `STime`, `SType`, `JID`, `PostedDate`, `ModifiedDate`) VALUES
(3, '15:00:00', 'Weekday', 5, '2019-09-10 11:52:05', '2019-09-10 11:52:05'),
(4, '17:30:00', 'Weekday', 5, '2019-09-10 11:54:09', '2019-09-10 11:54:09'),
(5, '15:10:00', 'Weekday', 6, '2019-09-10 11:54:33', '2019-09-10 11:54:33'),
(6, '17:40:00', 'Weekday', 6, '2019-09-10 11:55:14', '2019-09-10 11:55:14'),
(7, '15:22:00', 'Weekday', 7, '2019-09-10 11:56:04', '2019-09-10 11:56:04'),
(8, '17:52:00', 'Weekday', 7, '2019-09-10 11:56:27', '2019-09-10 11:56:27'),
(9, '15:52:00', 'Weekday', 8, '2019-09-10 11:56:53', '2019-09-10 11:56:53'),
(10, '18:22:00', 'Weekday', 8, '2019-09-10 11:57:28', '2019-09-10 11:57:28'),
(12, '16:12:00', 'Weekday', 9, '2019-09-10 12:59:53', '2019-09-10 12:59:53'),
(13, '18:47:00', 'Weekday', 9, '2019-09-10 13:00:11', '2019-09-10 13:00:11'),
(14, '16:40:00', 'Weekday', 10, '2019-09-10 13:00:47', '2019-09-10 13:00:47'),
(15, '19:10:00', 'Weekday', 10, '2019-09-10 13:01:10', '2019-09-10 13:02:00'),
(16, '09:00:00', 'Weekend', 5, '2019-09-10 13:02:52', '2019-09-10 13:02:52'),
(17, '10:30:00', 'Weekend', 5, '2019-09-10 13:06:32', '2019-09-10 13:06:32'),
(18, '14:30:00', 'Weekend', 5, '2019-09-10 13:07:24', '2019-09-10 13:07:24'),
(19, '15:30:00', 'Weekend', 5, '2019-09-10 13:07:58', '2019-09-10 13:07:58'),
(20, '09:10:00', 'Weekend', 6, '2019-09-10 13:08:47', '2019-09-10 13:08:47'),
(21, '10:40:00', 'Weekend', 6, '2019-09-10 13:10:00', '2019-09-10 13:10:00'),
(22, '14:40:00', 'Weekend', 6, '2019-09-10 13:10:30', '2019-09-10 13:10:30'),
(23, '15:40:00', 'Weekend', 6, '2019-09-10 13:11:07', '2019-09-10 13:11:07'),
(24, '09:22:00', 'Weekend', 7, '2019-09-10 13:11:33', '2019-09-10 13:11:33'),
(25, '10:52:00', 'Weekend', 7, '2019-09-10 13:11:59', '2019-09-10 13:11:59'),
(26, '14:52:00', 'Weekend', 7, '2019-09-10 13:12:31', '2019-09-10 13:12:31'),
(27, '15:52:00', 'Weekend', 7, '2019-09-10 13:13:06', '2019-09-10 13:13:06'),
(28, '09:52:00', 'Weekend', 8, '2019-09-10 13:13:56', '2019-09-10 13:13:56'),
(29, '11:22:00', 'Weekend', 8, '2019-09-10 13:14:25', '2019-09-10 13:14:25'),
(30, '15:22:00', 'Weekend', 8, '2019-09-10 13:14:44', '2019-09-10 13:14:44'),
(31, '16:22:00', 'Weekend', 8, '2019-09-10 13:15:02', '2019-09-10 13:15:02'),
(32, '10:17:00', 'Weekend', 9, '2019-09-10 13:15:28', '2019-09-10 13:15:28'),
(33, '11:47:00', 'Weekend', 9, '2019-09-10 13:15:53', '2019-09-10 13:15:53'),
(34, '15:47:00', 'Weekend', 9, '2019-09-10 13:16:19', '2019-09-10 13:16:19'),
(35, '16:47:00', 'Weekend', 9, '2019-09-10 13:16:33', '2019-09-10 13:16:33'),
(36, '10:40:00', 'Weekend', 10, '2019-09-10 13:17:10', '2019-09-10 13:17:10'),
(37, '12:10:00', 'Weekend', 10, '2019-09-10 13:17:32', '2019-09-10 13:17:32'),
(38, '16:10:00', 'Weekend', 10, '2019-09-10 13:17:51', '2019-09-10 13:17:51'),
(39, '17:10:00', 'Weekend', 10, '2019-09-10 13:18:18', '2019-09-10 13:18:18'),
(40, '08:00:00', 'Weekday', 18, '2019-09-10 13:38:23', '2019-09-10 13:38:23'),
(41, '15:00:00', 'Weekday', 18, '2019-09-10 13:40:54', '2019-09-10 13:40:54'),
(42, '08:23:00', 'Weekday', 19, '2019-09-10 13:41:14', '2019-09-10 13:41:14'),
(43, '15:23:00', 'Weekday', 19, '2019-09-10 13:41:51', '2019-09-10 13:41:51'),
(44, '08:48:00', 'Weekday', 20, '2019-09-10 13:42:18', '2019-09-10 13:42:18'),
(45, '15:48:00', 'Weekday', 20, '2019-09-10 13:42:47', '2019-09-10 13:42:47'),
(46, '09:18:00', 'Weekday', 21, '2019-09-10 13:43:11', '2019-09-10 13:43:11'),
(47, '16:18:00', 'Weekday', 21, '2019-09-10 13:43:45', '2019-09-10 13:43:45'),
(48, '09:30:00', 'Weekday', 22, '2019-09-10 13:44:06', '2019-09-10 13:44:06'),
(49, '16:30:00', 'Weekday', 22, '2019-09-10 13:44:30', '2019-09-10 13:44:30'),
(50, '09:40:00', 'Weekday', 23, '2019-09-10 13:44:54', '2019-09-10 13:44:54'),
(51, '16:40:00', 'Weekday', 23, '2019-09-10 13:45:10', '2019-09-10 13:45:10'),
(52, '09:00:00', 'Weekend', 18, '2019-09-10 13:46:52', '2019-09-10 13:46:52'),
(53, '10:30:00', 'Weekend', 18, '2019-09-10 13:47:49', '2019-09-10 13:47:49'),
(54, '14:30:00', 'Weekend', 18, '2019-09-10 13:48:18', '2019-09-10 13:48:18'),
(55, '15:30:00', 'Weekend', 18, '2019-09-10 13:49:04', '2019-09-10 13:49:04'),
(56, '09:23:00', 'Weekend', 19, '2019-09-10 13:50:58', '2019-09-10 13:50:58'),
(57, '10:53:00', 'Weekend', 19, '2019-09-10 13:51:18', '2019-09-10 13:51:18'),
(58, '14:53:00', 'Weekend', 19, '2019-09-10 13:51:54', '2019-09-10 13:51:54'),
(59, '15:53:00', 'Weekend', 19, '2019-09-10 13:52:13', '2019-09-10 13:52:13'),
(60, '09:48:00', 'Weekend', 20, '2019-09-10 13:53:23', '2019-09-10 13:53:23'),
(61, '11:18:00', 'Weekend', 20, '2019-09-10 13:53:51', '2019-09-10 13:53:51'),
(62, '15:18:00', 'Weekend', 20, '2019-09-10 13:54:06', '2019-09-10 13:54:06'),
(63, '16:18:00', 'Weekend', 20, '2019-09-10 13:54:25', '2019-09-10 13:54:25'),
(64, '10:18:00', 'Weekend', 21, '2019-09-10 13:54:43', '2019-09-10 13:54:43'),
(65, '11:18:00', 'Weekend', 21, '2019-09-10 13:54:59', '2019-09-10 13:54:59'),
(66, '15:48:00', 'Weekend', 21, '2019-09-10 13:55:38', '2019-09-10 13:55:38'),
(67, '16:48:00', 'Weekend', 21, '2019-09-10 13:56:44', '2019-09-10 13:56:44'),
(68, '10:30:00', 'Weekend', 22, '2019-09-10 13:57:10', '2019-09-10 13:57:10'),
(69, '12:00:00', 'Weekend', 22, '2019-09-10 13:57:54', '2019-09-10 13:57:54'),
(70, '16:00:00', 'Weekend', 22, '2019-09-10 13:58:55', '2019-09-10 13:58:55'),
(71, '17:00:00', 'Weekend', 22, '2019-09-10 13:59:15', '2019-09-10 13:59:15'),
(72, '10:40:00', 'Weekend', 23, '2019-09-10 14:00:20', '2019-09-10 14:00:20'),
(73, '12:10:00', 'Weekend', 23, '2019-09-10 14:00:40', '2019-09-10 14:00:40'),
(74, '16:10:00', 'Weekend', 23, '2019-09-10 14:01:10', '2019-09-10 14:01:10'),
(75, '17:10:00', 'Weekend', 23, '2019-09-10 14:01:33', '2019-09-10 14:01:33'),
(76, '07:00:00', 'Weekday', 11, '2019-09-10 14:02:15', '2019-09-10 14:02:15'),
(77, '07:30:00', 'Weekday', 11, '2019-09-10 14:02:54', '2019-09-10 14:02:54'),
(78, '08:00:00', 'Weekday', 11, '2019-09-10 14:05:21', '2019-09-10 14:05:21'),
(79, '08:40:00', 'Weekday', 11, '2019-09-10 14:05:41', '2019-09-10 14:05:41'),
(80, '09:00:00', 'Weekday', 11, '2019-09-10 14:06:03', '2019-09-10 14:06:03'),
(81, '09:20:00', 'Weekday', 11, '2019-09-10 14:06:18', '2019-09-10 14:06:18'),
(82, '07:15:00', 'Weekday', 12, '2019-09-10 14:06:45', '2019-09-10 14:06:45'),
(83, '07:45:00', 'Weekday', 12, '2019-09-10 14:07:14', '2019-09-10 14:07:14'),
(84, '08:10:00', 'Weekday', 12, '2019-09-10 14:07:34', '2019-09-10 14:07:34'),
(85, '08:30:00', 'Weekday', 12, '2019-09-10 14:07:47', '2019-09-10 14:07:47'),
(86, '08:50:00', 'Weekday', 12, '2019-09-10 14:08:04', '2019-09-10 14:08:04'),
(87, '09:15:00', 'Weekday', 12, '2019-09-10 14:13:48', '2019-09-10 14:13:48'),
(88, '16:00:00', 'Weekday', 12, '2019-09-10 14:15:23', '2019-09-10 14:15:23'),
(89, '16:30:00', 'Weekday', 12, '2019-09-10 14:15:42', '2019-09-10 14:15:42'),
(90, '17:00:00', 'Weekday', 12, '2019-09-10 14:16:01', '2019-09-10 14:16:01'),
(91, '17:30:00', 'Weekday', 12, '2019-09-10 14:16:22', '2019-09-10 14:16:22'),
(92, '18:00:00', 'Weekday', 12, '2019-09-10 14:18:16', '2019-09-10 14:18:16'),
(93, '18:30:00', 'Weekday', 12, '2019-09-10 14:18:36', '2019-09-10 14:18:36'),
(94, '19:00:00', 'Weekday', 12, '2019-09-10 14:18:56', '2019-09-10 14:18:56'),
(95, '16:15:00', 'Weekday', 13, '2019-09-10 14:19:18', '2019-09-10 14:19:18'),
(96, '16:45:00', 'Weekday', 13, '2019-09-10 14:20:14', '2019-09-10 14:20:14'),
(97, '17:15:00', 'Weekday', 13, '2019-09-10 14:20:32', '2019-09-10 14:20:32'),
(98, '17:45:00', 'Weekday', 13, '2019-09-10 14:22:13', '2019-09-10 14:22:13'),
(99, '18:15:00', 'Weekday', 13, '2019-09-10 14:22:42', '2019-09-10 14:22:42'),
(100, '18:45:00', 'Weekday', 13, '2019-09-10 14:22:57', '2019-09-10 14:22:57'),
(101, '08:00:00', 'Weekend', 13, '2019-09-10 14:23:28', '2019-09-10 14:23:28'),
(102, '08:30:00', 'Weekend', 13, '2019-09-10 14:23:58', '2019-09-10 14:23:58'),
(103, '09:00:00', 'Weekend', 13, '2019-09-10 14:24:13', '2019-09-10 14:24:13'),
(104, '09:30:00', 'Weekend', 13, '2019-09-10 14:24:32', '2019-09-10 14:24:32'),
(105, '08:15:00', 'Weekend', 13, '2019-09-10 14:24:53', '2019-09-10 14:24:53'),
(106, '08:45:00', 'Weekend', 13, '2019-09-10 14:25:08', '2019-09-10 14:25:08'),
(107, '09:15:00', 'Weekend', 13, '2019-09-10 14:25:29', '2019-09-10 14:25:29'),
(108, '16:00:00', 'Weekend', 12, '2019-09-10 14:29:20', '2019-09-10 14:29:20'),
(109, '16:30:00', 'Weekend', 12, '2019-09-10 14:29:52', '2019-09-10 14:29:52'),
(110, '17:00:00', 'Weekend', 12, '2019-09-10 14:30:11', '2019-09-10 14:30:11'),
(111, '17:30:00', 'Weekend', 12, '2019-09-10 14:30:26', '2019-09-10 14:30:26'),
(112, '18:00:00', 'Weekend', 12, '2019-09-10 14:30:42', '2019-09-10 14:30:42'),
(113, '18:30:00', 'Weekend', 12, '2019-09-10 14:31:03', '2019-09-10 14:31:03'),
(114, '19:00:00', 'Weekend', 12, '2019-09-10 14:31:16', '2019-09-10 14:31:16'),
(115, '16:15:00', 'Weekend', 13, '2019-09-10 14:31:39', '2019-09-10 14:31:39'),
(116, '16:45:00', 'Weekend', 13, '2019-09-10 14:31:59', '2019-09-10 14:31:59'),
(117, '17:15:00', 'Weekend', 13, '2019-09-10 14:32:19', '2019-09-10 14:32:19'),
(118, '18:15:00', 'Weekend', 13, '2019-09-10 14:32:40', '2019-09-10 14:32:40'),
(119, '18:45:00', 'Weekend', 13, '2019-09-10 14:32:57', '2019-09-10 14:32:57'),
(120, '19:15:00', 'Weekend', 13, '2019-09-10 14:33:15', '2019-09-10 14:33:15'),
(121, '07:00:00', 'Weekday', 15, '2019-09-10 14:38:11', '2019-09-10 14:38:11'),
(122, '07:30:00', 'Weekday', 15, '2019-09-10 14:38:32', '2019-09-10 14:38:32'),
(123, '08:00:00', 'Weekday', 15, '2019-09-10 14:38:46', '2019-09-10 14:38:46'),
(124, '08:30:00', 'Weekday', 15, '2019-09-10 14:39:03', '2019-09-10 14:39:03'),
(125, '09:00:00', 'Weekday', 15, '2019-09-10 14:39:25', '2019-09-10 14:39:25'),
(126, '09:30:00', 'Weekday', 15, '2019-09-10 14:39:41', '2019-09-10 14:39:41'),
(127, '07:15:00', 'Weekday', 14, '2019-09-10 14:40:01', '2019-09-10 14:40:01'),
(128, '07:45:00', 'Weekday', 14, '2019-09-10 14:40:19', '2019-09-10 14:40:19'),
(129, '08:15:00', 'Weekday', 14, '2019-09-10 14:40:37', '2019-09-10 14:40:37'),
(130, '08:45:00', 'Weekday', 14, '2019-09-10 14:40:51', '2019-09-10 14:40:51'),
(131, '09:15:00', 'Weekday', 14, '2019-09-10 14:41:05', '2019-09-10 14:41:05'),
(132, '16:00:00', 'Weekday', 14, '2019-09-10 14:41:49', '2019-09-10 14:41:49'),
(133, '16:30:00', 'Weekday', 14, '2019-09-10 14:42:08', '2019-09-10 14:42:08'),
(134, '17:00:00', 'Weekday', 14, '2019-09-10 14:42:41', '2019-09-10 14:42:41'),
(135, '17:30:00', 'Weekday', 14, '2019-09-10 14:43:00', '2019-09-10 14:43:00'),
(136, '18:00:00', 'Weekday', 14, '2019-09-10 14:43:18', '2019-09-10 14:43:18'),
(137, '18:30:00', 'Weekday', 14, '2019-09-10 14:43:45', '2019-09-10 14:43:45'),
(138, '16:15:00', 'Weekday', 15, '2019-09-10 14:44:08', '2019-09-10 14:44:08'),
(139, '16:45:00', 'Weekday', 15, '2019-09-10 14:44:30', '2019-09-10 14:44:30'),
(140, '17:15:00', 'Weekday', 15, '2019-09-10 14:44:48', '2019-09-10 14:44:48'),
(141, '17:45:00', 'Weekday', 15, '2019-09-10 14:45:05', '2019-09-10 14:45:05'),
(142, '18:15:00', 'Weekday', 15, '2019-09-10 14:45:23', '2019-09-10 14:45:23'),
(143, '18:45:00', 'Weekday', 15, '2019-09-10 14:45:39', '2019-09-10 14:45:39'),
(144, '08:00:00', 'Weekend', 15, '2019-09-10 14:46:07', '2019-09-10 14:46:07'),
(145, '08:30:00', 'Weekend', 15, '2019-09-10 14:47:13', '2019-09-10 14:47:13'),
(146, '09:00:00', 'Weekend', 15, '2019-09-10 14:47:30', '2019-09-10 14:47:30'),
(147, '09:30:00', 'Weekend', 15, '2019-09-10 14:47:44', '2019-09-10 14:47:44'),
(148, '08:15:00', 'Weekend', 14, '2019-09-10 14:48:00', '2019-09-10 14:48:00'),
(149, '08:45:00', 'Weekend', 14, '2019-09-10 14:48:19', '2019-09-10 14:48:19'),
(150, '09:15:00', 'Weekend', 14, '2019-09-10 14:48:31', '2019-09-10 14:48:31'),
(151, '16:00:00', 'Weekend', 14, '2019-09-10 14:50:04', '2019-09-10 14:50:04'),
(152, '16:30:00', 'Weekend', 14, '2019-09-10 14:50:20', '2019-09-10 14:50:20'),
(153, '17:00:00', 'Weekend', 14, '2019-09-10 14:50:44', '2019-09-10 14:50:44'),
(154, '17:30:00', 'Weekend', 14, '2019-09-10 14:51:02', '2019-09-10 14:51:02'),
(155, '18:00:00', 'Weekend', 14, '2019-09-10 14:51:24', '2019-09-10 14:51:24'),
(156, '18:30:00', 'Weekend', 14, '2019-09-10 14:51:38', '2019-09-10 14:51:38'),
(157, '16:15:00', 'Weekend', 15, '2019-09-10 14:52:34', '2019-09-10 14:52:34'),
(158, '16:45:00', 'Weekend', 15, '2019-09-10 14:52:54', '2019-09-10 14:52:54'),
(159, '17:15:00', 'Weekend', 15, '2019-09-10 14:53:11', '2019-09-10 14:53:11'),
(160, '17:45:00', 'Weekend', 15, '2019-09-10 14:53:30', '2019-09-10 14:53:30'),
(161, '18:15:00', 'Weekend', 15, '2019-09-10 14:53:46', '2019-09-10 14:53:46'),
(162, '18:45:00', 'Weekend', 15, '2019-09-10 14:54:01', '2019-09-10 14:54:01'),
(163, '06:00:00', 'Weekday', 17, '2019-09-10 14:56:05', '2019-09-10 14:56:05'),
(164, '06:30:00', 'Weekday', 17, '2019-09-10 14:56:21', '2019-09-10 14:56:21'),
(165, '07:00:00', 'Weekday', 17, '2019-09-10 14:56:36', '2019-09-10 14:56:36'),
(166, '07:30:00', 'Weekday', 17, '2019-09-10 14:56:52', '2019-09-10 14:56:52'),
(167, '08:00:00', 'Weekday', 17, '2019-09-10 14:57:11', '2019-09-10 14:57:11'),
(168, '08:30:00', 'Weekday', 17, '2019-09-10 14:57:24', '2019-09-10 14:57:24'),
(169, '09:00:00', 'Weekday', 17, '2019-09-10 14:57:40', '2019-09-10 14:57:40'),
(170, '09:30:00', 'Weekday', 17, '2019-09-10 14:57:50', '2019-09-10 14:57:50'),
(171, '06:15:00', 'Weekday', 16, '2019-09-10 14:58:20', '2019-09-10 14:58:20'),
(172, '06:45:00', 'Weekday', 16, '2019-09-10 14:58:40', '2019-09-10 14:58:40'),
(173, '07:15:00', 'Weekday', 16, '2019-09-10 14:59:04', '2019-09-10 14:59:04'),
(174, '07:45:00', 'Weekday', 16, '2019-09-10 14:59:42', '2019-09-10 14:59:42'),
(175, '08:15:00', 'Weekday', 16, '2019-09-10 14:59:55', '2019-09-10 14:59:55'),
(176, '08:45:00', 'Weekday', 16, '2019-09-10 15:00:08', '2019-09-10 15:00:08'),
(177, '09:15:00', 'Weekday', 16, '2019-09-10 15:00:22', '2019-09-10 15:00:22'),
(178, '15:30:00', 'Weekday', 16, '2019-09-10 15:00:40', '2019-09-10 15:00:40'),
(179, '16:00:00', 'Weekday', 16, '2019-09-10 15:01:30', '2019-09-10 15:01:30'),
(180, '16:30:00', 'Weekday', 16, '2019-09-10 15:01:44', '2019-09-10 15:01:44'),
(181, '17:00:00', 'Weekday', 16, '2019-09-10 15:02:07', '2019-09-10 15:02:07'),
(182, '17:30:00', 'Weekday', 16, '2019-09-10 15:02:24', '2019-09-10 15:02:24'),
(183, '18:00:00', 'Weekday', 16, '2019-09-10 15:02:42', '2019-09-10 15:02:42'),
(184, '18:30:00', 'Weekday', 16, '2019-09-10 15:02:54', '2019-09-10 15:02:54'),
(185, '19:00:00', 'Weekday', 16, '2019-09-10 15:03:10', '2019-09-10 15:03:10'),
(186, '15:45:00', 'Weekday', 17, '2019-09-10 15:04:09', '2019-09-10 15:04:09'),
(187, '16:15:00', 'Weekday', 17, '2019-09-10 15:04:30', '2019-09-10 15:04:30'),
(188, '17:45:00', 'Weekday', 17, '2019-09-10 15:04:48', '2019-09-10 15:04:48'),
(189, '17:15:00', 'Weekday', 17, '2019-09-10 15:05:13', '2019-09-10 15:05:13'),
(190, '17:45:00', 'Weekday', 17, '2019-09-10 15:05:32', '2019-09-10 15:05:32'),
(191, '18:15:00', 'Weekday', 17, '2019-09-10 15:06:06', '2019-09-10 15:06:06'),
(192, '18:45:00', 'Weekday', 17, '2019-09-10 15:06:23', '2019-09-10 15:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UID` int(11) NOT NULL COMMENT 'User ID',
  `FullName` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'User Full Name',
  `EmailAdd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Email Address',
  `UPwd` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'User Password',
  `PhNo` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Phone Number',
  `Gender` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Male or Female',
  `Ans1` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Answer - 1',
  `Ans2` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Answer - 2',
  `Ans3` text COLLATE utf8_general_mysql500_ci NOT NULL COMMENT 'Answer - 3',
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Date',
  `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UID`, `FullName`, `EmailAdd`, `UPwd`, `PhNo`, `Gender`, `Ans1`, `Ans2`, `Ans3`, `CreatedDate`, `ModifiedDate`) VALUES
(1, 'Test User', 'testuser1@gmail.com', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', '+959123456', 'Male', '', '', '', '2019-08-29 13:34:20', '2019-08-29 13:34:20'),
(2, 'KaungKaung', 'kaungkaung123@gmail.com', 'd101e88229b3434b060632e72c057359717b9ce596c530bf8dcff78ed76cf06a', '+959767463827', 'male', '', '', '', '2019-09-04 10:41:36', '2019-09-04 10:41:36'),
(3, 'KyawMinKhant', 'kyawmin@gmail.com', '70515805082f85746fd1dfef06a28c3e4dde7538cb00dc76c099a5e1044fd5b4', '+95978473682', 'male', '', '', '', '2019-09-04 10:46:19', '2019-09-04 10:46:19'),
(4, 'Khant sithu aung', 'khantsithu@gmail.com', 'acc596a5b07a7c86e0bd166395e56a6e5533488b637f65366ef9b8a1ac35e092', '+959748647362', 'male', '', '', '', '2019-09-04 10:48:24', '2019-09-04 10:48:24'),
(5, 'Stevenhtet', 'stevenhtet@gmail.com', '7be75506f0c9f533a3dec02579763e9a39527ad8c68557d4cb70e362bb8e80f3', '+959736384738', 'male', '', '', '', '2019-09-04 10:50:13', '2019-09-04 10:50:13'),
(6, 'Leyon chris', 'leyonchris@gmail.com', 'efed98f7b99027e8f3f60841ac7f15c9d29a78b2802907cad50b3c7efb55e6b7', '+9597846372984', 'male', '', '', '', '2019-09-04 10:52:54', '2019-09-04 10:52:54'),
(7, 'Christiner', 'christiner@gmail.com', '333e7dc0390380323c935fd8e62019bf04cbfe489ff9fe01b62960f464386247', '+959785736385', 'male', '', '', '', '2019-09-04 10:53:50', '2019-09-04 10:53:50'),
(8, 'Charlie tom', 'charlietom@gmail.com', 'e31fb1056c9377c6640950ecf2ea147cd12c82af1e20f1aeacbe4c78502d56d7', '+959756355838', 'male', '', '', '', '2019-09-04 10:56:16', '2019-09-04 10:56:16'),
(9, 'Chang yee', 'changyee@gmail.com', 'bf56352b5ac02036f32a72d036f988f1052ae8172a312205d8b8c305156abf98', '+959758475932', 'male', '', '', '', '2019-09-04 10:57:16', '2019-09-04 10:57:16'),
(10, 'Zhang Wei', 'zhangwei@gmail.com', 'fe5f545877786858c59393121cdea81956ae6b7caf57e24f9a4d3a7903f81b61', '+959787463732', 'male', '', '', '', '2019-09-04 11:01:49', '2019-09-04 11:01:49'),
(11, 'Azumi Chiyako', 'Azumichiyako@gmail.com', '45587e838840bdcffbb04b8db093fe48253679491898d89bfa7b9ea0b3b6f92b', '+959746478363', 'female', '', '', '', '2019-09-04 11:03:30', '2019-09-04 11:03:30'),
(12, 'Aungkaungmyat', 'aungkaungmyat@gmail.com', '30c9c2e74aaafc71ad440925e9973ec5e1d7b1f00e298ee502a5849fb4c1b983', '+959794836374', 'male', '', '', '', '2019-09-04 11:05:26', '2019-09-04 11:05:26'),
(13, 'Suyeehtet', 'suyeehtet@gmail.com', 'fd3ac02dbcca85bbbe741037c8c4beaef27551c2df1b17588da22bb5b1baff16', '+959984748374', 'female', '', '', '', '2019-09-04 11:06:25', '2019-09-04 11:06:25'),
(15, 'Honeynwayoo', 'honeynwayoo@gmail.com', '15b982dcaf790dca702f449a23d0251fd3b7970d13815e00d5af262f7cea0eea', '+9597847646372', 'female', '', '', '', '2019-09-04 11:09:48', '2019-09-04 11:09:48'),
(16, 'Phonethirikyaw', 'phonethirikyaw@gmail.com', '1b8a6a5de8093632c242f834325a3c90fe05aa58347f9c3c5861e10b1c11bef1', '+959746483743', 'female', '', '', '', '2019-09-04 11:10:57', '2019-09-04 11:10:57'),
(17, 'MaungMaungOo', 'maungmaungoo@gmail.com', 'b1e59986ca7ba92247c49d0e68802e6eed823870465ab8aaff06d440e57cd83a', '+959984756371', 'male', '', '', '', '2019-09-04 11:18:25', '2019-09-04 11:18:25'),
(18, 'Akari Soe moe', 'akarisoe@gmail.com', 'cb178030b9187e0d3ac1f7fd366cbd3104cab8a238d6e53ec4422a1164a15203', '+959746453633', 'female', '', '', '', '2019-09-04 11:19:17', '2019-09-04 11:19:17'),
(19, 'Phoo Pwint phyu', 'phoopwint@gmail.com', '1b4a58a5242eb5b91eca2aff5cb53e4744db0f4b25529b8f2893a3662eb7a9b8', '+959987463210', 'female', '', '', '', '2019-09-04 11:20:22', '2019-09-04 11:20:22'),
(20, 'Nay Oo kyaw', 'nayoo@gmail.com', '8b634a34d01ff2c60091d2aa6595d15c4f9af13d92259aea55811bb974482d61', '+959746355843', 'male', '', '', '', '2019-09-04 11:21:54', '2019-09-04 11:21:54'),
(21, 'Kong Burmese', 'kb@burma.com', '28877ae869af57c757d1eb26e7cd1784f6aa6bd8dad8d996ee3665b87edcba22', '+959955513959', 'male', '', '', '', '2019-09-05 14:38:45', '2019-09-05 14:38:45'),
(22, 'Amily', 'amily@gmail.com', '26df1176d4f08c9483d653b871d8909afa107879697fa5969e6cfe7af592da0e', '+959955513959', 'female', '', '', '', '2019-09-06 02:17:40', '2019-09-06 02:17:40'),
(23, 'Emily', 'emily@gmail.com', 'e8e9689deac5bac977b64e85c1105bd1419608f1223bdafb8e5fbdf6cf939879', '+959944428293', 'female', '', '', '', '2019-09-06 02:21:32', '2019-09-06 02:21:32'),
(24, 'Thiha Soe', 'thiha@gmail.com', '28877ae869af57c757d1eb26e7cd1784f6aa6bd8dad8d996ee3665b87edcba22', '+959944420594', 'male', '', '', '', '2019-09-06 02:22:56', '2019-09-06 02:22:56'),
(25, 'Thiha', 'thihaso@gmail.com', '2d5cefee610f21c85d5cc6695ae153214959d6676d045a465b776eafcbcd6bdc', '+959944423424', 'male', '', '', '', '2019-09-06 02:27:49', '2019-09-06 02:27:49'),
(26, 'KayKay', 'kay@gmail.com', 'd6462a99b76988516a0a880116c0017b66754c39056b52204052dbcad70c22fa', '+95994434453', 'male', '', '', '', '2019-09-06 02:32:20', '2019-09-06 02:32:20'),
(27, 'Khay', 'khay@kww.com', 'b843380a704d32c3f326a1757ffbbd8b92b8437d95dc64bdbfa9d8348a5c6e99', '+95994487375', 'female', '', '', '', '2019-09-06 02:33:16', '2019-09-06 02:33:16'),
(28, 'Kaung Khant Kyaw', 'kaungkhant@gmail.com', 'f71fa0e7b7ae96b86137bcaeb3e07a21df32ff83e40a965f1be15ae4dfd032dd', '+95994423424', 'male', '', '', '', '2019-09-06 02:35:12', '2019-09-06 02:35:12'),
(29, 'Kaung Htet', 'khk@dinga.com', '959acfc4daeb192786d3be934d988f54be5748c64b44f2627d7c3c5b502b00b0', '+959955513959', 'male', '', '', '', '2019-09-06 02:52:26', '2019-09-06 02:52:26'),
(30, 'Kaung Htet Kyaw', 'khk@gmail.com', 'aee58c5bfb49d4591749bb23cb09ac4f152095a09c21d08bbe7188f393a815e4', '+959955513959', 'male', '', '', '', '2019-09-06 02:52:49', '2019-09-06 02:52:49'),
(31, 'Tracy', 'tracy@gmail.com', 'b1efc77a39364d74c235222399e56d46bc1bf795e6eb1c39887a424cadaf5357', '+959988812234', 'female', '', '', '', '2019-09-06 02:56:41', '2019-09-06 02:56:41'),
(32, 'Kong Sky', 'sky@gmail.com', '28877ae869af57c757d1eb26e7cd1784f6aa6bd8dad8d996ee3665b87edcba22', '+959955513959', 'male', '', '', '', '2019-09-06 03:17:46', '2019-09-06 03:17:46'),
(33, 'Kong K', 'kk@gmail.com', 'add08a1223b9e6b63002087626d7b2f363acd4bf1738a79fa88fb4e7791deff2', '+959944424597', 'male', '', '', '', '2019-09-06 03:29:11', '2019-09-06 03:29:11'),
(34, 'Kyaw', 'kw@gmail.com', '4cee53b0cfa4b7efb5962661a155c70c775297166ee248dd84efccd5b3c1c1fc', '+959944423452', 'male', '', '', '', '2019-09-06 03:29:34', '2019-09-06 03:29:34'),
(35, 'Goodman', 'goodman@gmail.com', 'f157bff67be77ce722ef65c4f9b5653d4a50198101cbd18dbe85493bbe41862c', '+959955513959', 'male', '', '', '', '2019-09-06 05:43:40', '2019-09-06 05:43:40'),
(36, 'Kaung Khant Kyaw', 'kksweet1999@gmail.com', '40ccb8602c019e5f971a56969c55c9279bf734cdeefeae984ff08cf574b4df79', '+95978362772', 'male', '', '', '', '2019-09-06 08:24:39', '2019-09-06 08:24:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `UID` (`UID`),
  ADD KEY `SID` (`SID`) USING BTREE;

--
-- Indexes for table `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `IID` (`IID`),
  ADD KEY `UID` (`UID`);

--
-- Indexes for table `tblinfo`
--
ALTER TABLE `tblinfo`
  ADD PRIMARY KEY (`IID`);

--
-- Indexes for table `tbljetty`
--
ALTER TABLE `tbljetty`
  ADD PRIMARY KEY (`JID`) USING BTREE,
  ADD KEY `RID` (`RID`);

--
-- Indexes for table `tblmailbox`
--
ALTER TABLE `tblmailbox`
  ADD PRIMARY KEY (`MailID`);

--
-- Indexes for table `tblmanagement`
--
ALTER TABLE `tblmanagement`
  ADD PRIMARY KEY (`MID`);

--
-- Indexes for table `tblroute`
--
ALTER TABLE `tblroute`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `tblschedule`
--
ALTER TABLE `tblschedule`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `JID` (`JID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Booking ID', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcomment`
--
ALTER TABLE `tblcomment`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Comment ID';

--
-- AUTO_INCREMENT for table `tblinfo`
--
ALTER TABLE `tblinfo`
  MODIFY `IID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Information ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbljetty`
--
ALTER TABLE `tbljetty`
  MODIFY `JID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Jetty ID', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblmailbox`
--
ALTER TABLE `tblmailbox`
  MODIFY `MailID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mail Inbox ID', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblmanagement`
--
ALTER TABLE `tblmanagement`
  MODIFY `MID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Management User ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblroute`
--
ALTER TABLE `tblroute`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Route ID', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblschedule`
--
ALTER TABLE `tblschedule`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID', AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD CONSTRAINT `tblbooking_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `tbluser` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblbooking_ibfk_3` FOREIGN KEY (`SID`) REFERENCES `tblschedule` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD CONSTRAINT `tblcomment_ibfk_1` FOREIGN KEY (`IID`) REFERENCES `tblinfo` (`IID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblcomment_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `tbluser` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbljetty`
--
ALTER TABLE `tbljetty`
  ADD CONSTRAINT `tbljetty_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `tblroute` (`RID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblschedule`
--
ALTER TABLE `tblschedule`
  ADD CONSTRAINT `tblschedule_ibfk_1` FOREIGN KEY (`JID`) REFERENCES `tbljetty` (`JID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
