-- Active: 1741124993382@@127.0.0.1@3306@hospital

CREATE DATABASE hospital;
-- QUESTION 1 ---
USE hospital;

CREATE TABLE Patient(
    PatientID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(64),
    Age VARCHAR(50),
    Gender ENUM('Male','Female'),
    Contact INT(23)
);

DROP TABLE Patient;
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

ALTER  TABLE `Patient` CHANGE Contact Contact_number INT(10);

INSERT INTO 

SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 































































