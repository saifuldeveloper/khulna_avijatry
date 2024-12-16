-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2024 at 07:41 PM
-- Server version: 10.6.17-MariaDB
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avijatry_khulna_retailer`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '000', 'Cash in hand', 0, 0, 'This is a default cash account.', 1, 1, '2024-10-07 12:35:08', '2024-10-07 12:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sazzad', NULL, 'Avijatry store', NULL, 'sazzad@gmail.com', '78945612', 'Uttara', 'Dhaka', NULL, NULL, NULL, 1, '2024-10-07 12:24:14', '2024-10-07 12:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Avijatry', '20241007040713.png', 1, '2024-10-07 10:07:13', '2024-10-07 10:07:13'),
(2, 'Apex', '20241007040726.jpeg', 0, '2024-10-07 10:07:26', '2024-12-12 01:49:59'),
(3, 'Bata', '20241007040816.png', 0, '2024-10-07 10:08:16', '2024-12-12 01:50:04'),
(4, 'Lotto', '20241007040829.png', 0, '2024-10-07 10:08:29', '2024-12-12 01:49:52'),
(5, 'China', NULL, 1, '2024-12-11 22:51:07', '2024-12-11 22:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 50000, 1, 1, 1, '2024-12-11 23:19:13', '2024-12-11 23:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'লেডিস', '20241008042953.jpg', NULL, 1, NULL, NULL),
(2, 'সু', '20241008043138.png', NULL, 1, NULL, NULL),
(3, 'জেন্টস', '20241008042657.jpg', NULL, 1, NULL, NULL),
(4, 'বেবি', '20241008042833.png', NULL, 1, NULL, NULL),
(5, 'পাম', NULL, 2, 0, NULL, '2024-12-12 01:52:55'),
(6, 'টেপ', NULL, 2, 0, NULL, '2024-12-12 01:53:04'),
(7, 'আংটা', NULL, 3, 0, NULL, '2024-12-12 01:53:18'),
(8, 'লোফার', NULL, 3, 0, NULL, '2024-12-12 01:53:22'),
(9, 'সীট', NULL, 3, 0, NULL, '2024-12-12 01:53:28'),
(10, 'কলাপুরি', NULL, 3, 0, NULL, '2024-12-12 01:53:33'),
(11, 'গোলাই', NULL, 1, 0, NULL, '2024-12-12 01:52:51'),
(12, 'কারচুপী', NULL, 3, 0, NULL, '2024-12-12 01:53:41'),
(13, 'সীট পাম্পী', NULL, 3, 0, NULL, '2024-12-12 01:52:42'),
(14, '০-২', NULL, 4, 0, NULL, '2024-12-12 01:53:12'),
(15, 'কেডস', NULL, 3, 1, NULL, NULL),
(16, 'Ladies', NULL, NULL, 1, NULL, NULL),
(17, 'Keds', NULL, 16, 1, NULL, NULL),
(18, 'নাগড়া', NULL, 16, 1, NULL, NULL),
(19, 'পাম্পি', NULL, 16, 1, NULL, NULL),
(20, 'Pumpi', NULL, 16, 1, NULL, NULL),
(21, 'Baby', NULL, NULL, 1, NULL, NULL),
(22, 'Keds.', NULL, 21, 1, NULL, NULL),
(23, '6-9', NULL, NULL, 1, NULL, NULL),
(24, 'Keds..', NULL, 23, 1, NULL, NULL),
(25, 'জে', NULL, NULL, 1, '2024-12-15 10:16:05', '2024-12-15 10:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Taka', '৳', 1, 1, '2024-09-26 09:34:55', '2024-09-26 09:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `tax_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `points`, `is_active`, `created_at`, `updated_at`, `deposit`, `expense`) VALUES
(1, 1, NULL, 'Walking Customer', NULL, NULL, '12345678', NULL, 'Uttara', 'Dhaka', NULL, NULL, NULL, NULL, 1, '2024-10-07 12:23:05', '2024-10-07 12:23:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'General Customer', '0', 1, '2024-10-07 14:06:18', '2024-10-07 14:06:18'),
(2, 'wholesale Customer', '0', 1, '2024-10-07 14:06:37', '2024-10-07 14:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_to` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(255) DEFAULT NULL,
  `recieved_by` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `applicable_for` varchar(255) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dso_alerts`
--

CREATE TABLE `dso_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `salary` decimal(15,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '13592410', 'Food', 0, '2024-12-11 01:11:14', '2024-12-11 01:12:29'),
(2, '51919443', 'Food', 0, '2024-12-11 01:13:03', '2024-12-11 03:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `staff_access` varchar(255) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(255) NOT NULL,
  `developed_by` varchar(255) DEFAULT NULL,
  `invoice_format` varchar(255) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(255) NOT NULL,
  `modules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`modules`)),
  `currency_position` varchar(255) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `vat_registration_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `created_at`, `updated_at`, `currency`, `package_id`, `staff_access`, `without_stock`, `date_format`, `developed_by`, `invoice_format`, `decimal`, `state`, `theme`, `modules`, `currency_position`, `expiry_date`, `is_zatca`, `company_name`, `vat_registration_number`) VALUES
(1, 'Pos', '20240926032857.png', 0, '2023-06-20 23:00:00', '2024-09-26 09:28:57', '1', NULL, 'all', 'no', 'd-m-Y', 'SaifulDeveloper', 'standard', 2, 1, 'default.css', NULL, 'prefix', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_receives`
--

CREATE TABLE `gift_receives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` varchar(255) DEFAULT NULL,
  `gift_transaction_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_received` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `checkin`, `checkout`, `created_at`, `updated_at`) VALUES
(1, '10:00am', '6:00am', '2024-03-19 09:41:09', '2024-04-24 09:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `encryption` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 1),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 1),
(27, '2018_05_20_054532_create_adjustments_table', 1),
(28, '2018_05_20_054859_create_product_adjustments_table', 1),
(29, '2018_05_21_163419_create_returns_table', 1),
(30, '2018_05_21_163443_create_product_returns_table', 1),
(31, '2018_06_02_050905_create_roles_table', 1),
(32, '2018_06_02_073430_add_columns_to_users_table', 1),
(33, '2018_06_03_053738_create_permission_tables', 1),
(34, '2018_06_21_063736_create_pos_setting_table', 1),
(35, '2018_06_21_094155_add_user_id_to_sales_table', 1),
(36, '2018_06_21_101529_add_user_id_to_purchases_table', 1),
(37, '2018_06_21_103512_add_user_id_to_transfers_table', 1),
(38, '2018_06_23_061058_add_user_id_to_quotations_table', 1),
(39, '2018_06_23_082427_add_is_deleted_to_users_table', 1),
(40, '2018_06_25_043308_change_email_to_users_table', 1),
(41, '2018_07_06_115449_create_general_settings_table', 1),
(42, '2018_07_08_043944_create_languages_table', 1),
(43, '2018_07_11_102144_add_user_id_to_returns_table', 1),
(44, '2018_07_11_102334_add_user_id_to_payments_table', 1),
(45, '2018_07_22_130541_add_digital_to_products_table', 1),
(46, '2018_07_24_154250_create_deliveries_table', 1),
(47, '2018_08_16_053336_create_expense_categories_table', 1),
(48, '2018_08_17_115415_create_expenses_table', 1),
(49, '2018_08_18_050418_create_gift_cards_table', 1),
(50, '2018_08_19_063119_create_payment_with_gift_card_table', 1),
(51, '2018_08_25_042333_create_gift_card_recharges_table', 1),
(52, '2018_08_25_101354_add_deposit_expense_to_customers_table', 1),
(53, '2018_08_26_043801_create_deposits_table', 1),
(54, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 1),
(55, '2018_09_09_092713_create_payment_with_paypal_table', 1),
(56, '2018_09_10_051254_add_currency_to_general_settings_table', 1),
(57, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 1),
(58, '2018_10_26_034927_create_coupons_table', 1),
(59, '2018_10_27_090857_add_coupon_to_sales_table', 1),
(60, '2018_11_07_070155_add_currency_position_to_general_settings_table', 1),
(61, '2018_11_19_094650_add_combo_to_products_table', 1),
(62, '2018_12_09_043712_create_accounts_table', 1),
(63, '2018_12_17_112253_add_is_default_to_accounts_table', 1),
(64, '2018_12_19_103941_add_account_id_to_payments_table', 1),
(65, '2018_12_20_065900_add_account_id_to_expenses_table', 1),
(66, '2018_12_20_082753_add_account_id_to_returns_table', 1),
(67, '2018_12_26_064330_create_return_purchases_table', 1),
(68, '2018_12_26_144708_create_purchase_product_return_table', 1),
(69, '2018_12_27_110018_create_departments_table', 1),
(70, '2018_12_30_054844_create_employees_table', 1),
(71, '2018_12_31_125210_create_payrolls_table', 1),
(72, '2018_12_31_150446_add_department_id_to_employees_table', 1),
(73, '2019_01_01_062708_add_user_id_to_expenses_table', 1),
(74, '2019_01_02_075644_create_hrm_settings_table', 1),
(75, '2019_01_02_090334_create_attendances_table', 1),
(76, '2019_01_27_160956_add_three_columns_to_general_settings_table', 1),
(77, '2019_02_15_183303_create_stock_counts_table', 1),
(78, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 1),
(79, '2019_04_13_101707_add_tax_no_to_customers_table', 1),
(80, '2019_08_19_000000_create_failed_jobs_table', 1),
(81, '2019_10_14_111455_create_holidays_table', 1),
(82, '2019_11_13_145619_add_is_variant_to_products_table', 1),
(83, '2019_11_13_150206_create_product_variants_table', 1),
(84, '2019_11_13_153828_create_variants_table', 1),
(85, '2019_11_25_134041_add_qty_to_product_variants_table', 1),
(86, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 1),
(87, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 1),
(88, '2019_11_29_182201_add_variant_id_to_product_sales_table', 1),
(89, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 1),
(90, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 1),
(91, '2019_12_08_114954_add_variant_id_to_product_returns_table', 1),
(92, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 1),
(93, '2020_02_28_103340_create_money_transfers_table', 1),
(94, '2020_07_01_193151_add_image_to_categories_table', 1),
(95, '2020_09_26_130426_add_user_id_to_deliveries_table', 1),
(96, '2020_10_11_125457_create_cash_registers_table', 1),
(97, '2020_10_13_155019_add_cash_register_id_to_sales_table', 1),
(98, '2020_10_13_172624_add_cash_register_id_to_returns_table', 1),
(99, '2020_10_17_212338_add_cash_register_id_to_payments_table', 1),
(100, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 1),
(101, '2020_10_21_121632_add_developed_by_to_general_settings_table', 1),
(102, '2020_10_30_135557_create_notifications_table', 1),
(103, '2020_11_01_044954_create_currencies_table', 1),
(104, '2020_11_01_140736_add_price_to_product_warehouse_table', 1),
(105, '2020_11_02_050633_add_is_diff_price_to_products_table', 1),
(106, '2020_11_09_055222_add_user_id_to_customers_table', 1),
(107, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 1),
(108, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 1),
(109, '2021_03_07_093606_create_product_batches_table', 1),
(110, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 1),
(111, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 1),
(112, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 1),
(113, '2021_03_25_125421_add_is_batch_to_products_table', 1),
(114, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 1),
(115, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 1),
(116, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 1),
(117, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 1),
(118, '2021_06_08_213007_create_reward_point_settings_table', 1),
(119, '2021_06_16_104155_add_points_to_customers_table', 1),
(120, '2021_06_17_101057_add_used_points_to_payments_table', 1),
(121, '2021_07_06_132716_add_variant_list_to_products_table', 1),
(122, '2021_09_27_161141_add_is_imei_to_products_table', 1),
(123, '2021_09_28_170052_add_imei_number_to_product_warehouse_table', 1),
(124, '2021_09_28_170126_add_imei_number_to_product_purchases_table', 1),
(125, '2021_10_03_170652_add_imei_number_to_product_sales_table', 1),
(126, '2021_10_10_145214_add_imei_number_to_product_returns_table', 1),
(127, '2021_10_11_104504_add_imei_number_to_product_transfer_table', 1),
(128, '2021_10_12_160107_add_imei_number_to_purchase_product_return_table', 1),
(129, '2021_10_12_205146_add_is_rtl_to_general_settings_table', 1),
(130, '2022_01_13_191242_create_discount_plans_table', 1),
(131, '2022_01_14_174318_create_discount_plan_customers_table', 1),
(132, '2022_01_14_202439_create_discounts_table', 1),
(133, '2022_01_16_153506_create_discount_plan_discounts_table', 1),
(134, '2022_02_05_174210_add_order_discount_type_and_value_to_sales_table', 1),
(135, '2022_05_26_195506_add_daily_sale_objective_to_products_table', 1),
(136, '2022_05_28_104209_create_dso_alerts_table', 1),
(137, '2022_06_01_112100_add_is_embeded_to_products_table', 1),
(138, '2022_06_14_130505_add_sale_id_to_returns_table', 1),
(139, '2022_07_19_115504_add_variant_data_to_products_table', 1),
(140, '2022_07_25_194300_add_additional_cost_to_product_variants_table', 1),
(141, '2022_09_04_195610_add_purchase_id_to_return_purchases_table', 1),
(142, '2023_01_18_125040_alter_table_general_settings', 1),
(143, '2023_01_18_133701_alter_table_pos_setting', 1),
(144, '2023_01_25_145309_add_expiry_date_to_general_settings_table', 1),
(145, '2023_02_23_125656_alter_table_sales', 1),
(146, '2023_02_26_124100_add_package_id_to_general_settings_table', 1),
(147, '2023_03_04_120325_create_custom_fields_table', 1),
(148, '2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table', 1),
(149, '2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table', 1),
(150, '2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table', 1),
(151, '2023_04_25_150236_create_mail_settings_table', 1),
(152, '2023_05_13_125424_add_zatca_to_general_settings_table', 1),
(153, '2023_05_28_155540_create_tables_table', 1),
(154, '2023_05_29_115039_add_is_table_to_pos_setting_table', 1),
(155, '2023_05_29_115301_add_table_id_to_sales_table', 1),
(156, '2023_05_31_165049_add_queue_no_to_sales_table', 1),
(157, '2023_07_23_160254_create_couriers_table', 1),
(158, '2023_07_23_174343_add_courier_id_to_deliveries_table', 1),
(159, '2023_08_12_124016_add_staff_id_to_employees_table', 1),
(160, '2023_08_14_142608_add_is_active_to_currencies_table', 1),
(161, '2023_08_24_130203_change_columns_to_attendances_table', 1),
(162, '2023_09_10_134503_add_without_stock_to_general_settings_table', 1),
(163, '2023_09_26_211542_add_modules_to_general_settings_table', 1),
(164, '2023_10_15_124306_add_return_qty_to_product_sales_table', 1),
(165, '2024_10_07_191349_add_change_to_payments_table', 1),
(166, '2024_10_09_180729_add_selling_price_to_product_purchases_table', 1),
(167, '2024_11_16_181754_add_is_default_to_warehouses_table', 1),
(168, '2024_11_17_185645_create_wastes_table', 1),
(169, '2024_11_21_055815_create_waste_items_table', 1),
(170, '2024_11_27_061715_create_gift_receives_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_reference` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `paying_method` varchar(255) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `change` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(255) DEFAULT NULL,
  `charge_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `salary` double NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 00:00:09', '2018-06-03 00:00:09'),
(5, 'products-delete', 'web', '2018-06-03 21:54:22', '2018-06-03 21:54:22'),
(6, 'products-add', 'web', '2018-06-03 23:34:14', '2018-06-03 23:34:14'),
(7, 'products-index', 'web', '2018-06-04 02:34:27', '2018-06-04 02:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 07:03:19', '2018-06-04 07:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 07:12:25', '2018-06-04 07:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 08:47:36', '2018-06-04 08:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 08:47:36', '2018-06-04 08:47:36'),
(12, 'sales-index', 'web', '2018-06-04 09:49:08', '2018-06-04 09:49:08'),
(13, 'sales-add', 'web', '2018-06-04 09:49:52', '2018-06-04 09:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 09:49:52', '2018-06-04 09:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 09:49:53', '2018-06-04 09:49:53'),
(16, 'quotes-index', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(17, 'quotes-add', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(18, 'quotes-edit', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(19, 'quotes-delete', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(20, 'transfers-index', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(24, 'returns-index', 'web', '2018-06-04 21:50:24', '2018-06-04 21:50:24'),
(25, 'returns-add', 'web', '2018-06-04 21:50:24', '2018-06-04 21:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 21:50:25', '2018-06-04 21:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 21:50:25', '2018-06-04 21:50:25'),
(28, 'customers-index', 'web', '2018-06-04 22:15:54', '2018-06-04 22:15:54'),
(29, 'customers-add', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(36, 'product-report', 'web', '2018-06-24 22:05:33', '2018-06-24 22:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 22:24:56', '2018-06-24 22:24:56'),
(38, 'sale-report', 'web', '2018-06-24 22:33:13', '2018-06-24 22:33:13'),
(39, 'customer-report', 'web', '2018-06-24 22:36:51', '2018-06-24 22:36:51'),
(40, 'due-report', 'web', '2018-06-24 22:39:52', '2018-06-24 22:39:52'),
(41, 'users-index', 'web', '2018-06-24 23:00:10', '2018-06-24 23:00:10'),
(42, 'users-add', 'web', '2018-06-24 23:00:10', '2018-06-24 23:00:10'),
(43, 'users-edit', 'web', '2018-06-24 23:01:30', '2018-06-24 23:01:30'),
(44, 'users-delete', 'web', '2018-06-24 23:01:30', '2018-06-24 23:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 20:50:05', '2018-07-14 20:50:05'),
(46, 'best-seller', 'web', '2018-07-14 21:01:38', '2018-07-14 21:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 21:24:21', '2018-07-14 21:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 21:30:41', '2018-07-14 21:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 21:36:46', '2018-07-14 21:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 21:48:17', '2018-07-14 21:48:17'),
(51, 'payment-report', 'web', '2018-07-14 22:10:41', '2018-07-14 22:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 22:16:55', '2018-07-14 22:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 22:33:21', '2018-07-14 22:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 02:00:01', '2018-07-30 02:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 00:07:11', '2018-09-05 00:07:11'),
(59, 'general_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 09:30:23', '2019-01-02 09:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(67, 'account-index', 'web', '2019-01-02 21:06:13', '2019-01-02 21:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 21:06:14', '2019-01-02 21:06:14'),
(69, 'account-statement', 'web', '2019-01-02 21:06:14', '2019-01-02 21:06:14'),
(70, 'department', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(71, 'attendance', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(72, 'payroll', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(73, 'employees-index', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(74, 'employees-add', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(77, 'user-report', 'web', '2019-01-16 05:48:18', '2019-01-16 05:48:18'),
(78, 'stock_count', 'web', '2019-02-17 09:32:01', '2019-02-17 09:32:01'),
(79, 'adjustment', 'web', '2019-02-17 09:32:02', '2019-02-17 09:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 04:18:03', '2019-02-22 04:18:03'),
(81, 'create_sms', 'web', '2019-02-22 04:18:03', '2019-02-22 04:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 04:02:19', '2019-03-07 04:02:19'),
(83, 'empty_database', 'web', '2019-03-07 04:02:19', '2019-03-07 04:02:19'),
(84, 'customer_group', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(85, 'unit', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(86, 'tax', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(87, 'gift_card', 'web', '2019-03-07 05:29:38', '2019-03-07 05:29:38'),
(88, 'coupon', 'web', '2019-03-07 05:29:38', '2019-03-07 05:29:38'),
(89, 'holiday', 'web', '2019-10-19 07:57:15', '2019-10-19 07:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 05:00:23', '2019-10-22 05:00:23'),
(91, 'warehouse', 'web', '2020-02-26 05:47:32', '2020-02-26 05:47:32'),
(92, 'brand', 'web', '2020-02-26 05:59:59', '2020-02-26 05:59:59'),
(93, 'billers-index', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(94, 'billers-add', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 04:41:48', '2020-03-02 04:41:48'),
(98, 'category', 'web', '2020-07-13 11:13:16', '2020-07-13 11:13:16'),
(99, 'delivery', 'web', '2020-07-13 11:13:16', '2020-07-13 11:13:16'),
(100, 'send_notification', 'web', '2020-10-31 05:21:31', '2020-10-31 05:21:31'),
(101, 'today_sale', 'web', '2020-10-31 05:57:04', '2020-10-31 05:57:04'),
(102, 'today_profit', 'web', '2020-10-31 05:57:04', '2020-10-31 05:57:04'),
(103, 'currency', 'web', '2020-11-08 23:23:11', '2020-11-08 23:23:11'),
(104, 'backup_database', 'web', '2020-11-14 23:16:55', '2020-11-14 23:16:55'),
(105, 'reward_point_setting', 'web', '2021-06-27 03:34:42', '2021-06-27 03:34:42'),
(106, 'revenue_profit_summary', 'web', '2022-02-08 12:57:21', '2022-02-08 12:57:21'),
(107, 'cash_flow', 'web', '2022-02-08 12:57:22', '2022-02-08 12:57:22'),
(108, 'monthly_summary', 'web', '2022-02-08 12:57:22', '2022-02-08 12:57:22'),
(109, 'yearly_report', 'web', '2022-02-08 12:57:22', '2022-02-08 12:57:22'),
(110, 'discount_plan', 'web', '2022-02-16 08:12:26', '2022-02-16 08:12:26'),
(111, 'discount', 'web', '2022-02-16 08:12:38', '2022-02-16 08:12:38'),
(112, 'product-expiry-report', 'web', '2022-03-30 04:39:20', '2022-03-30 04:39:20'),
(113, 'purchase-payment-index', 'web', '2022-06-05 13:12:27', '2022-06-05 13:12:27'),
(114, 'purchase-payment-add', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(115, 'purchase-payment-edit', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(116, 'purchase-payment-delete', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(117, 'sale-payment-index', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(118, 'sale-payment-add', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(119, 'sale-payment-edit', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(120, 'sale-payment-delete', 'web', '2022-06-05 13:12:28', '2022-06-05 13:12:28'),
(121, 'all_notification', 'web', '2022-06-05 13:12:29', '2022-06-05 13:12:29'),
(122, 'sale-report-chart', 'web', '2022-06-05 13:12:29', '2022-06-05 13:12:29'),
(123, 'dso-report', 'web', '2022-06-05 13:12:29', '2022-06-05 13:12:29'),
(124, 'product_history', 'web', '2022-08-25 13:04:05', '2022-08-25 13:04:05'),
(125, 'supplier-due-report', 'web', '2022-08-31 08:46:33', '2022-08-31 08:46:33'),
(126, 'custom_field', 'web', '2023-05-02 06:41:35', '2023-05-02 06:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(255) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `paypal_live_api_username` varchar(255) DEFAULT NULL,
  `paypal_live_api_password` varchar(255) DEFAULT NULL,
  `paypal_live_api_secret` varchar(255) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `is_table`, `stripe_public_key`, `stripe_secret_key`, `paypal_live_api_username`, `paypal_live_api_password`, `paypal_live_api_secret`, `payment_options`, `invoice_option`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 4, 0, 0, NULL, NULL, NULL, NULL, NULL, 'cash', 'A4', '2024-10-08 13:59:44', '2024-12-11 01:10:13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `barcode_symbology` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double DEFAULT NULL,
  `price` double NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(255) DEFAULT NULL,
  `variant_list` varchar(255) DEFAULT NULL,
  `qty_list` varchar(255) DEFAULT NULL,
  `price_list` varchar(255) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `variant_option`, `variant_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'বেবি-০-২', 'R-100', 'standard', 'C128', 1, 14, 1, 1, 1, 1200, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Size\",\"Color\"]', '[\"26\",\"Red\"]', 0, '2024-12-11 00:04:36', '2024-12-12 01:53:12'),
(2, 'বেবি-০-২', 'R-101', 'standard', 'C128', 1, 14, 1, 1, 1, 1500, 1900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Red,Green\",\"26,28\"]', 0, '2024-12-11 00:06:24', '2024-12-12 01:53:12'),
(3, 'জে-কেডস', 'R-101', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2690, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120455501.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 0, '2024-12-11 22:55:50', '2024-12-11 23:20:10'),
(4, 'জে-কেডস', 'R-102', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120506221.JPG', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Green\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:06:22', '2024-12-11 23:11:28'),
(5, 'জে-কেডস', 'R-101', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120521511.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(6, 'জে-কেডস', 'R-103', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2990, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120528401.JPG', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41\"]', 0, '2024-12-11 23:28:40', '2024-12-11 23:32:03'),
(7, 'জে-কেডস', 'R-104', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 2990, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120533221.JPG', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 0, '2024-12-11 23:33:22', '2024-12-11 23:35:36'),
(8, 'জে-কেডস', 'R-105', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120536311.JPG,khulna_202412120634482.png', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(9, 'জে-কেডস', 'R-106', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120540501.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(10, 'জে-কেডস', 'R-107', 'standard', 'C128', 5, 15, 1, 1, 1, 1500, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120544141.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(11, 'জে-কেডস', 'R-108', 'standard', 'C128', 5, 15, 1, 1, 1, 1650, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120547391.JPG', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"40,41,42,43,44\"]', 1, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(12, 'জে-কেডস', 'R-109', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120550281.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,39\"]', 1, '2024-12-11 23:50:28', '2024-12-11 23:52:59'),
(13, 'জে-কেডস', 'R-10A', 'standard', 'C128', 5, 15, 1, 1, 1, 1700, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120554451.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Olive\",\"39,40,41,42,43\"]', 1, '2024-12-11 23:54:45', '2024-12-11 23:55:58'),
(14, 'জে-কেডস', 'R-10B', 'standard', 'C128', 5, 15, 1, 1, 1, 1600, 2890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120558281.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"41,42,43,44\"]', 1, '2024-12-11 23:58:28', '2024-12-12 00:02:34'),
(15, 'জে-কেডস', 'R-10C', 'standard', 'C128', 5, 15, 1, 1, 1, 1600, 2890, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120617552.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,44\"]', 0, '2024-12-12 00:17:28', '2024-12-12 00:20:27'),
(16, 'জে-কেডস', 'R-10D', 'standard', 'C128', 5, 15, 1, 1, 1, 1600, 2890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120622172.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,44\"]', 1, '2024-12-12 00:21:16', '2024-12-12 00:22:36'),
(17, 'জে-কেডস', 'R-10E', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 2890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120627412.jpg,khulna_202412120635392.png', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-12 00:25:40', '2024-12-12 00:35:39'),
(18, 'জে-কেডস', 'R-10F', 'standard', 'C128', 5, 15, 1, 1, 1, 1350, 2190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120637392.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"40,41,42,43,44\"]', 1, '2024-12-12 00:32:07', '2024-12-12 00:37:40'),
(19, 'জে-কেডস', 'R-110', 'standard', 'C128', 5, 15, 1, 1, 1, 1350, 2190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120639142.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"40,41,42,43,44\"]', 1, '2024-12-12 00:37:12', '2024-12-12 00:39:14'),
(20, 'জে-কেডস', 'R-111', 'standard', 'C128', 5, 15, 1, 1, 1, 1500, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120642422.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"40,41,.42,43,44\"]', 1, '2024-12-12 00:39:48', '2024-12-12 00:42:43'),
(21, 'জে-কেডস', 'R-112', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120648172.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"40,41,42,43,44\"]', 1, '2024-12-12 00:43:25', '2024-12-12 00:48:18'),
(22, 'Ladies-Keds', 'R-113', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120719092.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40\"]', 1, '2024-12-12 01:05:07', '2024-12-12 01:19:09'),
(23, 'Ladies-Keds', 'R-114', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120722202.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Purple\",\"36,37,38,39,40\"]', 1, '2024-12-12 01:11:24', '2024-12-12 01:22:20'),
(24, 'জেন্টস-কেডস', 'R-115', 'standard', 'C128', 5, 15, 1, 1, 1, 1650, 2690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120723272.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"40,41,42,43,44\"]', 1, '2024-12-12 01:14:57', '2024-12-12 01:23:28'),
(25, 'Ladies-Keds', 'R-116', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120735342.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Purple\",\"36,37,38,39,40\"]', 0, '2024-12-12 01:34:09', '2024-12-12 01:38:59'),
(26, 'Ladies-Keds', 'R-117', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120740332.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"36,37,38,39,40\"]', 1, '2024-12-12 01:35:41', '2024-12-12 01:40:33'),
(27, 'Ladies-Keds', 'R-116', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120742182.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"PINK\",\"36,37,38,39,40\"]', 0, '2024-12-12 01:39:53', '2024-12-12 01:49:16'),
(28, 'Ladies-Keds', 'R-118', 'standard', 'C128', 5, 17, 1, 1, 1, 1100, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120751142.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"37,38,39,40\"]', 1, '2024-12-12 01:47:45', '2024-12-12 01:51:14'),
(29, 'Ladies-Keds', 'R-116', 'standard', 'C128', 5, 17, 1, 1, 1, 775, 1290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120758122.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40\"]', 1, '2024-12-12 01:50:36', '2024-12-12 01:58:12'),
(30, 'Ladies-Keds', 'R-120', 'standard', 'C128', 1, 17, 1, 1, 1, 2000, 3200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120754221.png,khulna_202412120754222.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\",\"Color\",\"Size\"]', '[\"Black,White\",\"40,41,42\",\"Black,White\",\"40,41,42\"]', 0, '2024-12-12 01:54:22', '2024-12-12 01:54:56'),
(31, 'Ladies-Keds', 'R-119', 'standard', 'C128', 5, 17, 1, 1, 1, 1100, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120801422.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40\"]', 1, '2024-12-12 01:56:37', '2024-12-12 02:01:42'),
(32, 'Ladies-নাগড়া', 'R-11A', 'standard', 'C128', 5, 18, 1, 1, 1, 1375, 2290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120811412.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40,41\"]', 1, '2024-12-12 02:09:45', '2024-12-12 02:11:41'),
(33, 'Ladies-নাগড়া', 'R-11B', 'standard', 'C128', 5, 18, 1, 1, 1, 1375, 2290, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120815212.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"36,37,38,39,40,41\"]', 1, '2024-12-12 02:13:56', '2024-12-12 02:15:21'),
(34, 'Ladies-পাম্পি', 'R-11C', 'standard', 'C128', 5, 19, 1, 1, 1, 1475, 2490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120818322.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"36,37,38,39,40,41\"]', 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(35, 'Ladies-Pumpi', 'R-11D', 'standard', 'C128', 5, 20, 1, 1, 1, 1475, 2490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120823512.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Cream\",\"36,37,38,39,40,41\"]', 1, '2024-12-12 02:21:59', '2024-12-12 02:23:51'),
(36, 'জেন্টস-কেডস', 'R-11E', 'standard', 'C128', 5, 15, 1, 1, 1, 1200, 2190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120833372.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"40,41,42,43,44\"]', 1, '2024-12-12 02:30:48', '2024-12-12 02:33:37'),
(37, 'জেন্টস-কেডস', 'R-11F', 'standard', 'C128', 5, 15, 1, 1, 1, 1200, 2190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120839102.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-12 02:37:19', '2024-12-12 02:39:10'),
(38, 'জেন্টস-কেডস', 'R-120', 'standard', 'C128', 5, 15, 1, 1, 1, 1200, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120842532.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"40,41,42,43,44\"]', 1, '2024-12-12 02:40:07', '2024-12-12 02:42:53'),
(39, 'জেন্টস-কেডস', 'R-121', 'standard', 'C128', 5, 15, 1, 1, 1, 1200, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120846122.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,44\"]', 1, '2024-12-12 02:43:27', '2024-12-12 02:46:12'),
(40, 'Ladies-Pumpi', 'R-122', 'standard', 'C128', 5, 20, 1, 1, 1, 600, 1190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120855462.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40\"]', 1, '2024-12-12 02:52:18', '2024-12-12 02:55:46'),
(41, 'Ladies-Pumpi', 'R-123', 'standard', 'C128', 5, 20, 1, 1, 1, 600, 1190, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120901271.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"RED\",\"36,37,38,39,40\"]', 1, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(42, 'Ladies-Keds', 'R-124', 'standard', 'C128', 5, 17, 1, 1, 1, 1150, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120943252.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Pink\",\"36,37,38,39,40,41\"]', 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(43, 'Ladies-Keds', 'R-125', 'standard', 'C128', 5, 17, 1, 1, 1, 1150, 1890, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120945392.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"37,38,39,40,41\"]', 1, '2024-12-12 03:44:44', '2024-12-12 03:45:39'),
(44, 'জেন্টস-কেডস', 'R-126', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 3150, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120947152.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"40,41,42,43,44\"]', 1, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(45, 'জেন্টস-কেডস', 'R-127', 'standard', 'C128', 5, 15, 1, 1, 1, 1750, 3150, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120953532.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-12 03:50:04', '2024-12-12 03:53:53'),
(46, 'Ladies-Pumpi', 'R-128', 'standard', 'C128', 5, 20, 1, 1, 1, 950, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120955182.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"36,37,38,39,40\"]', 1, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(47, 'Ladies-Pumpi', 'R-129', 'standard', 'C128', 5, 20, 1, 1, 1, 950, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412120959372.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"36,37,38,39,40\"]', 1, '2024-12-12 03:57:52', '2024-12-12 03:59:37'),
(48, 'Ladies-Pumpi', 'R-12A', 'standard', 'C128', NULL, 20, 1, 1, 1, 950, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121002022.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"RED\",\"36,37,38,39,40\"]', 1, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(49, 'Ladies-Pumpi', 'R-12B', 'standard', 'C128', 5, 20, 1, 1, 1, 950, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121005372.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"36,37,38,39,40\"]', 1, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(50, 'Baby-Keds.', 'R-12C', 'standard', 'C128', 5, 22, 1, 1, 1, 800, 1390, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121014152.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"27,28,29,30,31\"]', 1, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(51, 'Baby-Keds.', 'R-12D', 'standard', 'C128', 5, 22, 1, 1, 1, 800, 1390, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121015362.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"27,28,29,30,31\"]', 1, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(52, 'Baby-Keds.', 'R-12E', 'standard', 'C128', 5, 22, 1, 1, 1, 1050, 1690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121019312.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"33,34,35,36,37,38\"]', 1, '2024-12-12 04:18:10', '2024-12-12 04:19:31'),
(53, 'Baby-Keds.', 'R-12F', 'standard', 'C128', 5, 22, 1, 1, 1, 1050, 1690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121021382.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"33,34,35,36,37,38\"]', 1, '2024-12-12 04:19:26', '2024-12-12 04:21:38'),
(54, '6-9-Keds..', 'R-130', 'standard', 'C128', 5, 24, 1, 1, 1, 1100, 1990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121028042.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"32,33,34,35,36,37\"]', 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(55, '6-9-Keds..', 'R-131', 'standard', 'C128', 5, 24, 1, 1, 1, 1100, 1990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121033162.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"32,33,34,35,36,37\"]', 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(56, 'জেন্টস-কেডস', 'R-132', 'standard', 'C128', 5, 24, 1, 1, 1, 1000, 1750, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121036502.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Green\",\"36,37,38,39,40\"]', 1, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(57, '6-9-Keds..', 'R-133', 'standard', 'C128', 5, 24, 1, 1, 1, 1000, 1750, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121038432.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Orng\",\"36,37,38,39,40\"]', 1, '2024-12-12 04:38:03', '2024-12-12 04:40:20'),
(58, 'Baby-Keds.', 'R-134', 'standard', 'C128', 5, 22, 1, 1, 1, 900, 1490, -6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121042242.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Olive\",\"26,27,28,29,30\"]', 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(59, 'Baby-Keds.', 'R-135', 'standard', 'C128', 5, 22, 1, 1, 1, 900, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121043492.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"26,27,28,29,30\"]', 1, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(60, '6-9-Keds..', 'R-136', 'standard', 'C128', 5, 24, 1, 1, 1, 1000, 1690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121045472.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Blue\",\"34,35,36,37,38,39\"]', 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(61, '6-9-Keds..', 'R-137', 'standard', 'C128', 5, 24, 1, 1, 1, 1000, 1690, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121047112.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"34,35,36,37,38,39\"]', 1, '2024-12-12 04:46:47', '2024-12-12 04:47:23'),
(62, '6-9-Keds..', 'R-138', 'standard', 'C128', 5, 24, 1, 1, 1, 1150, 1790, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121049392.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"36,37,38,39,40\"]', 1, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(63, 'Baby-Keds.', 'R-134', 'standard', 'C128', 5, 22, 1, 1, 1, 900, 1490, -6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121057272.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Olive\",\"26,27,28,29,30\"]', 0, '2024-12-12 04:56:27', '2024-12-12 04:59:56'),
(64, 'Baby-Keds.', 'R-134', 'standard', 'C128', 5, 22, 1, 1, 1, 900, 1490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121105022.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Olive\",\"26,27,28,29,30\"]', 1, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(65, 'জেন্টস-কেডস', 'R-139', 'standard', 'C128', 5, 15, 1, 1, 1, 1500, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121122052.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Brown\",\"40,41,42,43,44\"]', 1, '2024-12-12 05:17:56', '2024-12-12 05:22:05'),
(66, 'জেন্টস-কেডস', 'R-13A', 'standard', 'C128', 5, 15, 1, 1, 1, 1500, 2990, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121122362.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"White\",\"40,41,42,43,44\"]', 1, '2024-12-12 05:20:20', '2024-12-12 05:22:36'),
(67, 'জেন্টস-কেডস', 'R-13B', 'standard', 'C128', 5, 15, 1, 1, 1, 1600, 2490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121126512.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Black\",\"40,41,42,43,44\"]', 1, '2024-12-12 05:25:46', '2024-12-12 05:26:51'),
(68, 'জেন্টস-কেডস', 'R-13C', 'standard', 'C128', 5, 15, 1, 1, 1, 1600, 2490, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'khulna_202412121128412.jpg', NULL, 0, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', '[\"Color\",\"Size\"]', '[\"Grey\",\"40,41,42,43,44\"]', 1, '2024-12-12 05:27:13', '2024-12-12 05:28:41'),
(69, '101', '101', 'standard', 'C128', 1, 9, 1, 1, 1, 555, 555, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '101_675afac3302bd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-12-15 10:16:05', '2024-12-15 10:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `selling_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(3, 2, 4, NULL, 15, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:11:27', '2024-12-11 23:11:27'),
(4, 2, 4, NULL, 14, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:11:27', '2024-12-11 23:11:27'),
(5, 2, 4, NULL, 13, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:11:28', '2024-12-11 23:11:28'),
(6, 2, 4, NULL, 12, NULL, 2, 2, 1, 1700, 2690.00, 0, 0, 0, 3400, '2024-12-11 23:11:28', '2024-12-11 23:11:28'),
(7, 2, 4, NULL, 11, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:11:28', '2024-12-11 23:11:28'),
(8, 3, 5, NULL, 10, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(9, 3, 5, NULL, 9, NULL, 2, 2, 1, 1700, 2690.00, 0, 0, 0, 3400, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(10, 3, 5, NULL, 8, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(11, 3, 5, NULL, 7, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(12, 3, 5, NULL, 6, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(14, 5, 8, NULL, 10, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(15, 5, 8, NULL, 9, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(16, 5, 8, NULL, 8, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(17, 5, 8, NULL, 7, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(18, 5, 8, NULL, 6, NULL, 2, 2, 1, 1750, 2990.00, 0, 0, 0, 3500, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(19, 6, 9, NULL, 20, NULL, 1, 1, 1, 1750, 2690.00, 0, 0, 0, 1750, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(20, 6, 9, NULL, 19, NULL, 1, 1, 1, 1750, 2690.00, 0, 0, 0, 1750, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(21, 6, 9, NULL, 18, NULL, 1, 1, 1, 1750, 2690.00, 0, 0, 0, 1750, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(22, 6, 9, NULL, 17, NULL, 2, 2, 1, 1750, 2690.00, 0, 0, 0, 3500, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(23, 6, 9, NULL, 16, NULL, 1, 1, 1, 1750, 2690.00, 0, 0, 0, 1750, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(24, 7, 10, NULL, 20, NULL, 2, 2, 1, 1500, 2990.00, 0, 0, 0, 3000, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(25, 7, 10, NULL, 19, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(26, 7, 10, NULL, 18, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(27, 7, 10, NULL, 17, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(28, 7, 10, NULL, 16, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(29, 8, 11, NULL, 25, NULL, 2, 2, 1, 1650, 2690.00, 0, 0, 0, 3300, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(30, 8, 11, NULL, 24, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(31, 8, 11, NULL, 23, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(32, 8, 11, NULL, 22, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(33, 8, 11, NULL, 21, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(34, 9, 12, NULL, 26, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(35, 9, 12, NULL, 19, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(36, 9, 12, NULL, 18, NULL, 2, 2, 1, 1700, 2690.00, 0, 0, 0, 3400, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(37, 9, 12, NULL, 17, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(38, 9, 12, NULL, 16, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(39, 10, 13, NULL, 31, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(40, 10, 13, NULL, 30, NULL, 2, 2, 1, 1700, 2690.00, 0, 0, 0, 3400, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(41, 10, 13, NULL, 29, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(42, 10, 13, NULL, 28, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(43, 10, 13, NULL, 27, NULL, 1, 1, 1, 1700, 2690.00, 0, 0, 0, 1700, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(44, 11, 14, NULL, 35, NULL, 2, 2, 1, 1600, 2890.00, 0, 0, 0, 3200, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(45, 11, 14, NULL, 34, NULL, 2, 2, 1, 1600, 2890.00, 0, 0, 0, 3200, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(46, 11, 14, NULL, 33, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(47, 11, 14, NULL, 32, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(53, 13, 15, NULL, 20, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:20:11', '2024-12-12 00:20:11'),
(54, 13, 15, NULL, 19, NULL, 2, 2, 1, 1600, 2890.00, 0, 0, 0, 3200, '2024-12-12 00:20:11', '2024-12-12 00:20:11'),
(55, 13, 15, NULL, 18, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:20:11', '2024-12-12 00:20:11'),
(56, 13, 15, NULL, 17, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:20:11', '2024-12-12 00:20:11'),
(57, 13, 15, NULL, 16, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:20:11', '2024-12-12 00:20:11'),
(58, 14, 16, NULL, 20, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(59, 14, 16, NULL, 19, NULL, 2, 2, 1, 1600, 2890.00, 0, 0, 0, 3200, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(60, 14, 16, NULL, 18, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(61, 14, 16, NULL, 17, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(62, 14, 16, NULL, 16, NULL, 1, 1, 1, 1600, 2890.00, 0, 0, 0, 1600, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(63, 15, 17, NULL, 10, NULL, 1, 1, 1, 1750, 2890.00, 0, 0, 0, 1750, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(64, 15, 17, NULL, 9, NULL, 2, 2, 1, 1750, 2890.00, 0, 0, 0, 3500, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(65, 15, 17, NULL, 8, NULL, 1, 1, 1, 1750, 2890.00, 0, 0, 0, 1750, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(66, 15, 17, NULL, 7, NULL, 1, 1, 1, 1750, 2890.00, 0, 0, 0, 1750, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(67, 15, 17, NULL, 6, NULL, 1, 1, 1, 1750, 2890.00, 0, 0, 0, 1750, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(68, 16, 18, NULL, 35, NULL, 2, 2, 1, 1350, 2190.00, 0, 0, 0, 2700, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(69, 16, 18, NULL, 34, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(70, 16, 18, NULL, 33, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(71, 16, 18, NULL, 32, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(72, 16, 18, NULL, 36, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(73, 17, 19, NULL, 25, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(74, 17, 19, NULL, 24, NULL, 2, 2, 1, 1350, 2190.00, 0, 0, 0, 2700, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(75, 17, 19, NULL, 23, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(76, 17, 19, NULL, 22, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(77, 17, 19, NULL, 21, NULL, 1, 1, 1, 1350, 2190.00, 0, 0, 0, 1350, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(78, 18, 20, NULL, 25, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(79, 18, 20, NULL, 24, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(80, 18, 20, NULL, 37, NULL, 2, 2, 1, 1500, 2990.00, 0, 0, 0, 3000, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(81, 18, 20, NULL, 22, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(82, 18, 20, NULL, 21, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(83, 19, 21, NULL, 35, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(84, 19, 21, NULL, 34, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(85, 19, 21, NULL, 33, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(86, 19, 21, NULL, 32, NULL, 2, 2, 1, 1750, 2990.00, 0, 0, 0, 3500, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(87, 19, 21, NULL, 36, NULL, 1, 1, 1, 1750, 2990.00, 0, 0, 0, 1750, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(88, 20, 22, NULL, 42, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(89, 20, 22, NULL, 41, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(90, 20, 22, NULL, 40, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(91, 20, 22, NULL, 39, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(92, 20, 22, NULL, 38, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(93, 21, 23, NULL, 47, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(94, 21, 23, NULL, 46, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(95, 21, 23, NULL, 45, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(96, 21, 23, NULL, 44, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(97, 21, 23, NULL, 43, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(98, 22, 24, NULL, 35, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(99, 22, 24, NULL, 34, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(100, 22, 24, NULL, 33, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(101, 22, 24, NULL, 32, NULL, 1, 1, 1, 1650, 2690.00, 0, 0, 0, 1650, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(102, 22, 24, NULL, 36, NULL, 2, 2, 1, 1650, 2690.00, 0, 0, 0, 3300, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(103, 23, 25, NULL, 52, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(104, 23, 25, NULL, 51, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(105, 23, 25, NULL, 50, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(106, 23, 25, NULL, 49, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(107, 23, 25, NULL, 48, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(108, 24, 26, NULL, 16, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(109, 24, 26, NULL, 26, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(110, 24, 26, NULL, 55, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(111, 24, 26, NULL, 54, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(112, 24, 26, NULL, 53, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(113, 25, 27, NULL, 47, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(114, 25, 27, NULL, 46, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(115, 25, 27, NULL, 45, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(116, 25, 27, NULL, 44, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(117, 25, 27, NULL, 43, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(118, 26, 28, NULL, 21, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(119, 26, 28, NULL, 58, NULL, 2, 2, 1, 1100, 1890.00, 0, 0, 0, 2200, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(120, 26, 28, NULL, 57, NULL, 2, 2, 1, 1100, 1890.00, 0, 0, 0, 2200, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(121, 26, 28, NULL, 56, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(122, 27, 29, NULL, 42, NULL, 2, 2, 1, 775, 1290.00, 0, 0, 0, 1550, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(123, 27, 29, NULL, 41, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(124, 27, 29, NULL, 40, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(125, 27, 29, NULL, 39, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(126, 27, 29, NULL, 38, NULL, 1, 1, 1, 775, 1290.00, 0, 0, 0, 775, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(127, 28, 31, NULL, 42, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(128, 28, 31, NULL, 41, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(129, 28, 31, NULL, 40, NULL, 2, 2, 1, 1100, 1890.00, 0, 0, 0, 2200, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(130, 28, 31, NULL, 39, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(131, 28, 31, NULL, 38, NULL, 1, 1, 1, 1100, 1890.00, 0, 0, 0, 1100, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(132, 29, 32, NULL, 59, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(133, 29, 32, NULL, 42, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(134, 29, 32, NULL, 41, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(135, 29, 32, NULL, 40, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(136, 29, 32, NULL, 39, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(137, 29, 32, NULL, 38, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(138, 30, 33, NULL, 22, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(139, 30, 33, NULL, 21, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(140, 30, 33, NULL, 58, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(141, 30, 33, NULL, 57, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(142, 30, 33, NULL, 56, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(143, 30, 33, NULL, 60, NULL, 1, 1, 1, 1375, 2290.00, 0, 0, 0, 1375, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(144, 31, 34, NULL, 7, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(145, 31, 34, NULL, 6, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(146, 31, 34, NULL, 64, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(147, 31, 34, NULL, 63, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(148, 31, 34, NULL, 62, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(149, 31, 34, NULL, 61, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(150, 32, 35, NULL, 70, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(151, 32, 35, NULL, 69, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(152, 32, 35, NULL, 68, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(153, 32, 35, NULL, 67, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(154, 32, 35, NULL, 66, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(155, 32, 35, NULL, 65, NULL, 1, 1, 1, 1475, 2490.00, 0, 0, 0, 1475, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(156, 33, 36, NULL, 75, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(157, 33, 36, NULL, 74, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(158, 33, 36, NULL, 73, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(159, 33, 36, NULL, 72, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(160, 33, 36, NULL, 71, NULL, 2, 2, 1, 1200, 2190.00, 0, 0, 0, 2400, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(161, 34, 37, NULL, 10, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(162, 34, 37, NULL, 9, NULL, 2, 2, 1, 1200, 2190.00, 0, 0, 0, 2400, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(163, 34, 37, NULL, 8, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(164, 34, 37, NULL, 7, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(165, 34, 37, NULL, 6, NULL, 1, 1, 1, 1200, 2190.00, 0, 0, 0, 1200, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(166, 35, 38, NULL, 25, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(167, 35, 38, NULL, 24, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(168, 35, 38, NULL, 23, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(169, 35, 38, NULL, 22, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(170, 35, 38, NULL, 21, NULL, 2, 2, 1, 1200, 1890.00, 0, 0, 0, 2400, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(171, 36, 39, NULL, 10, NULL, 2, 2, 1, 1200, 1890.00, 0, 0, 0, 2400, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(172, 36, 39, NULL, 8, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(173, 36, 39, NULL, 7, NULL, 2, 2, 1, 1200, 1890.00, 0, 0, 0, 2400, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(174, 36, 39, NULL, 6, NULL, 1, 1, 1, 1200, 1890.00, 0, 0, 0, 1200, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(175, 37, 40, NULL, 42, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(176, 37, 40, NULL, 41, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(177, 37, 40, NULL, 40, NULL, 2, 2, 1, 600, 1190.00, 0, 0, 0, 1200, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(178, 37, 40, NULL, 39, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(179, 37, 40, NULL, 38, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(180, 38, 41, NULL, 80, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(181, 38, 41, NULL, 79, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(182, 38, 41, NULL, 78, NULL, 2, 2, 1, 600, 1190.00, 0, 0, 0, 1200, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(183, 38, 41, NULL, 77, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(184, 38, 41, NULL, 76, NULL, 1, 1, 1, 600, 1190.00, 0, 0, 0, 600, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(185, 39, 42, NULL, 59, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(186, 39, 42, NULL, 42, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(187, 39, 42, NULL, 41, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(188, 39, 42, NULL, 40, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(189, 39, 42, NULL, 39, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(190, 39, 42, NULL, 38, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(191, 40, 43, NULL, 22, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(192, 40, 43, NULL, 21, NULL, 2, 2, 1, 1150, 1890.00, 0, 0, 0, 2300, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(193, 40, 43, NULL, 58, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(194, 40, 43, NULL, 57, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(195, 40, 43, NULL, 56, NULL, 1, 1, 1, 1150, 1890.00, 0, 0, 0, 1150, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(196, 41, 44, NULL, 35, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(197, 41, 44, NULL, 34, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(198, 41, 44, NULL, 33, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(199, 41, 44, NULL, 32, NULL, 2, 2, 1, 1750, 3150.00, 0, 0, 0, 3500, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(200, 41, 44, NULL, 36, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(201, 42, 45, NULL, 10, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(202, 42, 45, NULL, 9, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(203, 42, 45, NULL, 8, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(204, 42, 45, NULL, 7, NULL, 1, 1, 1, 1750, 3150.00, 0, 0, 0, 1750, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(205, 42, 45, NULL, 6, NULL, 2, 2, 1, 1750, 3150.00, 0, 0, 0, 3500, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(206, 43, 46, NULL, 16, NULL, 2, 2, 1, 950, 1490.00, 0, 0, 0, 1900, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(207, 43, 46, NULL, 26, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(208, 43, 46, NULL, 55, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(209, 43, 46, NULL, 54, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(210, 43, 46, NULL, 53, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(211, 44, 47, NULL, 71, NULL, 2, 2, 1, 950, 1490.00, 0, 0, 0, 1900, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(212, 44, 47, NULL, 84, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(213, 44, 47, NULL, 83, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(214, 44, 47, NULL, 82, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(215, 44, 47, NULL, 81, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(216, 45, 48, NULL, 80, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(217, 45, 48, NULL, 79, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(218, 45, 48, NULL, 78, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(219, 45, 48, NULL, 77, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(220, 45, 48, NULL, 76, NULL, 2, 2, 1, 950, 1490.00, 0, 0, 0, 1900, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(221, 46, 49, NULL, 71, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(222, 46, 49, NULL, 84, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(223, 46, 49, NULL, 83, NULL, 2, 2, 1, 950, 1490.00, 0, 0, 0, 1900, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(224, 46, 49, NULL, 82, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(225, 46, 49, NULL, 81, NULL, 1, 1, 1, 950, 1490.00, 0, 0, 0, 950, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(226, 47, 50, NULL, 89, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(227, 47, 50, NULL, 88, NULL, 2, 2, 1, 800, 1390.00, 0, 0, 0, 1600, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(228, 47, 50, NULL, 87, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(229, 47, 50, NULL, 86, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(230, 47, 50, NULL, 85, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(231, 48, 51, NULL, 94, NULL, 2, 2, 1, 800, 1390.00, 0, 0, 0, 1600, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(232, 48, 51, NULL, 93, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(233, 48, 51, NULL, 92, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(234, 48, 51, NULL, 91, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(235, 48, 51, NULL, 90, NULL, 1, 1, 1, 800, 1390.00, 0, 0, 0, 800, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(236, 49, 52, NULL, 63, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(237, 49, 52, NULL, 62, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(238, 49, 52, NULL, 61, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(239, 49, 52, NULL, 97, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(240, 49, 52, NULL, 96, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(241, 49, 52, NULL, 95, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(242, 50, 53, NULL, 55, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(243, 50, 53, NULL, 54, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(244, 50, 53, NULL, 53, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(245, 50, 53, NULL, 100, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(246, 50, 53, NULL, 99, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(247, 50, 53, NULL, 98, NULL, 1, 1, 1, 1050, 1690.00, 0, 0, 0, 1050, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(248, 51, 54, NULL, 54, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(249, 51, 54, NULL, 53, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(250, 51, 54, NULL, 100, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(251, 51, 54, NULL, 99, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(252, 51, 54, NULL, 98, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(253, 51, 54, NULL, 101, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(254, 52, 55, NULL, 82, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(255, 52, 55, NULL, 81, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(256, 52, 55, NULL, 105, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(257, 52, 55, NULL, 104, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(258, 52, 55, NULL, 103, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(259, 52, 55, NULL, 102, NULL, 1, 1, 1, 1100, 1990.00, 0, 0, 0, 1100, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(260, 53, 56, NULL, 11, NULL, 2, 2, 1, 1000, 1750.00, 0, 0, 0, 2000, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(261, 53, 56, NULL, 109, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(262, 53, 56, NULL, 108, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(263, 53, 56, NULL, 107, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(264, 53, 56, NULL, 106, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(265, 54, 57, NULL, 119, NULL, 2, 2, 1, 1000, 1750.00, 0, 0, 0, 2000, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(266, 54, 57, NULL, 118, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(267, 54, 57, NULL, 117, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(268, 54, 57, NULL, 116, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(269, 54, 57, NULL, 115, NULL, 1, 1, 1, 1000, 1750.00, 0, 0, 0, 1000, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(275, 57, 59, NULL, 88, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(276, 57, 59, NULL, 87, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(277, 57, 59, NULL, 86, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(278, 57, 59, NULL, 85, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(279, 57, 59, NULL, 125, NULL, 2, 2, 1, 900, 1490.00, 0, 0, 0, 1800, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(280, 58, 60, NULL, 84, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(281, 58, 60, NULL, 83, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(282, 58, 60, NULL, 82, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(283, 58, 60, NULL, 81, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(284, 58, 60, NULL, 105, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(285, 58, 60, NULL, 104, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(286, 59, 61, NULL, 64, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(287, 59, 61, NULL, 63, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(288, 59, 61, NULL, 62, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(289, 59, 61, NULL, 61, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(290, 59, 61, NULL, 97, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:23', '2024-12-12 04:47:23'),
(291, 59, 61, NULL, 96, NULL, 1, 1, 1, 1000, 1690.00, 0, 0, 0, 1000, '2024-12-12 04:47:23', '2024-12-12 04:47:23'),
(292, 60, 62, NULL, 21, NULL, 1, 1, 1, 1150, 1790.00, 0, 0, 0, 1150, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(293, 60, 62, NULL, 58, NULL, 1, 1, 1, 1150, 1790.00, 0, 0, 0, 1150, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(294, 60, 62, NULL, 57, NULL, 2, 2, 1, 1150, 1790.00, 0, 0, 0, 2300, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(295, 60, 62, NULL, 56, NULL, 1, 1, 1, 1150, 1790.00, 0, 0, 0, 1150, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(296, 60, 62, NULL, 60, NULL, 1, 1, 1, 1150, 1790.00, 0, 0, 0, 1150, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(302, 62, 64, NULL, 124, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(303, 62, 64, NULL, 123, NULL, 2, 2, 1, 900, 1490.00, 0, 0, 0, 1800, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(304, 62, 64, NULL, 122, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(305, 62, 64, NULL, 121, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(306, 62, 64, NULL, 120, NULL, 1, 1, 1, 900, 1490.00, 0, 0, 0, 900, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(307, 63, 65, NULL, 10, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(308, 63, 65, NULL, 9, NULL, 2, 2, 1, 1500, 2990.00, 0, 0, 0, 3000, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(309, 63, 65, NULL, 8, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(310, 63, 65, NULL, 7, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(311, 63, 65, NULL, 6, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(312, 64, 66, NULL, 25, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(313, 64, 66, NULL, 24, NULL, 2, 2, 1, 1500, 2990.00, 0, 0, 0, 3000, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(314, 64, 66, NULL, 23, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(315, 64, 66, NULL, 22, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(316, 64, 66, NULL, 21, NULL, 1, 1, 1, 1500, 2990.00, 0, 0, 0, 1500, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(317, 65, 67, NULL, 20, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(318, 65, 67, NULL, 19, NULL, 2, 2, 1, 1600, 2490.00, 0, 0, 0, 3200, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(319, 65, 67, NULL, 18, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(320, 65, 67, NULL, 17, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(321, 65, 67, NULL, 16, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(322, 66, 68, NULL, 35, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(323, 66, 68, NULL, 34, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(324, 66, 68, NULL, 33, NULL, 2, 2, 1, 1600, 2490.00, 0, 0, 0, 3200, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(325, 66, 68, NULL, 32, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(326, 66, 68, NULL, 36, NULL, 1, 1, 1, 1600, 2490.00, 0, 0, 0, 1600, '2024-12-12 05:27:55', '2024-12-12 05:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_id`, `position`, `item_code`, `additional_cost`, `additional_price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2/R-R-100', NULL, NULL, 0, '2024-12-11 00:04:36', '2024-12-11 00:04:36'),
(2, 2, 2, 1, 'R/2-R-101', NULL, NULL, 0, '2024-12-11 00:06:25', '2024-12-11 00:23:43'),
(3, 2, 3, 2, 'R/2-R-101', NULL, NULL, 0, '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(4, 2, 4, 3, 'G/2-R-101', NULL, NULL, 0, '2024-12-11 00:06:25', '2024-12-11 00:23:43'),
(5, 2, 5, 4, 'G/2-R-101', NULL, NULL, 0, '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(6, 3, 6, 1, 'B/4-R-101', NULL, NULL, 0, '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(7, 3, 7, 2, 'B/4-R-101', NULL, NULL, 0, '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(8, 3, 8, 3, 'B/4-R-101', NULL, NULL, 0, '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(9, 3, 9, 4, 'B/4-R-101', NULL, NULL, 0, '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(10, 3, 10, 5, 'B/4-R-101', NULL, NULL, 0, '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(11, 4, 11, 1, 'G/40-R-102', NULL, NULL, 1, '2024-12-11 23:06:22', '2024-12-11 23:11:28'),
(12, 4, 12, 2, 'G/41-R-102', NULL, NULL, 2, '2024-12-11 23:06:22', '2024-12-11 23:11:28'),
(13, 4, 13, 3, 'G/42-R-102', NULL, NULL, 1, '2024-12-11 23:06:22', '2024-12-11 23:11:27'),
(14, 4, 14, 4, 'G/43-R-102', NULL, NULL, 1, '2024-12-11 23:06:22', '2024-12-11 23:11:27'),
(15, 4, 15, 5, 'G/44-R-102', NULL, NULL, 1, '2024-12-11 23:06:22', '2024-12-11 23:11:27'),
(16, 5, 6, 1, 'BR/40-R-101', NULL, NULL, 1, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(17, 5, 7, 2, 'BR/41-R-101', NULL, NULL, 1, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(18, 5, 8, 3, 'BR/42-R-101', NULL, NULL, 1, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(19, 5, 9, 4, 'BR/43-R-101', NULL, NULL, 2, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(20, 5, 10, 5, 'BR/44-R-101', NULL, NULL, 1, '2024-12-11 23:21:51', '2024-12-11 23:22:53'),
(21, 6, 6, 1, 'B/4-R-103', NULL, NULL, 0, '2024-12-11 23:28:40', '2024-12-11 23:28:40'),
(22, 6, 7, 2, 'B/4-R-103', NULL, NULL, 0, '2024-12-11 23:28:40', '2024-12-11 23:28:40'),
(23, 7, 6, 1, 'B/4-R-104', NULL, NULL, 0, '2024-12-11 23:33:22', '2024-12-11 23:35:36'),
(24, 7, 7, 2, 'B/4-R-104', NULL, NULL, 0, '2024-12-11 23:33:22', '2024-12-11 23:33:22'),
(25, 7, 8, 3, 'B/4-R-104', NULL, NULL, 0, '2024-12-11 23:33:22', '2024-12-11 23:33:22'),
(26, 7, 9, 4, 'B/4-R-104', NULL, NULL, 0, '2024-12-11 23:33:22', '2024-12-11 23:33:22'),
(27, 7, 10, 5, 'B/4-R-104', NULL, NULL, 0, '2024-12-11 23:33:22', '2024-12-11 23:33:22'),
(28, 8, 6, 1, 'Brown/40-R-105', NULL, NULL, 2, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(29, 8, 7, 2, 'Brown/41-R-105', NULL, NULL, 1, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(30, 8, 8, 3, 'Brown/42-R-105', NULL, NULL, 1, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(31, 8, 9, 4, 'Brown/43-R-105', NULL, NULL, 1, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(32, 8, 10, 5, 'Brown/44-R-105', NULL, NULL, 1, '2024-12-11 23:36:31', '2024-12-12 00:34:48'),
(33, 9, 16, 1, 'B/40-R-106', NULL, NULL, 1, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(34, 9, 17, 2, 'B/41-R-106', NULL, NULL, 2, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(35, 9, 18, 3, 'B/42-R-106', NULL, NULL, 1, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(36, 9, 19, 4, 'B/43-R-106', NULL, NULL, 1, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(37, 9, 20, 5, 'B/44-R-106', NULL, NULL, 1, '2024-12-11 23:40:50', '2024-12-11 23:42:01'),
(38, 10, 16, 1, 'Black/40-R-107', NULL, NULL, 1, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(39, 10, 17, 2, 'Black/41-R-107', NULL, NULL, 1, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(40, 10, 18, 3, 'Black/42-R-107', NULL, NULL, 1, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(41, 10, 19, 4, 'Black/43-R-107', NULL, NULL, 1, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(42, 10, 20, 5, 'Black/44-R-107', NULL, NULL, 2, '2024-12-11 23:44:14', '2024-12-11 23:45:30'),
(43, 11, 21, 1, 'W/40-R-108', NULL, NULL, 1, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(44, 11, 22, 2, 'W/41-R-108', NULL, NULL, 1, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(45, 11, 23, 3, 'W/42-R-108', NULL, NULL, 1, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(46, 11, 24, 4, 'W/43-R-108', NULL, NULL, 1, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(47, 11, 25, 5, 'W/44-R-108', NULL, NULL, 2, '2024-12-11 23:47:39', '2024-12-11 23:48:01'),
(48, 12, 16, 1, 'Black/40-R-109', NULL, NULL, 1, '2024-12-11 23:50:28', '2024-12-11 23:52:59'),
(49, 12, 17, 2, 'Black/41-R-109', NULL, NULL, 1, '2024-12-11 23:50:28', '2024-12-11 23:52:59'),
(50, 12, 18, 3, 'Black/42-R-109', NULL, NULL, 2, '2024-12-11 23:50:28', '2024-12-11 23:52:59'),
(51, 12, 19, 4, 'Black/43-R-109', NULL, NULL, 1, '2024-12-11 23:50:28', '2024-12-11 23:52:59'),
(53, 12, 26, 5, 'Black/39-R-109', NULL, NULL, 1, '2024-12-11 23:52:22', '2024-12-11 23:52:59'),
(54, 13, 27, 1, 'Olive/39-R-10A', NULL, NULL, 1, '2024-12-11 23:55:37', '2024-12-11 23:55:58'),
(55, 13, 28, 2, 'Olive/40-R-10A', NULL, NULL, 1, '2024-12-11 23:55:37', '2024-12-11 23:55:58'),
(56, 13, 29, 3, 'Olive/41-R-10A', NULL, NULL, 1, '2024-12-11 23:55:37', '2024-12-11 23:55:58'),
(57, 13, 30, 4, 'Olive/42-R-10A', NULL, NULL, 2, '2024-12-11 23:55:37', '2024-12-11 23:55:58'),
(58, 13, 31, 5, 'Olive/43-R-10A', NULL, NULL, 1, '2024-12-11 23:55:37', '2024-12-11 23:55:58'),
(59, 14, 32, 1, 'Grey/41-R-10B', NULL, NULL, 1, '2024-12-11 23:59:06', '2024-12-12 00:02:34'),
(60, 14, 33, 2, 'Grey/42-R-10B', NULL, NULL, 1, '2024-12-11 23:59:06', '2024-12-12 00:02:34'),
(61, 14, 34, 3, 'Grey/43-R-10B', NULL, NULL, 2, '2024-12-11 23:59:06', '2024-12-12 00:02:34'),
(62, 14, 35, 4, 'Grey/44-R-10B', NULL, NULL, 2, '2024-12-11 23:59:06', '2024-12-12 00:02:34'),
(64, 15, 16, 1, 'Black/40-R-10C', NULL, NULL, 1, '2024-12-12 00:17:28', '2024-12-12 00:20:11'),
(65, 15, 17, 2, 'Black/41-R-10C', NULL, NULL, 1, '2024-12-12 00:17:28', '2024-12-12 00:20:11'),
(66, 15, 18, 3, 'Black/42-R-10C', NULL, NULL, 1, '2024-12-12 00:17:28', '2024-12-12 00:20:11'),
(67, 15, 19, 4, 'Black/43-R-10C', NULL, NULL, 2, '2024-12-12 00:17:28', '2024-12-12 00:20:11'),
(68, 15, 20, 5, 'Black/44-R-10C', NULL, NULL, 1, '2024-12-12 00:17:28', '2024-12-12 00:20:11'),
(69, 16, 16, 1, 'Black/40-R-10D', NULL, NULL, 1, '2024-12-12 00:21:16', '2024-12-12 00:21:51'),
(70, 16, 17, 2, 'Black/41-R-10D', NULL, NULL, 1, '2024-12-12 00:21:16', '2024-12-12 00:21:51'),
(71, 16, 18, 3, 'Black/42-R-10D', NULL, NULL, 1, '2024-12-12 00:21:16', '2024-12-12 00:21:51'),
(72, 16, 19, 4, 'Black/43-R-10D', NULL, NULL, 2, '2024-12-12 00:21:16', '2024-12-12 00:21:51'),
(73, 16, 20, 5, 'Black/44-R-10D', NULL, NULL, 1, '2024-12-12 00:21:16', '2024-12-12 00:21:51'),
(74, 17, 6, 1, 'Brown/40-R-10E', NULL, NULL, 1, '2024-12-12 00:25:40', '2024-12-12 00:26:27'),
(75, 17, 7, 2, 'Brown/41-R-10E', NULL, NULL, 1, '2024-12-12 00:25:40', '2024-12-12 00:26:27'),
(76, 17, 8, 3, 'Brown/42-R-10E', NULL, NULL, 1, '2024-12-12 00:25:40', '2024-12-12 00:26:27'),
(77, 17, 9, 4, 'Brown/43-R-10E', NULL, NULL, 2, '2024-12-12 00:25:40', '2024-12-12 00:26:27'),
(78, 17, 10, 5, 'Brown/44-R-10E', NULL, NULL, 1, '2024-12-12 00:25:40', '2024-12-12 00:26:27'),
(79, 18, 36, 1, 'Grey/40-R-10F', NULL, NULL, 1, '2024-12-12 00:32:07', '2024-12-12 00:36:31'),
(80, 18, 32, 2, 'Grey/41-R-10F', NULL, NULL, 1, '2024-12-12 00:32:07', '2024-12-12 00:36:31'),
(81, 18, 33, 3, 'Grey/42-R-10F', NULL, NULL, 1, '2024-12-12 00:32:07', '2024-12-12 00:36:31'),
(82, 18, 34, 4, 'Grey/43-R-10F', NULL, NULL, 1, '2024-12-12 00:32:07', '2024-12-12 00:36:31'),
(83, 18, 35, 5, 'Grey/44-R-10F', NULL, NULL, 2, '2024-12-12 00:32:07', '2024-12-12 00:36:31'),
(89, 19, 21, 1, 'White/40-R-110', NULL, NULL, 1, '2024-12-12 00:37:12', '2024-12-12 00:38:09'),
(90, 19, 22, 2, 'White/41-R-110', NULL, NULL, 1, '2024-12-12 00:37:12', '2024-12-12 00:38:09'),
(91, 19, 23, 3, 'White/42-R-110', NULL, NULL, 1, '2024-12-12 00:37:12', '2024-12-12 00:38:09'),
(92, 19, 24, 4, 'White/43-R-110', NULL, NULL, 2, '2024-12-12 00:37:12', '2024-12-12 00:38:09'),
(93, 19, 25, 5, 'White/44-R-110', NULL, NULL, 1, '2024-12-12 00:37:12', '2024-12-12 00:38:09'),
(94, 20, 21, 1, 'White/40-R-111', NULL, NULL, 1, '2024-12-12 00:39:48', '2024-12-12 00:40:50'),
(95, 20, 22, 2, 'White/41-R-111', NULL, NULL, 1, '2024-12-12 00:39:48', '2024-12-12 00:40:50'),
(96, 20, 37, 3, 'White/.42-R-111', NULL, NULL, 2, '2024-12-12 00:39:48', '2024-12-12 00:40:50'),
(97, 20, 24, 4, 'White/43-R-111', NULL, NULL, 1, '2024-12-12 00:39:48', '2024-12-12 00:40:50'),
(98, 20, 25, 5, 'White/44-R-111', NULL, NULL, 1, '2024-12-12 00:39:48', '2024-12-12 00:40:50'),
(99, 21, 36, 1, 'Grey/40-R-112', NULL, NULL, 1, '2024-12-12 00:43:25', '2024-12-12 00:44:04'),
(100, 21, 32, 2, 'Grey/41-R-112', NULL, NULL, 2, '2024-12-12 00:43:25', '2024-12-12 00:44:04'),
(101, 21, 33, 3, 'Grey/42-R-112', NULL, NULL, 1, '2024-12-12 00:43:25', '2024-12-12 00:44:04'),
(102, 21, 34, 4, 'Grey/43-R-112', NULL, NULL, 1, '2024-12-12 00:43:25', '2024-12-12 00:44:04'),
(103, 21, 35, 5, 'Grey/44-R-112', NULL, NULL, 1, '2024-12-12 00:43:25', '2024-12-12 00:44:04'),
(104, 22, 38, 1, 'Pink/36-R-113', NULL, NULL, 1, '2024-12-12 01:05:07', '2024-12-12 01:05:55'),
(105, 22, 39, 2, 'Pink/37-R-113', NULL, NULL, 1, '2024-12-12 01:05:07', '2024-12-12 01:05:55'),
(106, 22, 40, 3, 'Pink/38-R-113', NULL, NULL, 1, '2024-12-12 01:05:07', '2024-12-12 01:05:55'),
(107, 22, 41, 4, 'Pink/39-R-113', NULL, NULL, 2, '2024-12-12 01:05:07', '2024-12-12 01:05:55'),
(108, 22, 42, 5, 'Pink/40-R-113', NULL, NULL, 1, '2024-12-12 01:05:07', '2024-12-12 01:05:55'),
(109, 23, 43, 1, 'Purple/36-R-114', NULL, NULL, 1, '2024-12-12 01:11:24', '2024-12-12 01:12:21'),
(110, 23, 44, 2, 'Purple/37-R-114', NULL, NULL, 1, '2024-12-12 01:11:24', '2024-12-12 01:12:21'),
(111, 23, 45, 3, 'Purple/38-R-114', NULL, NULL, 2, '2024-12-12 01:11:24', '2024-12-12 01:12:21'),
(112, 23, 46, 4, 'Purple/39-R-114', NULL, NULL, 1, '2024-12-12 01:11:24', '2024-12-12 01:12:21'),
(113, 23, 47, 5, 'Purple/40-R-114', NULL, NULL, 1, '2024-12-12 01:11:24', '2024-12-12 01:12:21'),
(114, 24, 36, 1, 'Grey/40-R-115', NULL, NULL, 2, '2024-12-12 01:14:57', '2024-12-12 01:16:30'),
(115, 24, 32, 2, 'Grey/41-R-115', NULL, NULL, 1, '2024-12-12 01:14:57', '2024-12-12 01:16:30'),
(116, 24, 33, 3, 'Grey/42-R-115', NULL, NULL, 1, '2024-12-12 01:14:57', '2024-12-12 01:16:30'),
(117, 24, 34, 4, 'Grey/43-R-115', NULL, NULL, 1, '2024-12-12 01:14:57', '2024-12-12 01:16:30'),
(118, 24, 35, 5, 'Grey/44-R-115', NULL, NULL, 1, '2024-12-12 01:14:57', '2024-12-12 01:16:30'),
(124, 26, 53, 1, 'Black/36-R-117', NULL, NULL, 1, '2024-12-12 01:35:41', '2024-12-12 01:36:14'),
(125, 26, 54, 2, 'Black/37-R-117', NULL, NULL, 1, '2024-12-12 01:35:41', '2024-12-12 01:36:14'),
(126, 26, 55, 3, 'Black/38-R-117', NULL, NULL, 2, '2024-12-12 01:35:41', '2024-12-12 01:36:14'),
(127, 26, 26, 4, 'Black/39-R-117', NULL, NULL, 1, '2024-12-12 01:35:41', '2024-12-12 01:36:14'),
(128, 26, 16, 5, 'Black/40-R-117', NULL, NULL, 1, '2024-12-12 01:35:41', '2024-12-12 01:36:14'),
(129, 25, 43, 1, 'Purple/36-R-116', NULL, NULL, 0, '2024-12-12 01:37:59', '2024-12-12 01:37:59'),
(130, 25, 44, 2, 'Purple/37-R-116', NULL, NULL, 0, '2024-12-12 01:37:59', '2024-12-12 01:37:59'),
(131, 25, 45, 3, 'Purple/38-R-116', NULL, NULL, 0, '2024-12-12 01:37:59', '2024-12-12 01:37:59'),
(132, 25, 46, 4, 'Purple/39-R-116', NULL, NULL, 0, '2024-12-12 01:37:59', '2024-12-12 01:37:59'),
(133, 25, 47, 5, 'Purple/40-R-116', NULL, NULL, 0, '2024-12-12 01:37:59', '2024-12-12 01:37:59'),
(139, 27, 38, 1, 'PINK/36-R-116', NULL, NULL, 0, '2024-12-12 01:46:11', '2024-12-12 01:46:11'),
(140, 27, 39, 2, 'PINK/37-R-116', NULL, NULL, 0, '2024-12-12 01:46:11', '2024-12-12 01:46:11'),
(141, 27, 40, 3, 'PINK/38-R-116', NULL, NULL, 0, '2024-12-12 01:46:11', '2024-12-12 01:46:11'),
(142, 27, 41, 4, 'PINK/39-R-116', NULL, NULL, 0, '2024-12-12 01:46:11', '2024-12-12 01:46:11'),
(143, 27, 42, 5, 'PINK/40-R-116', NULL, NULL, 0, '2024-12-12 01:46:11', '2024-12-12 01:46:11'),
(144, 28, 56, 1, 'White/37-R-118', NULL, NULL, 1, '2024-12-12 01:47:45', '2024-12-12 01:49:03'),
(145, 28, 57, 2, 'White/38-R-118', NULL, NULL, 2, '2024-12-12 01:47:45', '2024-12-12 01:49:03'),
(146, 28, 58, 3, 'White/39-R-118', NULL, NULL, 2, '2024-12-12 01:47:45', '2024-12-12 01:49:03'),
(147, 28, 21, 4, 'White/40-R-118', NULL, NULL, 1, '2024-12-12 01:47:45', '2024-12-12 01:49:03'),
(148, 29, 38, 1, 'Pink/36-R-116', NULL, NULL, 1, '2024-12-12 01:50:36', '2024-12-12 01:51:34'),
(149, 29, 39, 2, 'Pink/37-R-116', NULL, NULL, 1, '2024-12-12 01:50:36', '2024-12-12 01:51:34'),
(150, 29, 40, 3, 'Pink/38-R-116', NULL, NULL, 1, '2024-12-12 01:50:36', '2024-12-12 01:51:34'),
(151, 29, 41, 4, 'Pink/39-R-116', NULL, NULL, 1, '2024-12-12 01:50:36', '2024-12-12 01:51:34'),
(152, 29, 42, 5, 'Pink/40-R-116', NULL, NULL, 2, '2024-12-12 01:50:36', '2024-12-12 01:51:34'),
(153, 30, 16, 1, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(154, 30, 17, 2, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(155, 30, 18, 3, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(156, 30, 21, 4, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(157, 30, 22, 5, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(158, 30, 23, 6, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(159, 30, 16, 7, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(160, 30, 17, 8, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(161, 30, 18, 9, 'B/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(162, 30, 21, 10, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(163, 30, 22, 11, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(164, 30, 23, 12, 'W/4-R-120', NULL, NULL, 0, '2024-12-12 01:54:22', '2024-12-12 01:54:22'),
(165, 31, 38, 1, 'Pink/36-R-119', NULL, NULL, 1, '2024-12-12 01:56:37', '2024-12-12 01:57:10'),
(166, 31, 39, 2, 'Pink/37-R-119', NULL, NULL, 1, '2024-12-12 01:56:37', '2024-12-12 01:57:10'),
(167, 31, 40, 3, 'Pink/38-R-119', NULL, NULL, 2, '2024-12-12 01:56:37', '2024-12-12 01:57:10'),
(168, 31, 41, 4, 'Pink/39-R-119', NULL, NULL, 1, '2024-12-12 01:56:37', '2024-12-12 01:57:10'),
(169, 31, 42, 5, 'Pink/40-R-119', NULL, NULL, 1, '2024-12-12 01:56:37', '2024-12-12 01:57:10'),
(170, 32, 38, 1, 'Pink/36-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(171, 32, 39, 2, 'Pink/37-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(172, 32, 40, 3, 'Pink/38-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(173, 32, 41, 4, 'Pink/39-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(174, 32, 42, 5, 'Pink/40-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(175, 32, 59, 6, 'Pink/41-R-11A', NULL, NULL, 1, '2024-12-12 02:09:45', '2024-12-12 02:10:33'),
(176, 33, 60, 1, 'White/36-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(177, 33, 56, 2, 'White/37-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(178, 33, 57, 3, 'White/38-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(179, 33, 58, 4, 'White/39-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(180, 33, 21, 5, 'White/40-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(181, 33, 22, 6, 'White/41-R-11B', NULL, NULL, 1, '2024-12-12 02:13:56', '2024-12-12 02:14:25'),
(182, 34, 61, 1, 'Brown/36-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(183, 34, 62, 2, 'Brown/37-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(184, 34, 63, 3, 'Brown/38-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(185, 34, 64, 4, 'Brown/39-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(186, 34, 6, 5, 'Brown/40-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(187, 34, 7, 6, 'Brown/41-R-11C', NULL, NULL, 1, '2024-12-12 02:18:00', '2024-12-12 02:19:07'),
(188, 35, 65, 1, 'Cream/36-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(189, 35, 66, 2, 'Cream/37-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(190, 35, 67, 3, 'Cream/38-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(191, 35, 68, 4, 'Cream/39-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(192, 35, 69, 5, 'Cream/40-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(193, 35, 70, 6, 'Cream/41-R-11D', NULL, NULL, 1, '2024-12-12 02:21:59', '2024-12-12 02:22:42'),
(194, 36, 71, 1, 'Blue/40-R-11E', NULL, NULL, 2, '2024-12-12 02:30:48', '2024-12-12 02:31:44'),
(195, 36, 72, 2, 'Blue/41-R-11E', NULL, NULL, 1, '2024-12-12 02:30:48', '2024-12-12 02:31:44'),
(196, 36, 73, 3, 'Blue/42-R-11E', NULL, NULL, 1, '2024-12-12 02:30:48', '2024-12-12 02:31:44'),
(197, 36, 74, 4, 'Blue/43-R-11E', NULL, NULL, 1, '2024-12-12 02:30:48', '2024-12-12 02:31:44'),
(198, 36, 75, 5, 'Blue/44-R-11E', NULL, NULL, 1, '2024-12-12 02:30:48', '2024-12-12 02:31:44'),
(199, 37, 6, 1, 'Brown/40-R-11F', NULL, NULL, 1, '2024-12-12 02:37:19', '2024-12-12 02:38:31'),
(200, 37, 7, 2, 'Brown/41-R-11F', NULL, NULL, 1, '2024-12-12 02:37:19', '2024-12-12 02:38:31'),
(201, 37, 8, 3, 'Brown/42-R-11F', NULL, NULL, 1, '2024-12-12 02:37:19', '2024-12-12 02:38:31'),
(202, 37, 9, 4, 'Brown/43-R-11F', NULL, NULL, 2, '2024-12-12 02:37:19', '2024-12-12 02:38:31'),
(203, 37, 10, 5, 'Brown/44-R-11F', NULL, NULL, 1, '2024-12-12 02:37:19', '2024-12-12 02:38:31'),
(204, 38, 21, 1, 'White/40-R-120', NULL, NULL, 2, '2024-12-12 02:40:07', '2024-12-12 02:40:49'),
(205, 38, 22, 2, 'White/41-R-120', NULL, NULL, 1, '2024-12-12 02:40:07', '2024-12-12 02:40:49'),
(206, 38, 23, 3, 'White/42-R-120', NULL, NULL, 1, '2024-12-12 02:40:07', '2024-12-12 02:40:49'),
(207, 38, 24, 4, 'White/43-R-120', NULL, NULL, 1, '2024-12-12 02:40:07', '2024-12-12 02:40:49'),
(208, 38, 25, 5, 'White/44-R-120', NULL, NULL, 1, '2024-12-12 02:40:07', '2024-12-12 02:40:49'),
(209, 39, 6, 1, 'Brown/40-R-121', NULL, NULL, 1, '2024-12-12 02:43:27', '2024-12-12 02:44:46'),
(210, 39, 7, 2, 'Brown/41-R-121', NULL, NULL, 2, '2024-12-12 02:43:27', '2024-12-12 02:44:46'),
(211, 39, 8, 3, 'Brown/42-R-121', NULL, NULL, 1, '2024-12-12 02:43:27', '2024-12-12 02:44:46'),
(213, 39, 10, 4, 'Brown/44-R-121', NULL, NULL, 2, '2024-12-12 02:43:27', '2024-12-12 02:44:46'),
(214, 40, 38, 1, 'Pink/36-R-122', NULL, NULL, 1, '2024-12-12 02:52:18', '2024-12-12 02:52:55'),
(215, 40, 39, 2, 'Pink/37-R-122', NULL, NULL, 1, '2024-12-12 02:52:18', '2024-12-12 02:52:55'),
(216, 40, 40, 3, 'Pink/38-R-122', NULL, NULL, 2, '2024-12-12 02:52:18', '2024-12-12 02:52:55'),
(217, 40, 41, 4, 'Pink/39-R-122', NULL, NULL, 1, '2024-12-12 02:52:18', '2024-12-12 02:52:55'),
(218, 40, 42, 5, 'Pink/40-R-122', NULL, NULL, 1, '2024-12-12 02:52:18', '2024-12-12 02:52:55'),
(219, 41, 76, 1, 'RED/36-R-123', NULL, NULL, 1, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(220, 41, 77, 2, 'RED/37-R-123', NULL, NULL, 1, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(221, 41, 78, 3, 'RED/38-R-123', NULL, NULL, 2, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(222, 41, 79, 4, 'RED/39-R-123', NULL, NULL, 1, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(223, 41, 80, 5, 'RED/40-R-123', NULL, NULL, 1, '2024-12-12 03:01:27', '2024-12-12 03:03:23'),
(224, 42, 38, 1, 'Pink/36-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(225, 42, 39, 2, 'Pink/37-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(226, 42, 40, 3, 'Pink/38-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(227, 42, 41, 4, 'Pink/39-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(228, 42, 42, 5, 'Pink/40-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(229, 42, 59, 6, 'Pink/41-R-124', NULL, NULL, 1, '2024-12-12 03:42:45', '2024-12-12 03:43:46'),
(231, 43, 56, 1, 'White/37-R-125', NULL, NULL, 1, '2024-12-12 03:44:44', '2024-12-12 03:45:27'),
(232, 43, 57, 2, 'White/38-R-125', NULL, NULL, 1, '2024-12-12 03:44:44', '2024-12-12 03:45:27'),
(233, 43, 58, 3, 'White/39-R-125', NULL, NULL, 1, '2024-12-12 03:44:44', '2024-12-12 03:45:27'),
(234, 43, 21, 4, 'White/40-R-125', NULL, NULL, 2, '2024-12-12 03:44:44', '2024-12-12 03:45:27'),
(235, 43, 22, 5, 'White/41-R-125', NULL, NULL, 1, '2024-12-12 03:44:44', '2024-12-12 03:45:27'),
(236, 44, 36, 1, 'Grey/40-R-126', NULL, NULL, 1, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(237, 44, 32, 2, 'Grey/41-R-126', NULL, NULL, 2, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(238, 44, 33, 3, 'Grey/42-R-126', NULL, NULL, 1, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(239, 44, 34, 4, 'Grey/43-R-126', NULL, NULL, 1, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(240, 44, 35, 5, 'Grey/44-R-126', NULL, NULL, 1, '2024-12-12 03:46:45', '2024-12-12 03:48:40'),
(241, 45, 6, 1, 'Brown/40-R-127', NULL, NULL, 2, '2024-12-12 03:50:04', '2024-12-12 03:51:00'),
(242, 45, 7, 2, 'Brown/41-R-127', NULL, NULL, 1, '2024-12-12 03:50:04', '2024-12-12 03:51:00'),
(243, 45, 8, 3, 'Brown/42-R-127', NULL, NULL, 1, '2024-12-12 03:50:04', '2024-12-12 03:51:00'),
(244, 45, 9, 4, 'Brown/43-R-127', NULL, NULL, 1, '2024-12-12 03:50:04', '2024-12-12 03:51:00'),
(245, 45, 10, 5, 'Brown/44-R-127', NULL, NULL, 1, '2024-12-12 03:50:04', '2024-12-12 03:51:00'),
(246, 46, 53, 1, 'Black/36-R-128', NULL, NULL, 1, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(247, 46, 54, 2, 'Black/37-R-128', NULL, NULL, 1, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(248, 46, 55, 3, 'Black/38-R-128', NULL, NULL, 1, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(249, 46, 26, 4, 'Black/39-R-128', NULL, NULL, 1, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(250, 46, 16, 5, 'Black/40-R-128', NULL, NULL, 2, '2024-12-12 03:54:51', '2024-12-12 03:56:09'),
(251, 47, 81, 1, 'Blue/36-R-129', NULL, NULL, 1, '2024-12-12 03:57:52', '2024-12-12 03:58:47'),
(252, 47, 82, 2, 'Blue/37-R-129', NULL, NULL, 1, '2024-12-12 03:57:52', '2024-12-12 03:58:47'),
(253, 47, 83, 3, 'Blue/38-R-129', NULL, NULL, 1, '2024-12-12 03:57:52', '2024-12-12 03:58:47'),
(254, 47, 84, 4, 'Blue/39-R-129', NULL, NULL, 1, '2024-12-12 03:57:52', '2024-12-12 03:58:47'),
(255, 47, 71, 5, 'Blue/40-R-129', NULL, NULL, 2, '2024-12-12 03:57:52', '2024-12-12 03:58:47'),
(256, 48, 76, 1, 'RED/36-R-12A', NULL, NULL, 2, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(257, 48, 77, 2, 'RED/37-R-12A', NULL, NULL, 1, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(258, 48, 78, 3, 'RED/38-R-12A', NULL, NULL, 1, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(259, 48, 79, 4, 'RED/39-R-12A', NULL, NULL, 1, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(260, 48, 80, 5, 'RED/40-R-12A', NULL, NULL, 1, '2024-12-12 04:00:11', '2024-12-12 04:04:14'),
(261, 49, 81, 1, 'Blue/36-R-12B', NULL, NULL, 1, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(262, 49, 82, 2, 'Blue/37-R-12B', NULL, NULL, 1, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(263, 49, 83, 3, 'Blue/38-R-12B', NULL, NULL, 2, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(264, 49, 84, 4, 'Blue/39-R-12B', NULL, NULL, 1, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(265, 49, 71, 5, 'Blue/40-R-12B', NULL, NULL, 1, '2024-12-12 04:04:44', '2024-12-12 04:05:38'),
(266, 50, 85, 1, 'Brown/27-R-12C', NULL, NULL, 1, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(267, 50, 86, 2, 'Brown/28-R-12C', NULL, NULL, 1, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(268, 50, 87, 3, 'Brown/29-R-12C', NULL, NULL, 1, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(269, 50, 88, 4, 'Brown/30-R-12C', NULL, NULL, 2, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(270, 50, 89, 5, 'Brown/31-R-12C', NULL, NULL, 1, '2024-12-12 04:13:10', '2024-12-12 04:14:15'),
(271, 51, 90, 1, 'Blue/27-R-12D', NULL, NULL, 1, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(272, 51, 91, 2, 'Blue/28-R-12D', NULL, NULL, 1, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(273, 51, 92, 3, 'Blue/29-R-12D', NULL, NULL, 1, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(274, 51, 93, 4, 'Blue/30-R-12D', NULL, NULL, 1, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(275, 51, 94, 5, 'Blue/31-R-12D', NULL, NULL, 2, '2024-12-12 04:15:15', '2024-12-12 04:16:17'),
(276, 52, 95, 1, 'Brown/33-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(277, 52, 96, 2, 'Brown/34-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(278, 52, 97, 3, 'Brown/35-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(279, 52, 61, 4, 'Brown/36-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(280, 52, 62, 5, 'Brown/37-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(281, 52, 63, 6, 'Brown/38-R-12E', NULL, NULL, 1, '2024-12-12 04:18:10', '2024-12-12 04:18:48'),
(282, 53, 98, 1, 'Black/33-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(283, 53, 99, 2, 'Black/34-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(284, 53, 100, 3, 'Black/35-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(285, 53, 53, 4, 'Black/36-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(286, 53, 54, 5, 'Black/37-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(287, 53, 55, 6, 'Black/38-R-12F', NULL, NULL, 1, '2024-12-12 04:19:26', '2024-12-12 04:20:10'),
(288, 54, 101, 1, 'Black/32-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(289, 54, 98, 2, 'Black/33-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(290, 54, 99, 3, 'Black/34-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(291, 54, 100, 4, 'Black/35-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(292, 54, 53, 5, 'Black/36-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(293, 54, 54, 6, 'Black/37-R-130', NULL, NULL, 1, '2024-12-12 04:27:09', '2024-12-12 04:29:12'),
(294, 55, 102, 1, 'Blue/32-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(295, 55, 103, 2, 'Blue/33-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(296, 55, 104, 3, 'Blue/34-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(297, 55, 105, 4, 'Blue/35-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(298, 55, 81, 5, 'Blue/36-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(299, 55, 82, 6, 'Blue/37-R-131', NULL, NULL, 1, '2024-12-12 04:31:05', '2024-12-12 04:33:16'),
(300, 56, 106, 1, 'Green/36-R-132', NULL, NULL, 1, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(301, 56, 107, 2, 'Green/37-R-132', NULL, NULL, 1, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(302, 56, 108, 3, 'Green/38-R-132', NULL, NULL, 1, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(303, 56, 109, 4, 'Green/39-R-132', NULL, NULL, 1, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(304, 56, 11, 5, 'Green/40-R-132', NULL, NULL, 2, '2024-12-12 04:36:04', '2024-12-12 04:37:06'),
(310, 57, 115, 1, 'Orng/36-R-133', NULL, NULL, 1, '2024-12-12 04:39:35', '2024-12-12 04:40:20'),
(311, 57, 116, 2, 'Orng/37-R-133', NULL, NULL, 1, '2024-12-12 04:39:35', '2024-12-12 04:40:20'),
(312, 57, 117, 3, 'Orng/38-R-133', NULL, NULL, 1, '2024-12-12 04:39:35', '2024-12-12 04:40:20'),
(313, 57, 118, 4, 'Orng/39-R-133', NULL, NULL, 1, '2024-12-12 04:39:35', '2024-12-12 04:40:20'),
(314, 57, 119, 5, 'Orng/40-R-133', NULL, NULL, 2, '2024-12-12 04:39:35', '2024-12-12 04:40:20'),
(315, 58, 120, 1, 'Olive/26-R-134', NULL, NULL, 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(316, 58, 121, 2, 'Olive/27-R-134', NULL, NULL, 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(317, 58, 122, 3, 'Olive/28-R-134', NULL, NULL, 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(318, 58, 123, 4, 'Olive/29-R-134', NULL, NULL, 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(319, 58, 124, 5, 'Olive/30-R-134', NULL, NULL, 0, '2024-12-12 04:41:44', '2024-12-12 05:00:28'),
(320, 59, 125, 1, 'Brown/26-R-135', NULL, NULL, 2, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(321, 59, 85, 2, 'Brown/27-R-135', NULL, NULL, 1, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(322, 59, 86, 3, 'Brown/28-R-135', NULL, NULL, 1, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(323, 59, 87, 4, 'Brown/29-R-135', NULL, NULL, 1, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(324, 59, 88, 5, 'Brown/30-R-135', NULL, NULL, 1, '2024-12-12 04:43:18', '2024-12-12 04:44:11'),
(325, 60, 104, 1, 'Blue/34-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(326, 60, 105, 2, 'Blue/35-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(327, 60, 81, 3, 'Blue/36-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(328, 60, 82, 4, 'Blue/37-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(329, 60, 83, 5, 'Blue/38-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(330, 60, 84, 6, 'Blue/39-R-136', NULL, NULL, 1, '2024-12-12 04:45:23', '2024-12-12 04:46:02'),
(331, 61, 96, 1, 'Brown/34-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:23'),
(332, 61, 97, 2, 'Brown/35-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:22'),
(333, 61, 61, 3, 'Brown/36-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:22'),
(334, 61, 62, 4, 'Brown/37-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:22'),
(335, 61, 63, 5, 'Brown/38-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:22'),
(336, 61, 64, 6, 'Brown/39-R-137', NULL, NULL, 1, '2024-12-12 04:46:47', '2024-12-12 04:47:22'),
(337, 62, 60, 1, 'White/36-R-138', NULL, NULL, 1, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(338, 62, 56, 2, 'White/37-R-138', NULL, NULL, 1, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(339, 62, 57, 3, 'White/38-R-138', NULL, NULL, 2, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(340, 62, 58, 4, 'White/39-R-138', NULL, NULL, 1, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(341, 62, 21, 5, 'White/40-R-138', NULL, NULL, 1, '2024-12-12 04:49:17', '2024-12-12 04:50:04'),
(342, 63, 120, 1, 'Olive/26-R-134', NULL, NULL, 0, '2024-12-12 04:56:27', '2024-12-12 04:59:31'),
(343, 63, 121, 2, 'Olive/27-R-134', NULL, NULL, 0, '2024-12-12 04:56:27', '2024-12-12 04:59:31'),
(344, 63, 122, 3, 'Olive/28-R-134', NULL, NULL, 0, '2024-12-12 04:56:27', '2024-12-12 04:59:31'),
(345, 63, 123, 4, 'Olive/29-R-134', NULL, NULL, 0, '2024-12-12 04:56:27', '2024-12-12 04:59:31'),
(346, 63, 124, 5, 'Olive/30-R-134', NULL, NULL, 0, '2024-12-12 04:56:27', '2024-12-12 04:59:31'),
(347, 64, 120, 1, 'Olive/26-R-134', NULL, NULL, 1, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(348, 64, 121, 2, 'Olive/27-R-134', NULL, NULL, 1, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(349, 64, 122, 3, 'Olive/28-R-134', NULL, NULL, 1, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(350, 64, 123, 4, 'Olive/29-R-134', NULL, NULL, 2, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(351, 64, 124, 5, 'Olive/30-R-134', NULL, NULL, 1, '2024-12-12 05:04:02', '2024-12-12 05:05:02'),
(352, 65, 6, 1, 'Brown/40-R-139', NULL, NULL, 1, '2024-12-12 05:17:56', '2024-12-12 05:18:47'),
(353, 65, 7, 2, 'Brown/41-R-139', NULL, NULL, 1, '2024-12-12 05:17:56', '2024-12-12 05:18:47'),
(354, 65, 8, 3, 'Brown/42-R-139', NULL, NULL, 1, '2024-12-12 05:17:56', '2024-12-12 05:18:47'),
(355, 65, 9, 4, 'Brown/43-R-139', NULL, NULL, 2, '2024-12-12 05:17:56', '2024-12-12 05:18:47'),
(356, 65, 10, 5, 'Brown/44-R-139', NULL, NULL, 1, '2024-12-12 05:17:56', '2024-12-12 05:18:47'),
(357, 66, 21, 1, 'White/40-R-13A', NULL, NULL, 1, '2024-12-12 05:20:20', '2024-12-12 05:21:07'),
(358, 66, 22, 2, 'White/41-R-13A', NULL, NULL, 1, '2024-12-12 05:20:20', '2024-12-12 05:21:07'),
(359, 66, 23, 3, 'White/42-R-13A', NULL, NULL, 1, '2024-12-12 05:20:20', '2024-12-12 05:21:07'),
(360, 66, 24, 4, 'White/43-R-13A', NULL, NULL, 2, '2024-12-12 05:20:20', '2024-12-12 05:21:07'),
(361, 66, 25, 5, 'White/44-R-13A', NULL, NULL, 1, '2024-12-12 05:20:20', '2024-12-12 05:21:07'),
(362, 67, 16, 1, 'Black/40-R-13B', NULL, NULL, 1, '2024-12-12 05:25:46', '2024-12-12 05:26:27'),
(363, 67, 17, 2, 'Black/41-R-13B', NULL, NULL, 1, '2024-12-12 05:25:46', '2024-12-12 05:26:27'),
(364, 67, 18, 3, 'Black/42-R-13B', NULL, NULL, 1, '2024-12-12 05:25:46', '2024-12-12 05:26:27'),
(365, 67, 19, 4, 'Black/43-R-13B', NULL, NULL, 2, '2024-12-12 05:25:46', '2024-12-12 05:26:27'),
(366, 67, 20, 5, 'Black/44-R-13B', NULL, NULL, 1, '2024-12-12 05:25:46', '2024-12-12 05:26:27'),
(367, 68, 36, 1, 'Grey/40-R-13C', NULL, NULL, 1, '2024-12-12 05:27:13', '2024-12-12 05:27:55'),
(368, 68, 32, 2, 'Grey/41-R-13C', NULL, NULL, 1, '2024-12-12 05:27:13', '2024-12-12 05:27:55'),
(369, 68, 33, 3, 'Grey/42-R-13C', NULL, NULL, 2, '2024-12-12 05:27:13', '2024-12-12 05:27:55'),
(370, 68, 34, 4, 'Grey/43-R-13C', NULL, NULL, 1, '2024-12-12 05:27:13', '2024-12-12 05:27:55'),
(371, 68, 35, 5, 'Grey/44-R-13C', NULL, NULL, 1, '2024-12-12 05:27:13', '2024-12-12 05:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, '2', NULL, 4, NULL, 1, 0, 1900, '2024-12-11 00:07:14', '2024-12-11 00:23:43'),
(2, '2', NULL, 2, NULL, 1, 0, 1900, '2024-12-11 00:07:14', '2024-12-11 00:23:43'),
(3, '4', NULL, 15, NULL, 1, 1, 2690, '2024-12-11 23:11:27', '2024-12-11 23:11:27'),
(4, '4', NULL, 14, NULL, 1, 1, 2690, '2024-12-11 23:11:27', '2024-12-11 23:11:27'),
(5, '4', NULL, 13, NULL, 1, 1, 2690, '2024-12-11 23:11:27', '2024-12-11 23:11:27'),
(6, '4', NULL, 12, NULL, 1, 2, 2690, '2024-12-11 23:11:28', '2024-12-11 23:11:28'),
(7, '4', NULL, 11, NULL, 1, 1, 2690, '2024-12-11 23:11:28', '2024-12-11 23:11:28'),
(8, '5', NULL, 10, NULL, 1, 1, 2690, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(9, '5', NULL, 9, NULL, 1, 2, 2690, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(10, '5', NULL, 8, NULL, 1, 1, 2690, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(11, '5', NULL, 7, NULL, 1, 1, 2690, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(12, '5', NULL, 6, NULL, 1, 1, 2690, '2024-12-11 23:22:53', '2024-12-11 23:22:53'),
(13, '7', NULL, 6, NULL, 1, 0, 2990, '2024-12-11 23:35:05', '2024-12-11 23:35:36'),
(14, '8', NULL, 10, NULL, 1, 1, NULL, '2024-12-11 23:37:05', '2024-12-12 00:34:48'),
(15, '8', NULL, 9, NULL, 1, 1, 2990, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(16, '8', NULL, 8, NULL, 1, 1, 2990, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(17, '8', NULL, 7, NULL, 1, 1, 2990, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(18, '8', NULL, 6, NULL, 1, 2, 2990, '2024-12-11 23:37:05', '2024-12-11 23:37:05'),
(19, '9', NULL, 20, NULL, 1, 1, 2690, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(20, '9', NULL, 19, NULL, 1, 1, 2690, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(21, '9', NULL, 18, NULL, 1, 1, 2690, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(22, '9', NULL, 17, NULL, 1, 2, 2690, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(23, '9', NULL, 16, NULL, 1, 1, 2690, '2024-12-11 23:42:01', '2024-12-11 23:42:01'),
(24, '10', NULL, 20, NULL, 1, 2, 2990, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(25, '10', NULL, 19, NULL, 1, 1, 2990, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(26, '10', NULL, 18, NULL, 1, 1, 2990, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(27, '10', NULL, 17, NULL, 1, 1, 2990, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(28, '10', NULL, 16, NULL, 1, 1, 2990, '2024-12-11 23:45:30', '2024-12-11 23:45:30'),
(29, '11', NULL, 25, NULL, 1, 2, 2690, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(30, '11', NULL, 24, NULL, 1, 1, 2690, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(31, '11', NULL, 23, NULL, 1, 1, 2690, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(32, '11', NULL, 22, NULL, 1, 1, 2690, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(33, '11', NULL, 21, NULL, 1, 1, 2690, '2024-12-11 23:48:01', '2024-12-11 23:48:01'),
(34, '12', NULL, 26, NULL, 1, 1, 2690, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(35, '12', NULL, 19, NULL, 1, 1, 2690, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(36, '12', NULL, 18, NULL, 1, 2, 2690, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(37, '12', NULL, 17, NULL, 1, 1, 2690, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(38, '12', NULL, 16, NULL, 1, 1, 2690, '2024-12-11 23:52:59', '2024-12-11 23:52:59'),
(39, '13', NULL, 31, NULL, 1, 1, 2690, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(40, '13', NULL, 30, NULL, 1, 2, 2690, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(41, '13', NULL, 29, NULL, 1, 1, 2690, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(42, '13', NULL, 28, NULL, 1, 1, 2690, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(43, '13', NULL, 27, NULL, 1, 1, 2690, '2024-12-11 23:55:58', '2024-12-11 23:55:58'),
(44, '14', NULL, 35, NULL, 1, 2, 2890, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(45, '14', NULL, 34, NULL, 1, 2, 2890, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(46, '14', NULL, 33, NULL, 1, 1, 2890, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(47, '14', NULL, 32, NULL, 1, 1, 2890, '2024-12-12 00:02:34', '2024-12-12 00:02:34'),
(48, '15', NULL, 20, NULL, 1, 1, NULL, '2024-12-12 00:18:16', '2024-12-12 00:20:11'),
(49, '15', NULL, 19, NULL, 1, 2, 2890, '2024-12-12 00:18:16', '2024-12-12 00:20:11'),
(50, '15', NULL, 18, NULL, 1, 1, 2890, '2024-12-12 00:18:16', '2024-12-12 00:20:11'),
(51, '15', NULL, 17, NULL, 1, 1, 2890, '2024-12-12 00:18:16', '2024-12-12 00:20:11'),
(52, '15', NULL, 16, NULL, 1, 1, 2890, '2024-12-12 00:18:16', '2024-12-12 00:20:11'),
(53, '16', NULL, 20, NULL, 1, 1, NULL, '2024-12-12 00:21:51', '2024-12-12 00:22:18'),
(54, '16', NULL, 19, NULL, 1, 2, 2890, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(55, '16', NULL, 18, NULL, 1, 1, 2890, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(56, '16', NULL, 17, NULL, 1, 1, 2890, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(57, '16', NULL, 16, NULL, 1, 1, 2890, '2024-12-12 00:21:51', '2024-12-12 00:21:51'),
(58, '17', NULL, 10, NULL, 1, 1, NULL, '2024-12-12 00:26:27', '2024-12-12 00:27:42'),
(59, '17', NULL, 9, NULL, 1, 2, 2890, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(60, '17', NULL, 8, NULL, 1, 1, 2890, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(61, '17', NULL, 7, NULL, 1, 1, 2890, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(62, '17', NULL, 6, NULL, 1, 1, 2890, '2024-12-12 00:26:27', '2024-12-12 00:26:27'),
(63, '18', NULL, 35, NULL, 1, 2, NULL, '2024-12-12 00:36:31', '2024-12-12 00:37:40'),
(64, '18', NULL, 34, NULL, 1, 1, 2190, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(65, '18', NULL, 33, NULL, 1, 1, 2190, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(66, '18', NULL, 32, NULL, 1, 1, 2190, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(67, '18', NULL, 36, NULL, 1, 1, 2190, '2024-12-12 00:36:31', '2024-12-12 00:36:31'),
(68, '19', NULL, 25, NULL, 1, 1, NULL, '2024-12-12 00:38:09', '2024-12-12 00:39:14'),
(69, '19', NULL, 24, NULL, 1, 2, 2190, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(70, '19', NULL, 23, NULL, 1, 1, 2190, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(71, '19', NULL, 22, NULL, 1, 1, 2190, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(72, '19', NULL, 21, NULL, 1, 1, 2190, '2024-12-12 00:38:09', '2024-12-12 00:38:09'),
(73, '20', NULL, 25, NULL, 1, 1, NULL, '2024-12-12 00:40:50', '2024-12-12 00:42:43'),
(74, '20', NULL, 24, NULL, 1, 1, 2990, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(75, '20', NULL, 37, NULL, 1, 2, 2990, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(76, '20', NULL, 22, NULL, 1, 1, 2990, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(77, '20', NULL, 21, NULL, 1, 1, 2990, '2024-12-12 00:40:50', '2024-12-12 00:40:50'),
(78, '21', NULL, 35, NULL, 1, 1, NULL, '2024-12-12 00:44:04', '2024-12-12 00:48:18'),
(79, '21', NULL, 34, NULL, 1, 1, 2990, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(80, '21', NULL, 33, NULL, 1, 1, 2990, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(81, '21', NULL, 32, NULL, 1, 2, 2990, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(82, '21', NULL, 36, NULL, 1, 1, 2990, '2024-12-12 00:44:04', '2024-12-12 00:44:04'),
(83, '22', NULL, 42, NULL, 1, 1, NULL, '2024-12-12 01:05:55', '2024-12-12 01:19:09'),
(84, '22', NULL, 41, NULL, 1, 2, 1290, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(85, '22', NULL, 40, NULL, 1, 1, 1290, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(86, '22', NULL, 39, NULL, 1, 1, 1290, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(87, '22', NULL, 38, NULL, 1, 1, 1290, '2024-12-12 01:05:55', '2024-12-12 01:05:55'),
(88, '23', NULL, 47, NULL, 1, 1, NULL, '2024-12-12 01:12:21', '2024-12-12 01:22:20'),
(89, '23', NULL, 46, NULL, 1, 1, 1290, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(90, '23', NULL, 45, NULL, 1, 2, 1290, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(91, '23', NULL, 44, NULL, 1, 1, 1290, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(92, '23', NULL, 43, NULL, 1, 1, 1290, '2024-12-12 01:12:21', '2024-12-12 01:12:21'),
(93, '24', NULL, 35, NULL, 1, 1, NULL, '2024-12-12 01:16:30', '2024-12-12 01:23:28'),
(94, '24', NULL, 34, NULL, 1, 1, 2690, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(95, '24', NULL, 33, NULL, 1, 1, 2690, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(96, '24', NULL, 32, NULL, 1, 1, 2690, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(97, '24', NULL, 36, NULL, 1, 2, 2690, '2024-12-12 01:16:30', '2024-12-12 01:16:30'),
(98, '25', NULL, 52, NULL, 1, 2, NULL, '2024-12-12 01:34:43', '2024-12-12 01:35:34'),
(99, '25', NULL, 51, NULL, 1, 1, 1290, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(100, '25', NULL, 50, NULL, 1, 1, 1290, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(101, '25', NULL, 49, NULL, 1, 1, 1290, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(102, '25', NULL, 48, NULL, 1, 1, 1290, '2024-12-12 01:34:43', '2024-12-12 01:34:43'),
(103, '26', NULL, 16, NULL, 1, 1, NULL, '2024-12-12 01:36:14', '2024-12-12 01:40:33'),
(104, '26', NULL, 26, NULL, 1, 1, 1290, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(105, '26', NULL, 55, NULL, 1, 2, 1290, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(106, '26', NULL, 54, NULL, 1, 1, 1290, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(107, '26', NULL, 53, NULL, 1, 1, 1290, '2024-12-12 01:36:14', '2024-12-12 01:36:14'),
(108, '27', NULL, 47, NULL, 1, 2, NULL, '2024-12-12 01:40:28', '2024-12-12 01:42:18'),
(109, '27', NULL, 46, NULL, 1, 1, 1290, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(110, '27', NULL, 45, NULL, 1, 1, 1290, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(111, '27', NULL, 44, NULL, 1, 1, 1290, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(112, '27', NULL, 43, NULL, 1, 1, 1290, '2024-12-12 01:40:28', '2024-12-12 01:40:28'),
(113, '28', NULL, 21, NULL, 1, 1, NULL, '2024-12-12 01:49:03', '2024-12-12 01:51:14'),
(114, '28', NULL, 58, NULL, 1, 2, 1890, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(115, '28', NULL, 57, NULL, 1, 2, 1890, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(116, '28', NULL, 56, NULL, 1, 1, 1890, '2024-12-12 01:49:03', '2024-12-12 01:49:03'),
(117, '29', NULL, 42, NULL, 1, 2, NULL, '2024-12-12 01:51:34', '2024-12-12 01:58:12'),
(118, '29', NULL, 41, NULL, 1, 1, 1290, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(119, '29', NULL, 40, NULL, 1, 1, 1290, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(120, '29', NULL, 39, NULL, 1, 1, 1290, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(121, '29', NULL, 38, NULL, 1, 1, 1290, '2024-12-12 01:51:34', '2024-12-12 01:51:34'),
(122, '31', NULL, 42, NULL, 1, 1, NULL, '2024-12-12 01:57:10', '2024-12-12 02:01:42'),
(123, '31', NULL, 41, NULL, 1, 1, 1890, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(124, '31', NULL, 40, NULL, 1, 2, 1890, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(125, '31', NULL, 39, NULL, 1, 1, 1890, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(126, '31', NULL, 38, NULL, 1, 1, 1890, '2024-12-12 01:57:10', '2024-12-12 01:57:10'),
(127, '32', NULL, 59, NULL, 1, 1, NULL, '2024-12-12 02:10:33', '2024-12-12 02:11:41'),
(128, '32', NULL, 42, NULL, 1, 1, 2290, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(129, '32', NULL, 41, NULL, 1, 1, 2290, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(130, '32', NULL, 40, NULL, 1, 1, 2290, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(131, '32', NULL, 39, NULL, 1, 1, 2290, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(132, '32', NULL, 38, NULL, 1, 1, 2290, '2024-12-12 02:10:33', '2024-12-12 02:10:33'),
(133, '33', NULL, 22, NULL, 1, 1, NULL, '2024-12-12 02:14:25', '2024-12-12 02:15:21'),
(134, '33', NULL, 21, NULL, 1, 1, 2290, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(135, '33', NULL, 58, NULL, 1, 1, 2290, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(136, '33', NULL, 57, NULL, 1, 1, 2290, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(137, '33', NULL, 56, NULL, 1, 1, 2290, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(138, '33', NULL, 60, NULL, 1, 1, 2290, '2024-12-12 02:14:25', '2024-12-12 02:14:25'),
(139, '34', NULL, 7, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(140, '34', NULL, 6, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(141, '34', NULL, 64, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(142, '34', NULL, 63, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(143, '34', NULL, 62, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(144, '34', NULL, 61, NULL, 1, 1, 2490, '2024-12-12 02:19:07', '2024-12-12 02:19:07'),
(145, '35', NULL, 70, NULL, 1, 1, NULL, '2024-12-12 02:22:42', '2024-12-12 02:23:51'),
(146, '35', NULL, 69, NULL, 1, 1, 2490, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(147, '35', NULL, 68, NULL, 1, 1, 2490, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(148, '35', NULL, 67, NULL, 1, 1, 2490, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(149, '35', NULL, 66, NULL, 1, 1, 2490, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(150, '35', NULL, 65, NULL, 1, 1, 2490, '2024-12-12 02:22:42', '2024-12-12 02:22:42'),
(151, '36', NULL, 75, NULL, 1, 1, NULL, '2024-12-12 02:31:44', '2024-12-12 02:33:37'),
(152, '36', NULL, 74, NULL, 1, 1, 2190, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(153, '36', NULL, 73, NULL, 1, 1, 2190, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(154, '36', NULL, 72, NULL, 1, 1, 2190, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(155, '36', NULL, 71, NULL, 1, 2, 2190, '2024-12-12 02:31:44', '2024-12-12 02:31:44'),
(156, '37', NULL, 10, NULL, 1, 1, NULL, '2024-12-12 02:38:31', '2024-12-12 02:39:10'),
(157, '37', NULL, 9, NULL, 1, 2, 2190, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(158, '37', NULL, 8, NULL, 1, 1, 2190, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(159, '37', NULL, 7, NULL, 1, 1, 2190, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(160, '37', NULL, 6, NULL, 1, 1, 2190, '2024-12-12 02:38:31', '2024-12-12 02:38:31'),
(161, '38', NULL, 25, NULL, 1, 1, NULL, '2024-12-12 02:40:49', '2024-12-12 02:42:53'),
(162, '38', NULL, 24, NULL, 1, 1, 1890, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(163, '38', NULL, 23, NULL, 1, 1, 1890, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(164, '38', NULL, 22, NULL, 1, 1, 1890, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(165, '38', NULL, 21, NULL, 1, 2, 1890, '2024-12-12 02:40:49', '2024-12-12 02:40:49'),
(166, '39', NULL, 10, NULL, 1, 2, NULL, '2024-12-12 02:44:46', '2024-12-12 02:46:12'),
(167, '39', NULL, 8, NULL, 1, 1, 1890, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(168, '39', NULL, 7, NULL, 1, 2, 1890, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(169, '39', NULL, 6, NULL, 1, 1, 1890, '2024-12-12 02:44:46', '2024-12-12 02:44:46'),
(170, '40', NULL, 42, NULL, 1, 1, NULL, '2024-12-12 02:52:55', '2024-12-12 02:55:46'),
(171, '40', NULL, 41, NULL, 1, 1, 1190, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(172, '40', NULL, 40, NULL, 1, 2, 1190, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(173, '40', NULL, 39, NULL, 1, 1, 1190, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(174, '40', NULL, 38, NULL, 1, 1, 1190, '2024-12-12 02:52:55', '2024-12-12 02:52:55'),
(175, '41', NULL, 80, NULL, 1, 1, 1190, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(176, '41', NULL, 79, NULL, 1, 1, 1190, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(177, '41', NULL, 78, NULL, 1, 2, 1190, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(178, '41', NULL, 77, NULL, 1, 1, 1190, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(179, '41', NULL, 76, NULL, 1, 1, 1190, '2024-12-12 03:03:23', '2024-12-12 03:03:23'),
(180, '42', NULL, 59, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(181, '42', NULL, 42, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(182, '42', NULL, 41, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(183, '42', NULL, 40, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(184, '42', NULL, 39, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(185, '42', NULL, 38, NULL, 1, 1, 1890, '2024-12-12 03:43:46', '2024-12-12 03:43:46'),
(186, '43', NULL, 22, NULL, 1, 1, NULL, '2024-12-12 03:45:27', '2024-12-12 03:45:39'),
(187, '43', NULL, 21, NULL, 1, 2, 1890, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(188, '43', NULL, 58, NULL, 1, 1, 1890, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(189, '43', NULL, 57, NULL, 1, 1, 1890, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(190, '43', NULL, 56, NULL, 1, 1, 1890, '2024-12-12 03:45:27', '2024-12-12 03:45:27'),
(191, '44', NULL, 35, NULL, 1, 1, 3150, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(192, '44', NULL, 34, NULL, 1, 1, 3150, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(193, '44', NULL, 33, NULL, 1, 1, 3150, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(194, '44', NULL, 32, NULL, 1, 2, 3150, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(195, '44', NULL, 36, NULL, 1, 1, 3150, '2024-12-12 03:48:40', '2024-12-12 03:48:40'),
(196, '45', NULL, 10, NULL, 1, 1, NULL, '2024-12-12 03:51:00', '2024-12-12 03:53:53'),
(197, '45', NULL, 9, NULL, 1, 1, 3150, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(198, '45', NULL, 8, NULL, 1, 1, 3150, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(199, '45', NULL, 7, NULL, 1, 1, 3150, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(200, '45', NULL, 6, NULL, 1, 2, 3150, '2024-12-12 03:51:00', '2024-12-12 03:51:00'),
(201, '46', NULL, 16, NULL, 1, 2, 1490, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(202, '46', NULL, 26, NULL, 1, 1, 1490, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(203, '46', NULL, 55, NULL, 1, 1, 1490, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(204, '46', NULL, 54, NULL, 1, 1, 1490, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(205, '46', NULL, 53, NULL, 1, 1, 1490, '2024-12-12 03:56:09', '2024-12-12 03:56:09'),
(206, '47', NULL, 71, NULL, 1, 2, NULL, '2024-12-12 03:58:47', '2024-12-12 03:59:37'),
(207, '47', NULL, 84, NULL, 1, 1, 1490, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(208, '47', NULL, 83, NULL, 1, 1, 1490, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(209, '47', NULL, 82, NULL, 1, 1, 1490, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(210, '47', NULL, 81, NULL, 1, 1, 1490, '2024-12-12 03:58:47', '2024-12-12 03:58:47'),
(211, '48', NULL, 80, NULL, 1, 1, 1490, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(212, '48', NULL, 79, NULL, 1, 1, 1490, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(213, '48', NULL, 78, NULL, 1, 1, 1490, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(214, '48', NULL, 77, NULL, 1, 1, 1490, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(215, '48', NULL, 76, NULL, 1, 2, 1490, '2024-12-12 04:04:14', '2024-12-12 04:04:14'),
(216, '49', NULL, 71, NULL, 1, 1, 1490, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(217, '49', NULL, 84, NULL, 1, 1, 1490, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(218, '49', NULL, 83, NULL, 1, 2, 1490, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(219, '49', NULL, 82, NULL, 1, 1, 1490, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(220, '49', NULL, 81, NULL, 1, 1, 1490, '2024-12-12 04:05:38', '2024-12-12 04:05:38'),
(221, '50', NULL, 89, NULL, 1, 1, NULL, '2024-12-12 04:13:40', '2024-12-12 04:14:15'),
(222, '50', NULL, 88, NULL, 1, 2, 1390, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(223, '50', NULL, 87, NULL, 1, 1, 1390, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(224, '50', NULL, 86, NULL, 1, 1, 1390, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(225, '50', NULL, 85, NULL, 1, 1, 1390, '2024-12-12 04:13:40', '2024-12-12 04:13:40'),
(226, '51', NULL, 94, NULL, 1, 2, 1390, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(227, '51', NULL, 93, NULL, 1, 1, 1390, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(228, '51', NULL, 92, NULL, 1, 1, 1390, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(229, '51', NULL, 91, NULL, 1, 1, 1390, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(230, '51', NULL, 90, NULL, 1, 1, 1390, '2024-12-12 04:16:17', '2024-12-12 04:16:17'),
(231, '52', NULL, 63, NULL, 1, 1, NULL, '2024-12-12 04:18:48', '2024-12-12 04:19:31'),
(232, '52', NULL, 62, NULL, 1, 1, 1690, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(233, '52', NULL, 61, NULL, 1, 1, 1690, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(234, '52', NULL, 97, NULL, 1, 1, 1690, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(235, '52', NULL, 96, NULL, 1, 1, 1690, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(236, '52', NULL, 95, NULL, 1, 1, 1690, '2024-12-12 04:18:48', '2024-12-12 04:18:48'),
(237, '53', NULL, 55, NULL, 1, 1, NULL, '2024-12-12 04:20:10', '2024-12-12 04:21:38'),
(238, '53', NULL, 54, NULL, 1, 1, 1690, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(239, '53', NULL, 53, NULL, 1, 1, 1690, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(240, '53', NULL, 100, NULL, 1, 1, 1690, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(241, '53', NULL, 99, NULL, 1, 1, 1690, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(242, '53', NULL, 98, NULL, 1, 1, 1690, '2024-12-12 04:20:10', '2024-12-12 04:20:10'),
(243, '54', NULL, 54, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(244, '54', NULL, 53, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(245, '54', NULL, 100, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(246, '54', NULL, 99, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(247, '54', NULL, 98, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(248, '54', NULL, 101, NULL, 1, 1, 1990, '2024-12-12 04:29:12', '2024-12-12 04:29:12'),
(249, '55', NULL, 82, NULL, 1, 1, NULL, '2024-12-12 04:32:28', '2024-12-12 04:33:16'),
(250, '55', NULL, 81, NULL, 1, 1, 1990, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(251, '55', NULL, 105, NULL, 1, 1, 1990, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(252, '55', NULL, 104, NULL, 1, 1, 1990, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(253, '55', NULL, 103, NULL, 1, 1, 1990, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(254, '55', NULL, 102, NULL, 1, 1, 1990, '2024-12-12 04:32:28', '2024-12-12 04:32:28'),
(255, '56', NULL, 11, NULL, 1, 2, 1750, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(256, '56', NULL, 109, NULL, 1, 1, 1750, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(257, '56', NULL, 108, NULL, 1, 1, 1750, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(258, '56', NULL, 107, NULL, 1, 1, 1750, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(259, '56', NULL, 106, NULL, 1, 1, 1750, '2024-12-12 04:37:06', '2024-12-12 04:37:06'),
(260, '57', NULL, 119, NULL, 1, 2, 1750, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(261, '57', NULL, 118, NULL, 1, 1, 1750, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(262, '57', NULL, 117, NULL, 1, 1, 1750, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(263, '57', NULL, 116, NULL, 1, 1, 1750, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(264, '57', NULL, 115, NULL, 1, 1, 1750, '2024-12-12 04:40:20', '2024-12-12 04:40:20'),
(265, '58', NULL, 124, NULL, 1, 0, NULL, '2024-12-12 04:42:18', '2024-12-12 05:00:28'),
(266, '58', NULL, 123, NULL, 1, 0, 1490, '2024-12-12 04:42:18', '2024-12-12 05:00:28'),
(267, '58', NULL, 122, NULL, 1, 0, 1490, '2024-12-12 04:42:18', '2024-12-12 05:00:28'),
(268, '58', NULL, 121, NULL, 1, 0, 1490, '2024-12-12 04:42:18', '2024-12-12 05:00:28'),
(269, '58', NULL, 120, NULL, 1, 0, 1490, '2024-12-12 04:42:18', '2024-12-12 05:00:28'),
(270, '59', NULL, 88, NULL, 1, 1, 1490, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(271, '59', NULL, 87, NULL, 1, 1, 1490, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(272, '59', NULL, 86, NULL, 1, 1, 1490, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(273, '59', NULL, 85, NULL, 1, 1, 1490, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(274, '59', NULL, 125, NULL, 1, 2, 1490, '2024-12-12 04:44:11', '2024-12-12 04:44:11'),
(275, '60', NULL, 84, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(276, '60', NULL, 83, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(277, '60', NULL, 82, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(278, '60', NULL, 81, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(279, '60', NULL, 105, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(280, '60', NULL, 104, NULL, 1, 1, 1690, '2024-12-12 04:46:02', '2024-12-12 04:46:02'),
(281, '61', NULL, 64, NULL, 1, 1, 1690, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(282, '61', NULL, 63, NULL, 1, 1, 1690, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(283, '61', NULL, 62, NULL, 1, 1, 1690, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(284, '61', NULL, 61, NULL, 1, 1, 1690, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(285, '61', NULL, 97, NULL, 1, 1, 1690, '2024-12-12 04:47:22', '2024-12-12 04:47:22'),
(286, '61', NULL, 96, NULL, 1, 1, 1690, '2024-12-12 04:47:23', '2024-12-12 04:47:23'),
(287, '62', NULL, 21, NULL, 1, 1, 1790, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(288, '62', NULL, 58, NULL, 1, 1, 1790, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(289, '62', NULL, 57, NULL, 1, 2, 1790, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(290, '62', NULL, 56, NULL, 1, 1, 1790, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(291, '62', NULL, 60, NULL, 1, 1, 1790, '2024-12-12 04:50:04', '2024-12-12 04:50:04'),
(292, '63', NULL, 124, NULL, 1, 0, NULL, '2024-12-12 04:57:08', '2024-12-12 04:59:31'),
(293, '63', NULL, 121, NULL, 1, 0, 1490, '2024-12-12 04:57:08', '2024-12-12 04:59:31'),
(294, '63', NULL, 123, NULL, 1, 0, 1490, '2024-12-12 04:57:09', '2024-12-12 04:59:31'),
(295, '63', NULL, 122, NULL, 1, 0, 1490, '2024-12-12 04:57:09', '2024-12-12 04:59:31'),
(296, '63', NULL, 120, NULL, 1, 0, 1490, '2024-12-12 04:57:09', '2024-12-12 04:59:31'),
(297, '64', NULL, 124, NULL, 1, 1, NULL, '2024-12-12 05:04:36', '2024-12-12 05:05:02'),
(298, '64', NULL, 123, NULL, 1, 2, 1490, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(299, '64', NULL, 122, NULL, 1, 1, 1490, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(300, '64', NULL, 121, NULL, 1, 1, 1490, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(301, '64', NULL, 120, NULL, 1, 1, 1490, '2024-12-12 05:04:36', '2024-12-12 05:04:36'),
(302, '65', NULL, 10, NULL, 1, 1, NULL, '2024-12-12 05:18:47', '2024-12-12 05:22:05'),
(303, '65', NULL, 9, NULL, 1, 2, 2990, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(304, '65', NULL, 8, NULL, 1, 1, 2990, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(305, '65', NULL, 7, NULL, 1, 1, 2990, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(306, '65', NULL, 6, NULL, 1, 1, 2990, '2024-12-12 05:18:47', '2024-12-12 05:18:47'),
(307, '66', NULL, 25, NULL, 1, 1, NULL, '2024-12-12 05:21:07', '2024-12-12 05:22:36'),
(308, '66', NULL, 24, NULL, 1, 2, 2990, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(309, '66', NULL, 23, NULL, 1, 1, 2990, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(310, '66', NULL, 22, NULL, 1, 1, 2990, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(311, '66', NULL, 21, NULL, 1, 1, 2990, '2024-12-12 05:21:07', '2024-12-12 05:21:07'),
(312, '67', NULL, 20, NULL, 1, 1, NULL, '2024-12-12 05:26:27', '2024-12-12 05:26:51'),
(313, '67', NULL, 19, NULL, 1, 2, 2490, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(314, '67', NULL, 18, NULL, 1, 1, 2490, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(315, '67', NULL, 17, NULL, 1, 1, 2490, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(316, '67', NULL, 16, NULL, 1, 1, 2490, '2024-12-12 05:26:27', '2024-12-12 05:26:27'),
(317, '68', NULL, 35, NULL, 1, 1, NULL, '2024-12-12 05:27:55', '2024-12-12 05:28:41'),
(318, '68', NULL, 34, NULL, 1, 1, 2490, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(319, '68', NULL, 33, NULL, 1, 2, 2490, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(320, '68', NULL, 32, NULL, 1, 1, 2490, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(321, '68', NULL, 36, NULL, 1, 1, 2490, '2024-12-12 05:27:55', '2024-12-12 05:27:55'),
(322, '69', NULL, NULL, NULL, 1, 0, 555, '2024-12-15 10:16:05', '2024-12-15 10:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double(8,2) DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `currency_id`, `exchange_rate`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(2, 'pr-20241212-051127', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 10200, 0, 0.00, 0, 0, 10200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:11:27'),
(3, 'pr-20241212-052253', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 10200, 0, 0.00, 0, 0, 10200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:22:53'),
(5, 'pr-20241212-053705', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:37:05'),
(6, 'pr-20241212-054201', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:42:01'),
(7, 'pr-20241212-054530', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9000, 0, 0.00, 0, 0, 9000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:45:30'),
(8, 'pr-20241212-054801', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9900, 0, 0.00, 0, 0, 9900, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:48:01'),
(9, 'pr-20241212-055259', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 10200, 0, 0.00, 0, 0, 10200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:52:59'),
(10, 'pr-20241212-055558', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 10200, 0, 0.00, 0, 0, 10200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-11 23:55:58'),
(11, 'pr-20241212-060234', 1, 1, NULL, NULL, NULL, 4, 6, 0, 0, 9600, 0, 0.00, 0, 0, 9600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:02:34'),
(13, 'pr-20241212-062011', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9600, 0, 0.00, 0, 0, 9600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:20:11'),
(14, 'pr-20241212-062151', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9600, 0, 0.00, 0, 0, 9600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:21:51'),
(15, 'pr-20241212-062627', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:26:27'),
(16, 'pr-20241212-063631', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 8100, 0, 0.00, 0, 0, 8100, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:36:31'),
(17, 'pr-20241212-063809', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 8100, 0, 0.00, 0, 0, 8100, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:38:09'),
(18, 'pr-20241212-064050', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 9000, 0, 0.00, 0, 0, 9000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:40:50'),
(19, 'pr-20241212-064404', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 00:44:04'),
(20, 'pr-20241212-070555', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:05:55'),
(21, 'pr-20241212-071221', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:12:21'),
(22, 'pr-20241212-071630', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9900, 0, 0.00, 0, 0, 9900, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:16:30'),
(23, 'pr-20241212-073443', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:34:43'),
(24, 'pr-20241212-073614', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:36:14'),
(25, 'pr-20241212-074028', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:40:28'),
(26, 'pr-20241212-074903', 1, 1, NULL, NULL, NULL, 4, 6, 0, 0, 6600, 0, 0.00, 0, 0, 6600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:49:03'),
(27, 'pr-20241212-075134', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 4650, 0, 0.00, 0, 0, 4650, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:51:34'),
(28, 'pr-20241212-075710', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 6600, 0, 0.00, 0, 0, 6600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 01:57:10'),
(29, 'pr-20241212-081033', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 8250, 0, 0.00, 0, 0, 8250, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:10:33'),
(30, 'pr-20241212-081425', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 8250, 0, 0.00, 0, 0, 8250, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:14:25'),
(31, 'pr-20241212-081907', 1, 1, 1, NULL, NULL, 6, 6, 0, 0, 8850, 0, 0.00, 0, 0, 8850, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:19:07'),
(32, 'pr-20241212-082242', 1, 1, 1, NULL, NULL, 6, 6, 0, 0, 8850, 0, 0.00, 0, 0, 8850, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:22:42'),
(33, 'pr-20241212-083144', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 7200, 0, 0.00, 0, 0, 7200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:31:44'),
(34, 'pr-20241212-083831', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 7200, 0, 0.00, 0, 0, 7200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:38:31'),
(35, 'pr-20241212-084049', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 7200, 0, 0.00, 0, 0, 7200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:40:49'),
(36, 'pr-20241212-084446', 1, 1, NULL, NULL, NULL, 4, 6, 0, 0, 7200, 0, 0.00, 0, 0, 7200, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:44:46'),
(37, 'pr-20241212-085255', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 3600, 0, 0.00, 0, 0, 3600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 02:52:55'),
(38, 'pr-20241212-090323', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 3600, 0, 0.00, 0, 0, 3600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:03:23'),
(39, 'pr-20241212-094346', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6900, 0, 0.00, 0, 0, 6900, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:43:46'),
(40, 'pr-20241212-094527', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 6900, 0, 0.00, 0, 0, 6900, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:45:27'),
(41, 'pr-20241212-094840', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:48:40'),
(42, 'pr-20241212-095100', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 10500, 0, 0.00, 0, 0, 10500, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:51:00'),
(43, 'pr-20241212-095609', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5700, 0, 0.00, 0, 0, 5700, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:56:09'),
(44, 'pr-20241212-095847', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5700, 0, 0.00, 0, 0, 5700, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 03:58:47'),
(45, 'pr-20241212-100414', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5700, 0, 0.00, 0, 0, 5700, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:04:14'),
(46, 'pr-20241212-100538', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5700, 0, 0.00, 0, 0, 5700, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:05:38'),
(47, 'pr-20241212-101340', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 4800, 0, 0.00, 0, 0, 4800, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:13:40'),
(48, 'pr-20241212-101617', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 4800, 0, 0.00, 0, 0, 4800, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:16:17'),
(49, 'pr-20241212-101848', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6300, 0, 0.00, 0, 0, 6300, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:18:48'),
(50, 'pr-20241212-102010', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6300, 0, 0.00, 0, 0, 6300, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:20:10'),
(51, 'pr-20241212-102912', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6600, 0, 0.00, 0, 0, 6600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:29:12'),
(52, 'pr-20241212-103228', 1, 1, 1, NULL, NULL, 6, 6, 0, 0, 6600, 0, 0.00, 0, 0, 6600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:32:28'),
(53, 'pr-20241212-103706', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 6000, 0, 0.00, 0, 0, 6000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:37:06'),
(54, 'pr-20241212-104020', 1, 1, 1, NULL, NULL, 5, 6, 0, 0, 6000, 0, 0.00, 0, 0, 6000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:40:20'),
(57, 'pr-20241212-104411', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5400, 0, 0.00, 0, 0, 5400, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:44:11'),
(58, 'pr-20241212-104602', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6000, 0, 0.00, 0, 0, 6000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:46:02'),
(59, 'pr-20241212-104722', 1, 1, NULL, NULL, NULL, 6, 6, 0, 0, 6000, 0, 0.00, 0, 0, 6000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:47:22'),
(60, 'pr-20241212-105004', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 6900, 0, 0.00, 0, 0, 6900, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 04:50:04'),
(62, 'pr-20241212-110436', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 5400, 0, 0.00, 0, 0, 5400, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 05:04:36'),
(63, 'pr-20241212-111847', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9000, 0, 0.00, 0, 0, 9000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 05:18:47'),
(64, 'pr-20241212-112106', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9000, 0, 0.00, 0, 0, 9000, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 05:21:06'),
(65, 'pr-20241212-112627', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9600, 0, 0.00, 0, 0, 9600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 05:26:27'),
(66, 'pr-20241212-112755', 1, 1, NULL, NULL, NULL, 5, 6, 0, 0, 9600, 0, 0.00, 0, 0, 9600, 0, 1, 1, NULL, NULL, '2024-12-11 18:00:00', '2024-12-12 05:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `guard_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`, `guard_name`) VALUES
(1, 'Admin', 'Admins have full access to the system', 1, '2018-06-01 22:46:44', '2023-06-21 13:38:36', 'web'),
(2, 'Owner', 'Full access to the system except technical aspects.', 1, '2018-10-22 01:38:13', '2023-09-16 23:07:38', 'web'),
(3, 'Cashier', 'Cashier has limited access to sales data', 1, '2018-06-01 23:05:27', '2023-06-21 13:38:46', 'web'),
(5, 'Billers', 'Billerss can access their own data', 1, '2020-11-05 05:43:16', '2020-11-14 23:24:15', 'web'),
(6, 'Admin (Demo)', 'Demo admin with restricted access to system settings', 1, '2023-08-12 07:55:13', '2023-08-12 07:55:13', 'web'),
(7, 'Salesman', NULL, 1, '2024-12-11 02:11:03', '2024-12-11 02:11:03', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(4, 2),
(4, 3),
(4, 6),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(7, 1),
(7, 2),
(7, 3),
(7, 5),
(7, 6),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(9, 1),
(9, 2),
(9, 3),
(9, 6),
(10, 1),
(10, 2),
(10, 6),
(11, 1),
(11, 2),
(11, 6),
(12, 1),
(12, 2),
(12, 3),
(12, 6),
(13, 1),
(13, 2),
(13, 3),
(13, 6),
(14, 1),
(14, 2),
(14, 6),
(15, 1),
(15, 2),
(15, 6),
(16, 1),
(16, 2),
(16, 3),
(16, 6),
(17, 1),
(17, 2),
(17, 3),
(17, 6),
(18, 1),
(18, 2),
(18, 6),
(19, 1),
(19, 2),
(19, 6),
(20, 1),
(20, 2),
(20, 3),
(20, 6),
(21, 1),
(21, 2),
(21, 3),
(21, 6),
(22, 1),
(22, 2),
(22, 3),
(22, 6),
(23, 1),
(23, 2),
(23, 6),
(24, 1),
(24, 2),
(24, 3),
(24, 6),
(25, 1),
(25, 2),
(25, 3),
(25, 6),
(26, 1),
(26, 2),
(26, 6),
(27, 1),
(27, 2),
(27, 6),
(28, 1),
(28, 2),
(28, 3),
(28, 5),
(28, 6),
(29, 1),
(29, 2),
(29, 3),
(29, 6),
(30, 1),
(30, 2),
(30, 6),
(31, 1),
(31, 2),
(31, 6),
(32, 1),
(32, 2),
(32, 3),
(32, 6),
(33, 1),
(33, 2),
(33, 6),
(34, 1),
(34, 2),
(34, 6),
(35, 1),
(35, 2),
(35, 6),
(36, 1),
(36, 2),
(36, 3),
(36, 6),
(37, 1),
(37, 2),
(37, 6),
(38, 1),
(38, 2),
(38, 6),
(39, 1),
(39, 2),
(39, 6),
(40, 1),
(40, 2),
(40, 6),
(41, 1),
(41, 2),
(41, 6),
(42, 1),
(42, 2),
(42, 6),
(43, 1),
(43, 2),
(43, 6),
(44, 1),
(44, 2),
(44, 6),
(45, 1),
(45, 2),
(45, 6),
(46, 1),
(46, 2),
(46, 6),
(47, 1),
(47, 2),
(47, 3),
(47, 6),
(48, 1),
(48, 2),
(48, 6),
(49, 1),
(49, 2),
(49, 3),
(49, 6),
(50, 1),
(50, 2),
(50, 6),
(51, 1),
(51, 2),
(51, 6),
(52, 1),
(52, 2),
(52, 3),
(52, 6),
(53, 1),
(53, 2),
(53, 3),
(53, 6),
(54, 1),
(54, 2),
(54, 6),
(55, 1),
(55, 2),
(55, 3),
(55, 6),
(56, 1),
(56, 2),
(56, 3),
(56, 6),
(57, 1),
(57, 2),
(57, 3),
(57, 6),
(58, 1),
(58, 2),
(58, 6),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(61, 6),
(62, 1),
(62, 2),
(62, 6),
(63, 1),
(63, 2),
(63, 3),
(63, 6),
(64, 1),
(64, 2),
(64, 3),
(64, 6),
(65, 1),
(65, 2),
(65, 6),
(66, 1),
(66, 2),
(66, 6),
(67, 1),
(67, 2),
(67, 6),
(68, 1),
(68, 2),
(68, 6),
(69, 1),
(69, 2),
(69, 6),
(70, 1),
(70, 2),
(70, 6),
(71, 1),
(71, 2),
(71, 6),
(72, 1),
(72, 2),
(72, 6),
(73, 1),
(73, 2),
(73, 6),
(74, 1),
(74, 2),
(74, 6),
(75, 1),
(75, 2),
(75, 6),
(76, 1),
(76, 2),
(76, 6),
(77, 1),
(77, 2),
(77, 6),
(78, 1),
(78, 2),
(78, 6),
(79, 1),
(79, 2),
(79, 6),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(82, 6),
(83, 1),
(84, 1),
(84, 2),
(84, 6),
(85, 1),
(85, 2),
(85, 6),
(86, 1),
(86, 2),
(86, 6),
(87, 1),
(87, 2),
(87, 6),
(88, 1),
(88, 2),
(88, 6),
(89, 1),
(89, 2),
(89, 6),
(90, 1),
(90, 2),
(90, 3),
(90, 6),
(91, 1),
(91, 2),
(91, 6),
(92, 1),
(92, 2),
(92, 6),
(93, 1),
(93, 2),
(93, 3),
(93, 6),
(94, 1),
(94, 2),
(94, 6),
(95, 1),
(95, 2),
(95, 6),
(96, 1),
(96, 2),
(96, 6),
(97, 1),
(97, 2),
(97, 6),
(98, 1),
(98, 2),
(98, 6),
(99, 1),
(99, 2),
(99, 6),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(101, 6),
(102, 1),
(102, 2),
(102, 6),
(103, 1),
(103, 2),
(103, 6),
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(105, 6),
(106, 1),
(106, 2),
(106, 3),
(106, 6),
(107, 1),
(107, 2),
(107, 6),
(108, 1),
(108, 2),
(108, 6),
(109, 1),
(109, 2),
(109, 6),
(110, 1),
(110, 2),
(110, 6),
(111, 1),
(111, 2),
(111, 6),
(112, 1),
(112, 2),
(112, 3),
(112, 6),
(113, 1),
(113, 2),
(113, 6),
(114, 1),
(114, 2),
(114, 6),
(115, 1),
(115, 2),
(115, 6),
(116, 1),
(116, 2),
(116, 6),
(117, 1),
(117, 2),
(117, 6),
(118, 1),
(118, 2),
(118, 6),
(119, 1),
(119, 2),
(119, 6),
(120, 1),
(120, 2),
(120, 6),
(121, 1),
(121, 2),
(121, 6),
(122, 1),
(122, 2),
(122, 6),
(123, 1),
(123, 2),
(123, 6),
(124, 1),
(124, 2),
(124, 6),
(125, 1),
(125, 2),
(125, 6),
(126, 1),
(126, 2),
(126, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(255) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `brand_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `initial_file` varchar(255) DEFAULT NULL,
  `final_file` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Avijatry', 'Avijatry.png', 'Avijatry', NULL, 'masud@gmail.com', '987654321', 'Uttara', 'Dhaka', NULL, NULL, NULL, 1, '2024-10-07 12:25:04', '2024-12-11 00:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `number_of_person`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Buston', 5, NULL, 1, '2024-12-11 01:09:07', '2024-12-11 01:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(255) DEFAULT NULL,
  `unit_name` varchar(255) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Pair', NULL, '*', 1, 1, '2024-10-07 10:12:13', '2024-10-07 10:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$rRChF/FGAX59PKQFLjq57OKYvtukc97v4DM1XdO6jRKr2yev9uqKK', NULL, '2023-08-12 04:51:23', '2023-08-12 07:57:31', '+1-800-0000001', 'My Company', 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '26/Red', '2024-12-11 00:04:36', '2024-12-11 00:04:36'),
(2, 'Red/26', '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(3, 'Red/28', '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(4, 'Green/26', '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(5, 'Green/28', '2024-12-11 00:06:25', '2024-12-11 00:06:25'),
(6, 'Brown/40', '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(7, 'Brown/41', '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(8, 'Brown/42', '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(9, 'Brown/43', '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(10, 'Brown/44', '2024-12-11 22:55:50', '2024-12-11 22:55:50'),
(11, 'Green/40', '2024-12-11 23:06:22', '2024-12-11 23:06:22'),
(12, 'Green/41', '2024-12-11 23:06:22', '2024-12-11 23:06:22'),
(13, 'Green/42', '2024-12-11 23:06:22', '2024-12-11 23:06:22'),
(14, 'Green/43', '2024-12-11 23:06:22', '2024-12-11 23:06:22'),
(15, 'Green/44', '2024-12-11 23:06:22', '2024-12-11 23:06:22'),
(16, 'Black/40', '2024-12-11 23:40:50', '2024-12-11 23:40:50'),
(17, 'Black/41', '2024-12-11 23:40:50', '2024-12-11 23:40:50'),
(18, 'Black/42', '2024-12-11 23:40:50', '2024-12-11 23:40:50'),
(19, 'Black/43', '2024-12-11 23:40:50', '2024-12-11 23:40:50'),
(20, 'Black/44', '2024-12-11 23:40:50', '2024-12-11 23:40:50'),
(21, 'White/40', '2024-12-11 23:47:39', '2024-12-11 23:47:39'),
(22, 'White/41', '2024-12-11 23:47:39', '2024-12-11 23:47:39'),
(23, 'White/42', '2024-12-11 23:47:39', '2024-12-11 23:47:39'),
(24, 'White/43', '2024-12-11 23:47:39', '2024-12-11 23:47:39'),
(25, 'White/44', '2024-12-11 23:47:39', '2024-12-11 23:47:39'),
(26, 'Black/39', '2024-12-11 23:52:22', '2024-12-11 23:52:22'),
(27, 'Olive/39', '2024-12-11 23:55:37', '2024-12-11 23:55:37'),
(28, 'Olive/40', '2024-12-11 23:55:37', '2024-12-11 23:55:37'),
(29, 'Olive/41', '2024-12-11 23:55:37', '2024-12-11 23:55:37'),
(30, 'Olive/42', '2024-12-11 23:55:37', '2024-12-11 23:55:37'),
(31, 'Olive/43', '2024-12-11 23:55:37', '2024-12-11 23:55:37'),
(32, 'Grey/41', '2024-12-11 23:59:06', '2024-12-11 23:59:06'),
(33, 'Grey/42', '2024-12-11 23:59:06', '2024-12-11 23:59:06'),
(34, 'Grey/43', '2024-12-11 23:59:06', '2024-12-11 23:59:06'),
(35, 'Grey/44', '2024-12-11 23:59:06', '2024-12-11 23:59:06'),
(36, 'Grey/40', '2024-12-11 23:59:06', '2024-12-11 23:59:06'),
(37, 'White/.42', '2024-12-12 00:39:48', '2024-12-12 00:39:48'),
(38, 'Pink/36', '2024-12-12 01:05:07', '2024-12-12 01:05:07'),
(39, 'Pink/37', '2024-12-12 01:05:07', '2024-12-12 01:05:07'),
(40, 'Pink/38', '2024-12-12 01:05:07', '2024-12-12 01:05:07'),
(41, 'Pink/39', '2024-12-12 01:05:07', '2024-12-12 01:05:07'),
(42, 'Pink/40', '2024-12-12 01:05:07', '2024-12-12 01:05:07'),
(43, 'Purple/36', '2024-12-12 01:11:24', '2024-12-12 01:11:24'),
(44, 'Purple/37', '2024-12-12 01:11:24', '2024-12-12 01:11:24'),
(45, 'Purple/38', '2024-12-12 01:11:24', '2024-12-12 01:11:24'),
(46, 'Purple/39', '2024-12-12 01:11:24', '2024-12-12 01:11:24'),
(47, 'Purple/40', '2024-12-12 01:11:24', '2024-12-12 01:11:24'),
(48, 'PL/36', '2024-12-12 01:34:09', '2024-12-12 01:34:09'),
(49, 'PL/37', '2024-12-12 01:34:09', '2024-12-12 01:34:09'),
(50, 'PL/38', '2024-12-12 01:34:09', '2024-12-12 01:34:09'),
(51, 'PL/39', '2024-12-12 01:34:09', '2024-12-12 01:34:09'),
(52, 'PL/40', '2024-12-12 01:34:09', '2024-12-12 01:34:09'),
(53, 'Black/36', '2024-12-12 01:35:41', '2024-12-12 01:35:41'),
(54, 'Black/37', '2024-12-12 01:35:41', '2024-12-12 01:35:41'),
(55, 'Black/38', '2024-12-12 01:35:41', '2024-12-12 01:35:41'),
(56, 'White/37', '2024-12-12 01:47:45', '2024-12-12 01:47:45'),
(57, 'White/38', '2024-12-12 01:47:45', '2024-12-12 01:47:45'),
(58, 'White/39', '2024-12-12 01:47:45', '2024-12-12 01:47:45'),
(59, 'Pink/41', '2024-12-12 02:09:45', '2024-12-12 02:09:45'),
(60, 'White/36', '2024-12-12 02:13:56', '2024-12-12 02:13:56'),
(61, 'Brown/36', '2024-12-12 02:18:00', '2024-12-12 02:18:00'),
(62, 'Brown/37', '2024-12-12 02:18:00', '2024-12-12 02:18:00'),
(63, 'Brown/38', '2024-12-12 02:18:00', '2024-12-12 02:18:00'),
(64, 'Brown/39', '2024-12-12 02:18:00', '2024-12-12 02:18:00'),
(65, 'Cream/36', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(66, 'Cream/37', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(67, 'Cream/38', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(68, 'Cream/39', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(69, 'Cream/40', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(70, 'Cream/41', '2024-12-12 02:21:59', '2024-12-12 02:21:59'),
(71, 'Blue/40', '2024-12-12 02:30:48', '2024-12-12 02:30:48'),
(72, 'Blue/41', '2024-12-12 02:30:48', '2024-12-12 02:30:48'),
(73, 'Blue/42', '2024-12-12 02:30:48', '2024-12-12 02:30:48'),
(74, 'Blue/43', '2024-12-12 02:30:48', '2024-12-12 02:30:48'),
(75, 'Blue/44', '2024-12-12 02:30:48', '2024-12-12 02:30:48'),
(76, 'RED/36', '2024-12-12 03:01:27', '2024-12-12 03:01:27'),
(77, 'RED/37', '2024-12-12 03:01:27', '2024-12-12 03:01:27'),
(78, 'RED/38', '2024-12-12 03:01:27', '2024-12-12 03:01:27'),
(79, 'RED/39', '2024-12-12 03:01:27', '2024-12-12 03:01:27'),
(80, 'RED/40', '2024-12-12 03:01:27', '2024-12-12 03:01:27'),
(81, 'Blue/36', '2024-12-12 03:57:52', '2024-12-12 03:57:52'),
(82, 'Blue/37', '2024-12-12 03:57:52', '2024-12-12 03:57:52'),
(83, 'Blue/38', '2024-12-12 03:57:52', '2024-12-12 03:57:52'),
(84, 'Blue/39', '2024-12-12 03:57:52', '2024-12-12 03:57:52'),
(85, 'Brown/27', '2024-12-12 04:13:10', '2024-12-12 04:13:10'),
(86, 'Brown/28', '2024-12-12 04:13:10', '2024-12-12 04:13:10'),
(87, 'Brown/29', '2024-12-12 04:13:10', '2024-12-12 04:13:10'),
(88, 'Brown/30', '2024-12-12 04:13:10', '2024-12-12 04:13:10'),
(89, 'Brown/31', '2024-12-12 04:13:10', '2024-12-12 04:13:10'),
(90, 'Blue/27', '2024-12-12 04:15:15', '2024-12-12 04:15:15'),
(91, 'Blue/28', '2024-12-12 04:15:15', '2024-12-12 04:15:15'),
(92, 'Blue/29', '2024-12-12 04:15:15', '2024-12-12 04:15:15'),
(93, 'Blue/30', '2024-12-12 04:15:15', '2024-12-12 04:15:15'),
(94, 'Blue/31', '2024-12-12 04:15:15', '2024-12-12 04:15:15'),
(95, 'Brown/33', '2024-12-12 04:18:10', '2024-12-12 04:18:10'),
(96, 'Brown/34', '2024-12-12 04:18:10', '2024-12-12 04:18:10'),
(97, 'Brown/35', '2024-12-12 04:18:10', '2024-12-12 04:18:10'),
(98, 'Black/33', '2024-12-12 04:19:26', '2024-12-12 04:19:26'),
(99, 'Black/34', '2024-12-12 04:19:26', '2024-12-12 04:19:26'),
(100, 'Black/35', '2024-12-12 04:19:26', '2024-12-12 04:19:26'),
(101, 'Black/32', '2024-12-12 04:27:09', '2024-12-12 04:27:09'),
(102, 'Blue/32', '2024-12-12 04:31:05', '2024-12-12 04:31:05'),
(103, 'Blue/33', '2024-12-12 04:31:05', '2024-12-12 04:31:05'),
(104, 'Blue/34', '2024-12-12 04:31:05', '2024-12-12 04:31:05'),
(105, 'Blue/35', '2024-12-12 04:31:05', '2024-12-12 04:31:05'),
(106, 'Green/36', '2024-12-12 04:36:04', '2024-12-12 04:36:04'),
(107, 'Green/37', '2024-12-12 04:36:04', '2024-12-12 04:36:04'),
(108, 'Green/38', '2024-12-12 04:36:04', '2024-12-12 04:36:04'),
(109, 'Green/39', '2024-12-12 04:36:04', '2024-12-12 04:36:04'),
(110, 'Orange/36', '2024-12-12 04:38:03', '2024-12-12 04:38:03'),
(111, 'Orange/37', '2024-12-12 04:38:03', '2024-12-12 04:38:03'),
(112, 'Orange/38', '2024-12-12 04:38:03', '2024-12-12 04:38:03'),
(113, 'Orange/39', '2024-12-12 04:38:03', '2024-12-12 04:38:03'),
(114, 'Orange/40', '2024-12-12 04:38:03', '2024-12-12 04:38:03'),
(115, 'Orng/36', '2024-12-12 04:39:35', '2024-12-12 04:39:35'),
(116, 'Orng/37', '2024-12-12 04:39:35', '2024-12-12 04:39:35'),
(117, 'Orng/38', '2024-12-12 04:39:35', '2024-12-12 04:39:35'),
(118, 'Orng/39', '2024-12-12 04:39:35', '2024-12-12 04:39:35'),
(119, 'Orng/40', '2024-12-12 04:39:35', '2024-12-12 04:39:35'),
(120, 'Olive/26', '2024-12-12 04:41:44', '2024-12-12 04:41:44'),
(121, 'Olive/27', '2024-12-12 04:41:44', '2024-12-12 04:41:44'),
(122, 'Olive/28', '2024-12-12 04:41:44', '2024-12-12 04:41:44'),
(123, 'Olive/29', '2024-12-12 04:41:44', '2024-12-12 04:41:44'),
(124, 'Olive/30', '2024-12-12 04:41:44', '2024-12-12 04:41:44'),
(125, 'Brown/26', '2024-12-12 04:43:18', '2024-12-12 04:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`, `is_default`) VALUES
(1, 'Main Warehouse', '01770921384', 'warehouse@gmail.com', 'Dhaka, Bangladesh', 1, '2024-10-07 12:21:51', '2024-10-07 12:21:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wastes`
--

CREATE TABLE `wastes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receiver_type` varchar(255) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waste_items`
--

CREATE TABLE `waste_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `waste_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `subtotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendances_date_employee_id_checkin_unique` (`date`,`employee_id`,`checkin`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_receives`
--
ALTER TABLE `gift_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wastes`
--
ALTER TABLE `wastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waste_items`
--
ALTER TABLE `waste_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_receives`
--
ALTER TABLE `gift_receives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wastes`
--
ALTER TABLE `wastes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waste_items`
--
ALTER TABLE `waste_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
