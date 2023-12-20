-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 03:14 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_12_151301_create_urls_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 3, 'RestApi', '0d296fc374409b030e274223051d2b7138702e95854e3b9aff9138ea10f26ca5', '[\"*\"]', NULL, NULL, '2023-12-12 11:02:20', '2023-12-12 11:02:20'),
(4, 'App\\Models\\User', 4, 'RestApi', 'd0752bcf6ec147b8b35d25881fc97723fc6d76ffae950b31e8096fea920eb2f3', '[\"*\"]', NULL, NULL, '2023-12-12 19:45:52', '2023-12-12 19:45:52'),
(5, 'App\\Models\\User', 4, 'RestApi', 'be5e8ae721efaa2a286aadebdf2e2d05f791af4c3a373a22540f08e333c8252b', '[\"*\"]', NULL, NULL, '2023-12-12 20:22:03', '2023-12-12 20:22:03'),
(6, 'App\\Models\\User', 4, 'RestApi', '2ebc734379535018d012b41e8c57145d8ee9e0a26f3ba34d2d6e4459b2e7420f', '[\"*\"]', NULL, NULL, '2023-12-12 20:22:47', '2023-12-12 20:22:47'),
(11, 'App\\Models\\User', 5, 'RestApi', '494a1ff231f9843c103f0321434727a66562b4bb12ee7590d85817c56abb0694', '[\"*\"]', '2023-12-13 09:36:32', NULL, '2023-12-13 09:20:45', '2023-12-13 09:36:32'),
(12, 'App\\Models\\User', 5, 'RestApi', 'ddfe7d6cf1342138d09ef488926a16aeec928b11d8b8e5508e714519834cbc59', '[\"*\"]', NULL, NULL, '2023-12-13 09:21:40', '2023-12-13 09:21:40'),
(14, 'App\\Models\\User', 6, 'RestApi', 'eef4d0966b243ca24770567f4d98a3a176ee5d4b9d053ed067d17aba697b693d', '[\"*\"]', NULL, NULL, '2023-12-13 20:37:26', '2023-12-13 20:37:26'),
(29, 'App\\Models\\User', 2, 'RestApi', 'b544b5929dfbed9e1c2bba62e6ea6c26fa6855f1eff66940cb7236c211d7da71', '[\"*\"]', '2023-12-19 09:23:09', NULL, '2023-12-19 06:43:21', '2023-12-19 09:23:09'),
(30, 'App\\Models\\User', 2, 'RestApi', '3f4dd278b4b6f34eb960229d902045ae1ca5ea15011f6210eca66585343a0ed6', '[\"*\"]', '2023-12-19 19:54:57', NULL, '2023-12-19 19:50:51', '2023-12-19 19:54:57');

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

CREATE TABLE `urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `long_url` text NOT NULL,
  `short_url` varchar(255) NOT NULL,
  `visit_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urls`
--

INSERT INTO `urls` (`id`, `user_id`, `long_url`, `short_url`, `visit_count`, `created_at`, `updated_at`) VALUES
(1, 2, 'https://medium.com/@sahinuddinrony/laravel-email-subscribe-newsletter-using-gmail-smtp-377531c25def', 'RC6fjd', 5, '2023-12-13 00:54:25', '2023-12-19 00:28:42'),
(2, 2, 'https://medium.com/@sahinuddinrony/laravel-10-markdown-how-to-laravel-contact-form-send-email-using-gmail-smtp-d1ed32d0e62c', '4NAK7g', 4, '2023-12-13 01:57:48', '2023-12-18 20:24:16'),
(3, 1, 'https://medium.com/@sahinuddinrony/laravel-10-markdown-how-to-laravel-contact-form-send-email-using-gmail-smtp-d1ed32d0e62c', 'hM0WXm', 1, '2023-12-13 02:08:00', '2023-12-13 02:08:32'),
(4, 1, 'https://medium.com/@sahinuddinrony/laravel-email-subscribe-newsletter-using-gmail-smtp-377531c25def', 'Ok6Klz', 0, '2023-12-13 08:51:01', '2023-12-13 08:51:01'),
(5, 1, 'https://medium.com/@mukesh.ram/laravel-sanctum-secure-api-authentication-and-authorization-for-single-page-applications-21d1adae467b', 'CvWF91', 0, '2023-12-13 09:16:36', '2023-12-13 09:16:36'),
(6, 5, 'https://medium.com/@mukesh.ram/laravel-sanctum-secure-api-authentication-and-authorization-for-single-page-applications-21d1adae467b', '9GxtGd', 1, '2023-12-13 09:34:57', '2023-12-13 09:36:06'),
(7, 1, 'https://mzamin.com/news.php?news=88095', '0hPxA9', 3, '2023-12-13 22:39:39', '2023-12-19 00:38:51'),
(8, 1, 'https://mzamin.com/news.php?news=84077', 'xoiYk4', 1, '2023-12-14 06:39:20', '2023-12-14 06:41:11'),
(9, 1, 'https://mzamin.com/news.php?news=86695', 'cBoOxj', 2, '2023-12-14 07:25:22', '2023-12-14 08:49:53'),
(13, 2, 'https://www.prothomalo.com/education/higher-education/zrd6oo1v0w', 'raye=Y', 2, '2023-12-14 20:47:37', '2023-12-14 20:48:57'),
(14, 2, 'https://www.w3schools.com/php/php_compiler.asp', '>-sRKP', 1, '2023-12-14 20:50:51', '2023-12-14 20:51:07'),
(28, 2, 'https://mzamin.com/news.php?news=88980', 'Z!yLe&', 2, '2023-12-18 22:50:32', '2023-12-19 00:11:19'),
(29, 2, 'https://mzamin.com/news.php?news=89006', 'M4YSke', 6, '2023-12-19 00:12:52', '2023-12-19 19:54:57'),
(30, 1, 'https://www.php.net/manual/en/function.str-replace.php', 'n+!jBL', 2, '2023-12-19 06:13:02', '2023-12-19 06:14:33'),
(31, 2, 'https://docs.github.com/en/desktop/managing-commits/reverting-a-commit-in-github-desktop', '?PiJL8', 0, '2023-12-19 09:19:53', '2023-12-19 09:19:53'),
(32, 2, 'https://vuejs.org/guide/quick-start.html', ')V=U8Z', 2, '2023-12-19 09:22:28', '2023-12-19 09:23:09'),
(33, 2, 'https://www.php.net/manual/en/function.uniqid.php', '658248', 2, '2023-12-19 19:52:17', '2023-12-19 19:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sahin Uddin', 'sahincseiu@gmail.com', NULL, '$2y$12$Y/AH0ICCC9jKXIlDlEpzTuyJE4Ob/rAT2hM86EbaO0ZmVauI88KH.', NULL, '2023-12-12 10:57:50', '2023-12-12 10:57:50'),
(2, 'Rony', 'rony@gmail.com', NULL, '$2y$12$0xC15HGAgv8ZziXWGH4NQOVCHYT0os2G0hvvGReFFP7svyMG48jHy', NULL, '2023-12-12 11:00:14', '2023-12-12 11:00:14'),
(3, 'Abullah', 'Abdullah@gmail.com', NULL, '$2y$12$0s/jXcQlk6YZxbVlkqLPmOWBDGH4cJA6P27mMWoE4YI.W8m0FDWlS', NULL, '2023-12-12 11:02:20', '2023-12-12 11:02:20'),
(4, 'sahin', 'sahin@gamil.com', NULL, '$2y$12$3kWTkOydMY4nehlfP6dMYe85IvKdLbZtCHaWuPznyo6KCLxxcp2eG', NULL, '2023-12-12 19:45:52', '2023-12-12 19:45:52'),
(5, 'Abu Taher', 'taher@gmail.com', NULL, '$2y$12$2YvZq4uAUKWIOGaYq5MsiOjAw5BQqofjkKj2rMu8e4Xq2OWFqGL4m', NULL, '2023-12-13 09:20:45', '2023-12-13 09:20:45'),
(6, 'Ripon Islam', 'riponcv@gmail.com', NULL, '$2y$12$xU8TQAOQ9PKA/gQ0pqftuO6xfJeJeieajBI9cYKazOOsRWqiJx0Ca', NULL, '2023-12-13 20:37:26', '2023-12-13 20:37:26'),
(7, 'Keramot', 'keramot@gmail.com', NULL, '$2y$12$sROcssFEExedD7anJlwgbev1fQCWzr7O0TVUf95hY74kY5/QVWejC', NULL, '2023-12-14 04:29:44', '2023-12-14 04:29:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urls_short_url_unique` (`short_url`),
  ADD KEY `urls_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `urls`
--
ALTER TABLE `urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `urls`
--
ALTER TABLE `urls`
  ADD CONSTRAINT `urls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
