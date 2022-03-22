-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-03-22 10:30:25
-- 伺服器版本： 10.4.14-MariaDB
-- PHP 版本： 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `online_shopping`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `phone` int(8) NOT NULL,
  `email` varchar(40) NOT NULL,
  `created_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `username`, `pw`, `gender`, `phone`, `email`, `created_dt`) VALUES
(1, 'admin', 'admin000', 'admin000', 'F', 35788357, 'admin000@mail.com', '2020-11-03 12:04:54'),
(2, 'admin', 'admin001', 'admin001', 'M', 83944839, 'admin001@gg.g', '2020-11-04 17:04:53'),
(3, 'admin', 'admin002', 'admin002', 'F', 83533333, 'admin002@gg.g', '2020-11-04 17:04:53');

-- --------------------------------------------------------

--
-- 資料表結構 `bm_quantity`
--

CREATE TABLE `bm_quantity` (
  `no` int(11) NOT NULL,
  `item` enum('Bricks','Cement','Concrete','Sand','Reinforced Concrete','Glass','Plastic','Wood','Tiles') NOT NULL,
  `weight_g` int(5) NOT NULL,
  `price` float(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `bm_quantity`
--

INSERT INTO `bm_quantity` (`no`, `item`, `weight_g`, `price`) VALUES
(1, 'Concrete', 1000, 100.00),
(2, 'Bricks', 1200, 10.00),
(3, 'Cement', 2000, 35.00),
(4, 'Sand', 1500, 25.00),
(5, 'Reinforced Concrete', 3000, 30.00),
(6, 'Glass', 500, 90.00),
(7, 'Plastic', 400, 150.00),
(8, 'Wood', 700, 60.00),
(9, 'Tiles', 650, 70.00);

-- --------------------------------------------------------

--
-- 資料表結構 `building_material`
--

CREATE TABLE `building_material` (
  `no` int(11) NOT NULL,
  `case_id` int(5) NOT NULL,
  `order_id` int(5) NOT NULL,
  `item` enum('Bricks','Cement','Concrete','Sand','Reinforced Concrete','Glass','Plastic','Wood','Tiles') NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` float(7,2) NOT NULL,
  `Total_price` float(10,2) NOT NULL,
  `status` enum('pending','preparing','delivering','received') NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `building_material`
--

INSERT INTO `building_material` (`no`, `case_id`, `order_id`, `item`, `quantity`, `price`, `Total_price`, `status`, `created_dt`) VALUES
(1, 1, 1, 'Bricks', 10, 10.00, 100.00, 'delivering', '2022-02-13 01:00:53'),
(2, 1, 1, 'Cement', 200, 35.00, 7000.00, 'preparing', '2022-02-13 01:06:27'),
(3, 2, 2, 'Concrete', 40, 100.00, 4000.00, 'pending', '2022-02-13 01:08:19'),
(4, 3, 3, 'Sand', 600, 25.00, 15000.00, 'delivering', '2022-02-13 01:08:19'),
(5, 3, 3, 'Plastic', 600, 150.00, 90000.00, 'delivering', '2022-02-13 15:11:03'),
(6, 3, 4, 'Cement', 700, 35.00, 24500.00, 'received', '2022-02-13 15:11:03'),
(7, 3, 4, 'Wood', 890, 60.00, 53400.00, 'delivering', '2022-02-13 15:11:03'),
(8, 4, 5, 'Tiles', 900, 70.00, 63000.00, 'received', '2022-02-13 15:11:03'),
(9, 4, 6, 'Plastic', 2340, 150.00, 351000.00, 'pending', '2022-02-13 15:11:03'),
(10, 4, 6, 'Sand', 70, 25.00, 1750.00, 'pending', '2022-02-13 15:11:03'),
(11, 4, 7, 'Plastic', 400, 150.00, 60000.00, 'preparing', '2022-02-13 15:11:03'),
(12, 4, 7, 'Reinforced Concrete', 79, 30.00, 2370.00, 'preparing', '2022-02-13 15:11:03'),
(13, 5, 8, 'Bricks', 800, 10.00, 8000.00, 'delivering', '2022-02-13 15:20:16'),
(14, 5, 8, 'Reinforced Concrete', 900, 30.00, 27000.00, 'delivering', '2022-02-13 15:20:16'),
(15, 5, 9, 'Sand', 3000, 25.00, 75000.00, 'received', '2022-02-13 15:20:16'),
(16, 6, 10, 'Glass', 8570, 90.00, 771300.00, 'pending', '2022-02-13 15:22:04'),
(17, 16, 30, 'Reinforced Concrete', 12, 30.00, 360.00, 'pending', '2022-02-17 23:01:13'),
(18, 16, 31, 'Tiles', 100, 70.00, 7000.00, 'pending', '2022-02-18 14:28:02'),
(19, 16, 32, 'Glass', 23, 90.00, 2070.00, 'pending', '2022-02-19 22:57:22'),
(20, 20, 33, 'Plastic', 12, 150.00, 1800.00, 'pending', '2022-02-25 16:17:21'),
(21, 20, 33, 'Reinforced Concrete', 100, 30.00, 3000.00, 'pending', '2022-02-25 16:17:21'),
(22, 16, 34, 'Bricks', 12, 10.00, 120.00, 'pending', '2022-03-11 15:40:22'),
(23, 16, 35, 'Bricks', 12, 10.00, 120.00, 'pending', '2022-03-11 15:40:25'),
(24, 20, 36, 'Plastic', 120, 150.00, 18000.00, 'pending', '2022-03-11 17:05:02'),
(25, 20, 36, 'Sand', 120, 25.00, 3000.00, 'pending', '2022-03-11 17:05:02'),
(26, 20, 36, 'Wood', 909, 60.00, 54540.00, 'pending', '2022-03-11 17:05:02'),
(27, 16, 37, 'Reinforced Concrete', 120, 30.00, 3600.00, 'pending', '2022-03-11 17:16:54'),
(28, 16, 37, 'Glass', 120, 90.00, 10800.00, 'pending', '2022-03-11 17:16:54'),
(29, 16, 37, 'Wood', 300, 60.00, 18000.00, 'pending', '2022-03-11 17:16:54');

--
-- 觸發器 `building_material`
--
DELIMITER $$
CREATE TRIGGER `OnInsert` BEFORE INSERT ON `building_material` FOR EACH ROW SET NEW.`Total_price` = NEW.`quantity` * NEW.`price`
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `OnUpdate` BEFORE UPDATE ON `building_material` FOR EACH ROW SET NEW.`Total_price` = NEW.`quantity` * NEW.`price`
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `cases`
--

CREATE TABLE `cases` (
  `case_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `provider_id` int(5) NOT NULL,
  `category` set('decoration','design') NOT NULL,
  `description` varchar(100) NOT NULL,
  `address` varchar(30) NOT NULL,
  `district` enum('Islands','Kwai Tsing','North','Sai Kung','Sha Tin','Tai Po','Tsuen Wan','Tuen Mun','Yuen Long','Kowloon City','Kwun Tong','Sham Shui Po','Wong Tai Sin','Yau Tsim Mong','Central and Western','Eastern','Southern','Wan Chai') NOT NULL,
  `area` int(5) NOT NULL,
  `price` int(10) NOT NULL,
  `status` enum('Verifying','Posted','Processing','Done','Declined','Cancelled') NOT NULL,
  `created_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cases`
--

INSERT INTO `cases` (`case_id`, `customer_id`, `provider_id`, `category`, `description`, `address`, `district`, `area`, `price`, `status`, `created_dt`) VALUES
(1, 1, 0, 'decoration,design', 'ksfhgfskgfg', 'dsgdgdg', 'Yuen Long', 412, 0, 'Posted', '2020-10-21 10:58:07'),
(2, 2, 6, 'decoration', 'yogggg', 'sdsdgdsg', 'Central and Western', 734, 1419656, 'Done', '2020-10-21 14:42:42'),
(3, 3, 3, 'decoration', 'hdhgdgugu', 'dsres', 'Yau Tsim Mong', 2000, 319535, 'Done', '2020-10-30 11:37:32'),
(4, 1, 0, 'decoration', 'lsjghfgfg', 'sdgsdg', 'Eastern', 253, 0, 'Posted', '2020-10-30 12:44:05'),
(5, 16, 0, 'decoration,design', 'i want to blah', 'buildldldlding', 'Yau Tsim Mong', 5939, 0, 'Posted', '2020-11-04 17:23:50'),
(6, 10, 7, 'decoration,design', 'kdgjdgsd', 'janglngrg', 'Yau Tsim Mong', 2466, 99999, 'Processing', '2020-11-06 05:34:49'),
(7, 15, 5, 'decoration,design', 'adlnld', 'lnglkr', 'Tsuen Wan', 242, 2393253, 'Processing', '2020-11-06 05:34:49'),
(8, 2, 0, 'decoration', 'afsaf', 'afsasf', 'Islands', 2351, 0, 'Posted', '2020-11-05 22:16:14'),
(9, 2, 0, 'decoration,design', 'ljdgdklsgsdg', 'sjjdgksnkdgdg', 'Kwai Tsing', 83259, 0, 'Posted', '2020-11-06 05:24:10'),
(10, 4, 0, 'design', 'isahfsf', 'jkbdgs', 'North', 463, 0, 'Posted', '2020-11-06 05:24:54'),
(11, 19, 0, 'design', 'aljfslfjadfa', 'ksbdjhgsodf', 'Sai Kung', 49934, 0, 'Posted', '2020-11-06 05:24:54'),
(12, 24, 0, 'design', 'jnaddggd', 'jdskhkjsdg', 'Sha Tin', 245, 0, 'Posted', '2020-11-06 05:29:19'),
(13, 12, 0, 'decoration', 'eehkjsdfkjsdf', 'gwejrehr', 'Tai Po', 346, 0, 'Posted', '2020-11-06 05:29:19'),
(14, 9, 0, 'decoration,design', 'ehtnnfhg', 'efgekfk', 'Tsuen Wan', 357, 0, 'Posted', '2020-11-06 05:29:19'),
(15, 24, 0, 'design', 'kjdsbvkjdv', 'jdvwwrv', 'Tuen Mun', 64, 0, 'Posted', '2020-11-06 05:29:19'),
(16, 27, 23, 'design', 'ajdjkd', 'jvwrwgr', 'Yuen Long', 765, 0, 'Processing', '2020-11-06 05:29:19'),
(17, 6, 0, 'design', 'afnejewg', 'ljdnaljngjf', 'Kowloon City', 2644, 0, 'Posted', '2020-11-06 05:29:19'),
(18, 1, 0, 'decoration', 'wljngljnglwg', 'lnglwggnwlr', 'Kwun Tong', 2353, 0, 'Posted', '2020-11-06 05:29:19'),
(19, 4, 0, 'decoration,design', 'enfjlwnglg', 'nrgjnjg', 'Sham Shui Po', 2335, 0, 'Posted', '2020-11-06 05:29:19'),
(20, 20, 23, 'decoration', 'wngwwrkjr', 'eljngljrgnr', 'Wong Tai Sin', 23525, 112233, 'Processing', '2020-11-06 05:29:19'),
(21, 8, 0, 'design', 'rwjgnrlhnjr', 'elgnlrgnr', 'Yau Tsim Mong', 45435, 0, 'Posted', '2020-11-06 05:29:19'),
(22, 1, 1, 'design', 'rgnlerjhntl', 'lgnlrhnrhrwngelh', 'Central and Western', 7645, 4949, 'Done', '2020-11-06 05:29:19'),
(23, 2, 0, 'decoration', 'wjjgwlr', 'lekglrrhhr', 'Eastern', 34646, 0, 'Posted', '2020-11-06 05:29:19'),
(24, 3, 0, 'decoration,design', 'wnwrnhkwr', 'elgnegeg', 'Southern', 24646, 0, 'Posted', '2020-11-06 05:29:19'),
(25, 5, 0, 'decoration', 'ngwrnrwn', 'ejgkngk', 'Wan Chai', 2264, 0, 'Posted', '2020-11-06 05:29:19'),
(26, 2, 0, 'design', 'dfajkjdf', 'jdsngsj', 'Central and Western', 293, 0, 'Posted', '2020-11-07 19:12:23'),
(27, 24, 0, 'decoration', 'gkshs', 'fdjkgjsk', 'Southern', 2839, 0, 'Verifying', '2020-11-08 00:43:38'),
(28, 2, 0, 'design', 'lsdlgdg', 'ladnlgd', 'Central and Western', 4959, 0, 'Verifying', '2020-11-09 12:08:02'),
(29, 2, 0, 'design', 'ad,jfna,dg', 'admng,dsmg', 'Eastern', 382, 0, 'Verifying', '2020-11-10 11:14:38'),
(30, 2, 0, 'decoration,design', 'skdhgksdg', 'sdlgjlsf', 'Wan Chai', 3577, 0, 'Cancelled', '2020-11-10 12:48:50'),
(31, 2, 0, 'decoration,design', 'skdhgksdg', 'sdlgjlsf', 'Tuen Mun', 3577, 0, 'Posted', '2020-11-10 12:48:59'),
(32, 2, 0, 'decoration,design', 'skdhgksdg', 'sdlgjlsf', 'Southern', 3577, 0, 'Posted', '2020-11-10 12:48:59'),
(33, 2, 0, 'design', 'adljg', 'ldkjs', 'Tai Po', 346, 0, 'Verifying', '2020-11-10 12:54:05'),
(34, 2, 0, 'decoration', 'lksjdgsd', 'lkjdlkgjsfklg', 'Southern', 999, 0, 'Posted', '2020-11-10 15:19:50'),
(35, 2, 0, 'decoration', 'jdsllds', 'alfjlsf', 'North', 9990, 0, 'Declined', '2020-11-10 15:36:44'),
(36, 2, 0, 'decoration,design', 'sjdgsjg', 'ljhsdjg', 'Yau Tsim Mong', 999, 0, 'Posted', '2020-11-10 15:40:13'),
(37, 2, 0, 'decoration,design', 'lsdjgslg', 'lkjgdklsgk', 'Central and Western', 939, 0, 'Posted', '2020-11-10 15:42:17'),
(38, 2, 0, 'decoration,design', 'sljgnl', 'lsflg', 'Tsuen Wan', 9239, 0, 'Verifying', '2020-11-10 15:43:08'),
(39, 2, 0, 'design', 'ooooo', 'oooo', 'Kowloon City', 9, 0, 'Verifying', '2020-11-10 15:48:10'),
(40, 1, 0, 'design', 'apply me', 'apply me', 'Eastern', 999, 0, 'Posted', '2020-11-10 15:50:19'),
(41, 1, 0, 'design', 'bbb', 'bbb', 'Yau Tsim Mong', 999, 0, 'Cancelled', '2020-11-10 15:51:16'),
(42, 1, 0, 'design', 'ppp', 'ppp', 'Wong Tai Sin', 9090, 0, 'Cancelled', '2020-11-10 15:52:13'),
(43, 1, 0, 'decoration', 'opo', 'opop', 'North', 88, 0, 'Cancelled', '2020-11-10 15:52:28'),
(44, 1, 0, 'decoration,design', 'yy', 'yyoo9', 'Wong Tai Sin', 880, 0, 'Cancelled', '2020-11-10 15:52:49'),
(45, 2, 0, 'design', 'sjldglsdg', 'ldsnglsdg', 'Sai Kung', 2934, 0, 'Verifying', '2020-11-10 17:47:32'),
(46, 2, 0, 'decoration,design', 'sldkjgsl', 'kjsdgjs', 'Wan Chai', 919, 0, 'Posted', '2020-11-10 15:45:45'),
(47, 0, 0, 'decoration,design', 'jksdgksdg', 'sdjjsdlgsdg', 'Sha Tin', 999, 0, 'Cancelled', '2020-11-12 22:01:40'),
(48, 28, 0, 'decoration', 'hi', 'hi', 'Kowloon City', 199, 0, 'Posted', '2020-11-13 15:30:51'),
(49, 1, 1, 'design', 'akdljgsldkg', 'kdsgkldslkg', 'Islands', 235, 10000, 'Processing', '2020-11-13 16:22:16'),
(50, 1, 0, 'decoration', 'cancel me', 'cancel me', 'Sha Tin', 55555, 0, 'Posted', '2020-11-13 16:22:23'),
(51, 1, 0, 'decoration,design', '29045', 'lkdsjgl', 'Yuen Long', 9449, 0, 'Verifying', '2020-11-13 16:22:35'),
(52, 1, 0, 'design', 'lsdjglsfjlg', 'ljglksjglks', 'Tsuen Wan', 3333, 0, 'Posted', '2020-11-13 16:22:42'),
(53, 1, 0, 'decoration', 'slfjsgkllg', 'lkfdlkglksdg', 'Kwai Tsing', 45345, 0, 'Declined', '2020-11-13 16:22:50'),
(54, 1, 0, 'design', '123qwe', '123qwe', 'Islands', 456, 0, 'Verifying', '2021-03-18 17:43:49');

-- --------------------------------------------------------

--
-- 資料表結構 `cases_application`
--

CREATE TABLE `cases_application` (
  `casesApplication_id` int(10) NOT NULL,
  `case_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `provider_id` int(5) NOT NULL,
  `description` varchar(100) NOT NULL,
  `estimated_price` int(10) NOT NULL,
  `admin_status` enum('Accepted','Declined','Verifying') NOT NULL,
  `status` enum('Accepted','Waiting','Declined','cCancelled','pCancelled') NOT NULL COMMENT 'Accepted: accept by customer\r\nWaiting: not yet decided by customer\r\nDeclined: declined by customer\r\ncCancelled: cancelled by customer\r\npCancelled: cancelled by provider',
  `apply_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cases_application`
--

INSERT INTO `cases_application` (`casesApplication_id`, `case_id`, `customer_id`, `provider_id`, `description`, `estimated_price`, `admin_status`, `status`, `apply_dt`) VALUES
(1, 3, 3, 3, 'i am good, i think dadababa', 300000, 'Accepted', 'Accepted', '2020-11-05 21:02:22'),
(2, 2, 2, 6, 'me number 1', 1500000, 'Accepted', 'Accepted', '2020-11-05 21:02:22'),
(3, 1, 1, 1, 'cancel me', 5000000, 'Accepted', 'Waiting', '2020-11-07 15:47:24'),
(4, 10, 4, 2, 'kashfasf', 2500000, 'Accepted', 'Accepted', '2020-11-07 15:47:24'),
(5, 6, 10, 7, 'ajkdkadjg', 2000000, 'Accepted', 'Accepted', '2020-11-07 16:25:53'),
(6, 8, 2, 5, 'akjfaf', 100000, 'Accepted', 'Waiting', '2020-11-07 16:40:16'),
(7, 18, 1, 17, 'provider will be deleted', 90000, 'Accepted', 'Waiting', '2020-11-07 16:40:16'),
(8, 4, 1, 4, 'laladada', 1000000, 'Declined', 'cCancelled', '2020-11-07 20:27:02'),
(9, 4, 1, 3, 'im perfect', 999, 'Declined', 'cCancelled', '2020-11-07 21:14:57'),
(10, 4, 1, 2, 'im good', 100000, 'Declined', 'cCancelled', '2020-11-07 21:15:35'),
(11, 16, 27, 27, 'propro', 10000, 'Accepted', 'Waiting', '2020-11-07 21:16:25'),
(12, 4, 1, 1, 'lrgnfjlg', 83573, 'Declined', 'cCancelled', '2020-11-10 11:16:35'),
(13, 5, 16, 5, 'jdfl', 2999, 'Accepted', 'Waiting', '2020-11-10 13:46:06'),
(14, 21, 8, 5, 'gjfdkgbkjr', 38888, 'Verifying', 'Waiting', '2020-11-10 15:57:43'),
(15, 16, 27, 5, 'sjgldjgsdl', 28992, 'Verifying', 'Waiting', '2020-11-10 15:58:42'),
(16, 20, 20, 5, 'dskfj', 28888, 'Verifying', 'Declined', '2020-11-10 16:03:17'),
(17, 10, 4, 3, 'jfdkfjdk', 27777, 'Accepted', 'Waiting', '2020-11-10 16:06:03'),
(18, 15, 24, 5, 'lskjkldgsg', 22999, 'Verifying', 'pCancelled', '2020-11-10 16:16:39'),
(19, 10, 4, 5, 'iwoeoewi', 2982, 'Accepted', 'Waiting', '2020-11-10 16:18:23'),
(20, 17, 6, 1, 'akjfhkaf', 292934, 'Accepted', 'Waiting', '2020-11-10 16:26:46'),
(21, 24, 3, 1, 'sdjg', 2929, 'Verifying', 'Waiting', '2020-11-10 17:46:56'),
(22, 8, 2, 2, 'ksjdgksdg', 293893, 'Accepted', 'Waiting', '2020-11-10 18:12:03'),
(23, 8, 2, 1, 'adjnlgdsg', 27552, 'Accepted', 'Waiting', '2020-11-10 18:12:13'),
(24, 8, 2, 3, 'kfjshdje', 289525, 'Accepted', 'Waiting', '2020-11-10 18:12:20'),
(25, 8, 2, 4, 'bibi', 909090, 'Verifying', 'Waiting', '2020-11-10 18:14:14'),
(26, 30, 2, 3, 'lsdgjsdghjlsdngjl', 28929, 'Accepted', 'cCancelled', '2020-11-10 18:45:07'),
(27, 30, 2, 2, 'sdjgsjldg', 293, 'Accepted', 'cCancelled', '2020-11-10 18:45:15'),
(28, 32, 2, 1, 'sldjgsjldg39', 29829, '', 'pCancelled', '2020-11-10 18:45:23'),
(29, 31, 2, 2, 'sdjgldsjglsdg', 929292, 'Accepted', 'Waiting', '2020-11-10 18:45:30'),
(30, 31, 2, 1, 'sdjgsdgsgdl', 28929, 'Accepted', 'pCancelled', '2020-11-10 18:45:38'),
(31, 32, 2, 2, 'dljsfjlsdgjlsd2000', 20000, 'Accepted', 'Waiting', '2020-11-10 18:45:47'),
(32, 32, 2, 3, 'sdjgsjdgs200200', 100000, 'Accepted', 'Waiting', '2020-11-10 18:45:57'),
(33, 30, 2, 5, 'dksjgksjgdgs', 202000, 'Accepted', 'cCancelled', '2020-11-10 18:46:04'),
(34, 44, 0, 20, 'dkjsnfdkf', 191919, 'Declined', 'cCancelled', '2020-11-11 21:06:24'),
(35, 1, 1, 23, 'kjsddsgj', 2032, 'Accepted', 'Waiting', '2020-11-12 22:21:54'),
(36, 13, 12, 5, 'testing', 199, 'Declined', 'Waiting', '2020-11-13 15:34:54'),
(37, 12, 24, 1, 'testingagain', 1919, 'Verifying', 'Waiting', '2020-11-13 15:37:51'),
(38, 11, 19, 1, 'testing3gain', 19439, 'Verifying', 'pCancelled', '2020-11-13 15:39:25'),
(39, 19, 4, 1, 'testing4gain', 39311, 'Verifying', 'Waiting', '2020-11-13 15:40:40'),
(40, 22, 1, 1, 'lsdkgjlsdg', 0, 'Accepted', 'Accepted', '2020-11-13 16:36:22'),
(41, 18, 1, 1, 'accept me', 3939, 'Accepted', 'Waiting', '2020-11-13 16:37:49'),
(42, 46, 2, 1, 'gfl', 39, 'Verifying', 'Waiting', '2020-11-13 16:41:21'),
(43, 36, 2, 1, 'pppppppp', 333333333, 'Verifying', 'Waiting', '2020-11-13 16:43:18'),
(44, 14, 9, 1, 'pqqp', 2020, 'Verifying', 'Waiting', '2020-11-13 16:53:15'),
(45, 9, 2, 1, 'dskl', 39, 'Verifying', 'Waiting', '2020-11-13 16:53:43'),
(46, 49, 1, 3, 'ladjfldgk', 700, 'Accepted', 'Declined', '2020-11-13 18:29:36'),
(47, 15, 24, 3, 'dkdk', 3030, 'Verifying', 'Waiting', '2020-11-14 12:19:56'),
(48, 12, 24, 4, 'adklfjdsg', 22000, 'Verifying', 'Waiting', '2020-11-14 16:40:30'),
(49, 18, 1, 4, 'isldjflds', 100000, 'Accepted', 'Waiting', '2020-11-14 16:40:53'),
(50, 20, 20, 4, 'kkdlflskdfl', 100000, 'Verifying', 'Declined', '2020-11-14 16:41:08'),
(51, 4, 1, 5, 'sngnsdgsdng', 100000, 'Accepted', 'Waiting', '2020-11-14 16:41:26'),
(52, 12, 24, 5, 'lsdjlgjdsljgjdskg', 4000, 'Verifying', 'Waiting', '2020-11-14 16:41:34'),
(53, 18, 1, 5, 'sdjhdsgsdgll', 300000, 'Accepted', 'Waiting', '2020-11-14 16:41:45'),
(54, 1, 1, 3, 'skskkssk', 1010101, 'Accepted', 'Waiting', '2020-11-14 17:33:07'),
(55, 1, 1, 4, 'qpqppqp', 10000, 'Accepted', 'Waiting', '2020-11-14 17:33:45'),
(56, 1, 1, 5, 'qppppp', 1000000, 'Accepted', 'Waiting', '2020-11-14 17:34:09'),
(57, 1, 1, 6, 'yes', 99999, 'Accepted', 'Waiting', '2020-11-14 17:34:30'),
(58, 49, 1, 1, 'pppppppppp', 10000000, 'Accepted', 'Accepted', '2020-11-14 22:17:31'),
(59, 49, 1, 4, 'dpdpdppd', 900000, 'Accepted', 'Declined', '2020-11-14 22:20:18'),
(60, 48, 28, 1, 'customer will be deleted', 200000, 'Accepted', 'Declined', '2020-11-14 22:34:54'),
(61, 52, 3, 1, 'dodododod', 30000, 'Accepted', 'Waiting', '2020-11-14 22:47:53'),
(62, 50, 1, 1, 'this case will be cancelled', 100000, 'Accepted', 'Waiting', '2020-11-14 23:30:14'),
(64, 16, 27, 23, 'fdsaczxfdvcx', 123, 'Accepted', 'Accepted', '2022-02-16 23:09:38'),
(65, 20, 20, 23, 'abc please choose me', 112233, 'Accepted', 'Accepted', '2022-02-16 23:25:57');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `phone` int(8) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `username`, `pw`, `gender`, `phone`, `email`, `address`, `created_dt`) VALUES
(1, 'chiu mimii', 'customer', 'customer', 'F', 11111111, 'abc@umail.com', 'abc building 100/F Flat Z', '2020-10-21 00:00:00'),
(2, 'jayden hui', 'aaaaaaaa', 'aaaaaaaa', 'M', 77777777, 'jaydenhui@gmail.com', 'testing', '2020-10-28 00:00:00'),
(3, 'lam mimi', 'lammimi', 'fdksjlfjk', 'F', 33333333, 'lammimi@email.com', 'mimi building', '2020-10-30 00:00:00'),
(4, 'lau mimi', 'laumimi', 'ksjdfkdf', 'F', 22222222, 'laumimi@imail.com', 'laumimi building', '2020-10-30 00:00:00'),
(5, 'liu mimi', 'liumimi', 'kffak333333', 'M', 44444444, 'liumimi@qmail.com', 'liumimi building', '2020-10-30 00:00:00'),
(6, 'pui mimi', 'puimimi', 'afkely123', 'M', 55555555, 'puimimi@omail.com', 'puimimi building', '2020-10-30 00:00:00'),
(7, 'bui mimi', 'buimimi', 'buimimimi', 'F', 87654321, 'buimimi@yo.com', 'buimimi building', '2020-11-02 16:30:23'),
(8, 'oo mimi', 'fakfadjk', 'jdgdhkgdskh', 'M', 25936252, 'jsghhgrk@gshd.jsg', 'hskgdhsdgk', '2020-11-03 17:27:15'),
(9, 'dfdf mimi', 'shdgkgadg', 'kdajghkr', 'M', 29745445, 'dsjggeeg@gshd.jsg', 'kadjghr', '2020-11-03 17:27:20'),
(10, 'fufu mimi', 'aejhfjg', 'aeghkdeeg', 'F', 13874606, 'krgh@ksgjrg.egh', 'ldsjghrgrg', '2020-11-03 17:33:39'),
(11, 'chiu mimi', 'srjghrjgr', 'grgjrkgadf', 'M', 91935359, 'krjghrg@jjhdg.eghe', 'ejhege', '2020-11-03 17:36:28'),
(12, 'dfkdkfndf', 'rgjrhgjrg', 'egjegjee', 'M', 10840933, 'djfe@jeg.cmk', 'dfjef', '2020-11-03 17:54:00'),
(13, 'chiuff', 'ehfeug', 'djvhkjdgn', 'F', 29486043, 'djjghdg@rg.rg', '', '2020-11-04 15:33:19'),
(14, 'chiu oo', 'lrgjhrg', 'wlrghgeeg', 'M', 85932339, 'jgr@gj.f', 'wjeglhwg', '2020-11-04 15:55:35'),
(15, 'chiu bili', 'dajhdg', 'dguhgrgf', 'M', 83153555, 'djvhdv@g.g', 'buildingd', '2020-11-04 15:56:08'),
(16, 'chiu pipi', 'adjkhdg', 'aekjdgrg', 'M', 28974544, 'rjghg@rh.ge', 'ekhg', '2020-11-04 16:08:17'),
(17, 'mimio', 'adljfhdg', 'adljghadlg', 'M', 29744499, 'adjghdg@ef.fe', 'adkjghdg', '2020-11-04 16:09:25'),
(18, 'alm didi', 'efefefef', 'efefefefef', 'M', 92387535, 'djfhdf@rg.gr', '', '2020-11-04 16:14:14'),
(19, 'pui oep', 'adjfkhdf', 'efhefefef', 'M', 28937535, 'dkjfhd@g.gr', 'adljdlgg', '2020-11-04 16:15:09'),
(20, 'chiu mimi', 'mimimimim', 'mimimimimi', 'M', 83275922, 'adkjhd@fe.f', '', '2020-11-04 16:16:45'),
(21, 'chiu kjkj', 'adjfhdg', 'djkghdgdg', 'F', 47545464, 'dlkkjgdg@fg.gf', 'dgdgsg', '2020-11-04 16:22:30'),
(22, 'rringer', 'hihiihihih', 'hihihihihiih', 'F', 24578495, 'djhdg@f.ef', 'hihihihi building', '2020-11-04 16:31:22'),
(23, 'chiu mimi', 'ldhglegge', 'lheldgdgdg', 'F', 92857924, 'djghdlg@ge.g', 'adljgdg', '2020-11-04 16:32:10'),
(24, 'chiu mimi', 'lsdhldg', 'dlshgldgdg', 'M', 98434969, 'dsljhgd@g.ggg', 'ddfdfdfdffd', '2020-11-04 16:45:40'),
(25, 'chiu mimi', 'dljhgldg', 'dlghldgg', 'M', 48545459, 'dakjghdkg@g.g', '', '2020-11-04 16:46:48'),
(26, 'afsfas', 'asfafsasff', 'afsasfasf', 'F', 64646644, 'elg@g.g', 'gg', '2020-11-07 01:00:13'),
(27, 'delete me thank you', 'deleteme', 'deleteme', 'F', 23923999, 'grjggr@gggg.g', '', '2020-11-07 01:13:08'),
(28, 'twenty nine', 'adhhdhd', 'fhfhfhfhfhf', 'F', 54757575, 'fsgfh@g.g', '', '2020-11-07 01:15:24'),
(29, 'thirty', 'adhhdhd', 'fhfhfhfhfhf', 'F', 54757575, 'fsgfh@g.g', '', '2020-11-07 01:15:24'),
(30, 'thirty one', 'jdgjdjdjdk', 'kdhgkhuwifhf', 'F', 35235856, 'ewgkdg@g.g', '', '2020-11-07 01:28:46'),
(31, 'thirty two', 'bjbjbkjbgj', 'kjbbkjbkjbkj', 'F', 76775777, 'gfhyt@g.g', '', '2020-11-07 01:40:38'),
(32, 'thirty three', 'lkdsklgjskldg', 'kljskdlgjksd', 'F', 29292900, 'lsjdhgldsg@g.g', 'llsdgkls', '2020-11-11 16:23:08'),
(33, 'thirty four', 'thirtyfour', 'thirtyfour', 'F', 93939393, 'thirtyfour@g.g', 'ggg', '2020-11-14 18:46:47'),
(34, 'thirty five', 'thirtyfive', 'thirtyfive', 'F', 39393939, 'thirtyfive@gggg.g', 'dddd', '2020-11-14 18:47:59'),
(35, 'abc', 'abc123', 'ab123123', 'M', 12341234, 'abc@mail.com', '', '2021-10-16 13:58:36');

-- --------------------------------------------------------

--
-- 資料表結構 `provider`
--

CREATE TABLE `provider` (
  `provider_id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `introduction` varchar(100) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `phone` int(8) NOT NULL,
  `email` varchar(40) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `company_position` varchar(20) NOT NULL,
  `company_address` varchar(50) NOT NULL,
  `status` enum('Verified','Verifying','Declined') NOT NULL,
  `created_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `provider`
--

INSERT INTO `provider` (`provider_id`, `name`, `username`, `pw`, `introduction`, `gender`, `phone`, `email`, `company_name`, `company_position`, `company_address`, `status`, `created_dt`) VALUES
(1, 'real provider', 'provider', 'provider', 'i am good', 'F', 12312312, 'provider@gmail.com', '', '', '', 'Verified', '2020-11-02 19:04:59'),
(2, 'provider one', 'provider002', 'provider002', 'i am goodd', 'F', 31803582, 'provider001@g.cc', 'provider001 company ltd.', 'CEO', 'provider001 building', 'Verified', '2020-11-04 15:16:38'),
(3, 'provider', 'provider003', 'provider003', 'wonderful', 'M', 9148434, 'provider002@g.c', 'provider002 company', 'CEO', 'provider002 building', 'Verified', '2020-11-04 15:22:47'),
(4, 'provider', 'provider004', 'provider004', '', 'M', 9138533, 'provider003@g.g', '', '', '', 'Verified', '2020-11-04 15:40:32'),
(5, 'provider', 'provider005', 'provider005', '', 'F', 38295935, 'provider004@g.g', '', '', '', 'Verified', '2020-11-04 16:47:20'),
(6, 'provider', 'provider006', 'provider006', '', 'M', 23953333, 'provider005@g.g', '', '', '', 'Verified', '2020-11-04 16:57:14'),
(7, 'provider', 'provider007', 'provider007', '', 'F', 39355859, 'provider006@g.g', 'provider006 company', 'COO', 'provider006 building', 'Verified', '2020-11-04 16:58:29'),
(8, 'bling bling', 'provider008', 'provider008', 'superman', 'F', 23958735, 'provider007@gg.g', 'provider006 com', 'constructer', 'provider006 street', 'Verified', '2020-11-05 22:19:06'),
(9, 'providerrrr', 'provider009', 'provider009', 'pay me', 'M', 82353599, 'provider008@g.g', '', '', '', 'Verified', '2020-11-05 22:26:16'),
(10, 'provideererer', 'provider010', 'provider010', 'superwoman', 'F', 48584548, 'provider009@g.g', '', '', '', 'Verified', '2020-11-05 22:26:16'),
(11, 'notgood', 'notgoodd', 'notgoodd', 'wrhrhdddd', 'M', 46464646, 'kjghkjg@g.g', 'rjhgrg', 'wrgrg', 'wrgrg', 'Verified', '2020-11-05 22:27:43'),
(12, 'kjwgkjrg', 'rgrhhrgrg', 'rhrhrhrh', 'afefegdd', 'M', 23555777, 'egegeg@g.g', '', '', '', 'Verified', '2020-11-05 22:27:43'),
(13, 'verify me pls', 'verifyme', 'verifyme', 'yeah', 'F', 29296767, 'jkdhkjgdg@g.g', 'ekwhfkeg', 'rgrg', 'rwrwrh', 'Verifying', '2020-11-05 22:29:38'),
(14, 'wkjwgkeg', 'eqhkwghrr', 'wkjghkjwgr', 'gg', 'M', 29293877, 'eneg@g.g', '', '', '', 'Verifying', '2020-11-05 22:29:38'),
(15, 'kjegkjegk', 'hgfkgfkgfkgkr', 'ekjhksaabddg', 'kegkegddd', 'F', 48566644, 'kjg@g.g', 'ewgeg', 'egeg', 'gege', 'Verifying', '2020-11-05 22:30:44'),
(16, 'wekhgkw', 'ejghkegegell', 'egjhlglefee', 'ejhrkgrd', 'M', 28285656, 'rjhr@g.g', '', '', '', 'Verifying', '2020-11-05 22:30:44'),
(17, 'delete me la', 'deleteme2', 'deleteme2', 'bye guys', 'F', 90253925, 'sjkdghk@g.g', '', '', '', 'Verifying', '2020-11-07 01:47:48'),
(18, 'i was 18', 'jldgjldnsldg', 'wehgwegge', 'dkjskdgd', 'M', 98529299, 'ljgjlg@g.g', '', '', '', 'Verifying', '2020-11-07 01:48:36'),
(19, 'i was 19', 'ldglrgrff', 'kejhgkeg', 'goodd', 'F', 88448855, 'rkjgrg@gg.g', 'company yo', 'yoyo', 'yo', 'Verifying', '2020-11-08 20:00:35'),
(20, 'i was 20', 'bbbbbbbb', 'bbbbbbbb', 'spiderman', 'F', 84949944, 'kdjb@g,g', 'oooo', 'oooo', 'oooo', 'Verified', '2020-11-08 20:00:35'),
(21, 'i was 21', 'eglkemgklemk', 'dgdmsngsd', 'sdgjdddd', 'M', 29292929, 'wrg@g.g', '', '', '', 'Verifying', '2020-11-09 12:50:40'),
(22, 'i was 22', 'grkjgshk', 'rkgjhskfjg', 'gkajdhgkad', 'F', 32952295, 'sdjgl78@g.g', 'sdhg', 'lgj', 'rlkjlr', 'Verified', '2020-11-09 13:13:15'),
(23, 'i was 23', 'a', 'a', 'ksjdgkl', 'M', 22884583, 'skjdg@gg.g', 'sdjgh', 'jhssdjgh', 'jdghkjg', 'Verified', '2020-11-12 00:38:03');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `bm_quantity`
--
ALTER TABLE `bm_quantity`
  ADD PRIMARY KEY (`no`),
  ADD KEY `item` (`item`),
  ADD KEY `price` (`price`);

--
-- 資料表索引 `building_material`
--
ALTER TABLE `building_material`
  ADD PRIMARY KEY (`no`),
  ADD KEY `item` (`item`),
  ADD KEY `price` (`price`);

--
-- 資料表索引 `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`case_id`);

--
-- 資料表索引 `cases_application`
--
ALTER TABLE `cases_application`
  ADD PRIMARY KEY (`casesApplication_id`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- 資料表索引 `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bm_quantity`
--
ALTER TABLE `bm_quantity`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `building_material`
--
ALTER TABLE `building_material`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cases`
--
ALTER TABLE `cases`
  MODIFY `case_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cases_application`
--
ALTER TABLE `cases_application`
  MODIFY `casesApplication_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `building_material`
--
ALTER TABLE `building_material`
  ADD CONSTRAINT `building_material_ibfk_2` FOREIGN KEY (`price`) REFERENCES `bm_quantity` (`price`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `building_material_ibfk_3` FOREIGN KEY (`item`) REFERENCES `bm_quantity` (`item`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
