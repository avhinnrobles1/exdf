--Search for 'DECLARE VARIABLES' to set variables

PRINT N'Dropping existing stored procedures'
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetConfiguration]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetConfiguration];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspBackupAndDeletePageViews]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeletePageViews];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspBackupAndDeleteEvent]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteEvent];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspBackupAndDeleteMetrics]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteMetrics];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspBackupAndDeleteTelemetry]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteTelemetry];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteBackupPageViews]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupPageViews];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteBackupEvent]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupEvent];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteBackupMetrics]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupMetrics];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteBackupTelemetry]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupTelemetry];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteStagingPageViews]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingPageViews];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteStagingEvent]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingEvent];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteStagingMetrics]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingMetrics];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspDeleteStagingTelemetry]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingTelemetry];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetStagingPageViewsPerEnvironment]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetStagingPageViewsPerEnvironment];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetStagingPageViewPerformancePerEnvironment]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetStagingPageViewPerformancePerEnvironment];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetStagingEventPerEnvironment]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetStagingEventPerEnvironment];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetStagingMetricsPerEnvironment]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetStagingMetricsPerEnvironment];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspGetStagingTelemetryPerEnvironment]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspGetStagingTelemetryPerEnvironment];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspRestoreBackupPageViews]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupPageViews];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspRestoreBackupEvent]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupEvent];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspRestoreBackupMetrics]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupMetrics];
GO
IF OBJECT_ID('[UsageAnalyticsStaging].[uspRestoreBackupTelemetry]') IS NOT NULL
	DROP PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupTelemetry];
GO

PRINT N'Dropping existing tables'
GO
DROP TABLE IF EXISTS [UsageAnalyticsBackup].[PageViewPerformance]
GO
DROP TABLE IF EXISTS [UsageAnalyticsBackup].[Event]
GO
DROP TABLE IF EXISTS [UsageAnalyticsBackup].[Metrics]
GO
DROP TABLE IF EXISTS [UsageAnalyticsStaging].[PageViews]
GO
DROP TABLE IF EXISTS [UsageAnalyticsStaging].[PageViewPerformance]
GO
DROP TABLE IF EXISTS [UsageAnalyticsStaging].[Event]
GO
DROP TABLE IF EXISTS [UsageAnalyticsStaging].[Metrics]
GO
DROP TABLE IF EXISTS [UsageAnalytics].[PageViews]
GO
DROP TABLE IF EXISTS [UsageAnalytics].[PageViewPerformance]
GO
DROP TABLE IF EXISTS [UsageAnalytics].[Event]
GO
DROP TABLE IF EXISTS [UsageAnalytics].[Metrics]
GO
DROP TABLE IF EXISTS [UsageAnalytics].[Configuration]
GO
DROP TABLE IF EXISTS [UsageAnalyticsBackup].[PageViews]
GO

PRINT N'Dropping existing schemas'
GO
DROP SCHEMA IF EXISTS [UsageAnalytics]
GO
DROP SCHEMA IF EXISTS [UsageAnalyticsBackup]
GO
DROP SCHEMA IF EXISTS [UsageAnalyticsStaging]
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [UsageAnalytics]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [UsageAnalyticsBackup]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [UsageAnalyticsStaging]
AUTHORIZATION [dbo]
GO

PRINT N'Creating [UsageAnalyticsBackup].[PageViews]'
GO
CREATE TABLE [UsageAnalyticsBackup].[PageViews]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[ViewName] [nvarchar] (max) NOT NULL,
[ViewDurationMetricValue] [float] NOT NULL,
[ViewUrl] [nvarchar] (2500) NULL,
[ViewUrlDataBase] [nvarchar] (2000) NULL,
[ViewUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsBackup].[PageViews] ADD CONSTRAINT [PK_BackupPageViews] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsBackup].[PageViewPerformance]'
GO
CREATE TABLE [UsageAnalyticsBackup].[PageViewPerformance]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[ClientPerformanceName] [nvarchar] (max) NOT NULL,
[ClientPerformanceClientProcessValue] [float] NOT NULL,
[ClientPerformanceReceiveRequestValue] [float] NOT NULL,
[ClientPerformanceSendRequestValue] [float] NOT NULL,
[ClientPerformanceTotalValue] [float] NOT NULL,
[ClientPerformanceUrl] [nvarchar] (2500) NULL,
[ClientPerformanceUrlDataBase] [nvarchar] (2000) NULL,
[ClientPerformanceUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsBackup].[PageViewPerformance] ADD CONSTRAINT [PK_BackupPageViewPerformance] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsBackup].[Event]'
GO
CREATE TABLE [UsageAnalyticsBackup].[Event]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[EventName] [nvarchar] (max) NOT NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (10) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsBackup].[Event] ADD CONSTRAINT [PK_BackupEvent] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsBackup].[Metrics]'
GO
CREATE TABLE [UsageAnalyticsBackup].[Metrics]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[ContextDataSyntheticSource] [nvarchar] (max) NULL,

[ContextDeviceType] [nvarchar] (150) NULL,
[ContextDeviceRoleName] [nvarchar] (2000) NULL,
[ContextSessionIsFirst] [bit] NULL,

[ContextCustomDimensionsPortalId] [varchar] (20) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[ContextCustomDimensionsAppSrv_SlotName] [nvarchar] (max) NULL,
[ContextCustomDimensionsAppSrv_SiteName] [nvarchar] (max) NULL,

[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsBackup].[Metrics] ADD CONSTRAINT [PK_BackupMetrics] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO

PRINT N'Creating [UsageAnalyticsStaging].[PageViews]'
GO
CREATE TABLE [UsageAnalyticsStaging].[PageViews]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[ViewName] [nvarchar] (max) NOT NULL,
[ViewDurationMetricValue] [float] NOT NULL,
[ViewUrl] [nvarchar] (2500) NULL,
[ViewUrlDataBase] [nvarchar] (2000) NULL,
[ViewUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsStaging].[PageViews] ADD CONSTRAINT [PK_StagingPageViews] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsStaging].[PageViewPerformance]'
GO
CREATE TABLE [UsageAnalyticsStaging].[PageViewPerformance]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[ClientPerformanceName] [nvarchar] (max) NOT NULL,
[ClientPerformanceClientProcessValue] [float] NOT NULL,
[ClientPerformanceReceiveRequestValue] [float] NOT NULL,
[ClientPerformanceSendRequestValue] [float] NOT NULL,
[ClientPerformanceTotalValue] [float] NOT NULL,
[ClientPerformanceUrl] [nvarchar] (2500) NULL,
[ClientPerformanceUrlDataBase] [nvarchar] (2000) NULL,
[ClientPerformanceUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsStaging].[PageViewPerformance] ADD CONSTRAINT [PK_StagingPageViewPerformance] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsStaging].[Event]'
GO
CREATE TABLE [UsageAnalyticsStaging].[Event]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[EventName] [nvarchar] (max) NOT NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (10) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsStaging].[Event] ADD CONSTRAINT [PK_StagingEvent] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO
PRINT N'Creating [UsageAnalyticsStaging].[Metrics]'
GO
CREATE TABLE [UsageAnalyticsStaging].[Metrics]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [varchar] (36) NOT NULL,
[ContextDataSyntheticSource] [nvarchar] (max) NULL,

[ContextDeviceType] [nvarchar] (150) NULL,
[ContextDeviceRoleName] [nvarchar] (2000) NULL,
[ContextSessionIsFirst] [bit] NULL,

[ContextCustomDimensionsPortalId] [varchar] (20) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[ContextCustomDimensionsAppSrv_SlotName] [nvarchar] (max) NULL,
[ContextCustomDimensionsAppSrv_SiteName] [nvarchar] (max) NULL,

[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalyticsStaging].[Metrics] ADD CONSTRAINT [PK_StagingMetrics] PRIMARY KEY CLUSTERED  ([TelemetryDate] DESC, [InternalDataId])
GO




PRINT N'Creating [UsageAnalytics].[PageViews]'
GO
CREATE TABLE [UsageAnalytics].[PageViews]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[ViewName] [nvarchar] (max) NOT NULL,
[ViewDurationMetricValue] [float] NOT NULL,
[ViewUrl] [nvarchar] (2500) NULL,
[ViewUrlDataBase] [nvarchar] (2000) NULL,
[ViewUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalytics].[PageViews] ADD CONSTRAINT [PK_PageViews] PRIMARY KEY CLUSTERED  ([ContextDataEventTime], [InternalDataId])
GO
ADD SENSITIVITY CLASSIFICATION TO [UsageAnalytics].[PageViews].[ContextUserAuthId] WITH (LABEL = 'Highly Confidential - GDPR', LABEL_ID = '4234ea7a-ca3f-4b2e-bce2-fabf0d906471', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO
PRINT N'Creating [UsageAnalytics].[PageViewPerformance]'
GO
CREATE TABLE [UsageAnalytics].[PageViewPerformance]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[ClientPerformanceName] [nvarchar] (max) NOT NULL,
[ClientPerformanceClientProcessValue] [float] NOT NULL,
[ClientPerformanceReceiveRequestValue] [float] NOT NULL,
[ClientPerformanceSendRequestValue] [float] NOT NULL,
[ClientPerformanceTotalValue] [float] NOT NULL,
[ClientPerformanceUrl] [nvarchar] (2500) NULL,
[ClientPerformanceUrlDataBase] [nvarchar] (2000) NULL,
[ClientPerformanceUrlDataHost] [nvarchar] (250) NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalytics].[PageViewPerformance] ADD CONSTRAINT [PK_PageViewPerformance] PRIMARY KEY CLUSTERED  ([ContextDataEventTime], [InternalDataId])
GO
ADD SENSITIVITY CLASSIFICATION TO [UsageAnalytics].[PageViewPerformance].[ContextUserAuthId] WITH (LABEL = 'Highly Confidential - GDPR', LABEL_ID = '4234ea7a-ca3f-4b2e-bce2-fabf0d906471', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO
PRINT N'Creating [UsageAnalytics].[Event]'
GO
CREATE TABLE [UsageAnalytics].[Event]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[EventName] [nvarchar] (max) NOT NULL,
[ContextDeviceId] [nvarchar] (150) NULL,
[ContextDeviceName] [nvarchar] (250) NULL,
[ContextDeviceOSVersion] [nvarchar] (150) NULL,
[ContextDeviceBrowser] [nvarchar] (50) NULL,
[ContextDeviceBrowserVersion] [nvarchar] (50) NULL,
[ContextUserAuthId] [nvarchar] (2000) NULL,
[ContextUserAnonId] [nvarchar] (2000) NULL,
[ContextSessionId] [nvarchar] (max) NULL,
[ContextSessionIsFirst] [bit] NULL,
[ContextOperationId] [nvarchar] (max) NULL,
[ContextOperationParentId] [nvarchar] (max) NULL,
[ContextLocationContinent] [nvarchar] (50) NULL,
[ContextLocationCountry] [nvarchar] (150) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (10) NULL,
[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalytics].[Event] ADD CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED  ([ContextDataEventTime], [InternalDataId])
GO
ADD SENSITIVITY CLASSIFICATION TO [UsageAnalytics].[Event].[ContextUserAuthId] WITH (LABEL = 'Highly Confidential - GDPR', LABEL_ID = '4234ea7a-ca3f-4b2e-bce2-fabf0d906471', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO
PRINT N'Creating [UsageAnalytics].[Metrics]'
GO
CREATE TABLE [UsageAnalytics].[Metrics]
(
[ContextDataEventTime] [datetime] NOT NULL,
[InternalDataId] [uniqueidentifier] NOT NULL,
[ContextDataSyntheticSource] [nvarchar] (max) NULL,

[ContextDeviceType] [nvarchar] (150) NULL,
[ContextDeviceRoleName] [nvarchar] (2000) NULL,
[ContextSessionIsFirst] [bit] NULL,

[ContextCustomDimensionsPortalId] [varchar] (20) NULL,
[ContextCustomDimensionsRoleEnvironment] [varchar] (20) NULL,
[ContextCustomDimensionsAppSrv_SlotName] [nvarchar] (max) NULL,
[ContextCustomDimensionsAppSrv_SiteName] [nvarchar] (max) NULL,

[TelemetryIngestBatchId] [uniqueidentifier] NOT NULL,
[TelemetryDate] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [UsageAnalytics].[Metrics] ADD CONSTRAINT [PK_Metrics] PRIMARY KEY CLUSTERED  ([ContextDataEventTime], [InternalDataId])
GO
--ADD SENSITIVITY CLASSIFICATION TO [UsageAnalytics].[Metrics].[ContextUserAuthId] WITH (LABEL = 'Highly Confidential - GDPR', LABEL_ID = '4234ea7a-ca3f-4b2e-bce2-fabf0d906471', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO





PRINT N'Creating [UsageAnalytics].[Configuration]'
GO
CREATE TABLE [UsageAnalytics].[Configuration]
(
[Group] [varchar] (50) NOT NULL,
[Key] [varchar] (50) NOT NULL,
[Value] [nvarchar] (max) NOT NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Configuration_CreatedDate] DEFAULT (getdate()),
[CreatedBy] [varchar] (100) NOT NULL,
[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Configuration_LastModifiedDate] DEFAULT (getdate()),
[LastModifiedBy] [varchar] (100) NOT NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Configuration_IsDeleted] DEFAULT ((0))
)
GO
ALTER TABLE [UsageAnalytics].[Configuration] ADD CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED  ([Group], [Key])
GO








PRINT 'Creating [UsageAnalyticsStaging].[uspGetConfiguration]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
EXEC [UsageAnalyticsStaging].[uspGetConfiguration]
	@ConfigurationGroup = 'PageViews'
*/

CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetConfiguration]
	@ConfigurationGroup [varchar](50) = NULL,
	@ConfigurationKey [varchar](50) = NULL,
	@DebugMode BIT = 0
AS
BEGIN
	
	IF @DebugMode = 1
	BEGIN
		SELECT * 
		FROM [UsageAnalytics].[Configuration]
		WHERE 
		(
			@ConfigurationGroup IS NULL
			OR [Group] = @ConfigurationGroup
			OR [Group] = 'All'
		)
		AND
		(
			@ConfigurationKey IS NULL
			OR [Key] = @ConfigurationKey
		)
		AND IsDeleted = 0
	END


	--DECLARE @ConfigurationGroup [varchar](50) = 'PageViews'
	--	,@ConfigurationKey [varchar](50) = NULL
	SELECT
		@ConfigurationGroup AS AppInsightsTopic
		,*
		,(SELECT CAST([Value] AS bit)
		FROM [UsageAnalytics].[Configuration]
		WHERE [Key] = 
			CASE
				WHEN @ConfigurationGroup = 'PageViews'
				THEN 'IngestPageViews'
				WHEN @ConfigurationGroup = 'PageViewPerformance'
				THEN 'IngestPageViewPerformance'
				WHEN @ConfigurationGroup = 'Event'
				THEN 'IngestEvent'
				WHEN @ConfigurationGroup = 'Metrics'
				THEN 'IngestMetrics'
			END
		AND [Group] = @ConfigurationGroup) AS [IngestEnabled]
		,
		(SELECT [Value]
		FROM [UsageAnalytics].[Configuration]
		WHERE [Key] = 'StagingColumnsMapping'
		AND [Group] = @ConfigurationGroup) AS [StagingColumnsMapping]
		,
		(SELECT [Value]
		FROM [UsageAnalytics].[Configuration]
		WHERE [Key] = 'LandingColumnsMapping'
		AND [Group] = @ConfigurationGroup) AS [LandingColumnsMapping]
	FROM
	(
		SELECT
			[Key], [Value]
		FROM [UsageAnalytics].[Configuration]
		WHERE 
		(
			@ConfigurationGroup IS NULL
			OR [Group] = @ConfigurationGroup
			OR [Group] = 'All'
		)
		AND
		(
			@ConfigurationKey IS NULL
			OR [Key] = @ConfigurationKey
		)
		AND IsDeleted = 0
		AND [Key] NOT IN ('StagingColumnsMapping', 'LandingColumnsMapping')
	) AS PivotedTable
	PIVOT 
	(
		MAX([Value])
		FOR [Key] IN 
		(
			[AppInsightsDirectory]
			,[ContextCustomDimensionsEnvironmentColumnName]
			,[IncludeNullEnvironment]
			,[DefaultEnvironment]
			,[ToOtherEnvironment1]
			,[ToOtherEnvironment2]
			,[ToOtherEnvironment3]
			,[ToOtherEnvironment4]
			,[ContainerName]
		)
	) AS Pivoted

END;
GO








PRINT N'Creating [UsageAnalyticsStaging].[uspBackupAndDeletePageViews]'
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/* 
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspBackupAndDeletePageViews]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeletePageViews]
	@TelemetryDate [varchar](10)
AS
BEGIN
	DECLARE @IsIngestAlreadyInProgress BIT = 0

	BEGIN TRANSACTION

	BEGIN TRY
		IF EXISTS
		(
			SELECT [TelemetryDate]
			FROM [UsageAnalyticsBackup].[PageViews]
			WHERE [TelemetryDate] = @TelemetryDate
		)
		BEGIN
			SET @IsIngestAlreadyInProgress = 1
		END
		ELSE
		BEGIN
			SET @IsIngestAlreadyInProgress = 0

			DELETE [UsageAnalytics].[PageViews]
			OUTPUT DELETED.* 
			INTO [UsageAnalyticsBackup].[PageViews]
			FROM [UsageAnalytics].[PageViews]
			WHERE [TelemetryDate] = @TelemetryDate
		END

		SELECT @IsIngestAlreadyInProgress AS IsIngestAlreadyInProgress
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   ); 

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
	END CATCH

	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/* 
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance]
	@TelemetryDate [varchar](10)
AS
BEGIN
	DECLARE @IsIngestAlreadyInProgress BIT = 0

	BEGIN TRANSACTION

	BEGIN TRY
		IF EXISTS
		(
			SELECT [TelemetryDate]
			FROM [UsageAnalyticsBackup].[PageViewPerformance]
			WHERE [TelemetryDate] = @TelemetryDate
		)
		BEGIN
			SET @IsIngestAlreadyInProgress = 1
		END
		ELSE
		BEGIN
			SET @IsIngestAlreadyInProgress = 0

			DELETE [UsageAnalytics].[PageViewPerformance]
			OUTPUT DELETED.* 
			INTO [UsageAnalyticsBackup].[PageViewPerformance]
			FROM [UsageAnalytics].[PageViewPerformance]
			WHERE [TelemetryDate] = @TelemetryDate
		END

		SELECT @IsIngestAlreadyInProgress AS IsIngestAlreadyInProgress
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   ); 

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
	END CATCH

	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspBackupAndDeleteEvent]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/* 
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspBackupAndDeleteEvent]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteEvent]
	@TelemetryDate [varchar](10)
AS
BEGIN
	DECLARE @IsIngestAlreadyInProgress BIT = 0

	BEGIN TRANSACTION

	BEGIN TRY
		IF EXISTS
		(
			SELECT [TelemetryDate]
			FROM [UsageAnalyticsBackup].[Event]
			WHERE [TelemetryDate] = @TelemetryDate
		)
		BEGIN
			SET @IsIngestAlreadyInProgress = 1
		END
		ELSE
		BEGIN
			SET @IsIngestAlreadyInProgress = 0

			DELETE [UsageAnalytics].[Event]
			OUTPUT DELETED.* 
			INTO [UsageAnalyticsBackup].[Event]
			FROM [UsageAnalytics].[Event]
			WHERE [TelemetryDate] = @TelemetryDate
		END

		SELECT @IsIngestAlreadyInProgress AS IsIngestAlreadyInProgress
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   ); 

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
	END CATCH

	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspBackupAndDeleteMetrics]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/* 
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspBackupAndDeleteMetrics]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteMetrics]
	@TelemetryDate [varchar](10)
AS
BEGIN
	DECLARE @IsIngestAlreadyInProgress BIT = 0

	BEGIN TRANSACTION

	BEGIN TRY
		IF EXISTS
		(
			SELECT [TelemetryDate]
			FROM [UsageAnalyticsBackup].[Metrics]
			WHERE [TelemetryDate] = @TelemetryDate
		)
		BEGIN
			SET @IsIngestAlreadyInProgress = 1
		END
		ELSE
		BEGIN
			SET @IsIngestAlreadyInProgress = 0

			DELETE [UsageAnalytics].[Metrics]
			OUTPUT DELETED.* 
			INTO [UsageAnalyticsBackup].[Metrics]
			FROM [UsageAnalytics].[Metrics]
			WHERE [TelemetryDate] = @TelemetryDate
		END

		SELECT @IsIngestAlreadyInProgress AS IsIngestAlreadyInProgress
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage, -- Message text.  
				   @ErrorSeverity, -- Severity.  
				   @ErrorState -- State.  
				   ); 

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
	END CATCH

	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspBackupAndDeleteTelemetry]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/* 
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspBackupAndDeleteTelemetry]
	@TelemetryDate = '2020-04-01',
	@AppInsightsTopic = 'PageViews'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspBackupAndDeleteTelemetry]
	@TelemetryDate [varchar](10),
	@AppInsightsTopic [varchar](250)
AS
BEGIN

	IF @AppInsightsTopic = 'PageViews'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspBackupAndDeletePageViews]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'PageViewPerformance'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspBackupAndDeletePageViewPerformance]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Event'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspBackupAndDeleteEvent]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Metrics'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspBackupAndDeleteMetrics]
			@TelemetryDate = @TelemetryDate
	END

END;
GO









PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteBackupPageViews]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteBackupPageViews]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupPageViews]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[PageViews]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[PageViewPerformance]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteBackupEvent]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteBackupEvent]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupEvent]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[Event]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteBackupMetrics]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteBackupMetrics]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupMetrics]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[Metrics]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteBackupTelemetry]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteBackupTelemetry]
	@TelemetryDate = '2020-04-01',
	@AppInsightsTopic = 'PageViews'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteBackupTelemetry]
	@TelemetryDate [varchar](10),
	@AppInsightsTopic [varchar](250)
AS
BEGIN

	IF @AppInsightsTopic = 'PageViews'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteBackupPageViews]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'PageViewPerformance'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteBackupPageViewPerformance]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Event'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteBackupEvent]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Metrics'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteBackupMetrics]
			@TelemetryDate = @TelemetryDate
	END

END;
GO






PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteStagingPageViews]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalyticsStaging].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteStagingPageViews]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsStaging].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingPageViews]
	@TelemetryDate [varchar](10)
AS
BEGIN
	
	DELETE FROM [UsageAnalyticsStaging].[PageViews] 
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalyticsStaging].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsStaging].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance]
	@TelemetryDate [varchar](10)
AS
BEGIN
	
	DELETE FROM [UsageAnalyticsStaging].[PageViewPerformance] 
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteStagingEvent]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalyticsStaging].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteStagingEvent]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsStaging].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingEvent]
	@TelemetryDate [varchar](10)
AS
BEGIN
	
	DELETE FROM [UsageAnalyticsStaging].[Event] 
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteStagingMetrics]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalyticsStaging].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteStagingMetrics]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsStaging].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingMetrics]
	@TelemetryDate [varchar](10)
AS
BEGIN
	
	DELETE FROM [UsageAnalyticsStaging].[Metrics] 
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspDeleteStagingTelemetry]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalyticsStaging].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspDeleteStagingTelemetry]
	@TelemetryDate = '2020-04-01',
	@AppInsightsTopic = 'PageViews'
SELECT * FROM [UsageAnalyticsStaging].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspDeleteStagingTelemetry]
	@TelemetryDate [varchar](10),
	@AppInsightsTopic [varchar](250)
AS
BEGIN
	
	IF @AppInsightsTopic = 'PageViews'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteStagingPageViews]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'PageViewPerformance'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteStagingPageViewPerformance]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Event'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteStagingEvent]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Metrics'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspDeleteStagingMetrics]
			@TelemetryDate = @TelemetryDate
	END

END;
GO












PRINT N'Creating [UsageAnalyticsStaging].[uspGetStagingPageViewsPerEnvironment]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetStagingPageViewsPerEnvironment]
	@TelemetryDate [varchar](10),
	@ToEnvironment [varchar](20),
	@IncludeNullEnvironment [bit] = 0,
	@ContextCustomDimensionsEnvironmentColumnName varchar(250) = 'ContextCustomDimensionsRoleEnvironment'
AS
BEGIN

	DECLARE @SQL nvarchar(max)

	SET @SQL = N'
		SELECT * 
		FROM [UsageAnalyticsStaging].[PageViews]
		WHERE [TelemetryDate] = @TelemetryDate 
		AND
		(
			[' + @ContextCustomDimensionsEnvironmentColumnName + '] = @ToEnvironment
			OR 
			(
				@IncludeNullEnvironment = 1
				AND [' + @ContextCustomDimensionsEnvironmentColumnName + '] IS NULL
			)
		)'

	PRINT @SQL

	EXEC sp_executesql @SQL
		,N'@TelemetryDate [varchar](10)
		,@ToEnvironment [varchar](20)
		,@IncludeNullEnvironment [bit]'
		,@TelemetryDate = @TelemetryDate
		,@ToEnvironment = @ToEnvironment
		,@IncludeNullEnvironment = @IncludeNullEnvironment

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspGetStagingPageViewPerformancePerEnvironment]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetStagingPageViewPerformancePerEnvironment]
	@TelemetryDate [varchar](10),
	@ToEnvironment [varchar](20),
	@IncludeNullEnvironment [bit] = 0,
	@ContextCustomDimensionsEnvironmentColumnName varchar(250) = 'ContextCustomDimensionsRoleEnvironment'
AS
BEGIN
	
	DECLARE @SQL nvarchar(max)

	SET @SQL = N'
		SELECT * 
		FROM [UsageAnalyticsStaging].[PageViewPerformance] 
		WHERE [TelemetryDate] = @TelemetryDate 
		AND
		(
			[' + @ContextCustomDimensionsEnvironmentColumnName + '] = @ToEnvironment
			OR 
			(
				@IncludeNullEnvironment = 1
				AND [' + @ContextCustomDimensionsEnvironmentColumnName + '] IS NULL
			)
		)'

	PRINT @SQL

	EXEC sp_executesql @SQL
		,N'@TelemetryDate [varchar](10)
		,@ToEnvironment [varchar](20)
		,@IncludeNullEnvironment [bit]'
		,@TelemetryDate = @TelemetryDate
		,@ToEnvironment = @ToEnvironment
		,@IncludeNullEnvironment = @IncludeNullEnvironment

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspGetStagingEventPerEnvironment]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetStagingEventPerEnvironment]
	@TelemetryDate [varchar](10),
	@ToEnvironment [varchar](20),
	@IncludeNullEnvironment [bit] = 0,
	@ContextCustomDimensionsEnvironmentColumnName varchar(250) = 'ContextCustomDimensionsRoleEnvironment'
AS
BEGIN

	DECLARE @SQL nvarchar(max)

	SET @SQL = N'
		SELECT * 
		FROM [UsageAnalyticsStaging].[Event]
		WHERE [TelemetryDate] = @TelemetryDate 
		AND
		(
			[' + @ContextCustomDimensionsEnvironmentColumnName + '] = @ToEnvironment
			OR 
			(
				@IncludeNullEnvironment = 1
				AND [' + @ContextCustomDimensionsEnvironmentColumnName + '] IS NULL
			)
		)'

	PRINT @SQL

	EXEC sp_executesql @SQL
		,N'@TelemetryDate [varchar](10)
		,@ToEnvironment [varchar](20)
		,@IncludeNullEnvironment [bit]'
		,@TelemetryDate = @TelemetryDate
		,@ToEnvironment = @ToEnvironment
		,@IncludeNullEnvironment = @IncludeNullEnvironment

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspGetStagingMetricsPerEnvironment]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetStagingMetricsPerEnvironment]
	@TelemetryDate [varchar](10),
	@ToEnvironment [varchar](20),
	@IncludeNullEnvironment [bit] = 0,
	@ContextCustomDimensionsEnvironmentColumnName varchar(250) = 'ContextCustomDimensionsRoleEnvironment'
AS
BEGIN

	DECLARE @SQL nvarchar(max)

	SET @SQL = N'
		SELECT * 
		FROM [UsageAnalyticsStaging].[Metrics]
		WHERE [TelemetryDate] = @TelemetryDate 
		AND
		(
			[' + @ContextCustomDimensionsEnvironmentColumnName + '] = @ToEnvironment
			OR 
			(
				@IncludeNullEnvironment = 1
				AND [' + @ContextCustomDimensionsEnvironmentColumnName + '] IS NULL
			)
		)'

	PRINT @SQL

	EXEC sp_executesql @SQL
		,N'@TelemetryDate [varchar](10)
		,@ToEnvironment [varchar](20)
		,@IncludeNullEnvironment [bit]'
		,@TelemetryDate = @TelemetryDate
		,@ToEnvironment = @ToEnvironment
		,@IncludeNullEnvironment = @IncludeNullEnvironment

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspGetStagingTelemetryPerEnvironment]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [UsageAnalyticsStaging].[uspGetStagingTelemetryPerEnvironment]
	@TelemetryDate [varchar](10),
	@ToEnvironment [varchar](20),
	@IncludeNullEnvironment [bit] = 0,
	@AppInsightsTopic [varchar](250),
	@ContextCustomDimensionsEnvironmentColumnName varchar(250) = 'ContextCustomDimensionsRoleEnvironment'
AS
BEGIN

	IF @AppInsightsTopic = 'PageViews'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspGetStagingPageViewsPerEnvironment]
			@TelemetryDate = @TelemetryDate,
			@ToEnvironment = @ToEnvironment,
			@IncludeNullEnvironment = @IncludeNullEnvironment,
			@ContextCustomDimensionsEnvironmentColumnName = @ContextCustomDimensionsEnvironmentColumnName
	END
	ELSE IF @AppInsightsTopic = 'PageViewPerformance'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspGetStagingPageViewPerformancePerEnvironment]
			@TelemetryDate = @TelemetryDate,
			@ToEnvironment = @ToEnvironment,
			@IncludeNullEnvironment = @IncludeNullEnvironment,
			@ContextCustomDimensionsEnvironmentColumnName = @ContextCustomDimensionsEnvironmentColumnName
	END
	ELSE IF @AppInsightsTopic = 'Event'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspGetStagingEventPerEnvironment]
			@TelemetryDate = @TelemetryDate,
			@ToEnvironment = @ToEnvironment,
			@IncludeNullEnvironment = @IncludeNullEnvironment,
			@ContextCustomDimensionsEnvironmentColumnName = @ContextCustomDimensionsEnvironmentColumnName
	END
	ELSE IF @AppInsightsTopic = 'Metrics'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspGetStagingMetricsPerEnvironment]
			@TelemetryDate = @TelemetryDate,
			@ToEnvironment = @ToEnvironment,
			@IncludeNullEnvironment = @IncludeNullEnvironment,
			@ContextCustomDimensionsEnvironmentColumnName = @ContextCustomDimensionsEnvironmentColumnName
	END

END;
GO











PRINT N'Creating [UsageAnalyticsStaging].[uspRestoreBackupPageViews]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspRestoreBackupPageViews]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupPageViews]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[PageViews]
	OUTPUT DELETED.* 
    INTO [UsageAnalytics].[PageViews]
	FROM [UsageAnalyticsBackup].[PageViews]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViewPerformance] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[PageViewPerformance]
	OUTPUT DELETED.* 
    INTO [UsageAnalytics].[PageViewPerformance]
	FROM [UsageAnalyticsBackup].[PageViewPerformance]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspRestoreBackupEvent]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspRestoreBackupEvent]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Event] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Event] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupEvent]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[Event]
	OUTPUT DELETED.* 
    INTO [UsageAnalytics].[Event]
	FROM [UsageAnalyticsBackup].[Event]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspRestoreBackupMetrics]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspRestoreBackupMetrics]
	@TelemetryDate = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[Metrics] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupMetrics]
	@TelemetryDate [varchar](10)
AS
BEGIN

	DELETE FROM [UsageAnalyticsBackup].[Metrics]
	OUTPUT DELETED.* 
    INTO [UsageAnalytics].[Metrics]
	FROM [UsageAnalyticsBackup].[Metrics]
	WHERE [TelemetryDate] = @TelemetryDate

END;
GO
PRINT N'Creating [UsageAnalyticsStaging].[uspRestoreBackupTelemetry]'
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
/*
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
EXEC [UsageAnalyticsStaging].[uspRestoreBackupTelemetry]
	@TelemetryDate = '2020-04-01',
	@AppInsightsTopic = 'PageViews'
SELECT * FROM [UsageAnalyticsBackup].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
SELECT * FROM [UsageAnalytics].[PageViews] WHERE [TelemetryDate] = '2020-04-01'
*/
-- =============================================

CREATE PROCEDURE [UsageAnalyticsStaging].[uspRestoreBackupTelemetry]
	@TelemetryDate [varchar](10),
	@AppInsightsTopic [varchar](250)
AS
BEGIN

	IF @AppInsightsTopic = 'PageViews'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspRestoreBackupPageViews]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'PageViewPerformance'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspRestoreBackupPageViewPerformance]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Event'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspRestoreBackupEvent]
			@TelemetryDate = @TelemetryDate
	END
	ELSE IF @AppInsightsTopic = 'Metrics'
	BEGIN
		EXEC [UsageAnalyticsStaging].[uspRestoreBackupMetrics]
			@TelemetryDate = @TelemetryDate
	END

END;
GO
















-- DECLARE VARIABLES
DECLARE @DatabaseServer VARCHAR(MAX) = N'exsql3.database.windows.net'; -- oldvalue: 
DECLARE @AppInsightsDirectory VARCHAR(MAX) = N'az1.pex.ai_80fd3003ab2745f3b23ad777eda9dedf'; -- oldvalue: 
DECLARE @ContainerName VARCHAR(MAX) = N'az1-pex-ai-container'; -- oldvalue: 
DECLARE @DefaultDBEnvironment VARCHAR(MAX) = N'exdb3'; -- oldvalue: 
DECLARE @StorageAccountName VARCHAR(MAX) = N'exsav2'; -- oldvalue: 
DECLARE @Author VARCHAR(MAX) = N'avhinn18.az1@gmail.com'; -- oldvalue: 
-- UPDATE EXAI_LS credentials in azure

PRINT 'Populating [UsageAnalytics].[Configuration]'
--TRUNCATE TABLE [UsageAnalytics].[Configuration]
INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'AppInsightsDirectory'
	,[Group] = 'All'
    ,[Value] = @AppInsightsDirectory
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'AppInsightsDirectory'
)

UNION ALL

SELECT
	[Key] = 'ContainerName'
	,[Group] = 'All'
    ,[Value] = @ContainerName
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ContainerName'
)

UNION ALL

SELECT
	[Key] = 'DefaultEnvironment'
	,[Group] = 'All'
    ,[Value] = @DefaultDBEnvironment
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'DefaultEnvironment'
)

UNION ALL

SELECT
	[Key] = 'ContextCustomDimensionsEnvironmentColumnName'
	,[Group] = 'All'
    ,[Value] = N'ContextCustomDimensionsRoleEnvironment'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ContextCustomDimensionsEnvironmentColumnName'
)

UNION ALL

SELECT
	[Key] = 'IncludeNullEnvironment'
	,[Group] = 'All'
    ,[Value] = N'true'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'IncludeNullEnvironment'
)

UNION ALL

SELECT
	[Key] = 'ToOtherEnvironment1'
	,[Group] = 'All'
    ,[Value] = N''
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ToOtherEnvironment1'
)

UNION ALL

SELECT
	[Key] = 'ToOtherEnvironment2'
	,[Group] = 'All'
    ,[Value] = N''
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ToOtherEnvironment2'
)

UNION ALL

SELECT
	[Key] = 'ToOtherEnvironment3'
	,[Group] = 'All'
    ,[Value] = N''
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ToOtherEnvironment3'
)

UNION ALL

SELECT
	[Key] = 'ToOtherEnvironment4'
	,[Group] = 'All'
    ,[Value] = N''
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1958'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1958'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'ToOtherEnvironment4'
)

UNION ALL

SELECT
	[Key] = 'StagingColumnsMapping'
	,[Group] = 'PageViews'
    ,[Value] = N'{
    "type": "TabularTranslator",
    "mappings": [
        {
            "source": {
                "path": "$[''view''][0][''name'']"
            },
            "sink": {
                "name": "ViewName",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''view''][0][''durationMetric''][''value'']"
            },
            "sink": {
                "name": "ViewDurationMetricValue",
                "type": "Double"
            }
        },
        {
            "source": {
                "path": "$[''view''][0][''url'']"
            },
            "sink": {
                "name": "ViewUrl",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''view''][0][''urlData''][''base'']"
            },
            "sink": {
                "name": "ViewUrlDataBase",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''view''][0][''urlData''][''host'']"
            },
            "sink": {
                "name": "ViewUrlDataHost",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''internal''][''data''][''id'']"
            },
            "sink": {
                "name": "InternalDataId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''data''][''eventTime'']"
            },
            "sink": {
                "name": "ContextDataEventTime",
                "type": "DateTime"
            }
        },
        {
            "source": {
                "path": "$[''context''][''device''][''id'']"
            },
            "sink": {
                "name": "ContextDeviceId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''device''][''osVersion'']"
            },
            "sink": {
                "name": "ContextDeviceOSVersion",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''device''][''deviceName'']"
            },
            "sink": {
                "name": "ContextDeviceName",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''device''][''browser'']"
            },
            "sink": {
                "name": "ContextDeviceBrowser",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''device''][''browserVersion'']"
            },
            "sink": {
                "name": "ContextDeviceBrowserVersion",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''user''][''anonId'']"
            },
            "sink": {
                "name": "ContextUserAnonId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''user''][''authId'']"
            },
            "sink": {
                "name": "ContextUserAuthId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''session''][''id'']"
            },
            "sink": {
                "name": "ContextSessionId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''session''][''isFirst'']"
            },
            "sink": {
                "name": "ContextSessionIsFirst",
                "type": "Boolean"
            }
        },
        {
            "source": {
                "path": "$[''context''][''operation''][''id'']"
            },
            "sink": {
                "name": "ContextOperationId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''operation''][''parentId'']"
            },
            "sink": {
                "name": "ContextOperationParentId",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''location''][''continent'']"
            },
            "sink": {
                "name": "ContextLocationContinent",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''location''][''country'']"
            },
            "sink": {
                "name": "ContextLocationCountry",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''context''][''custom''][''dimensions''][0][''RoleEnvironment'']"
            },
            "sink": {
                "name": "ContextCustomDimensionsRoleEnvironment",
                "type": "String"
            }
        },
        {
            "source": {
                "path": "$[''TelemetryIngestBatchId'']"
            },
            "sink": {
                "name": "TelemetryIngestBatchId",
                "type": "Guid"
            }
        },
        {
            "source": {
                "path": "$[''TelemetryDate'']"
            },
            "sink": {
                "name": "TelemetryDate",
                "type": "String"
            }
        }
    ],
    "collectionReference": ""
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'StagingColumnsMapping'
	AND C2.[Group] = 'PageViews'
)

UNION ALL

SELECT
	[Key] = 'LandingColumnsMapping'
	,[Group] = 'PageViews'
    ,[Value] = N'{
    "type": "TabularTranslator",
    "mappings": [
        {
            "source": {
                "name": "ContextDataEventTime",
                "type": "DateTime"
            },
            "sink": {
                "name": "ContextDataEventTime",
                "type": "DateTime"
            }
        },
        {
            "source": {
                "name": "InternalDataId",
                "type": "String"
            },
            "sink": {
                "name": "InternalDataId",
                "type": "Guid"
            }
        },
        {
            "source": {
                "name": "ViewName",
                "type": "String"
            },
            "sink": {
                "name": "ViewName",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ViewDurationMetricValue",
                "type": "Double"
            },
            "sink": {
                "name": "ViewDurationMetricValue",
                "type": "Double"
            }
        },
        {
            "source": {
                "name": "ViewUrl",
                "type": "String"
            },
            "sink": {
                "name": "ViewUrl",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ViewUrlDataBase",
                "type": "String"
            },
            "sink": {
                "name": "ViewUrlDataBase",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ViewUrlDataHost",
                "type": "String"
            },
            "sink": {
                "name": "ViewUrlDataHost",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextDeviceId",
                "type": "String"
            },
            "sink": {
                "name": "ContextDeviceId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextDeviceName",
                "type": "String"
            },
            "sink": {
                "name": "ContextDeviceName",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextDeviceOSVersion",
                "type": "String"
            },
            "sink": {
                "name": "ContextDeviceOSVersion",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextDeviceBrowser",
                "type": "String"
            },
            "sink": {
                "name": "ContextDeviceBrowser",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextDeviceBrowserVersion",
                "type": "String"
            },
            "sink": {
                "name": "ContextDeviceBrowserVersion",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextUserAuthId",
                "type": "String"
            },
            "sink": {
                "name": "ContextUserAuthId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextUserAnonId",
                "type": "String"
            },
            "sink": {
                "name": "ContextUserAnonId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextSessionId",
                "type": "String"
            },
            "sink": {
                "name": "ContextSessionId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextSessionIsFirst",
                "type": "Boolean"
            },
            "sink": {
                "name": "ContextSessionIsFirst",
                "type": "Boolean"
            }
        },
        {
            "source": {
                "name": "ContextOperationId",
                "type": "String"
            },
            "sink": {
                "name": "ContextOperationId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextOperationParentId",
                "type": "String"
            },
            "sink": {
                "name": "ContextOperationParentId",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextLocationContinent",
                "type": "String"
            },
            "sink": {
                "name": "ContextLocationContinent",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextLocationCountry",
                "type": "String"
            },
            "sink": {
                "name": "ContextLocationCountry",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "ContextCustomDimensionsRoleEnvironment",
                "type": "String"
            },
            "sink": {
                "name": "ContextCustomDimensionsRoleEnvironment",
                "type": "String"
            }
        },
        {
            "source": {
                "name": "TelemetryIngestBatchId",
                "type": "Guid"
            },
            "sink": {
                "name": "TelemetryIngestBatchId",
                "type": "Guid"
            }
        },
        {
            "source": {
                "name": "TelemetryDate",
                "type": "String"
            },
            "sink": {
                "name": "TelemetryDate",
                "type": "String"
            }
        }
    ]
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'LandingColumnsMapping'
	AND C2.[Group] = 'PageViews'
)




--DELETE FROM [UsageAnalytics].[Configuration]
--WHERE [Group] = 'PageViewPerformance'

INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'StagingColumnsMapping'
	,[Group] = 'PageViewPerformance'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "path": "$[''clientPerformance''][0][''name'']"
      },
      "sink": {
        "name": "ClientPerformanceName",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''clientProcess''][''value'']"
      },
      "sink": {
        "name": "ClientPerformanceClientProcessValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''receiveRequest''][''value'']"
      },
      "sink": {
        "name": "ClientPerformanceReceiveRequestValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''sendRequest''][''value'']"
      },
      "sink": {
        "name": "ClientPerformanceSendRequestValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''total''][''value'']"
      },
      "sink": {
        "name": "ClientPerformanceTotalValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''url'']"
      },
      "sink": {
        "name": "ClientPerformanceUrl",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''urlData''][''base'']"
      },
      "sink": {
        "name": "ClientPerformanceUrlDataBase",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''clientPerformance''][0][''urlData''][''host'']"
      },
      "sink": {
        "name": "ClientPerformanceUrlDataHost",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''internal''][''data''][''id'']"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''data''][''eventTime'']"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''id'']"
      },
      "sink": {
        "name": "ContextDeviceId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''osVersion'']"
      },
      "sink": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''deviceName'']"
      },
      "sink": {
        "name": "ContextDeviceName",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''browser'']"
      },
      "sink": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''browserVersion'']"
      },
      "sink": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''user''][''anonId'']"
      },
      "sink": {
        "name": "ContextUserAnonId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''user''][''authId'']"
      },
      "sink": {
        "name": "ContextUserAuthId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''session''][''id'']"
      },
      "sink": {
        "name": "ContextSessionId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''session''][''isFirst'']"
      },
      "sink": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      }
    },
    {
      "source": {
        "path": "$[''context''][''operation''][''id'']"
      },
      "sink": {
        "name": "ContextOperationId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''operation''][''parentId'']"
      },
      "sink": {
        "name": "ContextOperationParentId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''location''][''continent'']"
      },
      "sink": {
        "name": "ContextLocationContinent",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''location''][''country'']"
      },
      "sink": {
        "name": "ContextLocationCountry",
        "type": "String"
      }
    },
    {
        "source": {
            "path": "$[''context''][''custom''][''dimensions''][0][''RoleEnvironment'']"
        },
        "sink": {
            "name": "ContextCustomDimensionsRoleEnvironment",
            "type": "String"
        }
    }, 
    {
      "source": {
        "path": "$[''TelemetryIngestBatchId'']"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "path": "$[''TelemetryDate'']"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ],
  "collectionReference": ""
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-2152'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'StagingColumnsMapping'
	AND C2.[Group] = 'PageViewPerformance'
)

UNION ALL

SELECT
	[Key] = 'LandingColumnsMapping'
	,[Group] = 'PageViewPerformance'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "name": "InternalDataId",
        "type": "String"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceName",
        "type": "String"
      },
      "sink": {
        "name": "ClientPerformanceName",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceClientProcessValue",
        "type": "Double"
      },
      "sink": {
        "name": "ClientPerformanceClientProcessValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceReceiveRequestValue",
        "type": "Double"
      },
      "sink": {
        "name": "ClientPerformanceReceiveRequestValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceSendRequestValue",
        "type": "Double"
      },
      "sink": {
        "name": "ClientPerformanceSendRequestValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceTotalValue",
        "type": "Double"
      },
      "sink": {
        "name": "ClientPerformanceTotalValue",
        "type": "Double"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceUrl",
        "type": "String"
      },
      "sink": {
        "name": "ClientPerformanceUrl",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceUrlDataBase",
        "type": "String"
      },
      "sink": {
        "name": "ClientPerformanceUrlDataBase",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ClientPerformanceUrlDataHost",
        "type": "String"
      },
      "sink": {
        "name": "ClientPerformanceUrlDataHost",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceId",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceName",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceName",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextUserAuthId",
        "type": "String"
      },
      "sink": {
        "name": "ContextUserAuthId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextUserAnonId",
        "type": "String"
      },
      "sink": {
        "name": "ContextUserAnonId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextSessionId",
        "type": "String"
      },
      "sink": {
        "name": "ContextSessionId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      },
      "sink": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      }
    },
    {
      "source": {
        "name": "ContextOperationId",
        "type": "String"
      },
      "sink": {
        "name": "ContextOperationId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextOperationParentId",
        "type": "String"
      },
      "sink": {
        "name": "ContextOperationParentId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextLocationContinent",
        "type": "String"
      },
      "sink": {
        "name": "ContextLocationContinent",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextLocationCountry",
        "type": "String"
      },
      "sink": {
        "name": "ContextLocationCountry",
        "type": "String"
      }
    },
    {
        "source": {
            "name": "ContextCustomDimensionsRoleEnvironment",
            "type": "String"
        },
        "sink": {
            "name": "ContextCustomDimensionsRoleEnvironment",
            "type": "String"
        }
    },
    {
      "source": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "TelemetryDate",
        "type": "String"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ]
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-2152'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'LandingColumnsMapping'
	AND C2.[Group] = 'PageViewPerformance'
)



--DELETE FROM [UsageAnalytics].[Configuration]
--WHERE [Group] = 'Event'

INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'StagingColumnsMapping'
	,[Group] = 'Event'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "path": "$[''event''][0][''name'']"
      },
      "sink": {
        "name": "EventName",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''internal''][''data''][''id'']"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''data''][''eventTime'']"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''id'']"
      },
      "sink": {
        "name": "ContextDeviceId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''osVersion'']"
      },
      "sink": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''deviceName'']"
      },
      "sink": {
        "name": "ContextDeviceName",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''browser'']"
      },
      "sink": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''browserVersion'']"
      },
      "sink": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''user''][''anonId'']"
      },
      "sink": {
        "name": "ContextUserAnonId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''user''][''authId'']"
      },
      "sink": {
        "name": "ContextUserAuthId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''session''][''id'']"
      },
      "sink": {
        "name": "ContextSessionId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''session''][''isFirst'']"
      },
      "sink": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      }
    },
    {
      "source": {
        "path": "$[''context''][''operation''][''id'']"
      },
      "sink": {
        "name": "ContextOperationId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''operation''][''parentId'']"
      },
      "sink": {
        "name": "ContextOperationParentId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''location''][''continent'']"
      },
      "sink": {
        "name": "ContextLocationContinent",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''location''][''country'']"
      },
      "sink": {
        "name": "ContextLocationCountry",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''custom''][''dimensions''][0][''RoleEnvironment'']"
      },
      "sink": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''TelemetryIngestBatchId'']"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "path": "$[''TelemetryDate'']"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ],
  "collectionReference": ""
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1964'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1964'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'StagingColumnsMapping'
	AND C2.[Group] = 'Event'
)

UNION ALL

SELECT
	[Key] = 'LandingColumnsMapping'
	,[Group] = 'Event'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "name": "InternalDataId",
        "type": "String"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "EventName",
        "type": "String"
      },
      "sink": {
        "name": "EventName",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceId",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceName",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceName",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceOSVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceBrowser",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceBrowserVersion",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextUserAuthId",
        "type": "String"
      },
      "sink": {
        "name": "ContextUserAuthId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextUserAnonId",
        "type": "String"
      },
      "sink": {
        "name": "ContextUserAnonId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextSessionId",
        "type": "String"
      },
      "sink": {
        "name": "ContextSessionId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      },
      "sink": {
        "name": "ContextSessionIsFirst",
        "type": "Boolean"
      }
    },
    {
      "source": {
        "name": "ContextOperationId",
        "type": "String"
      },
      "sink": {
        "name": "ContextOperationId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextOperationParentId",
        "type": "String"
      },
      "sink": {
        "name": "ContextOperationParentId",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextLocationContinent",
        "type": "String"
      },
      "sink": {
        "name": "ContextLocationContinent",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextLocationCountry",
        "type": "String"
      },
      "sink": {
        "name": "ContextLocationCountry",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      },
      "sink": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "TelemetryDate",
        "type": "String"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ]
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1964'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1964'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'LandingColumnsMapping'
	AND C2.[Group] = 'Event'
)

--SELECT * FROM [UsageAnalytics].[Configuration]
GO









--DELETE FROM [UsageAnalytics].[Configuration]
--WHERE [Group] = 'Event'

INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'StagingColumnsMapping'
	,[Group] = 'Metrics'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "path": "$[''internal''][''data''][''id'']"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''data''][''eventTime'']"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''type'']"
      },
      "sink": {
        "name": "ContextDeviceType",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''device''][''roleName'']"
      },
      "sink": {
        "name": "ContextDeviceRoleName",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''context''][''custom''][''dimensions''][0][''RoleEnvironment'']"
      },
      "sink": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      }
    },
    {
      "source": {
        "path": "$[''TelemetryIngestBatchId'']"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "path": "$[''TelemetryDate'']"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ],
  "collectionReference": ""
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1964'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1964'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'StagingColumnsMapping'
	AND C2.[Group] = 'Metrics'
)

UNION ALL

SELECT
	[Key] = 'LandingColumnsMapping'
	,[Group] = 'Metrics'
    ,[Value] = N'{
  "type": "TabularTranslator",
  "mappings": [
    {
      "source": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      },
      "sink": {
        "name": "ContextDataEventTime",
        "type": "DateTime"
      }
    },
    {
      "source": {
        "name": "InternalDataId",
        "type": "String"
      },
      "sink": {
        "name": "InternalDataId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "ContextDeviceType",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceType",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextDeviceRoleName",
        "type": "String"
      },
      "sink": {
        "name": "ContextDeviceRoleName",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      },
      "sink": {
        "name": "ContextCustomDimensionsRoleEnvironment",
        "type": "String"
      }
    },
    {
      "source": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      },
      "sink": {
        "name": "TelemetryIngestBatchId",
        "type": "Guid"
      }
    },
    {
      "source": {
        "name": "TelemetryDate",
        "type": "String"
      },
      "sink": {
        "name": "TelemetryDate",
        "type": "String"
      }
    }
  ]
}'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1964'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1964'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'LandingColumnsMapping'
	AND C2.[Group] = 'Metrics'
)

--SELECT * FROM [UsageAnalytics].[Configuration]
GO










PRINT 'Inserting "Ingest Switch Flags" to Configuration'
GO
INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'IngestPageViews'
	,[Group] = 'PageViews'
    ,[Value] = N'0'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'IngestPageViews'
)

UNION ALL

SELECT
	[Key] = 'IngestPageViewPerformance'
	,[Group] = 'PageViewPerformance'
    ,[Value] = N'0'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'IngestPageViewPerformance'
)

UNION ALL

SELECT
	[Key] = 'IngestEvent'
	,[Group] = 'Event'
    ,[Value] = N'0'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'IngestEvent'
)

UNION ALL

SELECT
	[Key] = 'IngestMetrics'
	,[Group] = 'Metrics'
    ,[Value] = N'1'
    --,[CreatedDate]
    ,[CreatedBy] = 'CPI-1358'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'CPI-1358'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'IngestMetrics'
)

--SELECT * FROM [UsageAnalytics].[Configuration]
GO




PRINT 'Inserting "NSize" to Configuration'
GO
INSERT INTO [UsageAnalytics].[Configuration]
    ([Key]
	,[Group]
    ,[Value]
    --,[CreatedDate]
    ,[CreatedBy]
    --,[LastModifiedDate]
    ,[LastModifiedBy]
    ,[IsDeleted])

SELECT
	[Key] = 'NSize'
	,[Group] = 'Tenant'
    ,[Value] = N'10'
    --,[CreatedDate]
    ,[CreatedBy] = 'FRANC583'
    --,[LastModifiedDate]
    ,[LastModifiedBy] = 'FRANC583'
    ,[IsDeleted] = 0
WHERE NOT EXISTS
(
	SELECT C2.[Key]
	FROM [UsageAnalytics].[Configuration] AS C2
	WHERE C2.[Key] = 'NSize'
)
GO