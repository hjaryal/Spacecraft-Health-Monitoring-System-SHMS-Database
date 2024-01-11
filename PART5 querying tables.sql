/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 5
** Date Created: 11/28/2023      
** Purpose: Creating three Queries and converting them into views
*/

-- View #1 Critical alerts view
CREATE VIEW dbo.CriticalAlerts AS
SELECT *
FROM dbo.Alerts
WHERE AlertType = 'Critical'
AND AcknowledgmentStatus = 'Not Acknowledged';

-- Test Critical Alerts View
USE Hansi060;
SELECT *
FROM dbo.CriticalAlerts;



-- View #2 Maintenanace History View
CREATE VIEW dbo.MaintenanceHistory AS
SELECT M.LogID, M.SystemID, M.Description, M.Timestamp, M.MaintenanceType, T.FirstName + ' ' + T.LastName AS TechnicianName
FROM dbo.MaintenanceLogs M
INNER JOIN dbo.Technician T ON M.TechnicianID = T.TechnicianID
WHERE M.MaintenanceType = 'Corrective';


-- Test Maintenance History View
USE Hansi060;
SELECT *
FROM dbo.MaintenanceHistory;



-- View #3 System Down No Technician View. A view for systems that are down with no assigned technician
CREATE VIEW dbo.SystemDownNoTechnicianView AS
SELECT
    ss.SystemID,
    ss.SystemType,
    ss.Status,
    ss.Timestamp AS SystemStatusTimestamp
FROM
    dbo.SystemStatus ss
WHERE
    ss.Status <> 'Operational'
    AND ss.SystemID NOT IN (SELECT DISTINCT SystemID FROM dbo.MaintenanceLogs);


-- Test System Down No Technician View
USE Hansi060;
select * from SystemDownNoTechnicianView;