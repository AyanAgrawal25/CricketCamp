-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Cricket_camp
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
DROP DATABASE IF EXISTS CRICKETCAMP;
CREATE SCHEMA CRICKETCAMP;
USE CRICKETCAMP;
--
-- Table structure for table `PARTICIPANTS`
--
DROP TABLE IF EXISTS `PARTICIPANTS`;
CREATE TABLE `PARTICIPANTS` (
    `First_Name` varchar(100) NOT NULL,
    `Middle_Name` varchar(100) NOT NULL,
    `Last_Name` varchar(100) NOT NULL,
    `Participant_ID` int NOT NULL AUTO_INCREMENT,
    `Age_on_joining` int NOT NULL,
    `Age_group` int NOT NULL,
    `Gender` varchar(20) NOT NULL,
    `Date_of_birth` date NOT NULL,
    `Address` varchar(200) NOT NULL,
    `Institute_name` varchar(50) NOT NULL,
    `Height` int NOT NULL,
    `Weight` int NOT NULL,
    `Tshirt_size` varchar(3) NOT NULL,
    `Area` varchar(100) NOT NULL,
    `Parents_Name` varchar(100) NOT NULL,
    `Email_ID` varchar(150) NOT NULL,
    PRIMARY KEY(Participant_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES `PARTICIPANTS` WRITE;
INSERT INTO `PARTICIPANTS`
VALUES (
        'Ayan',
        'Singh',
        'Agrawal',
        1,
        19,
        3,
        'Male',
        '2002-11-11',
        'Indore',
        'IIITH',
        190,
        70,
        'XXL',
        'Gachibowli',
        'XYZ Agarwal',
        'atan@gmail.com'
    ),
    (
        'Urvish',
        'H',
        'Pujara',
        2,
        17,
        2,
        'Male',
        '2004-10-10',
        'Rajkot',
        'IIITH',
        130,
        40,
        'L',
        'Chandkheda',
        'ABC Pujara',
        'urvish@gmail.com'
    );
UNLOCK TABLES;
--
-- Table structure for table `COACHES`
--
DROP TABLE IF EXISTS COACHES;
CREATE TABLE COACHES (
    Coach_ID INT NOT NULL AUTO_INCREMENT,
    STAFF_ID INT NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE DEFAULT NULL,
    Age INT NOT NULL,
    -- Derived one dekhna pdega kya hogaaa
    Gender VARCHAR(7) NOT NULL,
    Email_ID VARCHAR(150) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Experience INT NOT NULL,
    Role VARCHAR(30) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    PRIMARY KEY(Coach_ID),
    CONSTRAINT COACHES_ibfk_1 FOREIGN KEY (STAFF_ID) REFERENCES STAFF (Staff_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES COACHES WRITE;
INSERT INTO COACHES
VALUES (
        '1',
        '1',
        'Pradeep',
        'Singh',
        'Kohli',
        '1975-09-09',
        '45',
        'Male',
        'pradeep@gmail.com',
        'Lucknow',
        '3',
        'Batting',
        'Hindi'
    ),
    (
        '2',
        '2',
        'Lord',
        'Shardul',
        'Thakur',
        '1965-07-07',
        '55',
        'Male',
        'Shardul@gmail.com',
        'Kerela',
        '5',
        'Bowling',
        'Malyalam'
    );
UNLOCK TABLES;
--
-- Table structure for table `STAFF`
--
DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF (
    Staff_ID INT NOT NULL AUTO_INCREMENT,
    S_Firstname varchar(50) NOT NULL,
    S_Middlename varchar(50) NOT NULL,
    S_Lastname varchar(50) NOT NULL,
    Age INT,
    Date_of_birth DATE NOT NULL,
    Gender varchar(10) NOT NULL,
    `Role` varchar(25) NOT NULL,
    `Address` varchar(50) NOT NULL,
    Email varchar (50) NOT NULL,
    PRIMARY KEY (Staff_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES STAFF WRITE;
INSERT INTO STAFF
VALUES (
        '1',
        'Pradeep',
        'Singh',
        'Kohli',
        '45',
        '1975-09-09',
        'Male',
        'Coach',
        'Lucknow',
        'pradeep@gmail.com'
    ),
    (
        '2',
        'Lord',
        'Shardul',
        'Thakur',
        '55',
        '1965-07-07',
        'Male',
        'Coach',
        'Kerela',
        'shardul@gmail.com'
    ),
    (
        '3',
        'Raji',
        'Kumari',
        'Rajora',
        '22',
        '1998-10-18',
        'Feale',
        'Security-guard',
        'gurgaon',
        'raji@gmail.com'
    );
UNLOCK TABLES;
--
-- Table structure for table `SCHEDULE`
--
DROP TABLE IF EXISTS SCHEDULE;
CREATE TABLE SCHEDULE (
    Activity_ID INT NOT NULL AUTO_INCREMENT,
    `Date` DATE NOT NULL,
    `Time` TIME,
    Training_type VARCHAR(20),
    Coach_allotted_ID INT NOT NULL,
    Age_Group INT,
    PRIMARY KEY (Activity_ID) -- PRIMARY KEY (Coach_allotted_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES SCHEDULE WRITE;
INSERT INTO SCHEDULE
VALUES (
        '1',
        '2021-11-11',
        '15:22:21',
        'Batting',
        '1',
        '3'
    ),
    (
        '2',
        '2021-11-11',
        '17:22:21',
        'Bowling',
        '2',
        '2'
    );
UNLOCK TABLES;
--
-- Table structure for table `ADMINISTRATION`
--
DROP TABLE IF EXISTS ADMINISTRATION;
CREATE TABLE ADMINISTRATION(
    Administrator_ID INT NOT NULL AUTO_INCREMENT,
    Ad_Firstname varchar(50) NOT NULL,
    Ad_Middlename varchar(50) NOT NULL,
    Ad_Lastname varchar(50) NOT NULL,
    Age INT,
    Gender varchar(10) NOT NULL,
    Designation varchar(25) NOT NULL,
    `Address` varchar(50) NOT NULL,
    Email varchar (50) NOT NULL,
    PRIMARY KEY (Administrator_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES ADMINISTRATION WRITE;
INSERT INTO ADMINISTRATION
VALUES (
        '1',
        'Mayank',
        'Mukh',
        'Deshpande',
        '32',
        'Male',
        'Camp-Manager',
        'Haryana',
        'mayank@gmail.com'
    ),
    (
        '2',
        'Neerja',
        'Kaur',
        'Kohli',
        '33',
        'Feale',
        'Receptionist',
        'Mumbai',
        'Neerja@gmail.com'
    );
UNLOCK TABLES;
--
-- Table structure for table `TRANSPORTATION`
--
DROP TABLE IF EXISTS TRANSPORTATION;
CREATE TABLE TRANSPORTATION (
    Traveller_ID INT,
    -- Foreign Key hai participant id
    Capacity int NOT NULL,
    Driver_name varchar(10) NOT NULL,
    Driver_Conatct_no varchar(12) NOT NULL,
    Area varchar(50) NOT NULL,
    PRIMARY KEY (Traveller_ID),
    CONSTRAINT TRANSPORTATION_ibfk_1 FOREIGN KEY (Traveller_ID) REFERENCES PARTICIPANTS (Participant_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES TRANSPORTATION WRITE;
INSERT INTO TRANSPORTATION
VALUES ('1', '40', 'Ayan', '1234567890', 'Maninagar'),('2', '30', 'Urvish', '9876545578', 'Motera');
UNLOCK TABLES;
--
-- Table structure for table `EQUIPMENTS`
--
DROP TABLE IF EXISTS EQUIPMENTS;
CREATE TABLE EQUIPMENTS (
    Equipment_ID INT AUTO_INCREMENT,
    Quantity int NOT NULL,
    Sport varchar(10) NOT NULL,
    `Type` varchar(12) NOT NULL,
    PRIMARY KEY(Equipment_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES EQUIPMENTS WRITE;
INSERT INTO EQUIPMENTS
VALUES ('1', '15', 'Ball', 'Leather'),('2', '10', 'Ball', 'Tennis');
UNLOCK TABLES;
--
-- Table structure for table `PROGRESS_CARD`
--
DROP TABLE IF EXISTS PROGRESS_CARD;
CREATE TABLE PROGRESS_CARD (
    Player_ID INT,
    -- Foreign key
    Pcard_no INT,
    Reward varchar(25) NOT NULL,
    PRIMARY KEY(Pcard_no),
    CONSTRAINT PROGRESS_CARD_ibfk_1 FOREIGN KEY (Player_ID) REFERENCES PARTICIPANTS (Participant_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES PROGRESS_CARD WRITE;
INSERT INTO PROGRESS_CARD
VALUES ('1', '08', 'super striker'),('2', '04', 'gamechanger');
UNLOCK TABLES;
--
-- Table structure for table `PROGRESS`
--
DROP TABLE IF EXISTS PROGRESS;
CREATE TABLE PROGRESS (
    Coaches_ID INT NOT NULL,
    Part_ID INT NOT NULL,
    Act_ID INT NOT NULL,
    Card_no INT NOT NULL,
    PRIMARY KEY (Coaches_ID, Part_ID, Act_ID, Card_no),
    CONSTRAINT PROGRESS_ibfk_1 FOREIGN KEY (Coaches_ID) REFERENCES COACHES (Coach_ID),
    CONSTRAINT PROGRESS_ibfk_2 FOREIGN KEY (Part_ID) REFERENCES PARTICIPANTS (Participant_ID),
    CONSTRAINT PROGRESS_ibfk_3 FOREIGN KEY (Act_ID) REFERENCES SCHEDULE (Activity_ID),
    CONSTRAINT PROGRESS_ibfk_4 FOREIGN KEY (Card_no) REFERENCES PROGRESS_CARD (Pcard_no)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES PROGRESS WRITE;
INSERT INTO PROGRESS
VALUES ('1', '1', '1', '1'),('2', '2', '2', '2');
UNLOCK TABLES;
-- STAFF_CONTACT_NO
DROP TABLE IF EXISTS STAFF_CONTACT_NUMBER;
CREATE TABLE STAFF_CONTACT_NUMBER (
    STAFF_ID INT NOT NULL,
    -- Foreign key
    Contact_No varchar(12) NOT NULL,
    PRIMARY KEY (STAFF_ID, Contact_No),
    CONSTRAINT STAFF_CONTACT_NUMBER_ibfk_1 FOREIGN KEY (STAFF_ID) REFERENCES STAFF (Staff_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES STAFF_CONTACT_NUMBER WRITE;
INSERT INTO STAFF_CONTACT_NUMBER
VALUES ('1', '9826299489'),('2', '9826278773');
UNLOCK TABLES;
-- PARTICIPANT_CONTACT_NO
DROP TABLE IF EXISTS PARTICIPANT_CONTACT_NUMBER;
CREATE TABLE PARTICIPANT_CONTACT_NUMBER (
    Particip_ID INT NOT NULL,
    -- Foreign key
    Contact_No varchar(12) NOT NULL,
    PRIMARY KEY (Particip_ID, Contact_No),
    CONSTRAINT PARTICIPANT_CONTACT_NUMBER_ibfk_1 FOREIGN KEY (Particip_ID) REFERENCES PARTICIPANTS (Participant_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES PARTICIPANT_CONTACT_NUMBER WRITE;
INSERT INTO PARTICIPANT_CONTACT_NUMBER
VALUES ('1', '1234567890'),('2', '9876545578');
UNLOCK TABLES;
-- COACH_CONTACT_NUMBER
DROP TABLE IF EXISTS COACH_CONTACT_NUMBER;
CREATE TABLE COACH_CONTACT_NUMBER (
    Coach_ID INT NOT NULL,
    -- Foreign key
    Contact_No varchar(12) NOT NULL,
    PRIMARY KEY (Coach_ID, Contact_No),
    CONSTRAINT COACH_CONTACT_NUMBER_ibfk_1 FOREIGN KEY (Coach_ID) REFERENCES COACHES (Coach_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES COACH_CONTACT_NUMBER WRITE;
INSERT INTO COACH_CONTACT_NUMBER
VALUES ('1', '7839699489'),('2', '7831699489');
UNLOCK TABLES;
-- ADMINISTRATOR_CONTACT_NUMBER
DROP TABLE IF EXISTS ADMINISTRATOR_CONTACT_NUMBER;
CREATE TABLE ADMINISTRATOR_CONTACT_NUMBER (
    Admin_ID INT NOT NULL,
    -- Foreign key
    Contact_No varchar(12) NOT NULL,
    PRIMARY KEY (Admin_ID, Contact_No),
    CONSTRAINT ADMINISTRATOR_CONTACT_NUMBER_ibfk_1 FOREIGN KEY (Admin_ID) REFERENCES ADMINISTRATION (Administrator_ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES ADMINISTRATOR_CONTACT_NUMBER WRITE;
INSERT INTO ADMINISTRATOR_CONTACT_NUMBER
VALUES ('1', '8899699489'),('2', '8899692499');
UNLOCK TABLES;
-- Participant_Bowling_Marks
DROP TABLE IF EXISTS Participant_Bowling_Marks;
CREATE TABLE Participant_Bowling_Marks(
    Participant_ID INT NOT NULL,
    Bowl_Marks INT NOT NULL,
    PRIMARY KEY (Participant_ID, Bowl_Marks),
    CONSTRAINT Participant_Bowling_Marks_ibfk_1 FOREIGN KEY (Participant_ID) REFERENCES PROGRESS_CARD (Player_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES Participant_Bowling_Marks WRITE;
INSERT INTO Participant_Bowling_Marks
VALUES (2, 69);
INSERT INTO Participant_Bowling_Marks
VALUES (3, 49);
UNLOCK TABLES;
-- Participant_Batting_Marks
-- MARKS TABLE, FOREIGN KEY IS PART_ID OF PROGRESS_CARD TABLE
DROP TABLE IF EXISTS Participant_Batting_Marks;
CREATE TABLE Participant_Batting_Marks(
    Participant_ID INT NOT NULL,
    Bat_Marks INT NOT NULL,
    PRIMARY KEY (Participant_ID),
    CONSTRAINT Participant_Batting_Marks_ibfk_1 FOREIGN KEY (Participant_ID) REFERENCES PROGRESS_CARD (Player_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES Participant_Batting_Marks WRITE;
INSERT INTO Participant_Batting_Marks
VALUES (2, 23);
INSERT INTO Participant_Batting_Marks
VALUES (3, 50);
UNLOCK TABLES;
-- Participant_Fielding_Marks
DROP TABLE IF EXISTS Participant_Fielding_Marks;
CREATE TABLE Participant_Fielding_Marks(
    Participant_ID INT NOT NULL,
    Field_Marks INT NOT NULL,
    PRIMARY KEY (Participant_ID, Field_Marks),
    CONSTRAINT Participant_Fielding_Marks_ibfk_1 FOREIGN KEY (Participant_ID) REFERENCES PROGRESS_CARD (Player_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES Participant_Fielding_Marks WRITE;
INSERT INTO Participant_Fielding_Marks
VALUES (2, 76);
INSERT INTO Participant_Fielding_Marks
VALUES (3, 60);
UNLOCK TABLES;
-- Participant_Fitness_Marks
DROP TABLE IF EXISTS Participant_Fitness_Marks;
CREATE TABLE Participant_Fitness_Marks(
    Participant_ID INT NOT NULL,
    Fit_Marks INT NOT NULL,
    PRIMARY KEY (Participant_ID, Fit_Marks),
    CONSTRAINT Participant_Fitness_Marks_ibfk_1 FOREIGN KEY (Participant_ID) REFERENCES PROGRESS_CARD (Player_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES Participant_Fitness_Marks WRITE;
INSERT INTO Participant_Fitness_Marks
VALUES (2, 80);
INSERT INTO Participant_Fitness_Marks
VALUES (3, 63);
UNLOCK TABLES;
-- Canteen
DROP TABLE IF EXISTS Canteen;
CREATE TABLE Canteen(
    Eater_ID INT NOT NULL,
    Snack_price INT NOT NULL,
    Snack_name VARCHAR(50) NOT NULL,
    Open_time time NOT NULL,
    Close_time time NOT NULL,
    PRIMARY KEY(Eater_ID),
    CONSTRAINT Canteen_ibfk_1 FOREIGN KEY (Eater_ID) REFERENCES Participants (Participant_ID)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
LOCK TABLES Canteen WRITE;
INSERT INTO Canteen
VALUES (2, 30, 'Vadapav', '9:30:00', '19:30:00'),
(3, 150, 'Pizza', '9:30:00', '19:30:00');
UNLOCK TABLES;