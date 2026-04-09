-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 10:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `entity` varchar(100) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `user_id`, `action`, `entity`, `entity_id`, `created_at`) VALUES
(1, 2, 'approve', 'result', 2, '2026-01-23 06:42:48'),
(2, 4, 'publish', 'result', 2, '2026-01-23 06:58:58'),
(3, 4, 'publish', 'result', 1, '2026-01-23 06:59:00'),
(4, 2, 'approve', 'result', 3, '2026-01-23 09:14:05'),
(5, 4, 'publish', 'result', 3, '2026-01-23 09:14:52'),
(6, 3, 'faculty_recheck', 'result', 1, '2026-01-25 05:46:14'),
(7, 3, 'faculty_recheck', 'result', 1, '2026-01-25 05:53:11'),
(8, 3, 'faculty_recheck', 'result', 1, '2026-01-25 05:53:27'),
(9, 3, 'faculty_recheck', 'result', 1, '2026-01-25 05:53:39'),
(10, 3, 'recheck_updated', 'result', 1, '2026-01-25 06:20:08'),
(11, 3, 'recheck_updated', 'result', 2, '2026-01-25 06:22:46'),
(12, 3, 'recheck_updated', 'result', 1, '2026-01-25 06:23:00'),
(13, 3, 'faculty_rechecking_completed', 'result', 3, '2026-01-25 06:45:04'),
(14, 3, 'faculty_rechecking_completed', 'result', 3, '2026-01-25 07:24:51'),
(15, 3, 'faculty_rechecking_completed', 'result', 3, '2026-01-27 07:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `credit_hours` int(11) NOT NULL,
  `faculty_id` int(10) UNSIGNED DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_title`, `credit_hours`, `faculty_id`, `department_id`) VALUES
(1, 'CS-301', 'Database Systems', 3, 3, 1),
(2, 'CS-305', 'Operating Systems', 3, 3, 1),
(3, 'CC 230', 'Data Base System', 0, 10, 1),
(5, 'CC 231', 'Data Base System', 0, 13, NULL),
(6, 'CC 112', 'OOP', 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(10) UNSIGNED NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `hod_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `created_at`, `hod_id`) VALUES
(1, 'Computer Science', '2026-01-25 16:14:02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `user_id`, `course_id`, `semester`) VALUES
(2, 5, 1, 1),
(3, 5, 3, 0),
(4, 5, 2, 0),
(5, 5, 5, 0),
(6, 5, 6, 0),
(7, 18, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
  `attendance_id` int(11) NOT NULL,
  `timetable_id` int(11) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `status` enum('present','absent') NOT NULL DEFAULT 'present',
  `marked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_attendance`
--

INSERT INTO `exam_attendance` (`attendance_id`, `timetable_id`, `student_id`, `status`, `marked_at`) VALUES
(1, 1, 7, 'present', '2026-01-25 15:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `exam_incidents`
--

CREATE TABLE `exam_incidents` (
  `incident_id` int(11) NOT NULL,
  `timetable_id` int(11) NOT NULL,
  `invigilator_id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_requests`
--

CREATE TABLE `exam_requests` (
  `request_id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `requested_by` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedule`
--

CREATE TABLE `exam_schedule` (
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_terms`
--

CREATE TABLE `exam_terms` (
  `term_id` int(11) NOT NULL,
  `term_name` varchar(100) NOT NULL,
  `session` varchar(50) NOT NULL,
  `semester` int(11) NOT NULL,
  `exam_type` enum('Mid','Final','Supplementary') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetable`
--

CREATE TABLE `exam_timetable` (
  `timetable_id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `room` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_timetable`
--

INSERT INTO `exam_timetable` (`timetable_id`, `course_code`, `exam_date`, `exam_time`, `room`, `created_at`) VALUES
(1, 'CC 230', '2026-02-10', '08:30:00', '304B', '2026-01-25 09:42:34'),
(2, 'CC 231', '2026-02-10', '08:30:00', '304 CB2', '2026-01-26 13:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_departments`
--

CREATE TABLE `faculty_departments` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty_departments`
--

INSERT INTO `faculty_departments` (`id`, `user_id`, `department_id`) VALUES
(3, 3, 1),
(1, 5, 1),
(2, 6, 1),
(4, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
  `incident_id` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `reported_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rechecking_requests`
--

CREATE TABLE `rechecking_requests` (
  `request_id` int(10) UNSIGNED NOT NULL,
  `result_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','completed','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rechecking_requests`
--

INSERT INTO `rechecking_requests` (`request_id`, `result_id`, `user_id`, `reason`, `status`, `created_at`) VALUES
(11, 3, 5, 'rechecking', 'rejected', '2026-01-25 06:37:49'),
(12, 3, 5, 'rechecking', 'completed', '2026-01-25 06:44:01'),
(13, 3, 5, 'rechecking', 'completed', '2026-01-25 06:48:52'),
(14, 3, 5, 'rechecking', 'completed', '2026-01-25 07:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `result_id` int(10) UNSIGNED NOT NULL,
  `enrollment_id` int(10) UNSIGNED NOT NULL,
  `marks` int(11) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `grade_points` decimal(3,2) DEFAULT NULL,
  `status` enum('pending','hod_approved','approved','published') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_locked` tinyint(1) NOT NULL DEFAULT 0
) ;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`result_id`, `enrollment_id`, `marks`, `grade`, `grade_points`, `status`, `created_at`, `is_locked`) VALUES
(1, 2, 95, 'in', 0.04, '', '2026-01-23 06:34:07', 0),
(2, 2, 95, 'in', 0.04, '', '2026-01-23 06:42:28', 0),
(3, 2, 97, 'A+', 4.00, 'published', '2026-01-23 09:13:39', 0),
(4, 2, 90, 'A', 4.00, 'pending', '2026-01-26 13:27:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(4, 'Controller'),
(3, 'Faculty'),
(2, 'HOD'),
(6, 'Invigilator'),
(5, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_profiles`
--

INSERT INTO `student_profiles` (`user_id`, `reg_no`, `department`, `semester`) VALUES
(9, '2025-DS-393023', 'Computer Science', 2),
(12, '2025-CS-393024', 'Computer Science', 2),
(14, '2025-CS-393025', 'Computer Science', 5),
(16, '2025-DS-393019', 'Computer Science', 3),
(17, '2025-CS-393040', 'Computer Science', 4),
(18, '2026-DS-023', 'Data Science', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `department_id` int(10) UNSIGNED DEFAULT NULL
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role_id`, `status`, `created_at`, `department_id`) VALUES
(1, 'Admin User', 'admin@test.com', 'admin123', 1, 'active', '2026-01-22 16:17:38', NULL),
(2, 'HOD User', 'hod@test.com', 'hod123', 2, 'active', '2026-01-22 16:17:38', NULL),
(3, 'Faculty', 'faculty@test.com', 'faculty123', 3, 'active', '2026-01-22 16:17:38', NULL),
(4, 'Controller User', 'controller@test.com', 'controller123', 4, 'active', '2026-01-22 16:17:38', NULL),
(5, 'Student User', 'student@test.com', 'student123', 5, 'active', '2026-01-22 16:17:38', NULL),
(6, 'Invigilator User', 'invigilator@test.com', 'invigilator123', 6, 'active', '2026-01-22 16:17:38', NULL),
(7, 'Muhammad Shoaib Inksar', 'awanshabi74@gmail.com', '$2y$10$VLmxIA79Kf8VCayqS6eNbOo9ZeZrmYd1s7mwMUTl1savuT3YCatT6', 5, 'active', '2026-01-25 09:02:37', NULL),
(9, 'Muhammad Shoaib Inksar', 'mshoaibawanmshoaibawan142@gmail.com', '$2y$10$eogarcV.UnRrP/HSpmFazuzREW0LI9qGe8VYWIiLfKzR1cLBjtXwC', 5, 'active', '2026-01-25 09:05:06', NULL),
(10, 'Shoaib ali', 'alishoaib@74gamil.com', '$2y$10$QDtfoLZlSOSXSDw7/G09L.5AvpD2CE2TnYx1Hsr7.fvE.IOK/YWUa', 3, 'active', '2026-01-25 09:14:52', NULL),
(11, 'Dr. HOD', 'hod@uni.edu', 'dummy', 2, 'active', '2026-01-25 16:21:17', NULL),
(12, 'Ali Hassan', 'alihassan@gmail.com', '$2y$10$1qu7byk7vbn6nwX4tbyz4eJVKw.M2mFGnJaLgTWjq5eraqIPOZwCK', 5, 'active', '2026-01-26 13:17:50', NULL),
(13, 'Riaz Ahmed', 'riazahmed@gmail.com', '$2y$10$hCDOwfeiUp3SewowVorHnOlLGeYXvxdJVyhO6UD3AIgMnDe83ylWu', 3, 'active', '2026-01-26 13:19:07', NULL),
(14, 'bilal', 'bilal@gmail.com', '$2y$10$bilB2gLg.SzIzniXBRM3COBstqbtpHUYSceRQGSKx9nIJbz.vBjdW', 5, 'active', '2026-01-27 07:51:32', NULL),
(15, 'DR. Sundas ', 'sundas.shehzeen@math.uol.edu.pk', '$2y$10$qU5yz/VVgqm6DyjgZzYC7Os1/sZzKYMVmgTxHNZ5W9l6iL7mx5saC', 3, 'active', '2026-01-27 07:58:55', NULL),
(16, 'Zaib', 'zaib@gmail.com', '$2y$10$R1Y6Hj6UvHQ7owLuI0.4W..6zn6Rj1UxiFyxNthA53CcbT5Y./Vl2', 5, 'active', '2026-01-27 08:05:20', NULL),
(17, 'sajeel', 'sajeel@gamil.com', '$2y$10$AVywVAo5SdOx3s/Rw/xkJu6yPKVaOuP.xGwqL7/EAvhNz600djrEW', 5, 'active', '2026-01-31 05:40:45', NULL),
(18, 'Ali Hassan', 'ali23@umt.edu.pk', '$2y$10$Ty4JiNMF9LjyH8kUAiV1Du.M/iKX8f1ER413FUZUhLZl8fHwWCwgS', 5, 'active', '2026-04-08 12:49:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `fk_course_faculty` (`faculty_id`),
  ADD KEY `fk_courses_department` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`),
  ADD UNIQUE KEY `hod_id` (`hod_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `uq_student_course` (`user_id`,`course_id`),
  ADD KEY `fk_enroll_course` (`course_id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `idx_attendance_timetable` (`timetable_id`),
  ADD KEY `idx_attendance_student` (`student_id`);

--
-- Indexes for table `exam_incidents`
--
ALTER TABLE `exam_incidents`
  ADD PRIMARY KEY (`incident_id`),
  ADD KEY `timetable_id` (`timetable_id`),
  ADD KEY `invigilator_id` (`invigilator_id`);

--
-- Indexes for table `exam_requests`
--
ALTER TABLE `exam_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_exam_requests_user` (`requested_by`);

--
-- Indexes for table `exam_schedule`
--
ALTER TABLE `exam_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `fk_exam_course` (`course_id`);

--
-- Indexes for table `exam_terms`
--
ALTER TABLE `exam_terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  ADD PRIMARY KEY (`timetable_id`);

--
-- Indexes for table `faculty_departments`
--
ALTER TABLE `faculty_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`department_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `rechecking_requests`
--
ALTER TABLE `rechecking_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_recheck_result` (`result_id`),
  ADD KEY `fk_recheck_user` (`user_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `fk_results_enrollment` (`enrollment_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_role` (`role_id`),
  ADD KEY `fk_users_department` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_incidents`
--
ALTER TABLE `exam_incidents`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_requests`
--
ALTER TABLE `exam_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedule`
--
ALTER TABLE `exam_schedule`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_terms`
--
ALTER TABLE `exam_terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  MODIFY `timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faculty_departments`
--
ALTER TABLE `faculty_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `incident_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rechecking_requests`
--
ALTER TABLE `rechecking_requests`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_course_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_courses_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_department_hod` FOREIGN KEY (`hod_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enroll_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_enroll_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_enrollments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD CONSTRAINT `fk_exam_attendance_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_exam_attendance_timetable` FOREIGN KEY (`timetable_id`) REFERENCES `exam_timetable` (`timetable_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_incidents`
--
ALTER TABLE `exam_incidents`
  ADD CONSTRAINT `exam_incidents_ibfk_1` FOREIGN KEY (`timetable_id`) REFERENCES `exam_timetable` (`timetable_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_incidents_ibfk_2` FOREIGN KEY (`invigilator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_requests`
--
ALTER TABLE `exam_requests`
  ADD CONSTRAINT `fk_exam_requests_user` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_schedule`
--
ALTER TABLE `exam_schedule`
  ADD CONSTRAINT `fk_exam_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `faculty_departments`
--
ALTER TABLE `faculty_departments`
  ADD CONSTRAINT `faculty_departments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `faculty_departments_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `rechecking_requests`
--
ALTER TABLE `rechecking_requests`
  ADD CONSTRAINT `fk_recheck_result` FOREIGN KEY (`result_id`) REFERENCES `results` (`result_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recheck_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `fk_results_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `fk_student_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
