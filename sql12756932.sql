-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql12.freemysqlhosting.net
-- Generation Time: Jan 14, 2025 at 07:13 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql12756932`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_date`, `purpose`) VALUES
(1, 1, 1, '2025-01-15', 'Heart Checkup'),
(2, 2, 2, '2025-01-16', 'High Fever'),
(3, 3, 3, '2025-01-17', 'Knee Injury'),
(4, 4, 4, '2025-01-18', 'Chronic Migraine'),
(5, 5, 5, '2025-01-19', 'Skin Consultation'),
(6, 6, 6, '2025-01-20', 'Eye Problem'),
(7, 7, 7, '2025-01-21', 'Women Health Checkup'),
(8, 8, 8, '2025-01-22', 'Mental Health Issues'),
(9, 9, 9, '2025-01-23', 'Digestive Problems'),
(10, 10, 10, '2025-01-24', 'Early Stage Cancer Consultation'),
(11, 5, 6, '2025-01-25', 'Follow-up Eye Checkup');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `appointment_id`, `amount`, `status`) VALUES
(1, 1, '150.00', 'Paid'),
(2, 2, '200.00', 'Paid'),
(3, 3, '300.00', 'Paid'),
(4, 4, '250.00', 'Unpaid'),
(5, 5, '180.00', 'Paid'),
(6, 6, '120.00', 'Paid'),
(7, 7, '210.00', 'Unpaid'),
(8, 8, '400.00', 'Paid'),
(9, 9, '220.00', 'Unpaid'),
(10, 10, '500.00', 'Paid'),
(11, 5, '350.00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Cardio Surgery'),
(2, 'Pediatrics'),
(3, 'Orthopedics'),
(4, 'Neurology'),
(5, 'Dermatology'),
(6, 'Ophthalmology'),
(7, 'Gynecology'),
(8, 'Psychiatry'),
(9, 'Gastroenterology'),
(10, 'Oncology'),
(11, 'Endocrinology');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_name`, `department_id`, `phone_number`, `email`) VALUES
(1, 'Dr. Ahmad Zaki', 1, '0123456789', 'zaki.cardio@hospital.com'),
(2, 'Dr. Siti Hawa', 2, '0136547892', 'siti.pediatrics@hospital.com'),
(3, 'Dr. Farid Ismail', 3, '0146783452', 'farid.orthopedics@hospital.com'),
(4, 'Dr. Nur Aina', 4, '0164567890', 'aina.neurology@hospital.com'),
(5, 'Dr. Hafiz Rahim', 5, '0172345678', 'hafiz.dermatology@hospital.com'),
(6, 'Dr. Aisyah Malik', 6, '0184561234', 'aisyah.ophthalmology@hospital.com'),
(7, 'Dr. Shahrul Nizam', 7, '0199876543', 'shahrul.gynecology@hospital.com'),
(8, 'Dr. Liyana Kamal', 8, '0123456789', 'liyana.psychiatry@hospital.com'),
(9, 'Dr. Adam Zakaria', 9, '0134567890', 'adam.gastroenterology@hospital.com'),
(10, 'Dr. Farah Izzati', 10, '0145678901', 'farah.oncology@hospital.com'),
(11, 'Dr. Zainal Arifin', 2, '0191234567', 'zainal.pediatrics@hospital.com');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `medication_name` varchar(50) DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `medication_name`, `purpose`, `price`) VALUES
(1, 'Paracetamol', 'Fever and Headache', '30.00'),
(2, 'Ibuprofen', 'Pain and Inflammation', '10.00'),
(3, 'Cetirizine', 'Allergies and Itching', '8.00'),
(4, 'Omeprazole', 'Excess Stomach Acid', '15.00'),
(5, 'Amoxicillin', 'Bacterial Infections', '12.00'),
(6, 'Metformin', 'Control Blood Sugar', '20.00'),
(7, 'Losartan', 'High Blood Pressure', '18.00'),
(8, 'Salbutamol', 'Breathing Problems', '10.00'),
(9, 'Clotrimazole', 'Fungal Infections', '7.00'),
(10, 'Hydrocortisone', 'Skin Inflammation', '6.00'),
(11, 'Azithromycin', 'Bacterial Infection', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `age`, `gender`, `phone_number`, `address`) VALUES
(1, 'Ali Bin Ahmad', 39, 'M', '0129876543', 'Ampang, Kuala Lumpur'),
(2, 'Nurul Ain Hamid', 30, 'F', '0134567890', 'Duta, Kuala Lumpur'),
(3, 'Fahmi Zainal', 40, 'M', '0149876543', 'Tun, Petaling Jaya'),
(4, 'Siti Sarah Kamal', 35, 'F', '0156789012', 'Bukit, Shah Alam'),
(5, 'Ahmad Faiz Yusuf', 50, 'M', '0165432109', 'Meru, Klang'),
(6, 'Aisyah Rahman', 28, 'F', '0176543210', 'Melawati, Gombak'),
(7, 'Hafiz Idris', 45, 'M', '0187654321', 'Kebun, Kajang'),
(8, 'Nabila Zakaria', 32, 'F', '0198765432', 'Permai, Bangi'),
(9, 'Shahrul Arif', 55, 'M', '0123456789', 'Mawar, Serdang'),
(10, 'Farah Halim', 29, 'F', '0132345678', 'Kenari, Puchong'),
(11, 'Hassan Bin Ali', 37, 'M', '0119876543', 'Setapak, Kuala Lumpur');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `bill_id`, `payment_date`, `payment_method`) VALUES
(1, 1, '2025-01-10', 'Online Transfer'),
(2, 3, '2025-01-12', 'Card'),
(3, 5, '2025-01-13', 'Online Transfer'),
(4, 6, '2025-01-14', 'Cash'),
(5, 8, '2025-01-15', 'Card'),
(6, 10, '2025-01-16', 'Online Transfer'),
(7, 2, '2025-01-17', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`treatment_id`, `patient_id`, `doctor_id`, `treatment_date`, `description`) VALUES
(1, 1, 1, '2025-01-15', 'Revised Therapy for Pain Management'),
(2, 2, 2, '2025-01-16', 'Treatment for Fever and Antibiotics'),
(3, 3, 3, '2025-01-17', 'Physiotherapy Session'),
(4, 4, 4, '2025-01-18', 'Consultation for Migraine'),
(5, 5, 5, '2025-01-19', 'Creams and Lotions for Rash'),
(6, 6, 6, '2025-01-20', 'Eye Examination'),
(7, 7, 7, '2025-01-21', 'Women Health Check'),
(8, 8, 8, '2025-01-22', 'Psychotherapy and Counseling'),
(9, 9, 9, '2025-01-23', 'Treatment for Digestive Issues'),
(10, 10, 10, '2025-01-24', 'Cancer Consultation and Counseling'),
(11, 3, 4, '2025-01-26', 'Therapy for Chronic Pain'),
(12, 3, 4, '2025-01-26', 'Therapy for Chronic Pain');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`treatment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`);

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
