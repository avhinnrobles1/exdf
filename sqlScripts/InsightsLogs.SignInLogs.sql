IF NOT EXISTS (
SELECT  schema_name
FROM    information_schema.schemata
WHERE   schema_name = 'InsightsLogs' )
	BEGIN
		EXEC sp_executesql N'CREATE SCHEMA InsightsLogs'
	END
GO

/****** Object:  Table [InsightsLogs].[SignInLogs]    Script Date: 2020-07-02 4:05:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[InsightsLogs].[SignInLogs]') AND type in (N'U'))
DROP TABLE [InsightsLogs].[SignInLogs]
GO

/****** Object:  Table [InsightsLogs].[SignInLogs]    Script Date: 2020-07-02 4:05:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [InsightsLogs].[SignInLogs](
	[time] [nvarchar](max) NULL,
	[resourceId] [nvarchar](max) NULL,
	[operationName] [nvarchar](max) NULL,
	[operationVersion] [nvarchar](max) NULL,
	[category] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[resultType] [nvarchar](max) NULL,
	[resultSignature] [nvarchar](max) NULL,
	[resultDescription] [nvarchar](max) NULL,
	[durationMs] [int] NULL,
	[callerIpAddress] [nvarchar](max) NULL,
	[correlationId] [nvarchar](max) NULL,
	[identity] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[PropId] [nvarchar](max) NULL,
	[PropCreatedDateTime] [nvarchar](max) NULL,
	[PropUserDisplayName] [nvarchar](max) NULL,
	[PropUserPrincipalName] [nvarchar](max) NULL,
	[PropUserId] [nvarchar](max) NULL,
	[PropAppId] [nvarchar](max) NULL,
	[PropAppDisplayName] [nvarchar](max) NULL,
	[PropIpAddress] [nvarchar](max) NULL,
	[PropStatusErrorCode] [int] NULL,
	[PropStatusFailureReason] [nvarchar](max) NULL,
	[PropUserAgent] [nvarchar](max) NULL,
	[PropDeviceDetailId] [nvarchar](max) NULL,
	[PropDeviceDetailOS] [nvarchar](max) NULL,
	[PropDeviceDetailBrowser] [nvarchar](max) NULL,
	[PropLocGeoCoorLat] [nvarchar](max) NULL,
	[PropLocGeoCoorLong] [nvarchar](max) NULL,
	--[PropLocCity] [nvarchar](max) NULL,
	--[PropLocState] [nvarchar](max) NULL,
	--[PropLocCountryOrRegion] [nvarchar](max) NULL,
	[PropMfaDetailAuthMethod] [nvarchar](max) NULL,
	--[PropMfaDetailAuthDetail] [nvarchar](max) NULL,
	[PropConditionalAccessStatus] [nvarchar](max) NULL,
	[PropOriginalRequestId] [nvarchar](max) NULL,
	[PropIsInteractive] BIT NULL,
	[PropTokenIssuerName] [nvarchar](max) NULL,
	[PropTokenIssuerType] [nvarchar](max) NULL,
	[PropProcessingTimeInMilliseconds] INT NULL,
	[PropRiskDetail] [nvarchar](max) NULL,
	[PropRiskLevelAggregated] [nvarchar](max) NULL,
	[PropRiskLevelDuringSignIn] [nvarchar](max) NULL,
	[PropRiskState] [nvarchar](max) NULL,
	[PropResourceDisplayName] [nvarchar](max) NULL,
	[PropAuthenticationRequirement] [nvarchar](max) NULL,
	[PropServicePrincipalId] [nvarchar](max) NULL,
	[PropAccountType] INT NULL,
	--[PropClientAppUsed] [nvarchar](max) NULL,
	--[PropResourceId] [nvarchar](max) NULL,
	--[PropAlternateSignInName] [nvarchar](max) NULL,
	--[PropLocation] [nvarchar](max) NULL,
	[PipelineRunId] [nvarchar](40) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


