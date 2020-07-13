/****** Object:  Table [UsageAnalytics].[Messages]    Script Date: 2020-07-02 4:05:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[UsageAnalytics].[Messages]') AND type in (N'U'))
DROP TABLE [UsageAnalytics].[Messages]
GO

/****** Object:  Table [UsageAnalytics].[Messages]    Script Date: 2020-07-02 4:05:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [UsageAnalytics].[Messages](
	MessageRaw [nvarchar](max) NULL,
	MessageSeverityLevel [nvarchar](30) NULL,
	InternalDataId VARCHAR(40) NULL,
	InternalDataDocVer [nvarchar](10) NULL,
	ContextAppVersion [nvarchar](20) NULL,
	ContextDataEventTime [nvarchar](50) NULL,
	ContextDataIsSynthetic BIT NULL,
	ContextDataSamplingRate [nvarchar](50) NULL,
	ContextDataDeviceType [nvarchar](100) NULL,
	ContextDataDeviceRoleName [nvarchar](200) NULL,
	ContextDataDeviceRoleInstance [nvarchar](100) NULL,
	ContextDataSessionIsFirst BIT NULL,
	ContextDataOperationId [nvarchar](50) NULL,
	ContextDataOperationParentId [nvarchar](30) NULL,
	ContextDataOperationName [nvarchar](500) NULL,
	ContextLocationClientIp [nvarchar](20) NULL,
	ContextLocationContinent [nvarchar](100) NULL,
	ContextLocationCountry [nvarchar](100) NULL,
	ContextCustomDimTraceId [nvarchar](100) NULL,
	ContextCustomDimCategoryName [nvarchar](500) NULL,
	--ContextCustomDimRequestId VARCHAR(40) NULL,
	--ContextCustomDimActionId VARCHAR(40) NULL,
	--ContextCustomDimActionName [nvarchar](500) NULL,
	--ContextCustomDimSpanId [nvarchar](30) NULL,
	ContextCustomDimOriginalFormat [nvarchar](max) NULL,
	ContextCustomDimParentId [nvarchar](30) NULL,
	ContextCustomDimRequestPath [nvarchar](500) NULL,
	ContextCustomDimAspNetCoreEnvironment [nvarchar](20) NULL,
	ContextCustomDimEventId [nvarchar](10) NULL,
	--ContextCustomDimEventName [nvarchar](50) NULL,
	ContextCustomDimMethod [nvarchar](10) NULL,
	ContextCustomDimScheme [nvarchar](10) NULL,
	ContextCustomDimPath [nvarchar](500) NULL,
	ContextCustomDimProtocol [nvarchar](10) NULL,
	ContextCustomDimHost [nvarchar](100) NULL,
	ContextCustomDimQueryString [nvarchar](MAX) NULL,
	PipelineRunId VARCHAR(40) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


