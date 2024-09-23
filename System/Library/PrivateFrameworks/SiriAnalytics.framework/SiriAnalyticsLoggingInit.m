@implementation SiriAnalyticsLoggingInit

void __SiriAnalyticsLoggingInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;

  v0 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryXPC);
  v1 = (void *)SiriAnalyticsLogContextXPC;
  SiriAnalyticsLogContextXPC = (uint64_t)v0;

  v2 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryUtility);
  v3 = (void *)SiriAnalyticsLogContextUtility;
  SiriAnalyticsLogContextUtility = (uint64_t)v2;

  v4 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryAssistant);
  v5 = (void *)SiriAnalyticsLogContextAssistant;
  SiriAnalyticsLogContextAssistant = (uint64_t)v4;

  v6 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryStreaming);
  v7 = (void *)SiriAnalyticsLogContextStreaming;
  SiriAnalyticsLogContextStreaming = (uint64_t)v6;

  v8 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryStorage);
  v9 = (void *)SiriAnalyticsLogContextStorage;
  SiriAnalyticsLogContextStorage = (uint64_t)v8;

  v10 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryTime);
  v11 = (void *)SiriAnalyticsLogContextTime;
  SiriAnalyticsLogContextTime = (uint64_t)v10;

  v12 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryResolution);
  v13 = (void *)SiriAnalyticsLogContextResolution;
  SiriAnalyticsLogContextResolution = (uint64_t)v12;

  v14 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryPerformance);
  v15 = (void *)SiriAnalyticsLogContextPerformance;
  SiriAnalyticsLogContextPerformance = (uint64_t)v14;

  v16 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMessageTailing);
  v17 = (void *)SiriAnalyticsLogContextMessageTailing;
  SiriAnalyticsLogContextMessageTailing = (uint64_t)v16;

  v18 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategorySensitiveConditions);
  v19 = (void *)SiriAnalyticsLogContextSensitiveConditions;
  SiriAnalyticsLogContextSensitiveConditions = (uint64_t)v18;

  v20 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryDB);
  v21 = (void *)SiriAnalyticsLogContextDB;
  SiriAnalyticsLogContextDB = (uint64_t)v20;

  v22 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMetastore);
  v23 = (void *)SiriAnalyticsLogContextMetastore;
  SiriAnalyticsLogContextMetastore = (uint64_t)v22;

  v24 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryMessageStaging);
  v25 = (void *)SiriAnalyticsLogContextMessageStaging;
  SiriAnalyticsLogContextMessageStaging = (uint64_t)v24;

  v26 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryPreprocessor);
  v27 = (void *)SiriAnalyticsLogContextPreprocessor;
  SiriAnalyticsLogContextPreprocessor = (uint64_t)v26;

  v28 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryUnifiedBiomeStream);
  v29 = (void *)SiriAnalyticsLogContextUnifiedBiomeStream;
  SiriAnalyticsLogContextUnifiedBiomeStream = (uint64_t)v28;

  v30 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryLargeUpload);
  v31 = (void *)SiriAnalyticsLogContextLargeUpload;
  SiriAnalyticsLogContextLargeUpload = (uint64_t)v30;

  v32 = os_log_create(SiriAnalyticsLoggingSubsystem, (const char *)SiriAnalyticsLoggingCategoryOrchestrator);
  v33 = (void *)SiriAnalyticsLogContextOrchestrator;
  SiriAnalyticsLogContextOrchestrator = (uint64_t)v32;

}

@end
