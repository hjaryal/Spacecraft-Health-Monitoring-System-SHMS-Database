/*
** Author: Hansika Jaryal
** Assignment: Final Project- PART 8
** Date Created: 11/28/2023      
** Purpose: Cursors
*/

-- 1. Creating a Cursor for calculating average Metric value for a system
DECLARE @SystemIDCursor INT;
DECLARE MetricCursor CURSOR FOR
    SELECT DISTINCT SystemID
    FROM Metrics;

-- Open Cursor
OPEN MetricCursor;

-- Fetch the first SystemID
FETCH NEXT FROM MetricCursor INTO @SystemIDCursor;

-- Loop through each SystemID
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Declare variables
    DECLARE @MetricName NVARCHAR(100);
    DECLARE @AverageValue FLOAT;

    -- Create a temporary table to store metric values for the current system
    CREATE TABLE #TempMetrics (MetricName NVARCHAR(100), MeasuredValue FLOAT);

    -- Fetch metrics for the current system
    INSERT INTO #TempMetrics (MetricName, MeasuredValue)
    SELECT MetricName, MeasuredValue
    FROM Metrics
    WHERE SystemID = @SystemIDCursor;

    -- Calculate average value
    SELECT @AverageValue = AVG(MeasuredValue)
    FROM #TempMetrics;

    -- Print or use the average value as needed
    PRINT 'SystemID: ' + CAST(@SystemIDCursor AS NVARCHAR(10)) + ', Average Metric Value: ' + CAST(@AverageValue AS NVARCHAR(50));

    -- Drop the temporary table
    DROP TABLE #TempMetrics;

    -- Fetch the next SystemID
    FETCH NEXT FROM MetricCursor INTO @SystemIDCursor;
END

-- Close and deallocate the cursor
CLOSE MetricCursor;
DEALLOCATE MetricCursor;




-- 2. Creating a Cursor to identify unacknowledged Alerts
USE Hansi060;
DECLARE @AlertID INT, @SystemID INT, @AlertType VARCHAR(20), @Timestamp DATETIME;

-- Declare the cursor
DECLARE AlertCursor CURSOR FOR
    SELECT AlertID, SystemID, AlertType, Timestamp
    FROM dbo.Alerts
    WHERE AcknowledgmentStatus = 'Not Acknowledged';

-- Open the cursor
OPEN AlertCursor;

-- Fetch the first row
FETCH NEXT FROM AlertCursor INTO @AlertID, @SystemID, @AlertType, @Timestamp;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print or utilize the alert information (replace this with your logic)
    PRINT 'AlertID: ' + CAST(@AlertID AS VARCHAR(10)) + ', SystemID: ' + CAST(@SystemID AS VARCHAR(10)) + ', AlertType: ' + @AlertType + ', Timestamp: ' + CAST(@Timestamp AS VARCHAR(20));

    -- Fetch the next row
    FETCH NEXT FROM AlertCursor INTO @AlertID, @SystemID, @AlertType, @Timestamp;
END

-- Close and deallocate the cursor
CLOSE AlertCursor;
DEALLOCATE AlertCursor;
