USE [master]
GO

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MovieWatchList')
BEGIN
    PRINT 'Creating MovieWatchList database...'
    CREATE DATABASE [MovieWatchList]
END
GO

-- Create login if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'MovieWatchListUser')
BEGIN
    PRINT 'Creating MovieWatchListUser login...'
    CREATE LOGIN [MovieWatchListUser] WITH PASSWORD = 'Your_password123', DEFAULT_DATABASE=[master]
END
GO

USE [MovieWatchList]
GO

-- Create user and assign roles
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'MovieWatchListUser')
BEGIN
    PRINT 'Creating MovieWatchListUser database user...'
    CREATE USER [MovieWatchListUser] FOR LOGIN [MovieWatchListUser]
    ALTER ROLE [db_owner] ADD MEMBER [MovieWatchListUser]
END
GO

-- Create the ClickCounter table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ClickCounter')
BEGIN
    PRINT 'Creating ClickCounter table...'
    CREATE TABLE ClickCounter (Id INT PRIMARY KEY, Count INT)
    
    -- Insert initial row with ID=1 and Count=0
    INSERT INTO ClickCounter (Id, Count) VALUES (1, 0)
    
    PRINT 'ClickCounter table created and initialized.'
END
ELSE
BEGIN
    PRINT 'ClickCounter table already exists.'
END
GO
