-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2020 at 12:35 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `py`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `body_type`
--

CREATE TABLE `body_type` (
  `body_type_id` int(11) NOT NULL,
  `body_type_code` varchar(500) NOT NULL,
  `body_type` varchar(500) NOT NULL,
  `body_type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `body_type`
--

INSERT INTO `body_type` (`body_type_id`, `body_type_code`, `body_type`, `body_type_description`) VALUES
(1, '', 'thin', ''),
(2, '', 'Big', ''),
(3, '', 'Puffy', ''),
(4, '', 'Long and lean', '');

-- --------------------------------------------------------

--
-- Table structure for table `budget_range`
--

CREATE TABLE `budget_range` (
  `budget_range_id` int(11) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `budget_range`
--

INSERT INTO `budget_range` (`budget_range_id`, `minimum_amount`, `maximum_amount`) VALUES
(2, '100.00', '300.00'),
(3, '300.00', '500.00'),
(4, '500.00', '700.00'),
(5, '700.00', '1000.00'),
(6, '1000.00', '10000.00'),
(7, '20.00', '99.00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_items_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_items_id`, `cart_id`, `item_id`, `price`) VALUES
(1, 1, 1, '399.00'),
(2, 1, 2, '320.00'),
(3, 1, 4, '1000.00'),
(4, 2, 3, '400.00'),
(5, 3, 1, '399.00'),
(6, 3, 2, '320.00'),
(7, 3, 4, '1000.00'),
(8, 4, 11, '35.00'),
(9, 4, 13, '30.00'),
(10, 4, 38, '899.00'),
(11, 5, 11, '35.00'),
(12, 5, 13, '30.00'),
(13, 5, 38, '899.00'),
(14, 6, 41, '899.00'),
(15, 6, 45, '400.00'),
(16, 6, 37, '599.00'),
(17, 7, 39, '800.00'),
(18, 7, 43, '400.00'),
(19, 7, 38, '899.00'),
(20, 8, 17, '60.00'),
(21, 8, 38, '899.00'),
(22, 9, 37, '599.00'),
(23, 10, 20, '350.00'),
(24, 10, 26, '600.00'),
(25, 10, 33, '260.00'),
(26, 11, 49, '120.00'),
(27, 11, 51, '54.00'),
(28, 12, 2, '320.00'),
(29, 13, 47, '70.00'),
(30, 13, 48, '45.00'),
(31, 13, 50, '50.00'),
(32, 14, 54, '38.00'),
(33, 14, 55, '40.00'),
(34, 14, 59, '25.00'),
(35, 15, 54, '38.00'),
(36, 15, 55, '40.00'),
(37, 15, 59, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_main`
--

CREATE TABLE `cart_main` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` decimal(10,0) NOT NULL DEFAULT 0,
  `gender_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `body_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_main`
--

INSERT INTO `cart_main` (`cart_id`, `customer_id`, `rating`, `gender_id`, `size_id`, `category_id`, `season_id`, `body_type_id`, `event_id`, `skin_id`, `budget_id`, `date`, `total`) VALUES
(1, 6, '4', 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '1719.00'),
(2, 6, '5', 1, 5, 1, 2, 0, 4, 0, 0, '0000-00-00', '400.00'),
(3, 6, '5', 1, 2, 0, 0, 0, 0, 0, 0, '0000-00-00', '1719.00'),
(4, 12, '5', 2, 2, 0, 0, 0, 4, 0, 0, '0000-00-00', '964.00'),
(5, 11, '5', 2, 2, 0, 0, 0, 4, 0, 0, '0000-00-00', '964.00'),
(6, 10, '5', 2, 2, 0, 0, 0, 2, 0, 0, '0000-00-00', '1898.00'),
(7, 9, '5', 2, 3, 0, 0, 0, 2, 0, 0, '0000-00-00', '2099.00'),
(8, 13, '5', 2, 4, 0, 0, 0, 4, 0, 0, '0000-00-00', '959.00'),
(9, 11, '0', 2, 2, 0, 2, 0, 2, 0, 0, '0000-00-00', '599.00'),
(10, 6, '5', 1, 2, 0, 2, 0, 4, 0, 0, '0000-00-00', '1210.00'),
(11, 6, '5', 2, 1, 0, 3, 0, 1, 0, 0, '0000-00-00', '174.00'),
(12, 6, '5', 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '320.00'),
(13, 11, '3', 2, 2, 0, 2, 0, 1, 0, 0, '0000-00-00', '165.00'),
(14, 14, '5', 2, 2, 0, 0, 0, 2, 0, 0, '0000-00-00', '103.00'),
(15, 15, '5', 2, 2, 0, 0, 0, 2, 0, 0, '0000-00-00', '103.00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(500) NOT NULL,
  `gender` int(11) NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `gender`, `list_order`) VALUES
(1, 'Top wear', 0, 1),
(2, 'bottom wear', 0, 2),
(3, 'Foot Wear', 0, 3),
(9, 'Accessories', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country` varchar(500) NOT NULL,
  `country_code` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country`, `country_code`) VALUES
(1, 'India', 'ind'),
(2, 'U.K', 'U.K'),
(3, 'Australia', 'Aus'),
(4, 'Canada', 'can'),
(5, 'China', '12'),
(6, 'malesyya', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `addressline` varchar(500) NOT NULL,
  `country_id` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `zip` varchar(500) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `purchase_SKU` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `mobile`, `address`, `addressline`, `country_id`, `city`, `zip`, `user_name`, `password`, `purchase_SKU`) VALUES
(1, 'User', 'user@gmail.com', '7559831834', 'address', 'add2', '', '', '', '', '123456', ''),
(2, 'User2', 'usr@gmail.com', '9947343433', 'address', 'address2', '', '', '', '', '12356', ''),
(3, 'User', 'us@gmail.com', '7894561234', 'add1', 'add2', '', '', '', '', '789', ''),
(4, 'Nikhil Aasnikar', 'nikhilaasnikar@gmail.com', '894458780', 'Fort Ostman', 'Crumlin', '', '', '', '', 'nikhil1234', ''),
(5, 'Nimitha Pathy', 'nimith1234@gmail.com', '9164691641', '#146/B 10th cross\r\n5th main bapujinagar', '#146/B 10th cross', '', '', '', '', 'jumbo', ''),
(6, 'Naina sehgal', 'naina@gmail.com', '987676543', 'ireland', '', '', '', '', '', 'naina', ''),
(7, 'Leo sanders', 'leos@gmail.com', '0894656543', 'Ireland', '', '', '', '', '', 'leos', ''),
(8, 'Varsha ranganath', 'varsh27@gmail.com', '0897678953', 'Point Campus, Mayor Street upper', 'Point Campus, Mayor Street upper', '', '', '', '', 'varsha', ''),
(9, 'Pratim patil', 'pratim@gmail.com', '0894565346', 'Dublin 2', '', '', '', '', '', 'pratim', ''),
(10, 'Nikita', 'niki@gmail.com', '0895654340', 'Rathmines', '', '', '', '', '', 'niki', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event`, `description`) VALUES
(1, 'Festive', ''),
(2, 'Party', ''),
(3, 'Sports', ''),
(4, 'Formals', ''),
(5, 'Travel', ''),
(6, 'Casual', ''),
(7, 'Event', '');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender` enum('Male','Female','Other','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `imagename` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` int(11) NOT NULL,
  `gender_tag` varchar(500) NOT NULL,
  `size_tag` varchar(500) NOT NULL,
  `event_tag` varchar(500) NOT NULL,
  `season_tag` varchar(500) NOT NULL,
  `color_tag` varchar(500) NOT NULL,
  `body_type_tag` varchar(500) NOT NULL,
  `design_tag` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `published` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `imagename`, `name`, `price`, `category`, `gender_tag`, `size_tag`, `event_tag`, `season_tag`, `color_tag`, `body_type_tag`, `design_tag`, `description`, `published`) VALUES
(1, '019774boys-formal-shirt-500x500.jpg', 'Boys Formal shirt', '399.00', 1, '1', '1,2,3,4,5,6', '1,2,3,4', '1,2,3,4', '1,2,3', '1,2,3', '', 'des', 'yes'),
(2, 'DF24FEJeans.jpg', 'Elastic Skin Fit Jeans', '320.00', 2, '1', '1,2,3,4', '1,2,3,4', '1,2,3,4', '1,2', '1,2,3', '', 'des', 'yes'),
(3, 'B1CFABtopwearman.jpg', 'Full Sleeves Formal Shirts for Mens & Boys', '400.00', 1, '1', '3,4,5', '1,2,3,4', '1,2,3', '1,2,3', '1,2,3', '', 'des', 'yes'),
(4, 'D36FCFhush.jpg', 'Hush Puppies Mens Merchant Formal Shoes', '1000.00', 3, '1', '1,2,3,4,5', '1,2,3,4,5,6,7', '1,2,3,4', '1,2,3', '1,2,3', '', 'des', 'yes'),
(5, 'A9EBBDBROWON-New-Arrival-Plus-Size-Mens-Formal-Shirts-Meteor-Print-Long-Sleeve-Blouse-Shirts-for-Men.jpg_640x640q70.jpg', 'Men formal wear', '25.00', 1, '1', '2', '4', '2', '1', '1', '', 'Men Formal cotton shirt.', 'yes'),
(6, '63A4C8Formal_shirt.jpg', 'Men formal wear 1', '28.00', 1, '1', '3', '4', '2', '3', '2', '', 'Formal wear', 'yes'),
(7, '857E5Cformal-shirts-for-men-dark-green-shirt-mens-supplier-500x500.jpg', 'Shirt', '22.00', 1, '1', '2', '4', '1', '3', '1', '', 'Formal wear', 'yes'),
(8, '278DA9Men_formal_blazer.jpg', 'Men blazer', '40.00', 1, '1', '2', '4', '1', '3', '3', '', 'Blazer', 'yes'),
(9, '28F9D9Men_formal_plus.jpg', 'men plus size', '30.00', 1, '1', '5', '4', '3', '1', '3', '', 'Formal wear', 'yes'),
(10, 'A24CBEformal_1_women.jpg', 'Women formals', '26.00', 1, '2', '1', '4', '2', '1', '1', '', 'Formal', 'yes'),
(11, '835086Women_formal_white.jpg', 'Women formal 1', '35.00', 1, '2', '2', '4', '1', '3', '4', '', 'Formals', 'yes'),
(12, 'D5EAC5women-formal_2.jpg', 'Women formal', '35.00', 1, '2', '2', '4', '3', '3', '3', '', 'Formal wear', 'yes'),
(13, '3D7093Women_formal_skirt.jpg', 'Formal skirt', '30.00', 2, '2', '2', '4', '2', '3', '3', '', 'Skirt', 'yes'),
(14, 'FCA9DCGrey_pants_M.jpg', 'Formal pant', '40.00', 2, '2', '2', '4', '2', '1', '3', '', 'Formal pants', 'yes'),
(15, '3D845AWomen_formal_skirt_black.jpg', 'Formal skirt', '50.00', 2, '2', '2', '4', '2', '3', '1', '', 'Skirt', 'yes'),
(16, '2D858BPlus_size_skirt.jpg', 'Women skirt', '38.00', 2, '2', '5', '4', '2', '2', '2', '', 'Plus size', 'yes'),
(17, '29B79DFormal_wear_plus_size.jpg', 'formal', '60.00', 1, '2', '5', '4', '4', '1', '3', '', 'Dress', 'yes'),
(18, 'C5368EMarrown_formal_skirt.jpg', 'Dress formal', '65.00', 1, '2', '5', '4', '3', '3', '3', '', 'Dress', 'yes'),
(19, '314F1Dwomen_formal_blazer.jpg', 'Blazer women formal', '55.00', 1, '2', '2', '4', '4', '2', '4', '', 'Blazer', 'yes'),
(20, '88AEADAIRGRACIAS-Men-Shirt-Long-Sleeve-Solid-Color-Men-Shirts-Soft-Comfort-Pure-Cotton-Slim-Fit-White-3.jpg', 'Airgeacias Men Shirt', '350.00', 1, '1', '1,2,3,4,5,6,7', '1,2,3,4', '1,2,3', '1,2,3', '1,2,3', '', 'des', 'yes'),
(21, 'A4DBB211016-e26f58-640x640.jpg', 'Printed Short Sleeved Slimfit', '400.00', 1, '1', '1,2,3,4', '1,2,3,4', '2', '1,2,3', '1,2,3,4', '', 'des', 'yes'),
(22, '7BDC132018-Spring-Autumn-Features-Shirts-Men-Casual-Jeans-Shirt-New-Arrival-Long-Sleeve-Casual-Slim-Fit__36694.1527251175.jpg', 'Long Sleeve Casual', '800.00', 1, '1', '1,2,3,4,5,6', '6', '3', '1,2,3', '1,2,3,4', '', 'des', 'yes'),
(23, '03AF0461FKyka99YL._UX679_.jpg', 'Rosatro Men Shirts Casual', '690.00', 1, '1', '1,2,3,4', '1,2,5,6', '1,2,3,4', '1,2,3', '1,2,3', '', 'des', 'yes'),
(24, '6A6EE426495953-9e28-471d-9085-0a5ab294bc43.jpg', 'Long Sleeve chic Design For men', '499.00', 1, '1', '1,2,3,4,5,6', '1', '1,2,3', '1', '1,2,3', '', 'des', 'yes'),
(25, '5C4B0DRed-And-Black-Plaid-Shirt-Men-Shirts-2019-New-Summer-Fashion-Chemise-Homme-Mens-Checkered-Shirts.jpg', 'Fashion Chemise Men Plaid shit', '599.00', 1, '1', '1,2,3,4,5,6', '6,7', '2,3', '1,2,3', '2,3', '', 'de', 'yes'),
(26, '6E1C35rBVaVVyLdbqAOwXIAABPihht7Do351.jpg', 'Men  Zipper  Jeans', '600.00', 2, '1', '2,3,4,5,6', '4', '1,2,3', '1,2', '2,3', '', 'des', 'yes'),
(27, 'D5098Cindex2-1564512509.jpg', 'Sweat Pants For Men', '450.00', 2, '1', '2,3,4,5', '3', '1,2,3', '1,2', '1,2,3', '', 'des', 'yes'),
(28, 'B54A42men-s-track-bottom-500x500.jpg', 'Poly Ester Track Bottom', '200.00', 2, '1', '1,2,3,4,5,6,7', '3,6', '1,2,3,4', '1,2,3', '1,2,3', '', 'des', 'yes'),
(29, 'A0A481levi-s-men-s-501-original-fit.jpg', 'Levis Original Fit Jeans', '1000.00', 2, '1', '3,4,5,6,7', '1,2,3', '1,2,3', '1,2', '1,2', '', 'des', 'yes'),
(30, '39F2D4HTB1hJtMLXXXXXckapXXq6xXFXXXA.jpg', 'Men Biker Jeans', '800.00', 2, '1', '1,2,3,4,5,6,7', '5,6,7', '1,2', '3', '1,2,3', '', 'des', 'yes'),
(31, '15EBCC139403858-88982463-1531912946.jpg', 'Leather Formal Shoes', '400.00', 3, '1', '1,6,7', '1,2,4,7', '1,2', '1,2', '1,2', '', 'des', 'yes'),
(32, 'C5D7F2VKC_PRIDE_3170-1000x1000.jpg', 'V K C Pride 3170', '600.00', 3, '1', '1,2,3,4,5,6', '1,2,3', '1,2,3', '1,2,3', '1,2,3', '', 'dec', 'yes'),
(33, '82BB8E81npc9HQ9RL._UL1500_.jpg', 'Outdoor Mesh canvas Sneakers', '260.00', 3, '1', '1,2,3,4,5,6,7', '1,2,3,4,5,6,7', '1,2,3,4', '1,2,3', '1,2', '', 'dec', 'yes'),
(34, 'E25B4DGucci-Shoes-Men-High-Top-Sneakers-GGsh128.jpg', 'High Top Rivet Shoes', '500.00', 3, '1', '4,5,6', '1,2,6,7', '2,3,4', '1,2,3', '1,2', '', 'DEC', 'yes'),
(35, 'C8C027ZUNYU-2019-New-Male-Shoes-Genuine-Leather-Men-Sandals-Summer-Men-Shoes-Beach-Sandals-Man-Fashion.jpg', 'Genuine Leather Sandle', '600.00', 3, '1', '1,2,3,4,5,6,7', '1,2,4,5,6', '1,3,4', '1,2', '1,2,3', '', 'dec', 'yes'),
(36, '40C632kiwi-01cgryblk-4-asian-black-original-imafmmsghhuagb49.jpeg', 'Running Shoes for women', '390.00', 3, '2', '1,2,3,4,5,6,7', '3', '1,2,3', '1,2', '1,2', '', 'dec', 'yes'),
(37, '0043B2sanrhu-6-dolphin-miles-black-original-imafey2hpfw3mc4v.jpeg', 'Black heel Sandles', '599.00', 3, '2', '1,2,3,4,5,6,7', '1,2,4,7', '2,3,4', '1,2', '1,2', '', 'dec', 'yes'),
(38, 'C9BD2Fsg-f-770-7-saint-g-black-original-imafgucvswvz3jps.jpeg', 'SG/F/770 Boots For Women', '899.00', 3, '2', '1,2,3,4,5', '2,4,7', '1,2', '1,2', '1,2,3', '', 'de', 'yes'),
(39, '564ECE81SwH0DR1PL._UX679_.jpg', 'Tops and Blouses Striped Lantern ', '800.00', 1, '2', '1,2,3', '1,2,4,5,6,7', '1,2,3,4', '1,2', '1,2,3', '', 'dec', 'yes'),
(40, '5CF5D8womens-corporate-blazer-500x500-500x500.jpg', 'Women Formal Wear', '800.00', 1, '2', '1,2', '4', '1,2,3', '1,2,3', '1,2,3', '', 'dec', 'yes'),
(41, '7FB92Egirls-top-500x500.jpg', 'Party Wear Girls Top', '899.00', 1, '2', '1,2,3,4,5,6,7', '2', '1,2,3,4', '1,2', '1,2,3', '', 'des', 'yes'),
(42, 'C99544navy-dress-DQ-2459-a.jpg', 'V-neck Prom Dress', '800.00', 1, '2', '1,2,3,4,5', '1,7', '1,2', '1,2', '1,2,3', '', 'dec', 'yes'),
(43, '826216750021_0002_Black_WDENIMPANTS.jpg', 'Forged Denim Pants', '400.00', 2, '2', '2,3,4,5,6,7', '1,2,6,7', '1,2,3', '1,2', '1,2,3', '', 'des', 'yes'),
(44, '8FF2C6514c882f6298eafd.jpg', 'Women Casual Jogger', '500.00', 2, '2', '1,2,3,4,5,6', '3,6', '1,2,3', '1,2', '1,2', '', 'de', 'yes'),
(45, '23BDD3IMG_9378__25426.1539113247.jpg', 'Women Jeans Blue', '400.00', 2, '2', '1,2,3,4,5,6', '1,2,5,6,7', '1,2,3', '1,2', '1,2', '', 'dec', 'yes'),
(46, '8FD44Fdainese_amelia_slim_womens_jeans_dark_blue_300x300.jpg', 'Women Jeans', '555.00', 2, '2', '1,2,3,4', '6', '1,2', '1,2', '1,2', '', 'de', 'yes'),
(47, 'CAB7B1ethnic_1_M.jpg', 'Ethnic', '70.00', 1, '2', '2', '1', '2', '', '', '', 'Blue top', 'yes'),
(48, 'FBEEDAWhite_palazzo.jpg', 'White palazzo', '45.00', 2, '2', '2', '1', '2', '', '', '', 'Ethnic', 'yes'),
(49, 'D13F38ethnic_2M.jpg', 'Ethnic', '120.00', 1, '2', '1', '1', '3', '', '', '', 'Festival', 'yes'),
(50, '54B04Fbb84602beadfc456358da8b30cff269e.jpg', 'Sandals', '50.00', 3, '2', '2', '1', '2', '', '', '', 'Ethnic sandals', 'yes'),
(51, '3C7478a812e3f2675ed0bed11787e49e705152.jpg', 'Heels', '54.00', 3, '2', '1', '1', '3', '', '', '', 'Ethnic sandals 2', 'yes'),
(52, '6B3136c87cef3ff7c809b404af4f6f132b7c4e.jpg', 'Bag', '35.00', 9, '2', '2', '2', '1', '', '', '', 'Handbag', 'yes'),
(53, '323A37puff_sleeves_rebecca_taylor_blouse.jpg', 'Top', '45.00', 1, '2', '2', '6', '2', '', '', '', 'casual', 'yes'),
(54, 'B49EED5e55f5cb2356525f9766ae7e2bbe42e3.jpg', 'Party wear', '38.00', 1, '2', '2', '2', '2', '', '', '', 'Sequin top', 'yes'),
(55, 'C4D16A5c6c55cb365fb7aa8c2cc949e1779051_M.jpg', 'Party wear', '40.00', 2, '2', '2', '2', '2', '', '', '', 'Black jean', 'yes'),
(56, 'CC0E8025700cdec96cc2dc6806fd0e2e850283.jpg', 'Party', '30.00', 1, '2', '2', '2', '2', '', '', '', 'White top', 'yes'),
(57, '651929b2f83a5f4bc9eea0ad37974b81ad88ad_pant_M.jpg', 'Party', '45.00', 2, '2', '2', '2', '2', '', '', '', 'Pant', 'yes'),
(58, '169C437fe906546d451f8037e7d811b7887f63.jpg', 'Party', '60.00', 1, '2', '2', '2', '2', '', '', '', 'Dress', 'yes'),
(59, '8495CB988c1d1e08a6159ad87f88736591c444_M.jpg', 'Heels', '25.00', 3, '2', '2', '2', '2', '', '', '', 'Heels', 'yes'),
(60, '2DCE0C608043c18fee88534e8618860ea36c70_M.jpg', 'Footwear', '30.00', 3, '2', '2', '2', '2', '', '', '', 'Ballerinas', 'yes'),
(61, 'F8916Df12e7e1b76a2d36d6a8e5d4b0413108a_M.jpg', 'Footwear', '35.00', 3, '2', '2', '2', '1', '', '', '', 'Boots', 'yes'),
(62, 'C22B0D2bfa52986b6dc9166aacdf45d5f371de.jpg', 'Party', '25.00', 1, '2', '3', '2', '1', '', '', '', 'Top', 'yes'),
(63, '120E7C1ce99310067942d41509a89909515632_S.jpg', 'Party', '29.00', 2, '2', '1', '2', '2', '', '', '', 'Shorts', 'yes'),
(64, '9B29AD03fb7818a32164d92d892444634896b5.jpg', 'Party wear', '80.00', 1, '2', '1', '2', '2', '', '', '', 'Jumpsuit', 'yes'),
(65, '4C7222938d20dc97f047e64d290c749d348cb9.jpg', 'Party wear', '75.00', 1, '2', '1', '2', '2', '', '', '', 'Off shoulder Dress', 'yes'),
(66, 'B19DD83120bc9368d035a8bac2f44c421ac411_L.jpg', 'Heels', '45.00', 3, '2', '1', '2', '2', '', '', '', 'Stilletos', 'yes'),
(67, 'BC84462bfa52986b6dc9166aacdf45d5f371de.jpg', 'Blue top', '43.00', 1, '2', '3', '2', '3', '', '', '', 'Bow top', 'yes'),
(68, '1C89C0549b5a71731476b6a78a33c97a781771_L.jpg', 'Shorts', '45.00', 2, '2', '3', '2', '3', '', '', '', 'Shorts', 'yes'),
(69, 'A9C9E86b938e0e79d7e1bfe3e2e697fa5d7a4f.jpg', 'Jumpsuit', '90.00', 1, '2', '3', '2', '2', '', '', '', 'White jumpsuit', 'yes'),
(70, '038CE8051be29a31fa6cea569a6aec04b71588.jpg', 'Blue jumpsuit', '70.00', 1, '2', '4', '2', '2', '', '', '', 'Jumpsuit', 'yes'),
(71, '11923E08d1c0d861500d956a8c0a3747b90326.jpg', 'Blue jumpsuit', '55.00', 1, '2', '4', '2', '3', '', '', '', 'Jumpsuit', 'yes'),
(72, 'DA9E4108d1c0d861500d956a8c0a3747b90326.jpg', 'Blue jumpsuit', '55.00', 1, '2', '4', '2', '3', '', '', '', 'Jumpsuit', 'yes'),
(73, '2E054776b43231eb318b4c466ea0966e388949.jpg', 'Dress', '65.00', 1, '2', '4', '2', '2', '', '', '', 'Dress', 'yes'),
(74, 'C227F26135c46b14bb7c6254ed86b84d0bf821.jpg', 'Pink dress', '35.00', 1, '2', '4', '2', '3', '', '', '', 'Pink dress', 'yes'),
(75, '8DCA2C125f1a05697d2a9b080469abec9399bb.jpg', 'Jumpsuit', '45.00', 1, '2', '3', '2', '2', '', '', '', 'Jumpsuit', 'yes'),
(76, '213FA49a56d986ef49d50e6951aefafc5d3e8c_M.jpg', 'Blue', '55.00', 2, '2', '2', '2', '3', '', '', '', 'Denim', 'yes'),
(77, 'EA3032a464bbf827970adb6a977059bb86be63.jpg', 'Top', '120.00', 1, '2', '4', '2', '2', '', '', '', 'Lace top', 'yes'),
(78, '984C23b5b49a90e716a009c22fa8f302a5d70d_S.jpg', 'Jeans', '140.00', 2, '2', '1', '2', '2', '', '', '', 'Black jeans', 'yes'),
(79, '1855AA549b5a71731476b6a78a33c97a781771_L.jpg', 'Skirt', '78.00', 2, '2', '3', '2', '3', '', '', '', 'Skirt', 'yes'),
(80, '168041767d72bf09933491d9c002719e7bc0a2_XL.jpg', 'Blue denim', '95.00', 2, '2', '4', '2', '2', '', '', '', 'Blue denim', 'yes'),
(81, '86C7F780c3b41b8e18c0cfa29ced2fda0f4039_L.jpg', 'Heels', '145.00', 3, '2', '3', '2', '2', '', '', '', 'Stilletos', 'yes'),
(82, '138B133b54b9d090107e41e80fb0c9604d4410_XL.jpg', 'Wedges', '78.00', 3, '2', '4', '2', '2', '', '', '', 'Wedges', 'yes'),
(83, '6150AB24a25afab14ab54e83ea5367b1ef656a_S.jpg', 'Heels', '57.00', 3, '2', '1', '2', '2', '', '', '', 'Heels', 'yes'),
(84, 'E4AB7F690fefb6ad13b5a3c7ea7cb67604c8e3_S.jpg', 'Shoes', '67.00', 3, '2', '1', '2', '3', '', '', '', 'Ballerinas', 'yes'),
(85, 'C6DD9A83358d8fa175f162c1b2d5ce91997794_L.jpg', 'Wedges', '135.00', 1, '2', '3', '2', '2', '', '', '', 'Wedges', 'yes'),
(86, 'AEF2974136c6fff050ae1bae9acfadda3ccbc1_XL.jpg', 'Boots', '146.00', 3, '2', '4', '2', '2', '', '', '', 'Boots', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `learning`
--

CREATE TABLE `learning` (
  `learning_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `body_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `learning_items`
--

CREATE TABLE `learning_items` (
  `id` int(11) NOT NULL,
  `learning_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_type` enum('gender','size','category','season','body_type','events','skin_color','budget_range') NOT NULL,
  `tag_id` int(11) NOT NULL,
  `learning_data` varchar(500) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `learning_items`
--

INSERT INTO `learning_items` (`id`, `learning_id`, `item_id`, `tag_type`, `tag_id`, `learning_data`, `priority`) VALUES
(1, 0, 1, 'gender', 1, 'gender1', 4),
(2, 0, 1, 'size', 1, 'size1', 1),
(3, 0, 1, 'season', 1, 'season1', 2),
(4, 0, 1, 'body_type', 1, 'body_type1', 2),
(5, 0, 1, 'events', 1, 'events1', 2),
(6, 0, 1, 'skin_color', 1, 'skin_color1', 2),
(7, 0, 1, 'budget_range', 3, 'budget_range3', 1),
(8, 0, 2, 'gender', 1, 'gender1', 18),
(9, 0, 2, 'size', 1, 'size1', 1),
(10, 0, 2, 'season', 1, 'season1', 1),
(11, 0, 2, 'body_type', 1, 'body_type1', 1),
(12, 0, 2, 'events', 1, 'events1', 1),
(13, 0, 2, 'skin_color', 1, 'skin_color1', 1),
(14, 0, 2, 'budget_range', 3, 'budget_range3', 1),
(15, 0, 6, 'gender', 1, 'gender1', 1),
(16, 0, 6, 'size', 1, 'size1', 1),
(17, 0, 6, 'season', 1, 'season1', 1),
(18, 0, 6, 'body_type', 1, 'body_type1', 1),
(19, 0, 6, 'events', 1, 'events1', 1),
(20, 0, 6, 'skin_color', 1, 'skin_color1', 1),
(21, 0, 6, 'budget_range', 3, 'budget_range3', 1),
(22, 0, 1, 'budget_range', 2, 'budget_range2', 1),
(23, 0, 4, 'gender', 1, 'gender1', 8),
(24, 0, 4, 'size', 1, 'size1', 2),
(25, 0, 4, 'season', 1, 'season1', 2),
(26, 0, 4, 'body_type', 1, 'body_type1', 1),
(27, 0, 16, 'gender', 1, 'gender1', 1),
(28, 0, 1, 'gender', 2, 'gender2', 1),
(29, 0, 3, 'gender', 1, 'gender1', 1),
(30, 0, 3, 'size', 5, 'size5', 1),
(31, 0, 3, 'season', 2, 'season2', 2),
(32, 0, 3, 'events', 4, 'events4', 2),
(33, 0, 1, 'size', 2, 'size2', 1),
(34, 0, 2, 'size', 2, 'size2', 1),
(35, 0, 4, 'size', 2, 'size2', 1),
(36, 0, 11, 'gender', 2, 'gender2', 2),
(37, 0, 11, 'size', 2, 'size2', 2),
(38, 0, 11, 'events', 4, 'events4', 4),
(39, 0, 13, 'gender', 2, 'gender2', 2),
(40, 0, 13, 'size', 2, 'size2', 2),
(41, 0, 13, 'events', 4, 'events4', 4),
(42, 0, 38, 'gender', 2, 'gender2', 4),
(43, 0, 38, 'size', 2, 'size2', 2),
(44, 0, 38, 'events', 4, 'events4', 6),
(45, 0, 41, 'gender', 2, 'gender2', 1),
(46, 0, 41, 'size', 2, 'size2', 1),
(47, 0, 41, 'events', 2, 'events2', 2),
(48, 0, 45, 'gender', 2, 'gender2', 1),
(49, 0, 45, 'size', 2, 'size2', 1),
(50, 0, 45, 'events', 2, 'events2', 2),
(51, 0, 37, 'gender', 2, 'gender2', 2),
(52, 0, 37, 'size', 2, 'size2', 2),
(53, 0, 37, 'events', 2, 'events2', 4),
(54, 0, 39, 'gender', 2, 'gender2', 1),
(55, 0, 39, 'size', 3, 'size3', 1),
(56, 0, 39, 'events', 2, 'events2', 2),
(57, 0, 43, 'gender', 2, 'gender2', 1),
(58, 0, 43, 'size', 3, 'size3', 1),
(59, 0, 43, 'events', 2, 'events2', 2),
(60, 0, 38, 'size', 3, 'size3', 1),
(61, 0, 38, 'events', 2, 'events2', 2),
(62, 0, 17, 'gender', 2, 'gender2', 1),
(63, 0, 17, 'size', 4, 'size4', 1),
(64, 0, 17, 'events', 4, 'events4', 2),
(65, 0, 38, 'size', 4, 'size4', 1),
(66, 0, 37, 'season', 2, 'season2', 2),
(67, 0, 20, 'gender', 1, 'gender1', 1),
(68, 0, 20, 'size', 2, 'size2', 1),
(69, 0, 20, 'season', 2, 'season2', 2),
(70, 0, 20, 'events', 4, 'events4', 2),
(71, 0, 26, 'gender', 1, 'gender1', 1),
(72, 0, 26, 'size', 2, 'size2', 1),
(73, 0, 26, 'season', 2, 'season2', 2),
(74, 0, 26, 'events', 4, 'events4', 2),
(75, 0, 33, 'gender', 1, 'gender1', 1),
(76, 0, 33, 'size', 2, 'size2', 1),
(77, 0, 33, 'season', 2, 'season2', 2),
(78, 0, 33, 'events', 4, 'events4', 2),
(79, 0, 49, 'gender', 2, 'gender2', 1),
(80, 0, 49, 'size', 1, 'size1', 1),
(81, 0, 49, 'season', 3, 'season3', 2),
(82, 0, 49, 'events', 1, 'events1', 2),
(83, 0, 51, 'gender', 2, 'gender2', 1),
(84, 0, 51, 'size', 1, 'size1', 1),
(85, 0, 51, 'season', 3, 'season3', 2),
(86, 0, 51, 'events', 1, 'events1', 2),
(87, 0, 47, 'gender', 2, 'gender2', 1),
(88, 0, 47, 'size', 2, 'size2', 1),
(89, 0, 47, 'season', 2, 'season2', 2),
(90, 0, 47, 'events', 1, 'events1', 2),
(91, 0, 48, 'gender', 2, 'gender2', 1),
(92, 0, 48, 'size', 2, 'size2', 1),
(93, 0, 48, 'season', 2, 'season2', 2),
(94, 0, 48, 'events', 1, 'events1', 2),
(95, 0, 50, 'gender', 2, 'gender2', 1),
(96, 0, 50, 'size', 2, 'size2', 1),
(97, 0, 50, 'season', 2, 'season2', 2),
(98, 0, 50, 'events', 1, 'events1', 2),
(99, 0, 54, 'gender', 2, 'gender2', 2),
(100, 0, 54, 'size', 2, 'size2', 2),
(101, 0, 54, 'events', 2, 'events2', 4),
(102, 0, 55, 'gender', 2, 'gender2', 2),
(103, 0, 55, 'size', 2, 'size2', 2),
(104, 0, 55, 'events', 2, 'events2', 4),
(105, 0, 59, 'gender', 2, 'gender2', 2),
(106, 0, 59, 'size', 2, 'size2', 2),
(107, 0, 59, 'events', 2, 'events2', 4);

-- --------------------------------------------------------

--
-- Table structure for table `learning_main`
--

CREATE TABLE `learning_main` (
  `learning_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `filter_type` enum('gender','size','category','season','body_type','events','skin_color','budget_range') NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relevence_tag`
--

CREATE TABLE `relevence_tag` (
  `relevence_tag_id` int(11) NOT NULL,
  `relevence_tag` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `season_id` int(11) NOT NULL,
  `season` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`season_id`, `season`) VALUES
(1, 'Winter'),
(2, 'Summer'),
(3, 'Autumn'),
(4, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`size_id`, `size`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `skin_color`
--

CREATE TABLE `skin_color` (
  `color_id` int(11) NOT NULL,
  `color` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skin_color`
--

INSERT INTO `skin_color` (`color_id`, `color`) VALUES
(1, 'moderate brown'),
(2, 'Choclate '),
(3, 'White');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `type` enum('admin','customer') NOT NULL DEFAULT 'admin',
  `user_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `ref_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `type`, `user_name`, `password`, `ref_id`) VALUES
(2, 'admin', 'admin', 'admin123', 0),
(6, 'customer', 'user@gmail.com', '123456', 1),
(7, 'customer', 'usr@gmail.com', '12356', 2),
(8, 'customer', 'us@gmail.com', '789', 3),
(9, 'customer', 'nikhilaasnikar@gmail.com', 'nikhil1234', 4),
(10, 'customer', 'nimith1234@gmail.com', 'jumbo', 5),
(11, 'customer', 'naina@gmail.com', 'naina', 6),
(12, 'customer', 'leos@gmail.com', 'leos', 7),
(13, 'customer', 'varsh27@gmail.com', 'varsha', 8),
(14, 'customer', 'pratim@gmail.com', 'pratim', 9),
(15, 'customer', 'niki@gmail.com', 'niki', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `body_type`
--
ALTER TABLE `body_type`
  ADD PRIMARY KEY (`body_type_id`);

--
-- Indexes for table `budget_range`
--
ALTER TABLE `budget_range`
  ADD PRIMARY KEY (`budget_range_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_items_id`);

--
-- Indexes for table `cart_main`
--
ALTER TABLE `cart_main`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `learning_items`
--
ALTER TABLE `learning_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `learning_main`
--
ALTER TABLE `learning_main`
  ADD PRIMARY KEY (`learning_id`);

--
-- Indexes for table `relevence_tag`
--
ALTER TABLE `relevence_tag`
  ADD PRIMARY KEY (`relevence_tag_id`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`season_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `skin_color`
--
ALTER TABLE `skin_color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `body_type`
--
ALTER TABLE `body_type`
  MODIFY `body_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `budget_range`
--
ALTER TABLE `budget_range`
  MODIFY `budget_range_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `cart_main`
--
ALTER TABLE `cart_main`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `learning_items`
--
ALTER TABLE `learning_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `learning_main`
--
ALTER TABLE `learning_main`
  MODIFY `learning_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relevence_tag`
--
ALTER TABLE `relevence_tag`
  MODIFY `relevence_tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `season`
--
ALTER TABLE `season`
  MODIFY `season_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skin_color`
--
ALTER TABLE `skin_color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
