/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 4
** Date Created: 11/28/2023      
** Purpose: Populating Tables- Technician, SystemStatus, Metrics, MaintenanceLogs, Alerts, Actions
*/

USE Hansi060;

-- Inserting values into Technician Table
INSERT INTO dbo.Technician (TechnicianID, FirstName, LastName, ContactNumber, Email, Specialization)
VALUES
  (101, 'John', 'Doe', '123-456-xxxx', 'john.doe@email.com', 'System Maintenance'),
  (102, 'Jane', 'Smith', '987-654-xxxx', 'jane.smith@email.com', 'Sensor Calibration'),
  (103, 'Alice', 'Johnson', '555-123-xxxx', 'alice.johnson@email.com', 'Communication Systems'),
  (104, 'Bob', 'Williams', '555-987-xxxx', 'bob.williams@email.com', 'Navigation Calibration'),
  (105, 'Eva', 'Smith', '555-555-xxxx', 'eva.smith@email.com', 'Power Systems'),
  (106, 'Charlie', 'Brown', '555-111-xxxx', 'charlie.brown@email.com', 'Life Support Systems'),
  (107, 'Grace', 'Davis', '555-333-xxxx', 'grace.davis@email.com', 'Sensor Maintenance'),
  (108, 'Daniel', 'Clark', '555-777-xxxx', 'daniel.clark@email.com', 'Data Analysis'),
  (109, 'Sophia', 'Moore', '555-666-xxxx', 'sophia.moore@email.com', 'Propulsion Systems'),
  (110, 'Oliver', 'Taylor', '555-444-xxxx', 'oliver.taylor@email.com', 'Robotics Maintenance');

-- Retrieve Result Set from Technician Table
USE Hansi060;
SELECT * FROM dbo.Technician;

-- Inserting values into SystemStatus Table
INSERT INTO dbo.SystemStatus (SystemID, SystemType, Status, Timestamp, Description)
VALUES
  (1211, 'Navigation', 'Operational', '2023-01-01 08:00:00', 'Normal system operation'),
  (1212, 'Power', 'Critical', '2023-01-02 10:30:00', 'Low power levels detected'),
  (1213, 'Communication', 'Operational', '2023-01-03 12:45:00', 'Stable communication systems'),
  (1214, 'Life Support', 'Warning', '2023-01-04 15:20:00', 'Reduced oxygen levels detected'),
  (1215, 'Navigation', 'Operational', '2023-01-05 18:30:00', 'Normal system operation'),
  (1216, 'Power', 'Critical', '2023-01-06 21:15:00', 'Critical power outage'),
  (1217, 'Communication', 'Operational', '2023-01-07 23:45:00', 'Stable communication systems'),
  (1218, 'Life Support', 'Operational', '2023-01-08 02:30:00', 'Optimal life support conditions'),
  (1219, 'Navigation', 'Warning', '2023-01-09 05:10:00', 'Navigation system deviation detected'),
  (1220, 'Power', 'Warning', '2023-01-10 08:25:00', 'Normal power levels'),
  (1221, 'Communication', 'Critical', '2023-01-11 10:50:00', 'Critical communication failure'),
  (1222, 'Life Support', 'Operational', '2023-01-12 13:15:00', 'Optimal life support conditions'),
  (1223, 'Navigation', 'Operational', '2023-01-13 15:40:00', 'Normal system operation'),
  (1224, 'Power', 'Warning', '2023-01-14 18:00:00', 'Reduced power levels detected'),
  (1225, 'Communication', 'Operational', '2023-01-15 20:30:00', 'Stable communication systems'),
  (1226, 'Life Support', 'Operational', '2023-01-16 23:10:00', 'Optimal life support conditions'),
  (1227, 'Navigation', 'Operational', '2023-01-17 02:25:00', 'Normal system operation'),
  (1228, 'Power', 'Operational', '2023-01-18 05:45:00', 'Normal power levels'),
  (1229, 'Communication', 'Operational', '2023-01-19 08:00:00', 'Stable communication systems'),
  (1230, 'Life Support', 'Warning', '2023-01-20 10:20:00', 'Reduced oxygen levels detected');

-- Retrieve Result Set from SystemStatus Table
USE Hansi060;
SELECT * FROM dbo.SystemStatus;

-- Populate Metrics Transactional Table
INSERT INTO dbo.Metrics (MetricID, SystemID, MetricName, MeasuredValue, Unit, Timestamp)
VALUES
  (1, 1211, 'Temperature', 25.5, 'Celsius', '2023-01-01 08:15:00'),
  (2, 1212, 'Voltage', 11.8, 'Volts', '2023-01-02 10:35:00'),
  (3, 1213, 'Pressure', 1012.5, 'hPa', '2023-01-03 12:50:00'),
  (4, 1214, 'Oxygen Level', 18.2, '%', '2023-01-04 15:25:00'),
  (5, 1215, 'Temperature', 26.8, 'Celsius', '2023-01-05 18:45:00'),
  (6, 1216, 'Voltage', 9.5, 'Volts', '2023-01-06 21:30:00'),
  (7, 1217, 'Pressure', 1010.8, 'hPa', '2023-01-07 23:50:00'),
  (8, 1218, 'Oxygen Level', 20.5, '%', '2023-01-08 02:35:00'),
  (9, 1219, 'Temperature', 24.3, 'Celsius', '2023-01-09 05:15:00'),
  (10, 1220, 'Voltage', 12.5, 'Volts', '2023-01-10 08:30:00'),
  (11, 1221, 'Pressure', 1009.2, 'hPa', '2023-01-11 11:00:00'),
  (12, 1222, 'Oxygen Level', 19.8, '%', '2023-01-12 13:25:00'),
  (13, 1223, 'Temperature', 25.0, 'Celsius', '2023-01-13 15:45:00'),
  (14, 1224, 'Voltage', 10.8, 'Volts', '2023-01-14 18:15:00'),
  (15, 1225, 'Pressure', 1011.5, 'hPa', '2023-01-15 20:35:00'),
  (16, 1226, 'Oxygen Level', 17.5, '%', '2023-01-16 23:15:00'),
  (17, 1227, 'Temperature', 26.5, 'Celsius', '2023-01-17 02:30:00'),
  (18, 1228, 'Voltage', 11.2, 'Volts', '2023-01-18 05:50:00'),
  (19, 1229, 'Pressure', 1010.2, 'hPa', '2023-01-19 08:05:00'),
  (20, 1230, 'Oxygen Level', 18.0, '%', '2023-01-20 10:25:00');


-- Retrieve Result Set from Metrics Table
USE Hansi060;
SELECT * FROM dbo.Metrics;


-- Insert into MaintenanceLogs Table
INSERT INTO dbo.MaintenanceLogs (LogID, SystemID, Description, Timestamp, MaintenanceType, TechnicianID)
VALUES
  (1, 1211, 'Routine checkup', '2023-01-01 09:00:00', 'Preventive', 101),
  (2, 1212, 'Replace power module', '2023-01-02 11:00:00', 'Corrective', 102),
  (3, 1213, 'Communication system check', '2023-01-03 13:00:00', 'Preventive', 103),
  (4, 1214, 'Oxygen level adjustment', '2023-01-04 15:30:00', 'Corrective', 104),
  (5, 1215, 'Navigation system calibration', '2023-01-05 19:00:00', 'Preventive', 105),
  (6, 1216, 'Critical power outage response', '2023-01-06 21:45:00', 'Corrective', 106),
  (7, 1217, 'Communication system check', '2023-01-08 00:00:00', 'Preventive', 107),
  (8, 1218, 'Life support systems check', '2023-01-08 03:00:00', 'Preventive', 108),
  (9, 1219, 'Navigation system deviation correction', '2023-01-09 06:00:00', 'Corrective', 109),
  (11, 1221, 'Critical communication failure resolution', '2023-01-11 11:30:00', 'Corrective', 101),
  (12, 1222, 'Life support systems check', '2023-01-12 13:45:00', 'Preventive', 102),
  (13, 1223, 'Navigation system calibration', '2023-01-13 16:00:00', 'Preventive', 103),
  (14, 1224, 'Power system routine check', '2023-01-14 18:30:00', 'Preventive', 104),
  (15, 1225, 'Communication system check', '2023-01-15 21:00:00', 'Preventive', 105),
  (16, 1226, 'Life support systems check', '2023-01-16 23:30:00', 'Preventive', 106),
  (17, 1227, 'Navigation system calibration', '2023-01-17 02:45:00', 'Preventive', 107),
  (18, 1228, 'Power system routine check', '2023-01-18 06:00:00', 'Preventive', 108),
  (19, 1229, 'Communication system check', '2023-01-19 08:15:00', 'Preventive', 109),
  (20, 1230, 'Oxygen level adjustment', '2023-01-20 10:30:00', 'Corrective', 110),
  (21, 1211, 'Routine checkup', '2023-01-21 11:00:00', 'Preventive', 101),
  (22, 1212, 'Replace power module', '2023-01-22 12:30:00', 'Corrective', 102),
  (23, 1213, 'Communication system check', '2023-01-23 13:45:00', 'Preventive', 103),
  (24, 1214, 'Oxygen level adjustment', '2023-01-24 15:00:00', 'Corrective', 104),
  (25, 1215, 'Navigation system calibration', '2023-01-25 16:15:00', 'Preventive', 105);


-- Retrieve Result Set from MaintenanceLogs Table
USE Hansi060;
SELECT * FROM dbo.MaintenanceLogs;

-- Insert into Alerts table
INSERT INTO dbo.Alerts (AlertID, SystemID, MetricID, AlertType, ThresholdValue, Timestamp, AcknowledgmentStatus)
VALUES
  (1, 1211, 1, 'Critical', 30.0, '2023-01-01 08:20:00', 'Not Acknowledged'),
  (2, 1212, 2, 'Not Critical', 10.0, '2023-01-02 10:40:00', 'Not Acknowledged'),
  (3, 1213, 3, 'High Priority', 1015.0, '2023-01-03 12:55:00', 'Not Acknowledged'),
  (4, 1214, 4, 'Medium Priority', 15.0, '2023-01-04 15:35:00', 'Not Acknowledged'),
  (5, 1215, 5, 'Critical', 28.0, '2023-01-05 18:50:00', 'Not Acknowledged'),
  (6, 1216, 6, 'Low Priority', 8.0, '2023-01-06 21:35:00', 'Not Acknowledged'),
  (7, 1217, 7, 'Critical', 1010.0, '2023-01-07 23:55:00', 'Not Acknowledged'),
  (8, 1218, 8, 'Not Critical', 18.0, '2023-01-08 02:40:00', 'Not Acknowledged'),
  (9, 1219, 9, 'High Priority', 25.0, '2023-01-09 05:20:00', 'Not Acknowledged'),
  (10, 1220, 10, 'Not Critical', 11.0, '2023-01-10 08:35:00', 'Not Acknowledged'),
  (11, 1221, 11, 'Medium Priority', 1008.0, '2023-01-11 11:05:00', 'Not Acknowledged'),
  (12, 1222, 12, 'Low Priority', 20.0, '2023-01-12 13:30:00', 'Not Acknowledged'),
  (13, 1223, 13, 'Critical', 24.0, '2023-01-13 15:50:00', 'Not Acknowledged'),
  (14, 1224, 14, 'Not Critical', 10.0, '2023-01-14 18:20:00', 'Not Acknowledged'),
  (15, 1225, 15, 'High Priority', 1012.0, '2023-01-15 20:40:00', 'Not Acknowledged'),
  (16, 1226, 16, 'Not Critical', 16.0, '2023-01-16 23:20:00', 'Not Acknowledged'),
  (17, 1227, 17, 'Critical', 27.0, '2023-01-17 02:35:00', 'Not Acknowledged'),
  (18, 1228, 18, 'Not Critical', 9.0, '2023-01-18 05:55:00', 'Not Acknowledged'),
  (19, 1229, 19, 'Medium Priority', 1009.0, '2023-01-19 08:10:00', 'Not Acknowledged'),
  (20, 1230, 20, 'Low Priority', 17.0, '2023-01-20 10:25:00', 'Not Acknowledged');

-- Retrieve Result Set from Alerts Table
USE Hansi060;
SELECT * FROM dbo.Alerts;

-- Inset values into Actions Table
INSERT INTO dbo.Actions (ActionID, AlertID, ActionType, Timestamp, Description)
VALUES
  (1, 1, 'Investigate', '2023-01-01 08:30:00', 'Initiated investigation of temperature anomaly'),
  (2, 2, 'Replace Module', '2023-01-02 11:10:00', 'Replaced faulty power module'),
  (3, 3, 'Adjust Pressure', '2023-01-03 13:00:00', 'Adjusted pressure levels to normal range'),
  (4, 4, 'Oxygen Refill', '2023-01-04 16:00:00', 'Refilled oxygen supply to optimal levels'),
  (5, 5, 'Check Sensors', '2023-01-05 19:00:00', 'Conducted sensor check for temperature deviations'),
  (6, 6, 'Emergency Shutdown', '2023-01-06 21:50:00', 'Initiated emergency shutdown due to critical power outage'),
  (7, 7, 'System Reboot', '2023-01-08 00:00:00', 'Performed system reboot to stabilize communication'),
  (8, 8, 'Life Support Calibration', '2023-01-08 03:00:00', 'Calibrated life support systems for optimal performance'),
  (9, 9, 'Navigation Adjustment', '2023-01-09 05:30:00', 'Adjusted navigation system for proper alignment'),
  (10, 10, 'Power System Check', '2023-01-10 08:50:00', 'Conducted comprehensive check of power systems'),
  (11, 11, 'Communication System Reset', '2023-01-11 11:30:00', 'Reset communication systems to resolve critical failure'),
  (12, 12, 'Life Support Check', '2023-01-12 13:45:00', 'Performed thorough check of life support parameters'),
  (13, 13, 'Navigation Calibration', '2023-01-13 16:00:00', 'Calibrated navigation systems for accuracy'),
  (14, 14, 'Power System Optimization', '2023-01-14 18:30:00', 'Optimized power systems for efficient operation'),
  (15, 15, 'Communication Antenna Adjustment', '2023-01-15 20:50:00', 'Adjusted communication antennas for better reception'),
  (16, 16, 'Oxygen Supply Refill', '2023-01-17 02:50:00', 'Refilled oxygen supply to maintain optimal levels'),
  (17, 17, 'Temperature Control Calibration', '2023-01-17 03:00:00', 'Calibrated temperature control systems for precision'),
  (18, 18, 'Voltage Stabilization', '2023-01-18 06:00:00', 'Stabilized voltage levels in power systems'),
  (19, 19, 'Pressure Adjustment', '2023-01-19 08:15:00', 'Adjusted pressure levels for optimal performance'),
  (20, 20, 'Oxygen Level Monitoring', '2023-01-20 10:30:00', 'Implemented continuous monitoring of oxygen levels');


-- Retrieve Result Set from Actions Table
USE Hansi060;
SELECT * FROM dbo.Actions;