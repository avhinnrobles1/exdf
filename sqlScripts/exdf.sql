-- ======================================================================================
-- Create SQL Login template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ======================================================================================

CREATE LOGIN exdf
	WITH PASSWORD = 'pass@word1' 
GO

-- Get the SID here to be used for creating a Login with SID
SELECT name, sid FROM sys.sql_logins WHERE name = 'exdf';
GO

DROP LOGIN exdf;
GO

CREATE LOGIN exdf
WITH PASSWORD = 'pass@word1', SID = 0x01060000000000640000000000000000144CFD58D84850489B535ED63CBA7A31;

SELECT * FROM sys.sql_logins WHERE name = 'exdf';
GO

-- switch database to exdev
USE [exdev]

-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER exdf
	FOR LOGIN exdf
	WITH DEFAULT_SCHEMA = dbo
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'exdf'
GO

-- switch database to master
USE [master]

-- https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-set-firewall-rule-azure-sql-database?view=azure-sqldw-latest
exec sp_set_firewall_rule N'Allow Azure', '13.66.143.128', '13.66.143.128';  
exec sp_set_firewall_rule N'Allow Azure', '20.42.132.209', '20.42.132.209';  


-- curt's ip
exec sp_set_firewall_rule N'Allow Azure', '32.65.74.1', '32.65.74.255';  
