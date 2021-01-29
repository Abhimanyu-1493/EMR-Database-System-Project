-- create the database
DROP DATABASE IF EXISTS EMR_DB5;
CREATE DATABASE EMR_DB5;

-- select the database
USE EMR_DB5;

-- create the tables
CREATE TABLE `patient_information` (
  `patient_id` int(11) PRIMARY KEY UNIQUE NOT NULL,
  `patient_first_name` varchar(50) NOT NULL,
  `patient_last_name` varchar(50) NOT NULL,
  `patient_age` int(11) NOT NULL,
  `patient_gender` varchar(50) DEFAULT NULL,
  `patient_address` varchar(50) DEFAULT NULL,
  `patient_zip_code` varchar(20) NOT NULL,
  `patient_phone` varchar(50) DEFAULT NULL,
  `patient_insurance` varchar(50) DEFAULT NULL
);

CREATE TABLE `zip_code` (
  `patient_zip_code` varchar(20) NOT NULL,
  `patient_city` varchar(50) NOT NULL,
  `patient_state` char(2) NOT NULL
);

CREATE TABLE `provider_information` (
  `specialist_id` varchar(50) PRIMARY KEY UNIQUE NOT NULL,
  `specialist_name` varchar(50) NOT NULL,
  `specialisation` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `specialist_fees` decimal(10,2) NOT NULL
);

CREATE TABLE `visit_information` (
  `appointment_id` int(11) PRIMARY KEY NOT NULL,
  `patient_id` int(11) NOT NULL,
  `specialist_id` varchar(50) NOT NULL,
  `appointment_time_date` datetime NOT NULL,
  
	CONSTRAINT `visit_information_fk_patient_information` 
    FOREIGN KEY (`patient_id`)
    REFERENCES `patient_information` (`patient_id`),
    
    CONSTRAINT `visit_information_fk_provider_information` 
    FOREIGN KEY (`specialist_id`)
	REFERENCES `provider_information` (`specialist_id`)
);

CREATE TABLE `clinical_care_information` (
  `prescription_id` int(11) PRIMARY KEY NOT NULL,
  `patient_id` int(11) NOT NULL,
  `specialist_id` varchar(50) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `symptoms` varchar(100) NOT NULL,
  `test` varchar(50) DEFAULT NULL,
  `test_fees` decimal(10,2) DEFAULT NULL,
  
  CONSTRAINT `clinical_care_information_fk_patient_information` 
  FOREIGN KEY (`patient_id`) 
  REFERENCES `patient_information` (`patient_id`),
  
  CONSTRAINT `clinical_care_information_fk_provider_information` 
  FOREIGN KEY (`specialist_id`) 
  REFERENCES `provider_information` (`specialist_id`),
  
  CONSTRAINT `clinical_care_information_fk_visit_information` 
  FOREIGN KEY (`appointment_id`) 
  REFERENCES `visit_information` (`appointment_id`)
);

CREATE TABLE `billing` (
  `billing_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `medicine_name` varchar(50) DEFAULT NULL,
  `medicine_quantity` int(11) DEFAULT NULL,
 
  CONSTRAINT `billing_fk_clinical_care_information` 
  FOREIGN KEY (`prescription_id`) 
  REFERENCES `clinical_care_information` (`prescription_id`),
 
 CONSTRAINT `billing_fk_patient_information` 
 FOREIGN KEY (`patient_id`) 
 REFERENCES `patient_information` (`patient_id`)
);

CREATE TABLE `medicine` (
  `medicine_name` varchar(50) DEFAULT NULL,
  `medicine_price_USD` decimal(10,2) DEFAULT NULL
);






