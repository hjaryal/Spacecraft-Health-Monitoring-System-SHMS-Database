/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 6
** Date Created: 11/28/2023      
** Purpose: Creating audit table
*/

-- Step 1: Create the audit table
CREATE TABLE dbo.TechnicianAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TechnicianID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Specialization VARCHAR(50),
    AuditDateTime DATETIME,
    ChangeType VARCHAR(10)
);



-- Create a trigger to audit INSERT, UPDATE, DELETE on Technician table
CREATE TRIGGER TR_Technician_Audit
ON dbo.Technician
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT operation
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO dbo.TechnicianAudit (TechnicianID, FirstName, LastName, ContactNumber, Email, Specialization, AuditDateTime, ChangeType)
        SELECT 
            i.TechnicianID,
            i.FirstName,
            i.LastName,
            i.ContactNumber,
            i.Email,
            i.Specialization,
            GETDATE(),
            'INSERT'
        FROM inserted i;
    END

    -- UPDATE operation
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO dbo.TechnicianAudit (TechnicianID, FirstName, LastName, ContactNumber, Email, Specialization, AuditDateTime, ChangeType)
        SELECT 
            i.TechnicianID,
            i.FirstName,
            i.LastName,
            i.ContactNumber,
            i.Email,
            i.Specialization,
            GETDATE(),
            'UPDATE'
        FROM inserted i;
    END

    -- DELETE operation
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO dbo.TechnicianAudit (TechnicianID, FirstName, LastName, ContactNumber, Email, Specialization, AuditDateTime, ChangeType)
        SELECT 
            d.TechnicianID,
            d.FirstName,
            d.LastName,
            d.ContactNumber,
            d.Email,
            d.Specialization,
            GETDATE(),
            'DELETE'
        FROM deleted d;
    END
END;



-- Step 3: Test INSERT operation
INSERT INTO Technician (TechnicianID, FirstName, LastName, ContactNumber, Email, Specialization)
VALUES (111, 'New1', 'Technician1', '555-123-xxxx', 'new.technician1@email.com', 'New Specialization1');

-- Step 4: Test UPDATE operation
UPDATE dbo.Technician SET FirstName = 'New1Updated' WHERE TechnicianID = 111;

-- Step 5: Test DELETE operation
DELETE FROM dbo.Technician WHERE TechnicianID = 111;

-- Step 6: View the data in the audit table
SELECT * FROM dbo.TechnicianAudit;

