-- Active: 1741124993382@@127.0.0.1@3306@hospital

CREATE DATABASE Lisa2;
-- QUESTION 1 ---
USE Lisa2;

CREATE TABLE Patient(
    PatientID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(64),
    Age VARCHAR(50),
    Gender ENUM('Male','Female'),
    Contact INT(23)
);


CREATE TABLE Doctor(
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(63),
    Specification VARCHAR(64),
    Contact INT 
);

CREATE TABLE Appointment(
    AppointmentID INT PRIMARY KEY,
    PatientID VARCHAR(50),
    DoctorID INT ,
    Date DATE,
    Time TIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)

);

CREATE TABLE Prescription(
    PrescriptionID INT PRIMARY KEY,
    AppointmentID INT ,
    Medicine VARCHAR(50),
    Dosage INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

ALTER  TABLE `Patient` CHANGE Contact_number  Contact_Number INT(10);

CREATE TABLE Pharmacist(
    Pharmacist_ID INT PRIMARY KEY,
    Name VARCHAR(63),
    Qualification VARCHAR(64),
    Contact_Numbwe INT(10)
);

CREATE TABLE Medicine(
    Medicine_ID INT PRIMARY KEY,
    Name VARCHAR(63),
    Type VARCHAR(64),
    Price_Per_Unit(UGX) DECIMAL(10,2),
    Stock_Quantity INT
);

INSERT INTO 

DESC Patient;


SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 































































