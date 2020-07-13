-- ======================================================================================
-- Create SQL Login template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ======================================================================================

CREATE LOGIN cshneider
	WITH PASSWORD = 'projectEx123!' 
GO

-- Get the SID here to be used for creating a Login with SID
SELECT name, sid FROM sys.sql_logins WHERE name = 'cshneider';
GO

DROP LOGIN cshneider;
GO

CREATE LOGIN cshneider
WITH PASSWORD = 'projectEx123!', SID = 0x010600000000006400000000000000006FD0577C379262439DD9C3B2273E4D22;

SELECT * FROM sys.sql_logins WHERE name = 'cshneider';
GO

-- switch database to exdev
USE [exdev]

-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER cshneider
	FOR LOGIN cshneider
	WITH DEFAULT_SCHEMA = dbo
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'cshneider'
GO
