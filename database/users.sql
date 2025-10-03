-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 02, 2025 at 08:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users`
--

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2025_10_02_112150_create_users_table', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `gender`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Harshal', 'person1@gmail.com', '$2y$12$FGttQPA1LXPAVSLdePI1ouI99JwU.Y6w3XmhuwkeaPZF8PFTFGZ8O', '9307357056', 'male', 'q5BA2MytOW', '2025-10-02 12:44:55', '2025-10-02 12:44:55'),
(2, 'Francesca Schmeler', 'collins.dax@example.org', '$2y$12$8Ws0wxmg1SW/rilJ4wUuX.xwc0DK3afWkEaKtD0wFaR.Aiv4Xnjva', '1-734-901-7231', 'other', 'rygy06kV5U', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(3, 'Eudora Hamill', 'joanny.kulas@example.net', '$2y$12$NfXqx4wDBM.a.e4iRTuBHexlVFDorXtA6L7IAXUh815b4TtC5z0fW', '1-559-978-9933', 'male', 'W0sER0mbDH', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(4, 'Sigurd Koelpin', 'kathryne04@example.com', '$2y$12$YAjHHgP7nNBHie/TlK5Bf.cIoKdAw9hCiYV6KZhE1qxUOaKmhYYS.', '+1.820.707.2768', 'female', 'sK0oFi2cHB', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(5, 'Eda Gutkowski I', 'noreilly@example.net', '$2y$12$yPCfDD8.xwgAxZqHNdSU9u3Mp6vQ4V4ef61LRTcY0YhFU.TOZvBGa', '754-564-5411', 'male', 'UpfAXwCxQh', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(6, 'Lazaro Hickle MD', 'maye99@example.org', '$2y$12$dJ1LPfuSiQZKuo31yTYOUO2/EvsOXG0eS5SK3safpAkIitxMxJv0K', '1-424-485-1710', 'male', 'wMV6mamvAz', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(7, 'Skye Paucek', 'jmiller@example.org', '$2y$12$eWGypJf98XVHSIy2SBdfV.z9VCUf.toj01WlzOkQYqkgLwR51SbQq', '+13867748467', 'other', 'x6C8G2Ylda', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(8, 'Ebba Kozey', 'samara63@example.org', '$2y$12$6bXgP6DG.UzhiMcBfwjJZORyJdoGniyL3.r/93UZ2jOxf55GiTOsG', '(804) 966-2156', 'female', 'wsdmjzxhLn', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(9, 'Estella Raynor III', 'lilly.dicki@example.org', '$2y$12$BZt//w.q5M7T1lFLrIay7.gr0t.lO9cipDyQB4Q6/s5SJeRy0jRd.', '+1.346.608.8624', 'female', 'YIblbiiWGk', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(10, 'Ocie Braun', 'ogusikowski@example.org', '$2y$12$JkEbLv8HMt48p7DqRPlpB.EbJnGqajSa4mOqqYruYQaNPcfP/xIaq', '+1-858-338-3885', 'other', 'lkFcXpQ0ws', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(11, 'Mr. Horacio Ondricka DDS', 'brett47@example.net', '$2y$12$GGn6E6RSmo9CaRqSl4fVCujCvYhs287UNjplTe/KhmL7C7sG79wzu', '510.638.9104', 'female', 'XdkjXBfe94', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(12, 'Electa Welch', 'frederik.torp@example.org', '$2y$12$XnPuK8RKLqWUjENgBKQo3e6rGkXCehvJIOsEBaWzl9zoTBDl48UEW', '909.953.7762', 'other', '4KCHhqGKEK', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(13, 'Miss Alvena Breitenberg IV', 'kihn.rahul@example.net', '$2y$12$gzkzVBs4Vv4irLQ82dd4C.eYMfQYLpHG3JcuyPYP.7Ifc6ahnH9sq', '989-464-7065', 'male', 'xHycRamMJ2', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(14, 'Kallie Kihn', 'harris.lavada@example.net', '$2y$12$qZC4dVvrU66W9YsElQVrO.R1jwumVtzFdlVvuy5yMvzRJ3ZGoMPkS', '534.947.7439', 'male', 'D1gjdolbNZ', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(15, 'Orval Towne', 'rutherford.myra@example.com', '$2y$12$5hzg7E6jZadhGBTnss5U/umZ.6tMXDpz9sQCPdQ5oGuxSjYydPUpO', '+13084446310', 'male', 'aYIs1VWahY', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(16, 'Pete Roberts I', 'jedidiah17@example.org', '$2y$12$0xtf6Oax.fmtGLme0K6kaOLUldpuwwdcDiMCvL.H/zkCOen1znZh2', '+1.732.786.9151', 'female', 'yHQFU3vO9M', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(17, 'Prof. Gay Hill PhD', 'xkeebler@example.com', '$2y$12$ppzQeW4horPC.vDkYKxgOuxLbRJAMMfpuTaVN9mbxpbmQGbQReomy', '+1-980-349-6337', 'other', 'RBrPNdrThU', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(18, 'Alden Vandervort', 'whowe@example.org', '$2y$12$RDOcvXCwsfVtL4WnKE4OHebKomzzUuwQDT7AiLTMBguQwR88ddpxK', '+1-985-504-9420', 'female', 'OcMVxOj16B', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(19, 'Prof. Friedrich Bayer', 'nlakin@example.com', '$2y$12$7V6iOpSVRlmT1tmlSBVjgu4FWYhiiGqzO1M5PEAHFrQ1UvpkwmJaK', '+1-504-606-1517', 'male', '1dHcsSj0fM', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(20, 'Evangeline Runolfsdottir', 'hansen.chanel@example.org', '$2y$12$zC/bGDfT/mVhDBSNLmBOJusi0XVk29R5jC2t8yDt/z8TdZXDdc8LC', '(806) 460-5080', 'male', 'RHiUAVcYpe', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(21, 'Prof. Loy Buckridge', 'bessie63@example.com', '$2y$12$KcrY3TJ/oByVSb81m.ITCOrvp140R6Kx1snHfG6hl1HUt8JzDyI56', '+1.520.571.0685', 'female', 'uQbDc4RVHw', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(22, 'Danial Hermann', 'ramon39@example.org', '$2y$12$Es.L/xS0GQqFvwuguPD9geM0Gdn.xecLDroF/1WcRoGr5TnOgaEve', '(828) 795-9289', 'other', 'wHU8G7oLYY', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(23, 'Maegan Gutmann PhD', 'nbrakus@example.org', '$2y$12$wn6HfSo.B.HOg./Mur2Ppeuqo6QurraroGsYqltmlmJw1PgFUfahu', '986.520.8458', 'male', 'ZEuQQXfdWx', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(24, 'Dr. Vivienne Bernhard I', 'jean.reinger@example.net', '$2y$12$Mz2ZIwIQOxmfa2no0r.PROhGetZdLO9URlU0auvmbanS8vWVqxRzG', '(719) 263-3097', 'female', '6ykywuNDGx', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(25, 'Pearline Hermiston', 'king.dan@example.org', '$2y$12$u5XVQQVOyfNxxWaw1KZ95OtGL08j4TpOcetWleYxkrjvWOBsZaG9O', '757.795.6201', 'female', 'OaGX2IVrX8', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(26, 'Amalia Beatty', 'jcorkery@example.org', '$2y$12$Gs2I/u43Zw9MByPI/WLBJOYLvEhD6LM/M/JDXJbn1qceTUkJm4DOi', '+14798030779', 'male', 'pq9DBvQxiw', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(27, 'Penelope Zemlak', 'areilly@example.com', '$2y$12$HGBMRvaqpwUvPJiyOZVL7ermlKZPtaEns.J71GquzRU2wihnvzsm2', '+1-878-792-6511', 'other', 'fALTF2isv0', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(28, 'Eudora Nikolaus II', 'ibode@example.org', '$2y$12$5vT/vP4ePRFquagF2gMTW.JUvDnlnPoUSBjiJ.swVx1tuBwTaKXvq', '364.737.7800', 'male', 'tbfCzbx65l', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(29, 'Mekhi Stiedemann', 'veum.quinten@example.net', '$2y$12$5HqmjoTFE.jhzDGaZisz/utq.zBLu3xjeHdGyX5NJWCc03wSfgZFS', '+13414667379', 'male', 'KNu5owPHeZ', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(30, 'Kelley Heidenreich', 'schamberger.buddy@example.org', '$2y$12$OAZQm/D30WYRDX9WLqnrbesgYHIiWAEqFzOaktbrIfr7P0ebNDhd.', '+1 (678) 452-8909', 'male', 'Nb1bY6Nmlq', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(31, 'Kaley Leannon', 'dquigley@example.net', '$2y$12$bGtIvZW69gXMw.PuU2OdGe2UqZaJH5A/wKysPgw4uRtCfHe7ip.3m', '+1-682-662-1969', 'male', 'pfkHrHPP1t', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(32, 'Jewel Barrows', 'ewalker@example.net', '$2y$12$iNSrB3wdoaKh1ej6YW7f3.k.1z2SnopHJfsgBOD7M/y7XdCi6iMX2', '+1 (828) 703-3493', 'male', 'Ppl4Vf4FHh', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(33, 'Telly Pfannerstill', 'eino71@example.org', '$2y$12$nvrQY3MI5euYA47f4eea6OnkixLYojjte9q4ApZZhqN97z7F4qPdm', '+1 (339) 886-2705', 'other', 'sptleFGQEW', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(34, 'Caleb Hermiston', 'nitzsche.noemy@example.com', '$2y$12$60b0o7IF0qr6DpuvpEy7Ceurp1Fl1QW.gLmkDwRI8Ajbzdic2OvTe', '938-209-9948', 'other', 'TakQhiOPBr', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(35, 'Jean Denesik', 'cole69@example.net', '$2y$12$3sO1UaSKwD5vHosiTCCQCO6iebvbFXgYxMC7q2lPDZ6MRqLxpP4c.', '828.206.7692', 'male', 'kJA7vjD447', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(36, 'Edmund Klein', 'deven09@example.net', '$2y$12$4aGRGrefTFgijAVCunVtXeQT506Z3VVe4ORlM.y8X0BXPxKPFN212', '(585) 683-6887', 'female', 'ekagymCTTb', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(37, 'Robin Leuschke Jr.', 'uwalter@example.net', '$2y$12$KrImwhDwWMllycOlQiXB4eNCrzokeWcwGWgq37TrbKtw3BIhzuTR2', '(540) 799-8682', 'male', 'Rk7Qypubsl', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(38, 'Wava Langosh', 'dyost@example.com', '$2y$12$0K5T/zu29zG8LZMaHFp2RuSoKOIYWir7qpw8drWs.JAaaZMFKRgbO', '480.261.9067', 'male', 'r5UHraIKjq', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(39, 'Natasha Nikolaus II', 'ahoeger@example.net', '$2y$12$LwYcMOgoYd8bfKvJ9E2iiuoQCGfHOlCBBXh55IxObiftz5ECiFlHG', '+1.903.887.1464', 'other', 'nJNpyRRjEO', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(40, 'Mathilde Nicolas', 'stacy.boyle@example.org', '$2y$12$Cd/o1mMwM.FEkicFsBieK.65oaO5zGFcuztwDzS8w09VGCu/i/wqu', '+1 (708) 453-9043', 'other', 'A7D0Xgr4Qw', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(41, 'Raoul Predovic II', 'dejah93@example.net', '$2y$12$f5YBWfp5O3up6Pf3AkgP/eYYJGEm/XrA9FwVKiXS5LkYyabWfZ9UK', '(346) 819-6433', 'male', '3vvzUnU1ZP', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(42, 'Danial Fahey PhD', 'olson.cesar@example.com', '$2y$12$gXL6/1.CPOggbAg3QS.mheswSJbKHusESCrLbZynJvumFV/5bcTX.', '319.353.2139', 'male', 'Z3UY1oSvH8', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(43, 'Alexzander Mosciski', 'misty37@example.org', '$2y$12$mIjQuaUdFkmlb6gC0Dcxq.5tRg9MkVbhZ8z8qg.zEhueTxMOM/qbi', '(272) 482-6977', 'other', '32KyCsbvzo', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(44, 'Ari Tromp', 'hahn.godfrey@example.org', '$2y$12$EtH4Pk36EAZsb0MU5UxfaOarJq7MncoX8uGczDYpNPiZgFM7A6fQW', '1-364-453-9478', 'male', 'xkpEW4pTEi', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(45, 'Abe Koss', 'yundt.coralie@example.net', '$2y$12$n2nVA7s3koKs3atAYf62SO66cHHp./rL3MqY5g/P.jGUaVdIgu016', '+1-574-785-9493', 'female', 'Eeg25vRz1n', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(46, 'Emmie Keeling', 'kane31@example.net', '$2y$12$5eqsq5MEyMP86TnJtHExIORJFgGWMw5zz8H6Iilu5ShXKSvB7qaLe', '1-314-417-1954', 'female', 'tJYxFOakQ3', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(47, 'Verda Hammes', 'gerard33@example.org', '$2y$12$wBIRgAQbMIH.SGYW.T83Xuzc21VZ9eeTz1V6BsYj6Pu3J8VPVyfr6', '+1.351.472.1033', 'female', 'JlBGG6zzMv', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(48, 'Marina Toy', 'medhurst.domenica@example.org', '$2y$12$MFmUh/5bHSU2F8C4r3BI0Ohf51.yeavIIVHa4q/X1/OGQh/89U/K.', '1-458-267-8503', 'female', 'CxlcDTE6Qz', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(49, 'Hershel Rau', 'cleveland03@example.com', '$2y$12$3RBVV2a0r5aM3TrOLDJwbOaVw6RfK6H4aRkKDcM94yFc.4nhWOnau', '+1-623-438-9429', 'male', 'uexOc308ck', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(50, 'Mya Schuppe MD', 'elsie.shanahan@example.com', '$2y$12$rO.soKe.kNaXMM2pAF4oAOWyH6aBlAqFRdtpQafMAfcWHGzHh3DBC', '1-551-552-2369', 'female', 'lT5732MFkv', '2025-10-02 12:45:14', '2025-10-02 12:45:14'),
(51, 'Annabelle Macejkovic', 'eda89@example.org', '$2y$12$B25cHjOI708fcZ6QxGWPJe.1DUG77BgY2zOVLzbnx2C6sMCOhOKcq', '816-331-0044', 'female', 'JZZGK6VQ0D', '2025-10-02 12:45:14', '2025-10-02 12:45:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
