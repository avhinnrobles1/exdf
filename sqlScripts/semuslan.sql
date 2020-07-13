-- ======================================================================================
-- Create SQL Login template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ======================================================================================

CREATE LOGIN semuslan
	WITH PASSWORD = 'projectEx123!' 
GO

-- Get the SID here to be used for creating a Login with SID
SELECT name, sid FROM sys.sql_logins WHERE name = 'semuslan';
GO

DROP LOGIN semuslan;
GO

CREATE LOGIN semuslan
WITH PASSWORD = 'projectEx123!', SID = 0x010600000000006400000000000000001136BAF89241BC4BB280A87FE56717F8;

SELECT * FROM sys.sql_logins WHERE name = 'semuslan';
GO

-- switch database to exdev
USE [exdev]

-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER semuslan
	FOR LOGIN semuslan
	WITH DEFAULT_SCHEMA = dbo
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'semuslan'
GO
