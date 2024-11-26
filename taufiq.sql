-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (x86_64)
--
-- Host: localhost    Database: family_mart
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clock_in` datetime NOT NULL,
  `clock_out` datetime DEFAULT NULL,
  `clock_in_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_in_geolocation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_geolocation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_in_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_out_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `absence_employee_id_foreign` (`employee_id`),
  KEY `absence_clock_in_index` (`clock_in`),
  KEY `absence_clock_out_index` (`clock_out`),
  KEY `absence_clock_in_geolocation_index` (`clock_in_geolocation`),
  KEY `absence_clock_out_geolocation_index` (`clock_out_geolocation`),
  CONSTRAINT `absence_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
INSERT INTO `absence` VALUES (1,'2024-11-24 18:57:57','2024-11-24 19:04:09','2024-11-25 01:57:57','2024-11-25 02:04:09','absence_photos/vaGbcoFJzxG42Matn92BUQcRXJyjhgcBhyHemdty.jpg','absence_photos/DS4i65lzh18KGSkIf2GQE4WIFGCewRue8yOkTsHP.jpg','Depok, West Java, ID, -6.4000,106.8186','Depok, West Java, ID, -6.4000,106.8186','lembur','lembur',1);
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_name_index` (`name`),
  KEY `employees_phone_index` (`phone`),
  KEY `employees_nik_index` (`nik`),
  KEY `employees_department_index` (`department`),
  KEY `employees_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'2024-11-24 18:56:55','2024-11-24 18:56:55','taufiq','taufiq@hidayat.com','$2y$12$vUtzXyxa2bIJF/f0TIgxt.qEQRJrBAm5f5JNNCVl5g6q9hqpwxsuW','1994-06-27','081380706026','Pria','photos/n3wdILDEq0e8NmFSUA9Y00ahaklpWePkdfe1G1e0.jpg','jl test','2323232323','IT','backend',20000000.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(14,'2019_12_14_000001_create_personal_access_tokens_table',2),(15,'2024_11_24_081607_create_employees_table',2),(16,'2024_11_24_081655_create_absence_table',2),(17,'2024_11_24_081729_create_sp_do_absence',2),(18,'2024_11_24_184641_create_insert_employee_procedure',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'family_mart'
--
/*!50003 DROP PROCEDURE IF EXISTS `do_absence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_absence`(
                IN emp_id INT, 
                IN photo VARCHAR(255), 
                IN geolocation VARCHAR(255), 
                IN description VARCHAR(255) 
            )
BEGIN
                DECLARE record_count INT; 

                -- Hitung apakah sudah ada record absensi hari ini
                SELECT COUNT(*) INTO record_count
                FROM absence
                WHERE employee_id = emp_id AND DATE(created_at) = CURRENT_DATE();

                -- Jika sudah ada record, maka update clock_out
                IF record_count > 0 THEN
                    UPDATE absence
                    SET 
                        clock_out = NOW(), -- Waktu clock out
                        clock_out_geolocation = geolocation, -- Lokasi clock out
                        clock_out_photo = photo, -- Foto clock out
                        clock_out_description = description, -- Deskripsi clock out
                        updated_at = NOW() -- Update timestamp
                    WHERE employee_id = emp_id AND DATE(created_at) = CURRENT_DATE();

                -- Jika belum ada record, tambahkan record baru untuk clock_in
                ELSE
                    INSERT INTO absence (
                        employee_id, 
                        clock_in, 
                        clock_in_photo, 
                        clock_in_geolocation, 
                        clock_in_description, 
                        created_at, 
                        updated_at
                    )
                    VALUES (
                        emp_id, 
                        NOW(), 
                        photo, 
                        geolocation, 
                        description, 
                        NOW(), 
                        NOW()
                    );
                END IF;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employee`(
                p_name VARCHAR(255),
                p_email VARCHAR(255),
                p_password VARCHAR(255),
                p_dob DATE,
                p_phone VARCHAR(20),
                p_gender VARCHAR(20),
                p_photo VARCHAR(255),
                p_address TEXT,
                p_nik VARCHAR(20),
                p_department VARCHAR(100),
                p_position VARCHAR(100),
                p_salary DECIMAL(10, 2)
            )
BEGIN
                INSERT INTO employees (
                    name,
                    email,
                    password,
                    dob,
                    phone,
                    gender,
                    photo,
                    address,
                    nik,
                    department,
                    position,
                    salary,
                    created_at,
                    updated_at
                ) VALUES (
                    p_name,
                    p_email,
                    p_password,
                    p_dob,
                    p_phone,
                    p_gender,
                    p_photo,
                    p_address,
                    p_nik,
                    p_department,
                    p_position,
                    p_salary,
                    NOW(),
                    NOW()
                );
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25  2:37:16
