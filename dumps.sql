CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `mobilenum` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`userid`)
);
CREATE TABLE `doctors` (
  `did` int NOT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `specialisation` varchar(50) DEFAULT NULL,
  `available_from` time DEFAULT NULL,
  `available_till` time DEFAULT NULL,
  PRIMARY KEY (`did`)
);
CREATE TABLE `vaccine` (
  `uid` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
);
CREATE TABLE `billings` (
  `uid` int DEFAULT NULL,
  `billing_day` date DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `bill_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bill_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `billings_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
CREATE TABLE `bptests` (
  `uid` int DEFAULT NULL,
  `testid` int NOT NULL,
  `systolic_pressure` decimal(10,0) DEFAULT NULL,
  `diastolic_pressure` decimal(10,0) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `bptests_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ;
CREATE TABLE `doctorappointments` (
  `uid` int DEFAULT NULL,
  `docid` int DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  KEY `docid` (`docid`),
  CONSTRAINT `doctorappointments_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`),
  CONSTRAINT `doctorappointments_ibfk_2` FOREIGN KEY (`docid`) REFERENCES `doctors` (`did`)
) ;
CREATE TABLE `medicines` (
  `medicine_name` varchar(50) DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `stock_left` int DEFAULT NULL,
  `last_updated` date DEFAULT NULL
);
CREATE TABLE `prescriptions` (
  `prescription` varchar(200) DEFAULT NULL,
  `docname` varchar(50) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `Day` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
) ;
CREATE TABLE `requests` (
  `uid` int DEFAULT NULL,
  `request_message` varchar(100) DEFAULT NULL
) ;
CREATE TABLE `sugartests` (
  `uid` int DEFAULT NULL,
  `testid` int NOT NULL,
  `sugar_level` decimal(10,0) DEFAULT NULL,
  `ppsl` decimal(10,0) DEFAULT NULL,
  `insulin_level` decimal(10,0) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `sugartests_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
);
CREATE TABLE `testappointments` (
  `uid` int DEFAULT NULL,
  `testname` varchar(50) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `testappointments_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`)
);