-- ======================================================================================
-- Create SQL Login template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ======================================================================================

CREATE LOGIN fcatameo
	WITH PASSWORD = 'pass@word1' 
GO

-- Get the SID here to be used for creating a Login with SID
SELECT name, sid FROM sys.sql_logins WHERE name = 'fcatameo';
GO

DROP LOGIN fcatameo;
GO

CREATE LOGIN fcatameo
WITH PASSWORD = 'pass@word1', SID = 0x01060000000000640000000000000000C67607213824D148AA12CE7FC4B7F539;

SELECT * FROM sys.sql_logins WHERE name = 'fcatameo';
GO

-- switch database to exdev
USE [exsql]

-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER fcatameo
	FOR LOGIN fcatameo
	WITH DEFAULT_SCHEMA = dbo
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'fcatameo'
GO