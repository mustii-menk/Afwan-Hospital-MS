-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2022 at 12:46 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afwan_hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'Mr Admin', 'Admin', 'admin123', 'Active', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(122, '', 59, 0, 16, '2022-06-25', '11:20:00', 63, 'Approved', 'Wound in my knee'),
(123, '', 60, 0, 45, '2022-06-25', '12:45:00', 62, 'Approved', 'Tooth Sensitivity'),
(124, '', 61, 0, 45, '2022-08-28', '14:00:00', 62, 'Approved', 'Tooth Decay'),
(125, '', 61, 0, 18, '2022-08-30', '12:00:00', 64, 'Approved', 'diarrhea ');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL,
  `discount` float(10,2) NOT NULL,
  `taxamount` float(10,2) NOT NULL,
  `discountreason` text NOT NULL,
  `discharge_time` time NOT NULL,
  `discharge_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingid`, `patientid`, `appointmentid`, `billingdate`, `billingtime`, `discount`, `taxamount`, `discountreason`, `discharge_time`, `discharge_date`) VALUES
(42, 60, 123, '2022-06-25', '14:41:52', 35.00, 0.00, 'Mercy , ', '03:30:30', '2022-06-25'),
(43, 59, 122, '2022-06-27', '10:05:49', 0.00, 0.00, ' , ', '10:09:31', '2022-06-27'),
(44, 0, 0, '2022-08-28', '12:10:08', 0.00, 0.00, '', '00:00:00', '0000-00-00'),
(45, 61, 124, '2022-08-28', '12:15:16', 0.00, 0.00, '', '00:00:00', '0000-00-00'),
(46, 61, 125, '2022-08-28', '12:27:14', 100.00, 0.00, ' , ', '12:34:38', '2022-08-28');

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE `billing_records` (
  `billingservice_id` int(10) NOT NULL,
  `billingid` int(10) NOT NULL,
  `bill_type_id` int(10) NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_records`
--

INSERT INTO `billing_records` (`billingservice_id`, `billingid`, `bill_type_id`, `bill_type`, `bill_amount`, `bill_date`, `status`) VALUES
(209, 42, 62, 'Consultancy Charge', 500.00, '2022-06-25', 'Active'),
(210, 42, 20, 'Treatment', 1500.00, '2022-06-25', 'Active'),
(211, 42, 101, 'Prescription Charge', 700.00, '2022-06-25', 'Active'),
(212, 43, 63, 'Consultancy Charge', 2000.00, '2022-06-27', 'Active'),
(213, 43, 17, 'Treatment', 5600.00, '2022-06-27', 'Active'),
(214, 43, 102, 'Prescription Charge', 500.00, '2022-06-27', 'Active'),
(215, 46, 64, 'Consultancy Charge', 1000.00, '2022-08-28', 'Active'),
(216, 46, 19, 'Treatment', 4000.00, '2022-08-28', 'Active'),
(217, 46, 103, 'Prescription Charge', 150.00, '2022-08-28', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(11, 'Physician', 'All type of disease', 'Active'),
(12, 'Children doctor', 'All kinds of disease', 'Active'),
(13, 'General Medicne1', 'General doctor', 'Active'),
(14, 'ENT Specialist', 'Ear, Nose and Tongue Doctor', 'Active'),
(15, 'Neurologist', 'Related neurons, bones', 'Active'),
(16, 'Surgery', 'Includes plastic surgery, brain and neurology surgery', 'Active'),
(17, 'Pediatrics', 'Pediatrics doctor', 'Active'),
(18, 'Pharmacy', 'Providing patients with medicines prescribed by specialist physicians', 'Active'),
(19, 'Laboratory and Blood bank', 'Includes detailed lab investigations and blood bank are developing considerably as per international standards  ', 'Active'),
(20, 'Physiotherapy', 'Includes services to specialized clinic inpatients who are referred by hospital physicians or primary health care clinics.', 'Active'),
(45, 'Dental', 'All Dental related diseases', 'Active'),
(46, 'Maternity', 'Maternity', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`) VALUES
(62, 'SK Macharia', '0723232123', 45, 'Dentist', 'dentist123', 'Active', 'BMID', 4.0, 500.00),
(63, 'Doctor X', '0724234231', 16, 'Doctor X', 'doctorx123', 'Active', 'Masters in Surgery', 6.5, 2000.00),
(64, 'Alfred ', '0720022020', 18, 'Alfie ', 'alfie101', 'Active', 'degree in pharmacy ', 10.0, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`) VALUES
(32, 62, '07:00:00', '19:00:00', '', 'Active'),
(33, 63, '08:30:00', '21:00:00', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`) VALUES
(1, 'Mara Moja', 10.00, 'Mara Moja', 'Active'),
(6, 'Kaluma', 50.00, 'Kaluma', 'Active'),
(7, 'Panadol Extra', 20.00, 'Panadol', 'Active'),
(8, 'Eno', 100.00, 'Eno', 'Active'),
(9, 'Diclofenac', 50.00, 'Pain reliever', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `prescriptionid` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `patientid`, `doctorid`, `prescriptionid`, `orderdate`, `deliverydate`, `address`, `mobileno`, `note`, `status`, `payment_type`, `card_no`, `cvv_no`, `expdate`, `card_holder`) VALUES
(17, 7, 0, 0, '2016-03-01', '2016-03-05', ' shivajinagar, Ujire', '9874561230', '', 'Active', '', '', '', '0000-00-00', ''),
(18, 9, 0, 0, '2016-03-03', '2016-03-25', ' Bajpe', '8785674625', '', 'Active', '', '', '', '0000-00-00', ''),
(19, 22, 0, 0, '2016-03-15', '2016-03-26', ' Kadri, Mangalore', '8756332456', '', 'Active', '', '', '', '0000-00-00', ''),
(20, 23, 0, 0, '2016-03-07', '2016-03-10', ' Perla, Ujire', '9449443117', '', 'Active', '', '', '', '0000-00-00', ''),
(21, 36, 0, 0, '2016-03-16', '2016-03-22', ' Ujire', '9449678831', '', 'Active', '', '', '', '0000-00-00', ''),
(22, 36, 0, 72, '0000-00-00', '2018-04-03', '3rd floor, city light buildin ', '8874563210', '', 'Active', '', '', '', '0000-00-00', ''),
(23, 48, 0, 73, '0000-00-00', '2018-03-27', '3rd floor, city light buildin ', '8874563210', ' Kindly send the medicines as soon as possible', 'Active', '', '', '', '0000-00-00', ''),
(24, 48, 0, 0, '2016-03-27', '2018-03-17', '3rd floor, city light buildin ', '8874563210', ' Kindly send the medicines as soon as possible', 'Pending', '', '', '', '0000-00-00', ''),
(25, 48, 37, 32, '2016-03-27', '2016-03-27', '3rd floor, city light buildin ', '8874563210', ' Test note send ', 'Active', '', '', '', '0000-00-00', ''),
(26, 48, 37, 33, '2016-03-27', '2016-03-27', '3rd floor, city light buildin ', '8874563210', ' Test note send ', 'Active', '', '', '', '0000-00-00', ''),
(27, 48, 37, 35, '2016-03-27', '2016-03-27', '3rd floor, city light buildin ', '8874563210', ' Test note send ', 'Active', '', '', '', '0000-00-00', ''),
(28, 7, 35, 56, '0000-00-00', '2018-03-17', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' xxx', 'Active', '', '', '', '0000-00-00', ''),
(29, 7, 35, 58, '2018-03-19', '2018-03-21', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' xxx', 'Active', '', '', '', '0000-00-00', ''),
(30, 7, 35, 59, '2018-03-21', '2018-03-27', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' trfrbgb', 'Active', '', '', '', '0000-00-00', ''),
(31, 22, 35, 44, '2018-03-27', '2018-03-28', '  kuvempu nagar ', '8756332456', ' hhhhh', 'Active', '', '', '', '0000-00-00', ''),
(32, 7, 35, 45, '2018-03-28', '2018-03-28', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' fffff', 'Active', '', '', '', '0000-00-00', ''),
(33, 41, 35, 47, '2018-03-30', '2018-03-31', '34rd floor ', '78978978979', ' hiiiii', 'Delivered', '', '', '', '0000-00-00', ''),
(34, 41, 35, 67, '2018-03-31', '0000-00-00', '34rd floor ', '78978978979', ' Kindly provide prescription', 'Active', '', '', '', '0000-00-00', ''),
(35, 41, 36, 57, '2018-03-31', '2018-03-31', '34rd floor ', '78978978979', ' tt', 'Delivered', '', '', '', '0000-00-00', ''),
(36, 7, 35, 62, '2018-03-31', '0000-00-00', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' mmmm', 'Active', '', '', '', '0000-00-00', ''),
(37, 7, 35, 65, '2018-04-03', '2018-04-03', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' vvvv', 'Delivered', '', '', '', '0000-00-00', ''),
(38, 7, 0, 71, '2018-04-03', '2018-04-03', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' ddd', 'Delivered', '', '', '', '0000-00-00', ''),
(39, 7, 0, 0, '2018-04-03', '0000-00-00', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' vvvvv', 'Pending', '', '', '', '0000-00-00', ''),
(40, 7, 0, 75, '2018-04-03', '0000-00-00', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' kkkk', 'Pending', '', '', '', '0000-00-00', ''),
(41, 7, 0, 74, '2018-04-03', '0000-00-00', ' manjunath nilaya\r\nperla road\r\nujire ', '9874561230', ' lbbnbjbj', 'Pending', '', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(59, 'Patient X', '2022-06-25', '09:52:24', ' P.O BOX 345, NAKURU', '0714309788', 'Nakuru', 'Patient X', 'patientx', 'O+', 'MALE', '1994-06-05', 'Active'),
(60, 'Patient Y', '2022-06-25', '11:04:35', 'P.O BOX 045, MOMBASA', '0785342321', 'Mombasa', 'Patient Y', 'patienty', 'AB-', 'FEMALE', '1984-05-05', 'Active'),
(61, 'Ann Kananu', '2022-08-28', '12:07:40', 'Nairobi', '0712567238', 'Nairobi', 'Ann Kananu', 'annkananu', 'B+', 'FEMALE', '1995-06-29', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `cardnumber` int(25) NOT NULL,
  `cvvno` int(5) NOT NULL,
  `expdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `appointmentid`, `paiddate`, `paidtime`, `paidamount`, `status`, `cardholder`, `cardnumber`, `cvvno`, `expdate`) VALUES
(61, 60, 123, '2022-06-25', '15:33:06', 2800.00, 'Active', '', 0, 0, '0000-00-00'),
(62, 59, 122, '2022-06-27', '10:09:46', 8505.00, 'Active', '', 0, 0, '0000-00-00'),
(63, 61, 125, '2022-08-28', '12:34:56', 5307.50, 'Active', '', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `delivery_type` varchar(10) NOT NULL COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10) NOT NULL COMMENT 'appointmentid or orderid',
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `doctorid`, `patientid`, `delivery_type`, `delivery_id`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(101, 0, 62, 60, '', 0, '2022-06-25', 'Active', 123),
(102, 0, 63, 59, '', 0, '2022-06-27', 'Active', 122),
(103, 0, 64, 61, '', 0, '2022-08-28', 'Active', 125);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(151, 101, '8', 100.00, 7, '2X3', 'Active'),
(152, 102, '6', 50.00, 10, '2X3', 'Active'),
(153, 103, '9', 50.00, 3, '1X2', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`) VALUES
(13, 'Treatment for Malaria', '450.00', ' Providing medicine and tonic with injection  ', 'Active'),
(14, 'Treatment for Dengue', '20000.00', ' Providing massage and home made tips', 'Active'),
(17, 'Plastic Surgery', '5600.00', ' Plastic Surgery', 'Active'),
(19, 'Dengue', '4000.00', 'Dengue treatment', 'Active'),
(20, 'Tooth Decay', '1500.00', 'Tooth Decay Issue', 'Active'),
(21, 'Corona Virus Treatment', '10000.00', 'Corona Virus Treatment', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `doctorid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(62, 20, 123, 60, 62, 'Injected', '18037667085.jpg', '2022-06-25', '15:41:00', 'Active'),
(63, 17, 122, 59, 63, 'Knee Surgery', '1405597319', '2022-06-27', '11:05:00', 'Active'),
(64, 19, 125, 61, 64, 'give a dose of flagylla for stomach pains and a dose of antibiotics ', '632048090', '2022-08-28', '14:30:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `loginname`, `password`, `patientname`, `mobileno`, `email`, `createddateandtime`) VALUES
(1, 'admin', 'admin', 'admin', '', '', '2017-12-14 11:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD PRIMARY KEY (`billingservice_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`treatment_records_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `billing_records`
--
ALTER TABLE `billing_records`
  MODIFY `billingservice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
