-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2016 at 03:56 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oauth_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` int(14) NOT NULL,
  `access_token` varchar(256) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `client_id` int(14) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_tokens`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `id` int(14) NOT NULL,
  `authorization_code` varchar(256) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `client_id` int(14) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_authorization_codes`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_id` varchar(80) DEFAULT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `name`, `client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
(1, NULL, 'democlient', 'democlientsecret', 'http://localhost/cb', NULL, 'profile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` int(14) NOT NULL,
  `refresh_token` varchar(256) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `client_id` int(14) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_refresh_tokens`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `id` int(11) NOT NULL,
  `scope` varchar(80) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_scopes`
--

INSERT INTO `oauth_scopes` (`id`, `scope`, `is_default`) VALUES
(1, 'profile', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `scope`) VALUES
(1, 'admin', 'admin', 'profile');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_access_tokens_id_unique` (`id`),
  ADD KEY `oauth_client_id` (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_authorization_codes_id_unique` (`id`),
  ADD KEY `oauth_client_id` (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_clients_id_unique` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_refresh_tokens_id_unique` (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_scopes_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `oauth_access_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `oauth_access_tokens_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD CONSTRAINT `oauth_authorization_codes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `oauth_authorization_codes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD CONSTRAINT `oauth_clients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD CONSTRAINT `oauth_refresh_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `oauth_refresh_tokens_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
