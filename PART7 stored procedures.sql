/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 7
** Date Created: 11/28/2023      
** Purpose: Stored Procedures
*/

-- Creating a Stored Procedure 1 to retrieve technician information based on their email address.
CREATE PROCEDURE usp_GetTechnicianByEmail
    @Email VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM dbo.Technician
    WHERE Email = @Email;
END;


-- Using procedure usp_GetTechnicianByEmail
EXEC usp_GetTechnicianByEmail @Email = 'john.doe@email.com';



-- Creating a Stored Procedure 2 to update the contact number of a technician based on their TechnicianID.
USE Hansi060;
CREATE PROCEDURE usp_UpdateTechnicianContact
    @TechnicianID INT,
    @NewContactNumber VARCHAR(15)
AS
BEGIN
    UPDATE dbo.Technician
    SET ContactNumber = @NewContactNumber
    WHERE TechnicianID = @TechnicianID;
END;


-- Using procedure usp_UpdateTechnicianContact
EXEC usp_UpdateTechnicianContact @TechnicianID = 101, @NewContactNumber = '987-004-xxxx';


