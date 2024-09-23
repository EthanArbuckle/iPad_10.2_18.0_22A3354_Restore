@implementation STYSignpostsMonitor

- (STYSignpostsMonitor)init
{
  STYSignpostsMonitor *v2;
  void *v3;
  id v4;
  const char *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *monitorQueue;
  STYGeneralSignpostMonitorHelper *v12;
  STYGeneralSignpostMonitorHelper *generalSignpostHelper;
  STYSpecialAppLaunchSignpostMonitorHelper *v14;
  STYSpecialAppLaunchSignpostMonitorHelper *specialAppLaunchSignpostHelper;
  STYWorkflowResponsivenessMonitorHelper *v16;
  STYWorkflowResponsivenessMonitorHelper *workflowResponsivenessHelper;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)STYSignpostsMonitor;
  v2 = -[STYSignpostsMonitor init](&v19, sel_init);
  if (v2)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subsystemForSignposts");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    v6 = os_log_create(v5, "timeToReceiveASignpostNotification");
    v7 = (void *)handleForNotificationLatency;
    handleForNotificationLatency = (uint64_t)v6;

    v8 = os_log_create(v5, "signpostNotificationStreamClosed");
    v9 = (void *)handleForNotificationDisconnects;
    handleForNotificationDisconnects = (uint64_t)v8;

    v10 = dispatch_queue_create("com.apple.sentry.signpostsMonitor.monitorQueue", 0);
    monitorQueue = v2->_monitorQueue;
    v2->_monitorQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(STYGeneralSignpostMonitorHelper);
    generalSignpostHelper = v2->_generalSignpostHelper;
    v2->_generalSignpostHelper = v12;

    v14 = objc_alloc_init(STYSpecialAppLaunchSignpostMonitorHelper);
    specialAppLaunchSignpostHelper = v2->_specialAppLaunchSignpostHelper;
    v2->_specialAppLaunchSignpostHelper = v14;

    v16 = objc_alloc_init(STYWorkflowResponsivenessMonitorHelper);
    workflowResponsivenessHelper = v2->_workflowResponsivenessHelper;
    v2->_workflowResponsivenessHelper = v16;

  }
  return v2;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_7);
  return (id)sharedMonitor_sharedMonitor;
}

void __36__STYSignpostsMonitor_sharedMonitor__block_invoke()
{
  STYSignpostsMonitor *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DistributedCenter;
  STYAbcHelper *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *attr;

  v0 = objc_alloc_init(STYSignpostsMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

  if (sharedMonitor_sharedMonitor)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    attr = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.Sentry.Framework.htInteraction", attr);
    v3 = (void *)htInteractionQueue;
    htInteractionQueue = (uint64_t)v2;

    v4 = dispatch_queue_create("com.apple.Sentry.Framework.signpostSupport", attr);
    v5 = (void *)signpostSupportQueue;
    signpostSupportQueue = (uint64_t)v4;

    v6 = dispatch_queue_create("com.apple.Sentry.Framework.stateVariableUpdate", attr);
    v7 = (void *)stateVariableUpdateQueue;
    stateVariableUpdateQueue = (uint64_t)v6;

    v8 = dispatch_queue_create("com.apple.Sentry.Framework.mkHTInteraction", attr);
    v9 = (void *)mkHangtracerInteractionQueue;
    mkHangtracerInteractionQueue = (uint64_t)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)outstandingTailspinSaveRequests;
    outstandingTailspinSaveRequests = v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)perfIssueDetectionTimeLogs;
    perfIssueDetectionTimeLogs = v12;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)responseRecieved, (CFStringRef)kSTYTailspinSaveOperationCompletedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, 0, (CFNotificationCallback)responseRecieved, (CFStringRef)kSTYTailspinSaveOperationCompletedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    notify_register_dispatch("com.apple.sentry.Signpostmonitor.conifg_changed", (int *)&sentryConfigChangeNotificationToken, (dispatch_queue_t)htInteractionQueue, &__block_literal_global_65);
    notify_register_dispatch("com.apple.da.tasking_changed", &HTConfigChangeNotificationToken, (dispatch_queue_t)htInteractionQueue, &__block_literal_global_67);
    v16 = objc_alloc_init(STYAbcHelper);
    objc_msgSend((id)sharedMonitor_sharedMonitor, "generalSignpostHelper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAbcHelper:", v16);

    STYFrameworkDefaults();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLForKey:", kSTYDefaultsForceAcceptAppLaunchKey);
    objc_msgSend((id)sharedMonitor_sharedMonitor, "specialAppLaunchSignpostHelper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setForceAppLaunchDiagnostics:", v19);

    objc_msgSend((id)sharedMonitor_sharedMonitor, "workflowResponsivenessHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedMonitor_sharedMonitor, "monitorQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "notifyWhenSettingsChanged:block:", v22, &__block_literal_global_69);

  }
}

uint64_t __36__STYSignpostsMonitor_sharedMonitor__block_invoke_4()
{
  return objc_msgSend((id)sharedMonitor_sharedMonitor, "checkMonitoring:", 1);
}

- (void)forEachHelper:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[STYSignpostsMonitor generalSignpostHelper](self, "generalSignpostHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  -[STYSignpostsMonitor specialAppLaunchSignpostHelper](self, "specialAppLaunchSignpostHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v7);

  -[STYSignpostsMonitor workflowResponsivenessHelper](self, "workflowResponsivenessHelper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v8);

}

- (void)forEachEnabledHelper:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__STYSignpostsMonitor_forEachEnabledHelper___block_invoke;
  v6[3] = &unk_1E86A0C28;
  v7 = v4;
  v5 = v4;
  -[STYSignpostsMonitor forEachHelper:](self, "forEachHelper:", v6);

}

void __44__STYSignpostsMonitor_forEachEnabledHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)disable
{
  -[STYSignpostsMonitor forEachHelper:](self, "forEachHelper:", &__block_literal_global_71);
}

void __30__STYSignpostsMonitor_disable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  objc_msgSend(v2, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__STYSignpostsMonitor_disable__block_invoke_2;
  block[3] = &unk_1E86A0B60;
  v6 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

uint64_t __30__STYSignpostsMonitor_disable__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndMonitoring");
}

- (BOOL)needsEnablementChange
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__STYSignpostsMonitor_needsEnablementChange__block_invoke;
  v4[3] = &unk_1E86A0C90;
  v4[4] = &v5;
  -[STYSignpostsMonitor forEachHelper:](self, "forEachHelper:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__STYSignpostsMonitor_needsEnablementChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "needsEnablementChange");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)setupRetryAfterFailure
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "successiveExtractorFailureCount");
  OUTLINED_FUNCTION_16(&dword_1CB87B000, v1, v2, "%u successive failures communicating with diagnosticsd . Pre-emptively ceasing signpost monitoring", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_25();
}

uint64_t __45__STYSignpostsMonitor_setupRetryAfterFailure__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB87B000, v3, OS_LOG_TYPE_DEFAULT, "Retrying", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (void)checkMonitoring:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  NSObject *v35;
  uint8_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t v42[8];
  uint8_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a3 || -[STYSignpostsMonitor needsEnablementChange](self, "needsEnablementChange"))
  {
    -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopProcessing");

    -[STYSignpostsMonitor setSignpostExtractor:](self, "setSignpostExtractor:", 0);
    v5 = objc_alloc_init(MEMORY[0x1E0D97680]);
    v6 = (void *)os_transaction_create();
    *(_QWORD *)v42 = 0;
    v43 = v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke;
    v34[3] = &unk_1E86A0CE0;
    v8 = v5;
    v35 = v8;
    v36 = v42;
    v37 = &v38;
    -[STYSignpostsMonitor forEachHelper:](self, "forEachHelper:", v34);

    if (v43[24])
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D97678]);
      -[STYSignpostsMonitor setSignpostExtractor:](self, "setSignpostExtractor:", v9);

      -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = v10 == 0;

      if ((_DWORD)v9)
      {
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logHandle");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          -[STYSignpostsMonitor checkMonitoring:].cold.1();

        -[STYSignpostsMonitor setupRetryAfterFailure](self, "setupRetryAfterFailure");
      }
      else
      {
        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSubsystemCategoryFilter:", v8);

        v33[0] = v7;
        v33[1] = 3221225472;
        v33[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_76;
        v33[3] = &unk_1E86A0D30;
        v33[4] = self;
        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIntervalCompletionProcessingBlock:", v33);

        v32[0] = v7;
        v32[1] = 3221225472;
        v32[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_4;
        v32[3] = &unk_1E86A0D58;
        v32[4] = self;
        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEmitEventProcessingBlock:", v32);

        v31[0] = v7;
        v31[1] = 3221225472;
        v31[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_7;
        v31[3] = &unk_1E86A0D58;
        v31[4] = self;
        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBeginEventProcessingBlock:", v31);

        v30[0] = v7;
        v30[1] = 3221225472;
        v30[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10;
        v30[3] = &unk_1E86A0D80;
        v30[4] = self;
        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProcessingCompletionBlock:", v30);

        -[STYSignpostsMonitor signpostExtractor](self, "signpostExtractor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *((unsigned __int8 *)v39 + 24);
        -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        LOBYTE(v17) = objc_msgSend(v16, "processNotificationsWithIntervalTimeoutInSeconds:shouldCalculateAnimationFramerate:targetQueue:errorOut:", 30, v17 != 0, v18, &v29);
        v19 = v29;

        if ((v17 & 1) != 0)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "logHandle");
          v21 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB87B000, v21, OS_LOG_TYPE_DEFAULT, "Signpost extractor created succesfully", buf, 2u);
          }
        }
        else
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "logHandle");
          v21 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "localizedDescription");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "code");
            -[STYSignpostsMonitor checkMonitoring:].cold.2();
          }
        }

      }
    }
    else
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logHandle");
      v23 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB87B000, v23, OS_LOG_TYPE_DEFAULT, "No monitoring enabled", buf, 2u);
      }

    }
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v42, 8);
  }
  else
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_1CB87B000, v8, OS_LOG_TYPE_INFO, "No change in monitoring", v42, 2u);
    }
  }

}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(v3, "processingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2;
  block[3] = &unk_1E86A0CB8;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  dispatch_sync(v4, block);

}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2(uint64_t a1)
{
  id *v2;
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldBeEnabled");
  v4 = objc_msgSend(*v2, "isEnabled");
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_1(v2);

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v2, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v8;
        _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ starting monitoring", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(*v2, "willStartMonitoring");
    }
    objc_msgSend(*v2, "allowList");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "allowList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAllowlist:", v10);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      if (objc_msgSend(*(id *)(a1 + 32), "wantsAnimationFrameRate"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logHandle");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v2, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1CB87B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has nothing to monitor", (uint8_t *)&v14, 0xCu);

      }
    }
LABEL_21:

    return;
  }
  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_2(v2);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*v2, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending monitoring", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*v2, "didEndMonitoring");
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_77;
  v7[3] = &unk_1E86A0D08;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "forEachEnabledHelper:", v7);
  objc_msgSend(*(id *)(a1 + 32), "reportLatencyToReceiveSignposts:", v5);

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "allowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "passesSubsystem:category:", v5, v6);

  if (v7)
  {
    objc_msgSend(v3, "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_3;
    v9[3] = &unk_1E86A08D0;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInterval:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_5;
  v7[3] = &unk_1E86A0D08;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "forEachEnabledHelper:", v7);
  objc_msgSend(*(id *)(a1 + 32), "reportLatencyToReceiveSignposts:", v5);

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "allowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "passesSubsystem:category:", v5, v6);

  if (v7)
  {
    objc_msgSend(v3, "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_6;
    v9[3] = &unk_1E86A08D0;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEmit:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_8;
  v7[3] = &unk_1E86A0D08;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "forEachEnabledHelper:", v7);
  objc_msgSend(*(id *)(a1 + 32), "reportLatencyToReceiveSignposts:", v5);

  return 1;
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "allowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "passesSubsystem:category:", v5, v6);

  if (v7)
  {
    objc_msgSend(v3, "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__STYSignpostsMonitor_checkMonitoring___block_invoke_9;
    v9[3] = &unk_1E86A08D0;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
}

uint64_t __39__STYSignpostsMonitor_checkMonitoring___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleIntervalBegin:", *(_QWORD *)(a1 + 40));
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10_cold_1(v3);

    v6 = handleForNotificationLatency;
    if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB87B000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "signpostNotificationStreamClosed", (const char *)&unk_1CB88E3FF, buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setupRetryAfterFailure");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CB87B000, v5, OS_LOG_TYPE_INFO, "Stopped monitoring signposts", v7, 2u);
    }

  }
}

- (void)reportLatencyToReceiveSignposts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "endEvent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_13;
    }
    v5 = v4;
  }
  v6 = v5;
  if (v5)
  {
    v7 = self->_eventCount + 1;
    self->_eventCount = v7;
    if (v7 == 100)
    {
      v8 = (void *)handleForNotificationLatency;
      if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
      {
        v9 = v8;
        v11 = 134217984;
        v12 = objc_msgSend(v6, "timeRecordedMachContinuousTime");
        _os_signpost_emit_with_name_impl(&dword_1CB87B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToReceiveASignpostNotification", "%{signpost.description:begin_time}llu", (uint8_t *)&v11, 0xCu);

      }
      v10 = handleForNotificationLatency;
      if (os_signpost_enabled((os_log_t)handleForNotificationLatency))
      {
        LOWORD(v11) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CB87B000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToReceiveASignpostNotification", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
      }
      self->_eventCount = 0;
    }
  }
LABEL_13:

}

- (BOOL)monitorSignposts:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[16];

  v3 = a3;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "Monitoring general signposts (seed mode)";
LABEL_6:
      _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = "Monitoring general signposts";
    goto LABEL_6;
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__STYSignpostsMonitor_monitorSignposts___block_invoke;
  v11[3] = &unk_1E86A0DA8;
  v11[4] = self;
  v12 = v3;
  dispatch_async(v9, v11);

  return 1;
}

uint64_t __40__STYSignpostsMonitor_monitorSignposts___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "generalSignpostHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 1);

  v3 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "generalSignpostHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeedUserMode:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (void)stopMonitoringSignposts
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB87B000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring general signposts", buf, 2u);
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__STYSignpostsMonitor_stopMonitoringSignposts__block_invoke;
  block[3] = &unk_1E86A0B60;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __46__STYSignpostsMonitor_stopMonitoringSignposts__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "generalSignpostHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (BOOL)monitorAppLaunchSignposts
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB87B000, v4, OS_LOG_TYPE_DEFAULT, "Monitoring app launch signposts", buf, 2u);
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__STYSignpostsMonitor_monitorAppLaunchSignposts__block_invoke;
  block[3] = &unk_1E86A0B60;
  block[4] = self;
  dispatch_async(v5, block);

  return 1;
}

uint64_t __48__STYSignpostsMonitor_monitorAppLaunchSignposts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "specialAppLaunchSignpostHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "generalSignpostHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAvoidGeneratingTailspinsForAppLaunches:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (void)stopMonitoringAppLaunchSignposts
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB87B000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring app launch signposts", buf, 2u);
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__STYSignpostsMonitor_stopMonitoringAppLaunchSignposts__block_invoke;
  block[3] = &unk_1E86A0B60;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __55__STYSignpostsMonitor_stopMonitoringAppLaunchSignposts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "specialAppLaunchSignpostHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "generalSignpostHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAvoidGeneratingTailspinsForAppLaunches:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (BOOL)monitorWorkflowsWithDailyLogLimit:(int)a3 perPeriodLogLimit:(int)a4 periodLengthSec:(int)a5
{
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  int v14;
  int v15;
  int v16;
  uint8_t buf[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB87B000, v10, OS_LOG_TYPE_DEFAULT, "Monitoring workflow responsiveness", buf, 2u);
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__STYSignpostsMonitor_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec___block_invoke;
  block[3] = &unk_1E86A0DD0;
  block[4] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  dispatch_async(v11, block);

  return 1;
}

uint64_t __91__STYSignpostsMonitor_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "workflowResponsivenessHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 1);

  v3 = *(unsigned int *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "workflowResponsivenessHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerDayLogLimit:", v3);

  v5 = *(unsigned int *)(a1 + 44);
  objc_msgSend(*(id *)(a1 + 32), "workflowResponsivenessHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPerPeriodLogLimit:", v5);

  v7 = *(unsigned int *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "workflowResponsivenessHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPeriodLengthSec:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (void)stopMonitoringWorkflows
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB87B000, v4, OS_LOG_TYPE_DEFAULT, "Stopping monitoring workflow responsiveness", buf, 2u);
  }

  -[STYSignpostsMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__STYSignpostsMonitor_stopMonitoringWorkflows__block_invoke;
  block[3] = &unk_1E86A0B60;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __46__STYSignpostsMonitor_stopMonitoringWorkflows__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "workflowResponsivenessHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldBeEnabled:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "checkMonitoring:", 0);
}

- (OS_dispatch_queue)monitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonitorQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SignpostSupportObjectExtractor)signpostExtractor
{
  return (SignpostSupportObjectExtractor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignpostExtractor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)timeOfLastExtractorFailure
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimeOfLastExtractorFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)successiveExtractorFailureCount
{
  return self->_successiveExtractorFailureCount;
}

- (void)setSuccessiveExtractorFailureCount:(unsigned int)a3
{
  self->_successiveExtractorFailureCount = a3;
}

- (unsigned)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unsigned int)a3
{
  self->_eventCount = a3;
}

- (STYGeneralSignpostMonitorHelper)generalSignpostHelper
{
  return (STYGeneralSignpostMonitorHelper *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGeneralSignpostHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (STYSpecialAppLaunchSignpostMonitorHelper)specialAppLaunchSignpostHelper
{
  return (STYSpecialAppLaunchSignpostMonitorHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpecialAppLaunchSignpostHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (STYWorkflowResponsivenessMonitorHelper)workflowResponsivenessHelper
{
  return (STYWorkflowResponsivenessMonitorHelper *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkflowResponsivenessHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowResponsivenessHelper, 0);
  objc_storeStrong((id *)&self->_specialAppLaunchSignpostHelper, 0);
  objc_storeStrong((id *)&self->_generalSignpostHelper, 0);
  objc_storeStrong((id *)&self->_timeOfLastExtractorFailure, 0);
  objc_storeStrong((id *)&self->_signpostExtractor, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

- (void)checkMonitoring:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_13();
  _os_log_fault_impl(&dword_1CB87B000, v0, OS_LOG_TYPE_FAULT, "Unable to create signpost extractor", v1, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)checkMonitoring:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_12(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(_QWORD *)(v3 + 14) = v4;
  _os_log_error_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_ERROR, "Failed to register for signpost notifications. \n Error Description: %@ \n Error Code: %ld", v5, 0x16u);

  OUTLINED_FUNCTION_11();
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "%{public}@ already monitoring", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_2_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "%{public}@ already not monitoring", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __39__STYSignpostsMonitor_checkMonitoring___block_invoke_10_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CB87B000, v2, v3, "Signpost extractor completed with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
