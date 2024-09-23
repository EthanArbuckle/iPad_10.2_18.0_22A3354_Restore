@implementation AssistantSiriAnalyticsService

- (void)handler:(id)a3 messagesReceived:(id)a4
{
  id v5;
  SiriAnalyticsWhiteRose *whiteRose;
  _QWORD v7[5];

  v5 = a4;
  if (-[AssistantSiriAnalyticsService _analyticsEnabled](self, "_analyticsEnabled"))
  {
    whiteRose = self->_whiteRose;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__AssistantSiriAnalyticsService_handler_messagesReceived___block_invoke;
    v7[3] = &unk_1E43573D8;
    v7[4] = self;
    -[SiriAnalyticsWhiteRose markTimeForAnnotatedMessages:completion:](whiteRose, "markTimeForAnnotatedMessages:completion:", v5, v7);
  }

}

- (BOOL)_analyticsEnabled
{
  char v2;
  SiriAnalyticsServiceHostDelegate **p_delegate;
  id WeakRetained;
  id v5;

  if (self->_killSwitchEnabled)
    return 0;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v2 = objc_msgSend(v5, "analyticsEnabled");

  }
  else
  {
    v2 = 1;
  }

  return v2;
}

- (AssistantSiriAnalyticsService)initWithQueue:(id)a3 delegate:(id)a4
{
  id v5;
  AssistantSiriAnalyticsService *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  AssistantSiriAnalyticsService *v20;
  uint64_t v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  objc_super v28;

  v5 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AssistantSiriAnalyticsService;
  v6 = -[AssistantSiriAnalyticsService init](&v28, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.siri.analytics.runtime", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v5);
    v11 = mach_continuous_time();
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke;
    v26[3] = &unk_1E4357B10;
    v14 = v12;
    v27 = v14;
    -[AssistantSiriAnalyticsService _buildDependenciesWithCompletion:](v6, "_buildDependenciesWithCompletion:", v26);
    dispatch_group_enter(v14);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_2;
    v24[3] = &unk_1E4357B10;
    v15 = v14;
    v25 = v15;
    -[AssistantSiriAnalyticsService _bootstrapStorageWithCompletion:](v6, "_bootstrapStorageWithCompletion:", v24);
    dispatch_group_enter(v15);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_3;
    v22[3] = &unk_1E4357B10;
    v23 = v15;
    v16 = v15;
    -[AssistantSiriAnalyticsService _setupMaintenanceWorkWithCompletion:](v6, "_setupMaintenanceWorkWithCompletion:", v22);
    v17 = v6->_queue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_4;
    block[3] = &unk_1E4357360;
    v20 = v6;
    v21 = v11;
    dispatch_group_notify(v16, v17, block);

  }
  return v6;
}

- (void)_buildDependenciesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AssistantSiriAnalyticsService__buildDependenciesWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_buildDependenciesOnQueue
{
  SiriAnalyticsPreferences *v3;
  SiriAnalyticsPreferences *preferences;
  _BOOL4 v5;
  void *v6;
  SiriAnalyticsPreferences *v7;
  NSObject *v8;
  NSObject *v9;
  OS_dispatch_queue *queue;
  _BOOL8 killSwitchEnabled;
  AssistantSiriAnalyticsMessageTailing *v12;
  AssistantSiriAnalyticsMessageTailing *messageTailing;
  SiriAnalyticsInternalTelemetry *v14;
  SiriAnalyticsInternalTelemetry *internalTelemetry;
  SiriAnalyticsMetastore *v16;
  SiriAnalyticsMetastore *metastore;
  _TtC13SiriAnalytics27SiriAnalyticsMessageStaging *v18;
  _TtC13SiriAnalytics27SiriAnalyticsMessageStaging *messageStaging;
  SiriAnalyticsLargeMessageStorage *v20;
  SiriAnalyticsLargeMessageUploadProcessor *v21;
  SiriAnalyticsLargeMessageStorage *v22;
  SiriAnalyticsLargeMessageStorage *largeMessageStorage;
  SiriAnalyticsSensitiveConditionsObservers *v24;
  SiriAnalyticsSensitiveConditionsObservers *sensitiveConditionsObservers;
  SiriAnalyticsMessageStore *v26;
  SiriAnalyticsMessageStore *messageStore;
  SiriAnalyticsRawUnifiedStream *v28;
  SiriAnalyticsRawUnifiedStream *rawUnifiedStream;
  SiriAnalyticsFBFStorage *v30;
  SiriAnalyticsFBFStorage *fbf;
  SiriAnalyticsPreprocessor *v32;
  SiriAnalyticsPreprocessor *preprocessor;
  SiriAnalyticsMetadataExtractor *v34;
  SiriAnalyticsMessageProcessingStrategy *v35;
  SiriAnalyticsMessageProcessingStrategy *messageProcessingStrategy;
  SiriAnalyticsClockInactivityScheduler *v37;
  OS_dispatch_queue *v38;
  uint64_t v39;
  SiriAnalyticsClockInactivityScheduler *v40;
  SiriAnalyticsClockInactivityScheduler *inactivityScheduler;
  SiriAnalyticsDataCollectionPolicyClockObserver *v42;
  id WeakRetained;
  void *v44;
  SiriAnalyticsDataCollectionPolicyClockObserver *v45;
  AssistantSiriAnalyticsClockWatcher *v46;
  SiriAnalyticsInternalTelemetry *v47;
  SiriAnalyticsSensitiveConditionsObservers *v48;
  void *v49;
  void *v50;
  AssistantSiriAnalyticsClockWatcher *v51;
  AssistantSiriAnalyticsClockWatcher *clockWatcher;
  SiriAnalyticsWhiteRose *v53;
  SiriAnalyticsWhiteRose *whiteRose;
  SiriAnalyticsMessageResolutionPipeline *v55;
  SiriAnalyticsMessageResolutionPipeline *messageResolutionPipeline;
  _TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver *v57;
  _TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver *firstUnlockObserver;
  SiriAnalyticsUserHistoryPolicy *v59;
  id *p_userHistoryPolicy;
  SiriAnalyticsUserHistoryPolicy *userHistoryPolicy;
  SiriAnalyticsLocalStorageDispatcher *v62;
  SiriAnalyticsPrivateLearningStorageProvider *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  AssistantSiriAnalyticsService *v71;
  __int16 v72;
  OS_dispatch_queue *v73;
  __int16 v74;
  _BOOL8 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SiriAnalyticsPreferences);
  preferences = self->_preferences;
  self->_preferences = v3;

  v5 = -[SiriAnalyticsPreferences killSwitchEnabled](self->_preferences, "killSwitchEnabled");
  self->_killSwitchEnabled = v5;
  if (!v5)
  {
LABEL_6:
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    goto LABEL_8;
  }
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = (void *)SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    v7 = self->_preferences;
    v8 = v6;
    *(_DWORD *)buf = 136315394;
    v69 = "-[AssistantSiriAnalyticsService _buildDependenciesOnQueue]";
    v70 = 2048;
    v71 = (AssistantSiriAnalyticsService *)-[SiriAnalyticsPreferences killSwitchEnabled](v7, "killSwitchEnabled");
    _os_log_impl(&dword_1A025F000, v8, OS_LOG_TYPE_INFO, "%s 💀 kill switch enabled with pref: %ld", buf, 0x16u);

    goto LABEL_6;
  }
LABEL_8:
  v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    queue = self->_queue;
    killSwitchEnabled = self->_killSwitchEnabled;
    *(_DWORD *)buf = 136315906;
    v69 = "-[AssistantSiriAnalyticsService _buildDependenciesOnQueue]";
    v70 = 2112;
    v71 = self;
    v72 = 2112;
    v73 = queue;
    v74 = 2048;
    v75 = killSwitchEnabled;
    _os_log_impl(&dword_1A025F000, v9, OS_LOG_TYPE_INFO, "%s Analytics service: %@ created on queue: %@ with killSwitchEnabled: %ld", buf, 0x2Au);
  }
  v12 = -[AssistantSiriAnalyticsMessageTailing initWithPreferences:]([AssistantSiriAnalyticsMessageTailing alloc], "initWithPreferences:", self->_preferences);
  messageTailing = self->_messageTailing;
  self->_messageTailing = v12;

  v14 = -[SiriAnalyticsInternalTelemetry initWithPreferences:]([SiriAnalyticsInternalTelemetry alloc], "initWithPreferences:", self->_preferences);
  internalTelemetry = self->_internalTelemetry;
  self->_internalTelemetry = v14;

  -[SiriAnalyticsInternalTelemetry trackRuntimeBootstrapWithKillSwitchEnabled:](self->_internalTelemetry, "trackRuntimeBootstrapWithKillSwitchEnabled:", self->_killSwitchEnabled);
  v16 = objc_alloc_init(SiriAnalyticsMetastore);
  metastore = self->_metastore;
  self->_metastore = v16;

  v18 = -[SiriAnalyticsMessageStaging initWithInternalTelemetry:]([_TtC13SiriAnalytics27SiriAnalyticsMessageStaging alloc], "initWithInternalTelemetry:", self->_internalTelemetry);
  messageStaging = self->_messageStaging;
  self->_messageStaging = v18;

  v20 = [SiriAnalyticsLargeMessageStorage alloc];
  v21 = -[SiriAnalyticsLargeMessageUploadProcessor initWithMetastore:]([SiriAnalyticsLargeMessageUploadProcessor alloc], "initWithMetastore:", self->_metastore);
  v22 = -[SiriAnalyticsLargeMessageStorage initWithApplicationIdentifier:processor:runtimeQueue:](v20, "initWithApplicationIdentifier:processor:runtimeQueue:", CFSTR("com.apple.assistantd"), v21, self->_queue);
  largeMessageStorage = self->_largeMessageStorage;
  self->_largeMessageStorage = v22;

  v24 = -[SiriAnalyticsSensitiveConditionsObservers initWithQueue:]([SiriAnalyticsSensitiveConditionsObservers alloc], "initWithQueue:", self->_queue);
  sensitiveConditionsObservers = self->_sensitiveConditionsObservers;
  self->_sensitiveConditionsObservers = v24;

  v26 = -[SiriAnalyticsMessageStore initWithPrefs:]([SiriAnalyticsMessageStore alloc], "initWithPrefs:", self->_preferences);
  messageStore = self->_messageStore;
  self->_messageStore = v26;

  v28 = objc_alloc_init(SiriAnalyticsRawUnifiedStream);
  rawUnifiedStream = self->_rawUnifiedStream;
  self->_rawUnifiedStream = v28;

  v30 = -[SiriAnalyticsFBFStorage initWithApplicationIdentifier:telemetry:]([SiriAnalyticsFBFStorage alloc], "initWithApplicationIdentifier:telemetry:", CFSTR("com.apple.assistantd"), self->_internalTelemetry);
  fbf = self->_fbf;
  self->_fbf = v30;

  v63 = objc_alloc_init(SiriAnalyticsPrivateLearningStorageProvider);
  v62 = -[SiriAnalyticsLocalStorageDispatcher initWithPlusStream:]([SiriAnalyticsLocalStorageDispatcher alloc], "initWithPlusStream:", v63);
  v32 = -[SiriAnalyticsPreprocessor initWithMetastore:metastoreQueue:fbf:telemetry:messageTailing:messageStaging:localStorage:uspUploadQueue:]([SiriAnalyticsPreprocessor alloc], "initWithMetastore:metastoreQueue:fbf:telemetry:messageTailing:messageStaging:localStorage:uspUploadQueue:", self->_metastore, self->_queue, self->_fbf, self->_internalTelemetry, self->_messageTailing, self->_messageStaging, v62, self->_messageStore);
  preprocessor = self->_preprocessor;
  self->_preprocessor = v32;

  v34 = -[SiriAnalyticsMetadataExtractor initWithMetastore:runtimeQueue:autoCommit:]([SiriAnalyticsMetadataExtractor alloc], "initWithMetastore:runtimeQueue:autoCommit:", self->_metastore, self->_queue, 1);
  v35 = -[SiriAnalyticsMessageProcessingStrategy initWithMessageStaging:metadataExtractor:]([SiriAnalyticsMessageProcessingStrategy alloc], "initWithMessageStaging:metadataExtractor:", self->_messageStaging, v34);
  messageProcessingStrategy = self->_messageProcessingStrategy;
  self->_messageProcessingStrategy = v35;

  if (!self->_killSwitchEnabled)
  {
    objc_initWeak((id *)buf, self);
    v37 = [SiriAnalyticsClockInactivityScheduler alloc];
    v38 = self->_queue;
    v39 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke;
    v66[3] = &unk_1E4357388;
    objc_copyWeak(&v67, (id *)buf);
    v66[4] = self;
    v64[0] = v39;
    v64[1] = 3221225472;
    v64[2] = __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke_2;
    v64[3] = &unk_1E4357388;
    objc_copyWeak(&v65, (id *)buf);
    v64[4] = self;
    v40 = -[SiriAnalyticsClockInactivityScheduler initWithSeconds:queue:expiration:creation:](v37, "initWithSeconds:queue:expiration:creation:", 30, v38, v66, v64);
    inactivityScheduler = self->_inactivityScheduler;
    self->_inactivityScheduler = v40;

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);
  }
  v42 = [SiriAnalyticsDataCollectionPolicyClockObserver alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriAssistantConfiguration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[SiriAnalyticsDataCollectionPolicyClockObserver initWithSiriConfiguration:metastore:metastoreQueue:](v42, "initWithSiriConfiguration:metastore:metastoreQueue:", v44, self->_metastore, self->_queue);

  v46 = [AssistantSiriAnalyticsClockWatcher alloc];
  v47 = self->_internalTelemetry;
  v48 = self->_sensitiveConditionsObservers;
  +[AssistantSiriAnalytics sharedAnalytics](AssistantSiriAnalytics, "sharedAnalytics");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "defaultMessageStream");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[AssistantSiriAnalyticsClockWatcher initWithInternalTelemetry:sensitiveConditionsObservers:clientMessageStream:preprocessor:metastore:scheduler:metadataExtractor:dataPolicyObserver:](v46, "initWithInternalTelemetry:sensitiveConditionsObservers:clientMessageStream:preprocessor:metastore:scheduler:metadataExtractor:dataPolicyObserver:", v47, v48, v50, self->_preprocessor, self->_metastore, self->_inactivityScheduler, v34, v45);
  clockWatcher = self->_clockWatcher;
  self->_clockWatcher = v51;

  v53 = -[SiriAnalyticsWhiteRose initWithQueue:delegate:metastore:]([SiriAnalyticsWhiteRose alloc], "initWithQueue:delegate:metastore:", self->_queue, self->_clockWatcher, self->_metastore);
  whiteRose = self->_whiteRose;
  self->_whiteRose = v53;

  v55 = -[SiriAnalyticsMessageResolutionPipeline initWithQueue:]([SiriAnalyticsMessageResolutionPipeline alloc], "initWithQueue:", self->_queue);
  messageResolutionPipeline = self->_messageResolutionPipeline;
  self->_messageResolutionPipeline = v55;

  v57 = -[SiriAnalyticsFirstUnlockObserver initWithQueue:]([_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver alloc], "initWithQueue:", self->_queue);
  firstUnlockObserver = self->_firstUnlockObserver;
  self->_firstUnlockObserver = v57;

  v59 = -[SiriAnalyticsUserHistoryPolicy initWithMessageStaging:queue:]([SiriAnalyticsUserHistoryPolicy alloc], "initWithMessageStaging:queue:", self->_messageStaging, self->_queue);
  userHistoryPolicy = self->_userHistoryPolicy;
  p_userHistoryPolicy = (id *)&self->_userHistoryPolicy;
  *p_userHistoryPolicy = v59;

  objc_msgSend(*p_userHistoryPolicy, "startObserving");
}

- (void)_bootstrapStorageWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_bootstrapStorageOnQueue
{
  void *v3;

  +[SiriAnalyticsPersistentStorage dataVault](SiriAnalyticsPersistentStorage, "dataVault");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "migrate");

  -[SiriAnalyticsMetastore bootstrap](self->_metastore, "bootstrap");
  -[SiriAnalyticsMetastore prune](self->_metastore, "prune");
  -[SiriAnalyticsMessageStaging bootstrapAndPrune](self->_messageStaging, "bootstrapAndPrune");
}

- (void)_setupMaintenanceWorkWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setupMaintenanceWorkOnQueueWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  SiriAnalyticsWhiteRose *whiteRose;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;

  v4 = a3;
  -[SiriAnalyticsClockInactivityScheduler startScheduling](self->_inactivityScheduler, "startScheduling");
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  whiteRose = self->_whiteRose;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke;
  v13[3] = &unk_1E4357B10;
  v14 = v5;
  v8 = v5;
  -[SiriAnalyticsWhiteRose bootstrapWithCompletion:](whiteRose, "bootstrapWithCompletion:", v13);
  queue = self->_queue;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke_2;
  v11[3] = &unk_1E4357C20;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v8, queue, v11);

}

- (void)_setupIncomingConnections
{
  SiriAnalyticsXPCServiceListener *v3;
  SiriAnalyticsXPCServiceListener *siriAnalyticsListener;

  v3 = -[SiriAnalyticsXPCServiceListener initWithMachServiceName:entitlementsKey:queue:delegate:]([SiriAnalyticsXPCServiceListener alloc], "initWithMachServiceName:entitlementsKey:queue:delegate:", CFSTR("com.apple.siri.analytics.assistant"), CFSTR("com.apple.siri.analytics.assistant"), self->_queue, self);
  siriAnalyticsListener = self->_siriAnalyticsListener;
  self->_siriAnalyticsListener = v3;

}

- (void)registerMessageResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AssistantSiriAnalyticsService_registerMessageResolver___block_invoke;
  v7[3] = &unk_1E4357A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)registerSensitiveConditionsObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AssistantSiriAnalyticsService_registerSensitiveConditionsObserver___block_invoke;
  v7[3] = &unk_1E4357A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AssistantSiriAnalyticsService_sensitiveCondition_startedAt___block_invoke;
  block[3] = &unk_1E43573B0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(queue, block);
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AssistantSiriAnalyticsService_sensitiveCondition_endedAt___block_invoke;
  block[3] = &unk_1E43573B0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(queue, block);
}

- (void)handler:(id)a3 unorderedMessagesReceived:(id)a4
{
  id v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  AssistantSiriAnalyticsService *v9;

  v5 = a4;
  if (-[AssistantSiriAnalyticsService _analyticsEnabled](self, "_analyticsEnabled"))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived___block_invoke;
    v7[3] = &unk_1E4357A90;
    v8 = v5;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

- (void)handler:(id)a3 unresolvedMessagesReceived:(id)a4
{
  id v5;
  _QWORD v6[5];

  v5 = a4;
  if (-[AssistantSiriAnalyticsService _analyticsEnabled](self, "_analyticsEnabled"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke;
    v6[3] = &unk_1E4357448;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  }

}

- (void)handler:(id)a3 largeMessageReceivedWithPath:(id)a4 messageWrapper:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD, void *))a6;
  if (-[AssistantSiriAnalyticsService _analyticsEnabled](self, "_analyticsEnabled"))
  {
    -[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:completion:](self->_largeMessageStorage, "enqueueLargeMessageObjectFromPath:messageWrapper:completion:", v12, v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.analytics"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);

  }
}

- (void)handler:(id)a3 sensitiveCondition:(int)a4 startedAt:(unint64_t)a5 completion:(id)a6
{
  -[SiriAnalyticsWhiteRose sensitiveCondition:startedAt:ensureClockExists:completion:](self->_whiteRose, "sensitiveCondition:startedAt:ensureClockExists:completion:", *(_QWORD *)&a4, a5, 1, a6);
}

- (void)handler:(id)a3 sensitiveCondition:(int)a4 endedAt:(unint64_t)a5 completion:(id)a6
{
  -[SiriAnalyticsWhiteRose sensitiveCondition:endedAt:ensureClockExists:completion:](self->_whiteRose, "sensitiveCondition:endedAt:ensureClockExists:completion:", *(_QWORD *)&a4, a5, 1, a6);
}

- (void)handler:(id)a3 resetLogicalClockWithCompletion:(id)a4
{
  id v5;
  NSObject *v6;
  SiriAnalyticsWhiteRose *whiteRose;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[AssistantSiriAnalyticsService handler:resetLogicalClockWithCompletion:]";
    _os_log_debug_impl(&dword_1A025F000, v6, OS_LOG_TYPE_DEBUG, "%s Resetting logical clock", buf, 0xCu);
  }
  whiteRose = self->_whiteRose;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AssistantSiriAnalyticsService_handler_resetLogicalClockWithCompletion___block_invoke;
  v9[3] = &unk_1E4357BF8;
  v10 = v5;
  v8 = v5;
  -[SiriAnalyticsWhiteRose destroyActiveClockWithReason:completion:](whiteRose, "destroyActiveClockWithReason:completion:", 3, v9);

}

- (void)handler:(id)a3 vendSandboxExtensionWithResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  void (**v10)(id, void *, id);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _OWORD v20[2];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  _BOOL8 v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, id))a6;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = v7;
    _os_log_debug_impl(&dword_1A025F000, v11, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
  }
  +[SiriAnalyticsPersistentStorage dataVault](SiriAnalyticsPersistentStorage, "dataVault");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitlements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extendedEntitlements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v20, 0, sizeof(v20));
  v19 = 0;
  objc_msgSend(v12, "vendAccessFor:withEntitlements:auditToken:readonly:error:", a4, v14, v20, v7, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;

  if (SiriAnalyticsLoggingInit_once == -1)
  {
    if (v16)
      goto LABEL_10;
  }
  else
  {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    if (v16)
    {
LABEL_10:
      v17 = SiriAnalyticsLogContextXPC;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
        v23 = 2048;
        v24 = a4;
        v25 = 2048;
        v26 = v7;
        v27 = 2112;
        v28 = v16;
        _os_log_error_impl(&dword_1A025F000, v17, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
        if (!v10)
          goto LABEL_17;
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  v18 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = v7;
    _os_log_debug_impl(&dword_1A025F000, v18, OS_LOG_TYPE_DEBUG, "%s Vended sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
    if (!v10)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_15:
  if (v10)
LABEL_16:
    v10[2](v10, v15, v16);
LABEL_17:

}

- (void)handler:(id)a3 vendResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  void (**v10)(id, void *, void *, id);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  id v24;
  _OWORD v25[2];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  _BOOL8 v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, void *, id))a6;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
    v28 = 2048;
    v29 = a4;
    v30 = 2048;
    v31 = v7;
    _os_log_debug_impl(&dword_1A025F000, v11, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
  }
  +[SiriAnalyticsPersistentStorage dataVault](SiriAnalyticsPersistentStorage, "dataVault");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitlements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extendedEntitlements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v25, 0, sizeof(v25));
  v24 = 0;
  v22 = v7;
  objc_msgSend(v12, "vendAccessFor:withEntitlements:auditToken:readonly:error:", a4, v14, v25, v7, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;

  if (SiriAnalyticsLoggingInit_once == -1)
  {
    if (v16)
      goto LABEL_10;
LABEL_16:
    v18 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
      v28 = 2048;
      v29 = a4;
      v30 = 2048;
      v31 = v22;
      _os_log_debug_impl(&dword_1A025F000, v18, OS_LOG_TYPE_DEBUG, "%s Vended sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
    }
    +[SiriAnalyticsPersistentStorage dataVault](SiriAnalyticsPersistentStorage, "dataVault");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v19, "vendedResourceUrlFor:error:", a4, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;

    if (!v16)
      goto LABEL_22;
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v21 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
      v28 = 2048;
      v29 = a4;
      v30 = 2048;
      v31 = v22;
      v32 = 2112;
      v33 = v16;
      _os_log_error_impl(&dword_1A025F000, v21, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
      if (!v10)
        goto LABEL_24;
    }
    else
    {
LABEL_22:
      if (!v10)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    v10[2](v10, v15, v20, v16);
    goto LABEL_24;
  }
  dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  if (!v16)
    goto LABEL_16;
LABEL_10:
  v17 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
    v28 = 2048;
    v29 = a4;
    v30 = 2048;
    v31 = v22;
    v32 = 2112;
    v33 = v16;
    _os_log_error_impl(&dword_1A025F000, v17, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
    if (!v10)
      goto LABEL_25;
    goto LABEL_12;
  }
  if (v10)
LABEL_12:
    v10[2](v10, 0, 0, v16);
LABEL_25:

}

- (void)handler:(id)a3 fetchKillSwitchWithCompletion:(id)a4
{
  SiriAnalyticsPreferences *preferences;
  id v6;

  if (a4)
  {
    preferences = self->_preferences;
    v6 = a4;
    (*((void (**)(id, BOOL, _QWORD))a4 + 2))(v6, -[SiriAnalyticsPreferences killSwitchEnabled](preferences, "killSwitchEnabled"), 0);

  }
}

- (void)handler:(id)a3 setKillSwitchEnabled:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[SiriAnalyticsPreferences setKillSwitchEnabled:](self->_preferences, "setKillSwitchEnabled:", v5);
  -[SiriAnalyticsPreferences synchronize](self->_preferences, "synchronize");
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
    v7 = v8;
  }

}

- (void)handler:(id)a3 runPipelineWithCompletion:(id)a4
{
  id v5;
  SiriAnalyticsPreprocessor *preprocessor;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  preprocessor = self->_preprocessor;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__AssistantSiriAnalyticsService_handler_runPipelineWithCompletion___block_invoke;
  v8[3] = &unk_1E4357C20;
  v9 = v5;
  v7 = v5;
  -[SiriAnalyticsPreprocessor triggerWithReason:completion:](preprocessor, "triggerWithReason:completion:", 2, v8);

}

- (void)handler:(id)a3 purgeStagedMessagesWithCompletion:(id)a4
{
  id v5;
  _TtC13SiriAnalytics27SiriAnalyticsMessageStaging *messageStaging;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  messageStaging = self->_messageStaging;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__AssistantSiriAnalyticsService_handler_purgeStagedMessagesWithCompletion___block_invoke;
  v8[3] = &unk_1E4357C20;
  v9 = v5;
  v7 = v5;
  -[SiriAnalyticsMessageStaging purgeWithCompletionHandler:](messageStaging, "purgeWithCompletionHandler:", v8);

}

- (void)handler:(id)a3 fetchLogicalClocks:(id)a4
{
  id v5;
  SiriAnalyticsLogicalClocksXPCHandler *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = -[SiriAnalyticsLogicalClocksXPCHandler initWithMetastore:queue:]([SiriAnalyticsLogicalClocksXPCHandler alloc], "initWithMetastore:queue:", self->_metastore, self->_queue);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__AssistantSiriAnalyticsService_handler_fetchLogicalClocks___block_invoke;
  v8[3] = &unk_1E4357470;
  v9 = v5;
  v7 = v5;
  -[SiriAnalyticsLogicalClocksXPCHandler allWithCompletion:](v6, "allWithCompletion:", v8);

}

- (void)handler:(id)a3 fetchTags:(id)a4
{
  SiriAnalyticsTaggingXPCHandler *v5;
  void *v6;
  void (**v7)(id, uint64_t, void *, _QWORD);

  v7 = (void (**)(id, uint64_t, void *, _QWORD))a4;
  v5 = -[SiriAnalyticsTaggingXPCHandler initWithMetastore:]([SiriAnalyticsTaggingXPCHandler alloc], "initWithMetastore:", self->_metastore);
  -[SiriAnalyticsTaggingXPCHandler all](v5, "all");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, 1, v6, 0);

}

- (void)handler:(id)a3 fetchStateForPluginName:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AssistantSiriAnalyticsService handler:fetchStateForPluginName:completion:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1A025F000, v9, OS_LOG_TYPE_INFO, "%s plugin: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AssistantSiriAnalyticsService_handler_fetchStateForPluginName_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(queue, block);

}

- (void)handler:(id)a3 saveState:(id)a4 forPluginName:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v12 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[AssistantSiriAnalyticsService handler:saveState:forPluginName:completion:]";
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1A025F000, v12, OS_LOG_TYPE_INFO, "%s plugin: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__AssistantSiriAnalyticsService_handler_saveState_forPluginName_completion___block_invoke;
  v17[3] = &unk_1E4357B88;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(queue, v17);

}

- (void)handler:(id)a3 createTag:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AssistantSiriAnalyticsService_handler_createTag_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)sensitiveConditionRangesForBootSessionUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (id)_getPreprocessor
{
  return self->_preprocessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHistoryPolicy, 0);
  objc_storeStrong((id *)&self->_rawUnifiedStream, 0);
  objc_storeStrong((id *)&self->_firstUnlockObserver, 0);
  objc_storeStrong((id *)&self->_inactivityScheduler, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_messageStaging, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_sensitiveConditionsObservers, 0);
  objc_storeStrong((id *)&self->_internalTelemetry, 0);
  objc_storeStrong((id *)&self->_messageTailing, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clockWatcher, 0);
  objc_storeStrong((id *)&self->_messageResolutionPipeline, 0);
  objc_storeStrong((id *)&self->_whiteRose, 0);
  objc_storeStrong((id *)&self->_largeMessageStorage, 0);
  objc_storeStrong((id *)&self->_messageProcessingStrategy, 0);
  objc_storeStrong((id *)&self->_siriAnalyticsListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke_2;
  v6[3] = &unk_1E4357C48;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v6[4] = v4;
  v7 = v5;
  objc_msgSend(v2, "afterFirstUnlock:", v6);

}

void __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1[6])
  {
    objc_msgSend(*(id *)(a1[4] + 104), "sensitiveConditionsWithBootSessionUUIDs:", a1[5]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v3 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
    {
      v4 = a1[5];
      v5 = 136315394;
      v6 = "-[AssistantSiriAnalyticsService sensitiveConditionRangesForBootSessionUUIDs:completion:]_block_invoke_2";
      v7 = 2112;
      v8 = v4;
      _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
}

uint64_t __62__AssistantSiriAnalyticsService_handler_createTag_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "createTag:completion:", a1[5], a1[6]);
}

uint64_t __76__AssistantSiriAnalyticsService_handler_saveState_forPluginName_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 72), "setPluginState:forBundleIdentifier:", a1[5], a1[6]);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__AssistantSiriAnalyticsService_handler_fetchStateForPluginName_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "pluginStateForBundleIdentifier:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[6];
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

uint64_t __60__AssistantSiriAnalyticsService_handler_fetchLogicalClocks___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, a2, 0);
  return result;
}

uint64_t __75__AssistantSiriAnalyticsService_handler_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __67__AssistantSiriAnalyticsService_handler_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __73__AssistantSiriAnalyticsService_handler_resetLogicalClockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, a2, 0);
  return result;
}

void __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6 = objc_msgSend(v3, "timestamp");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke_2;
    v7[3] = &unk_1E4357420;
    v8 = v3;
    objc_msgSend(v5, "resolveMessage:timestamp:completion:", v4, v6, v7);

  }
}

void __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = a2;
    +[AssistantSiriAnalytics sharedAnalytics](AssistantSiriAnalytics, "sharedAnalytics");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultMessageStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "timestamp");
    objc_msgSend(*(id *)(a1 + 32), "streamUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emitMessage:timestamp:isolatedStreamUUID:", v3, v5, v6);

  }
}

uint64_t __67__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "trackAnyEventEmitted:", v7, (_QWORD)v11);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
        +[SiriAnalyticsOffDeviceTopicsShim unordered](SiriAnalyticsOffDeviceTopicsShim, "unordered");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "store:topic:completion:", v7, v9, &__block_literal_global);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "sendWithAnyEvents:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "tailAnyEvents:", *(_QWORD *)(a1 + 32));
}

void __67__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v3 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[AssistantSiriAnalyticsService handler:unorderedMessagesReceived:]_block_invoke_2";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1A025F000, v3, OS_LOG_TYPE_ERROR, "%s Failed to persist message: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void __58__AssistantSiriAnalyticsService_handler_messagesReceived___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v4 = a2;
  objc_msgSend(v3, "sendWithRuntimeEvents:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "processWithMessages:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "trackEmittedEvents:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "tailMessages:", v4);

}

uint64_t __60__AssistantSiriAnalyticsService_sensitiveCondition_endedAt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sensitiveCondition:endedAt:ensureClockExists:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, 0);
}

uint64_t __62__AssistantSiriAnalyticsService_sensitiveCondition_startedAt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sensitiveCondition:startedAt:ensureClockExists:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, 0);
}

uint64_t __69__AssistantSiriAnalyticsService_registerSensitiveConditionsObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addSensitiveConditionsObserver:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__AssistantSiriAnalyticsService_registerMessageResolver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "registerMessageResolver:", *(_QWORD *)(a1 + 40));
}

void __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 160);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4357C98;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "afterFirstUnlock:", v4);

}

uint64_t __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupMaintenanceWorkOnQueueWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 160);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4357C98;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "afterFirstUnlock:", v4);

}

uint64_t __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_bootstrapStorageOnQueue");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_getPreprocessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerWithReason:completion:", 0, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "prune");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "prune");
}

uint64_t __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_getPreprocessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerWithReason:completion:", 1, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "prune");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "prune");
}

uint64_t __66__AssistantSiriAnalyticsService__buildDependenciesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_buildDependenciesOnQueue");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupIncomingConnections");
  v2 = mach_continuous_time();
  v3 = *(_QWORD *)(a1 + 40);
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_391);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "trackRuntimeBootstrapCompleteWithBootstrapTimeInNs:", (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)(v2 - v3)));
}

@end
