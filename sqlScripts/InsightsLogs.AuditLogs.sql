/****** Object:  Table [InsightsLogs].[AuditLogs]    Script Date: 2020-07-02 4:05:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[InsightsLogs].[AuditLogs]') AND type in (N'U'))
DROP TABLE [InsightsLogs].[AuditLogs]
GO

/****** Object:  Table [InsightsLogs].[AuditLogs]    Script Date: 2020-07-02 4:05:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [InsightsLogs].[AuditLogs](
	[time] [nvarchar](max) NULL,
	[resourceId] [nvarchar](max) NULL,
	[operationName] [nvarchar](max) NULL,
	[operationVersion] [nvarchar](max) NULL,
	[category] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[resultSignature] [nvarchar](max) NULL,
	[resultDescription] [nvarchar](max) NULL,
	[durationMs] [int] NULL,
	[callerIpAddress] [nvarchar](max) NULL,
	[correlationId] [nvarchar](max) NULL,
	[level] [nvarchar](max) NULL,
	[PropId] [nvarchar](max) NULL,
	[PropCategory] [nvarchar](max) NULL,
	[PropCorrelationId] [nvarchar](max) NULL,
	[PropResult] [nvarchar](max) NULL,
	[PropResultReason] [nvarchar](max) NULL,
	[PropActivityDisplayName] [nvarchar](max) NULL,
	[PropActivityDateTime] [nvarchar](max) NULL,
	[PropLoggedByService] [nvarchar](max) NULL,
	[PropOperationType] [nvarchar](max) NULL,
	[PropInitiatedByUserId] [nvarchar](max) NULL,
	[PropInitiatedByUserDisplayName] [nvarchar](max) NULL,
	[PropInitiatedByUserPrincipalName] [nvarchar](max) NULL,
	[PropInitiatedByUserIpAddress] [nvarchar](max) NULL,
	[PropInitiatedByAppId] [nvarchar](max) NULL,
	[PropInitiatedByAppDisplayName] [nvarchar](max) NULL,
	[PropInitiatedByAppServicePrincipalId] [nvarchar](max) NULL,
	[PropInitiatedByAppServicePrincipalName] [nvarchar](max) NULL,
	[PropInitiatedByTargetResourceId] [nvarchar](max) NULL,
	[PropInitiatedByTargetResourceDisplayName] [nvarchar](max) NULL,
	[PropInitiatedByTargetResourceType] [nvarchar](max) NULL,
	[Identity] [nvarchar](max) NULL,
	[PipelineRunId] [nvarchar](40) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


