-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2024 at 09:57 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock-management-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `inventory_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `inventory_item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint UNSIGNED NOT NULL,
  `in_stock_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0: outofstock, 1: instock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_item_id`),
  KEY `inventories_store_id_foreign` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`inventory_item_id`, `inventory_item_code`, `inventory_item_name`, `quantity`, `location`, `store_id`, `in_stock_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ITEM001', 'Item 1', 218, 'Location A', 11, '2024-12-22', 0, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(2, 'ITEM002', 'Item 2', 73, 'Location B', 5, '2024-12-22', 1, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(3, 'ITEM003', 'Item 3', 262, 'Location C', 9, '2024-12-22', 0, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(4, 'ITEM004', 'Item 4', 480, 'Location D', 4, '2024-12-22', 1, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(5, 'ITEM005', 'Item 5', 396, 'Location E', 19, '2024-12-22', 0, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(6, 'ITEM006', 'Item 6', 159, 'Location F', 20, '2024-12-22', 1, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(7, 'ITEM007', 'Item 7', 146, 'Location G', 2, '2024-12-22', 0, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(8, 'ITEM008', 'Item 8', 99, 'Location H', 26, '2024-12-22', 1, '2024-12-22 04:27:06', '2024-12-22 04:27:06'),
(9, 'ITEM009', 'Item 9', 334, 'Location I', 12, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(10, 'ITEM010', 'Item 10', 394, 'Location J', 13, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(11, 'ITEM011', 'Item 11', 392, 'Location K', 23, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(12, 'ITEM012', 'Item 12', 403, 'Location L', 14, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(13, 'ITEM013', 'Item 13', 417, 'Location M', 26, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(14, 'ITEM014', 'Item 14', 276, 'Location N', 3, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(15, 'ITEM015', 'Item 15', 71, 'Location O', 11, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(16, 'ITEM016', 'Item 16', 281, 'Location P', 3, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(17, 'ITEM017', 'Item 17', 386, 'Location Q', 12, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(18, 'ITEM018', 'Item 18', 441, 'Location R', 21, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(19, 'ITEM019', 'Item 19', 207, 'Location S', 4, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(20, 'ITEM020', 'Item 20', 141, 'Location T', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(21, 'ITEM021', 'Item 21', 56, 'Location U', 9, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(22, 'ITEM022', 'Item 22', 489, 'Location V', 12, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(23, 'ITEM023', 'Item 23', 130, 'Location W', 8, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(24, 'ITEM024', 'Item 24', 460, 'Location X', 8, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(25, 'ITEM025', 'Item 25', 271, 'Location Y', 7, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(26, 'ITEM026', 'Item 26', 261, 'Location @', 14, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(27, 'ITEM027', 'Item 27', 178, 'Location A', 4, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(28, 'ITEM028', 'Item 28', 475, 'Location B', 16, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(29, 'ITEM029', 'Item 29', 446, 'Location C', 25, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(30, 'ITEM030', 'Item 30', 258, 'Location D', 9, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(31, 'ITEM031', 'Item 31', 102, 'Location E', 2, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(32, 'ITEM032', 'Item 32', 138, 'Location F', 20, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(33, 'ITEM033', 'Item 33', 117, 'Location G', 15, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(34, 'ITEM034', 'Item 34', 421, 'Location H', 11, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(35, 'ITEM035', 'Item 35', 152, 'Location I', 5, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(36, 'ITEM036', 'Item 36', 489, 'Location J', 18, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(37, 'ITEM037', 'Item 37', 305, 'Location K', 24, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(38, 'ITEM038', 'Item 38', 202, 'Location L', 1, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(39, 'ITEM039', 'Item 39', 331, 'Location M', 4, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(40, 'ITEM040', 'Item 40', 480, 'Location N', 18, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(41, 'ITEM041', 'Item 41', 454, 'Location O', 16, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(42, 'ITEM042', 'Item 42', 255, 'Location P', 10, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(43, 'ITEM043', 'Item 43', 72, 'Location Q', 7, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(44, 'ITEM044', 'Item 44', 468, 'Location R', 18, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(45, 'ITEM045', 'Item 45', 315, 'Location S', 4, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(46, 'ITEM046', 'Item 46', 497, 'Location T', 3, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(47, 'ITEM047', 'Item 47', 376, 'Location U', 19, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(48, 'ITEM048', 'Item 48', 339, 'Location V', 26, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(49, 'ITEM049', 'Item 49', 387, 'Location W', 5, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(50, 'ITEM050', 'Item 50', 437, 'Location X', 6, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(51, 'ITEM051', 'Item 51', 441, 'Location Y', 22, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(52, 'ITEM052', 'Item 52', 307, 'Location @', 3, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(53, 'ITEM053', 'Item 53', 483, 'Location A', 18, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(54, 'ITEM054', 'Item 54', 458, 'Location B', 26, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(55, 'ITEM055', 'Item 55', 379, 'Location C', 13, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(56, 'ITEM056', 'Item 56', 156, 'Location D', 25, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(57, 'ITEM057', 'Item 57', 412, 'Location E', 8, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(58, 'ITEM058', 'Item 58', 365, 'Location F', 4, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(59, 'ITEM059', 'Item 59', 173, 'Location G', 2, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(60, 'ITEM060', 'Item 60', 365, 'Location H', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(61, 'ITEM061', 'Item 61', 20, 'Location I', 17, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(62, 'ITEM062', 'Item 62', 7, 'Location J', 17, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(63, 'ITEM063', 'Item 63', 404, 'Location K', 4, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(64, 'ITEM064', 'Item 64', 224, 'Location L', 18, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(65, 'ITEM065', 'Item 65', 34, 'Location M', 24, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(66, 'ITEM066', 'Item 66', 347, 'Location N', 4, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(67, 'ITEM067', 'Item 67', 1, 'Location O', 25, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(68, 'ITEM068', 'Item 68', 51, 'Location P', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(69, 'ITEM069', 'Item 69', 171, 'Location Q', 19, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(70, 'ITEM070', 'Item 70', 16, 'Location R', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(71, 'ITEM071', 'Item 71', 369, 'Location S', 21, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(72, 'ITEM072', 'Item 72', 80, 'Location T', 6, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(73, 'ITEM073', 'Item 73', 348, 'Location U', 25, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(74, 'ITEM074', 'Item 74', 395, 'Location V', 21, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(75, 'ITEM075', 'Item 75', 211, 'Location W', 11, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(76, 'ITEM076', 'Item 76', 385, 'Location X', 16, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(77, 'ITEM077', 'Item 77', 499, 'Location Y', 8, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(78, 'ITEM078', 'Item 78', 205, 'Location @', 4, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(79, 'ITEM079', 'Item 79', 214, 'Location A', 3, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(80, 'ITEM080', 'Item 80', 72, 'Location B', 15, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(81, 'ITEM081', 'Item 81', 323, 'Location C', 13, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(82, 'ITEM082', 'Item 82', 354, 'Location D', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(83, 'ITEM083', 'Item 83', 135, 'Location E', 10, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(84, 'ITEM084', 'Item 84', 342, 'Location F', 4, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(85, 'ITEM085', 'Item 85', 47, 'Location G', 21, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(86, 'ITEM086', 'Item 86', 225, 'Location H', 26, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(87, 'ITEM087', 'Item 87', 248, 'Location I', 20, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(88, 'ITEM088', 'Item 88', 200, 'Location J', 5, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(89, 'ITEM089', 'Item 89', 121, 'Location K', 20, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(90, 'ITEM090', 'Item 90', 456, 'Location L', 25, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(91, 'ITEM091', 'Item 91', 357, 'Location M', 25, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(92, 'ITEM092', 'Item 92', 262, 'Location N', 21, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(93, 'ITEM093', 'Item 93', 413, 'Location O', 11, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(94, 'ITEM094', 'Item 94', 328, 'Location P', 18, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(95, 'ITEM095', 'Item 95', 122, 'Location Q', 3, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(96, 'ITEM096', 'Item 96', 367, 'Location R', 6, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(97, 'ITEM097', 'Item 97', 69, 'Location S', 5, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(98, 'ITEM098', 'Item 98', 103, 'Location T', 14, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(99, 'ITEM099', 'Item 99', 139, 'Location U', 6, '2024-12-22', 0, '2024-12-22 04:27:07', '2024-12-22 04:27:07'),
(100, 'ITEM100', 'Item 100', 128, 'Location V', 17, '2024-12-22', 1, '2024-12-22 04:27:07', '2024-12-22 04:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(27, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(28, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(29, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(30, '2016_06_01_000004_create_oauth_clients_table', 1),
(31, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(32, '2019_08_19_000000_create_failed_jobs_table', 1),
(33, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(34, '2024_12_22_052608_create_inventories_table', 1),
(35, '2024_12_22_052652_create_stores_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('35f2fa49842d30d1a4fe429135b0e1563cdb4a1e816b08ec5419803a9e6ded07151b833e3ba305a8', 1, 1, 'user1@yopmail.com', '[]', 0, '2024-12-22 04:21:38', '2024-12-22 04:21:39', '2025-12-22 09:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'sU9kKjO8ljXKalALzO1ipvxDgyNUHPsecUv0fSax', NULL, 'http://localhost', 1, 0, 0, '2024-12-22 04:18:35', '2024-12-22 04:18:35'),
(2, NULL, 'Laravel Password Grant Client', '1YTJt6rSf9jtTsIXBxV9nZ5tUH562bC76mduWMrb', 'users', 'http://localhost', 0, 1, 0, '2024-12-22 04:18:35', '2024-12-22 04:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-12-22 04:18:35', '2024-12-22 04:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `store_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0: inactive, 1: active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Store 1', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(2, 'Store 2', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(3, 'Store 3', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(4, 'Store 4', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(5, 'Store 5', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(6, 'Store 6', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(7, 'Store 7', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(8, 'Store 8', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(9, 'Store 9', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(10, 'Store 10', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(11, 'Store 11', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(12, 'Store 12', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(13, 'Store 13', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(14, 'Store 14', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(15, 'Store 15', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(16, 'Store 16', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(17, 'Store 17', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(18, 'Store 18', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(19, 'Store 19', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(20, 'Store 20', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(21, 'Store 21', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(22, 'Store 22', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(23, 'Store 23', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(24, 'Store 24', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(25, 'Store 25', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54'),
(26, 'Store 26', 1, '2024-12-22 04:18:54', '2024-12-22 04:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User 1', 'user1@yopmail.com', NULL, '$2y$12$uhhOx1RbQr9GjUWDzsSQ5.xu3zLIQmd/xxXEGT7BSZnNN/dvJWJnO', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(2, 'User 2', 'user2@yopmail.com', NULL, '$2y$12$tX6Lh3NPDcHpLgEUpoCanOGVdO3Ew4YlEWCTfAsNTr6D0mJaiI9qC', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(3, 'User 3', 'user3@yopmail.com', NULL, '$2y$12$4uZIojB7bFlBqQY4rHadCubgv0eetFIcdoQUxR7LaxCbYfLKPy58u', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(4, 'User 4', 'user4@yopmail.com', NULL, '$2y$12$3Xr5GLKqK7CM7o3deSSzEON52Bk9nKaVMJFZ5Rr/9s/a4/qsJtpL6', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(5, 'User 5', 'user5@yopmail.com', NULL, '$2y$12$Q98maDYJcDZZ9jiWRB2nU.KDRhzSJY1KXz/aray7JMfMed9jsM0MS', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(6, 'User 6', 'user6@yopmail.com', NULL, '$2y$12$GC9hpXa8as3WLSmKT3JLReBoGY.xQi4o4nVjteDYpcyyhcJup/OQW', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(7, 'User 7', 'user7@yopmail.com', NULL, '$2y$12$ROtjCRZiy7wL/wM..YPs2O.rDSMqywWbHlWG/mXWhUZSXQIkwjFk.', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(8, 'User 8', 'user8@yopmail.com', NULL, '$2y$12$TxdPb4yY1tGdZor5nC5s5.FLcc3Tuxv/BBXdn0YcrRZoJHLLva5T6', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(9, 'User 9', 'user9@yopmail.com', NULL, '$2y$12$H3n1beqSBqbw93rfE0mm4e/leB1Yo3M7vxtQrEnVsRIWWIJMIBk1i', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06'),
(10, 'User 10', 'user10@yopmail.com', NULL, '$2y$12$UlrRVThAzB.I3Z9TCrjHb.9qFv.0Glj4nuBOvMRiykSxbPcikbmEq', NULL, '2024-12-22 04:18:54', '2024-12-22 04:27:06');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
