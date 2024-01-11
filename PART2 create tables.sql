/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 2 
** Date Created: 11/28/2023      
** Purpose: Creating Tables- Technician, SystemStatus, Metrics, MaintenanceLogs, Alerts, Actions
*/


-- Drop the database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Hansi060')
    DROP DATABASE Hansi060;
GO

-- Create the database
CREATE DATABASE Hansi060;
GO


-- Drop tables if they exist
IF OBJECT_ID('dbo.Actions', 'U') IS NOT NULL
    DROP TABLE dbo.Actions;

IF OBJECT_ID('dbo.Alerts', 'U') IS NOT NULL
    DROP TABLE dbo.Alerts;

IF OBJECT_ID('dbo.MaintenanceLogs', 'U') IS NOT NULL
    DROP TABLE dbo.MaintenanceLogs;

IF OBJECT_ID('dbo.Metrics', 'U') IS NOT NULL
    DROP TABLE dbo.Metrics;

IF OBJECT_ID('dbo.SystemStatus', 'U') IS NOT NULL
    DROP TABLE dbo.SystemStatus;

IF OBJECT_ID('dbo.Technician', 'U') IS NOT NULL
    DROP TABLE dbo.Technician;


-- Use the newly created database
USE Hansi060;
GO

-- Create the Technician table
CREATE TABLE dbo.Technician (
    TechnicianID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Specialization VARCHAR(50)
);


-- Create the SystemStatus table
CREATE TABLE dbo.SystemStatus (
    SystemID INT PRIMARY KEY,
    SystemType VARCHAR(50),
    Status VARCHAR(50),
    Timestamp DATETIME,
    Description VARCHAR(MAX)
);

-- Create the Metrics table
CREATE TABLE dbo.Metrics (
    MetricID INT PRIMARY KEY,
    SystemID INT FOREIGN KEY REFERENCES dbo.SystemStatus(SystemID),
    MetricName VARCHAR(50),
    MeasuredValue FLOAT,
    Unit VARCHAR(20),
    Timestamp DATETIME
);

-- Create the MaintenanceLogs table
CREATE TABLE dbo.MaintenanceLogs (
    LogID INT PRIMARY KEY,
    SystemID INT FOREIGN KEY REFERENCES dbo.SystemStatus(SystemID),
    Description VARCHAR(MAX),
    Timestamp DATETIME,
    MaintenanceType VARCHAR(20),
    TechnicianID INT FOREIGN KEY REFERENCES dbo.Technician(TechnicianID)
);


-- Create the Alerts table
CREATE TABLE dbo.Alerts (
    AlertID INT PRIMARY KEY,
    SystemID INT FOREIGN KEY REFERENCES dbo.SystemStatus(SystemID),
    MetricID INT FOREIGN KEY REFERENCES dbo.Metrics(MetricID),
    AlertType VARCHAR(50),
    ThresholdValue FLOAT,
    Timestamp DATETIME,
    AcknowledgmentStatus VARCHAR(50)
);

-- Create the Actions table
CREATE TABLE dbo.Actions (
    ActionID INT PRIMARY KEY,
    AlertID INT FOREIGN KEY REFERENCES dbo.Alerts(AlertID),
    ActionType VARCHAR(50),
    Timestamp DATETIME,
    Description VARCHAR(MAX)
);