-- Create the MovieWatchList database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MovieWatchList')
BEGIN
    CREATE DATABASE [MovieWatchList];
END
GO

-- Switch to the MovieWatchList database
USE [MovieWatchList];
GO

-- Create the ClickCounter table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ClickCounter')
BEGIN
    CREATE TABLE ClickCounter (Id INT PRIMARY KEY, Count INT);
    
    -- Insert initial row with ID=1 and Count=0
    INSERT INTO ClickCounter (Id, Count) VALUES (1, 0);
    
    PRINT 'ClickCounter table created and initialized.';
END
ELSE
BEGIN
    PRINT 'ClickCounter table already exists.';
END
GO
