@implementation SYActivityObserver

uint64_t __70__SYActivityObserver__reportActiveUserActivityChangeIfNeeded_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_reportActiveUserActivityChangeIfNeeded:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityPersistentIdentifierWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", v6, v8);

  }
}

void __36__SYActivityObserver_sharedInstance__block_invoke()
{
  SYActivityObserver *v0;
  void *v1;

  v0 = objc_alloc_init(SYActivityObserver);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (SYActivityObserver)init
{
  SYActivityObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *observerQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYActivityObserver;
  v2 = -[SYActivityObserver init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.ActivityObserver", v3);
    observerQueue = v2->__observerQueue;
    v2->__observerQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

uint64_t __71__SYActivityObserver__discoverAndProcessActiveUserActivityWithContext___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reportActiveUserActivityChangeIfNeeded:context:", a2, *(_QWORD *)(result + 40));
  return result;
}

void __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  char v15;

  v4 = +[SYDefaults shouldDisableQuickNoteTemporarily](SYDefaults, "shouldDisableQuickNoteTemporarily");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_2;
  v8[3] = &unk_1E757C460;
  v13 = a2;
  v14 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v15 = *(_BYTE *)(a1 + 64);
  v12 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;
  id v7;
  id v8;
  char v9;

  if (*(_QWORD *)(a1 + 64)
    && !*(_BYTE *)(a1 + 72)
    && (!*(_QWORD *)(a1 + 32) || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "appIsActive")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_observerQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_3;
    block[3] = &unk_1E757C438;
    v4 = *(int8x16_t *)(a1 + 32);
    v3 = (id)v4.i64[0];
    v6 = vextq_s8(v4, v4, 8uLL);
    v7 = *(id *)(a1 + 48);
    v9 = *(_BYTE *)(a1 + 73);
    v8 = *(id *)(a1 + 56);
    dispatch_async(v2, block);

  }
}

void __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  SYBacklinkMonitorClient *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "set_delayedEvaluationBlock:", 0);
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = 1;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "set_lastReportedActivityWasLinkable:", v2);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "set_lastReportedActivityTime:", v3);

    v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(const __CFString **)(a1 + 40);
      if (!v5)
        v5 = CFSTR("None");
      v6 = CFSTR("Y");
      if (!*(_BYTE *)(a1 + 64))
        v6 = CFSTR("N");
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "ActivityObserver: Starting request for activity: %@, linkable: %@.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(SYBacklinkMonitorClient);
      objc_msgSend(*(id *)(a1 + 32), "set_client:", v8);

    }
    if (*(_BYTE *)(a1 + 64))
      v9 = *(void **)(a1 + 48);
    else
      v9 = 0;
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "_client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke_21;
    v15[3] = &unk_1E757C4D8;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v12, "notifyActiveUserActivityDidChange:context:completion:", v11, v13, v15);

LABEL_17:
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_lastReportedActivityWasLinkable"))
  {
    v2 = *(_BYTE *)(a1 + 64) != 0;
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 48) && !*(_BYTE *)(a1 + 64))
  {
    v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "ActivityObserver: Current activity %@ is not linkable, ignoring.", buf, 0xCu);
    }
    goto LABEL_17;
  }
}

- (void)q_processActiveUserActivity:(id)a3 identifier:(id)a4 linkable:(BOOL)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  __CFString *v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  NSObject *v27;
  const __CFString *v28;
  dispatch_time_t v29;
  NSObject *v30;
  void *v31;
  _QWORD block[5];
  __CFString *v33;
  id v34;
  id v35;
  BOOL v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SYActivityObserver _delayedEvaluationBlock](self, "_delayedEvaluationBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_INFO, "ActivityObserver: Cancelled previous scheduled request.", buf, 2u);
    }

    -[SYActivityObserver _delayedEvaluationBlock](self, "_delayedEvaluationBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v15);

    -[SYActivityObserver set_delayedEvaluationBlock:](self, "set_delayedEvaluationBlock:", 0);
  }
  -[SYActivityObserver _lastReportedActivityTime](self, "_lastReportedActivityTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v18 = v17;
    -[SYActivityObserver _lastReportedActivityTime](self, "_lastReportedActivityTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v21 = v20;

    if (v21 - v18 + 2.0 >= 0.1)
      v22 = v21 - v18 + 2.0;
    else
      v22 = 0.1;
  }
  else
  {
    v22 = 0.1;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke;
  block[3] = &unk_1E757C438;
  block[4] = self;
  v36 = a5;
  v23 = (__CFString *)v11;
  v33 = v23;
  v34 = v10;
  v35 = v12;
  v24 = v12;
  v25 = v10;
  v26 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[SYActivityObserver set_delayedEvaluationBlock:](self, "set_delayedEvaluationBlock:", v26);

  v27 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = CFSTR("None");
    if (v23)
      v28 = v23;
    *(_DWORD *)buf = 134218242;
    v38 = v22;
    v39 = 2112;
    v40 = v28;
    _os_log_impl(&dword_1BCC38000, v27, OS_LOG_TYPE_INFO, "ActivityObserver: Scheduling request after %0.2fs for activity: %@.", buf, 0x16u);
  }

  v29 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
  -[SYActivityObserver _observerQueue](self, "_observerQueue");
  v30 = objc_claimAutoreleasedReturnValue();
  -[SYActivityObserver _delayedEvaluationBlock](self, "_delayedEvaluationBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v29, v30, v31);

}

- (id)_delayedEvaluationBlock
{
  return self->__delayedEvaluationBlock;
}

- (void)set_delayedEvaluationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)_lastReportedActivityTime
{
  return self->__lastReportedActivityTime;
}

- (SYBacklinkMonitorClient)_client
{
  return self->__client;
}

- (BOOL)_lastReportedActivityWasLinkable
{
  return self->__lastReportedActivityWasLinkable;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

uint64_t __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_processActiveUserActivity:identifier:linkable:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_handleAppBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: app is active %@", (uint8_t *)&v7, 0xCu);
  }

  -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYActivityObserver _discoverAndProcessActiveUserActivityWithContext:](self, "_discoverAndProcessActiveUserActivityWithContext:", v6);

}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  v4 = a4;
  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityDidBecomeCurrent", v11, 2u);
  }

  if (v4)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsCacheUpdate:", 1);
  -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", v9, v10);

}

- (id)_defaultActivityObserverContext
{
  SYActivityObserverContext *v2;

  v2 = objc_alloc_init(SYActivityObserverContext);
  -[SYActivityObserverContext setNeedsCacheUpdate:](v2, "setNeedsCacheUpdate:", 0);
  return v2;
}

- (void)_q_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  SYUserActivityIdentifierInfo *v11;
  void *v12;
  SYDefaultsClient *v13;
  void *v14;
  id v15;
  id v16;
  SYUserActivityIdentifierInfo *v17;
  _QWORD v18[4];
  SYUserActivityIdentifierInfo *v19;
  SYActivityObserver *v20;
  id v21;
  id v22;
  BOOL v23;

  v6 = a3;
  v7 = a4;
  -[SYActivityObserver _observerQueue](self, "_observerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    v9 = SYIsLinkableUserActivity(v6);
    objc_msgSend(v6, "_uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SYUserActivityIdentifierInfo initWithUserActivity:]([SYUserActivityIdentifierInfo alloc], "initWithUserActivity:", v6);
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  -[SYActivityObserver _defaultsClient](self, "_defaultsClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(SYDefaultsClient);
    -[SYActivityObserver set_defaultsClient:](self, "set_defaultsClient:", v13);

  }
  -[SYActivityObserver _defaultsClient](self, "_defaultsClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__SYActivityObserver__q_reportActiveUserActivityChangeIfNeeded_context___block_invoke;
  v18[3] = &unk_1E757C488;
  v19 = v11;
  v20 = self;
  v23 = v9;
  v21 = v10;
  v22 = v7;
  v15 = v7;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "indicatorCoverageWithCompletion:", v18);

}

- (SYDefaultsClient)_defaultsClient
{
  return self->__defaultsClient;
}

- (void)_reportActiveUserActivityChangeIfNeeded:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SYActivityObserver _observerQueue](self, "_observerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SYActivityObserver__reportActiveUserActivityChangeIfNeeded_context___block_invoke;
  block[3] = &unk_1E757B410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- (void)set_defaultsClient:(id)a3
{
  objc_storeStrong((id *)&self->__defaultsClient, a3);
}

- (void)_discoverAndProcessActiveUserActivityWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CA5920];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SYActivityObserver__discoverAndProcessActiveUserActivityWithContext___block_invoke;
  v7[3] = &unk_1E757C4B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_syFetchCurrentUserActivityWithCompletion:", v7);

}

void __41__SYActivityObserver_loadSynapseObserver__block_invoke()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  NSObject *v3;
  SYDocumentWorkflowsActivityObserver *v4;
  uint8_t v5[16];
  uint8_t v6[16];
  uint8_t buf[16];

  v0 = SYIsBacklinkingSupportedForDevice();
  v1 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCC38000, v1, OS_LOG_TYPE_INFO, "ActivityObserver: Loading observer.", buf, 2u);
    }

    +[SYActivityObserver sharedInstance](SYActivityObserver, "sharedInstance");
    v1 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(getUAUserActivityClass(), "addUserActivityObserver:", v1);
    -[NSObject registerForAppStateNotifications](v1, "registerForAppStateNotifications");
  }
  else if (v2)
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCC38000, v1, OS_LOG_TYPE_INFO, "ActivityObserver: Backlinking is disabled for current device.", v6, 2u);
  }

  if (SYIsReturnToSenderEnabled())
  {
    v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "Loading document workflows observer.", v5, 2u);
    }

    v4 = objc_alloc_init(SYDocumentWorkflowsActivityObserver);
    -[SYDocumentWorkflowsActivityObserver registerForAppStateNotifications](v4, "registerForAppStateNotifications");
    objc_msgSend(getUAUserActivityClass(), "addUserActivityObserver:", v4);

  }
}

- (void)registerForAppStateNotifications
{
  SYApplicationStateObserver *v3;
  uint64_t v4;
  SYApplicationStateObserver *v5;
  SYApplicationStateObserver *appStateObserver;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_appStateObserver)
  {
    objc_initWeak(&location, self);
    v3 = [SYApplicationStateObserver alloc];
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SYActivityObserver_registerForAppStateNotifications__block_invoke;
    v9[3] = &unk_1E757BAF8;
    objc_copyWeak(&v10, &location);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __54__SYActivityObserver_registerForAppStateNotifications__block_invoke_2;
    v7[3] = &unk_1E757BAF8;
    objc_copyWeak(&v8, &location);
    v5 = -[SYApplicationStateObserver initWithBecomeActiveHandler:resignActiveHandler:](v3, "initWithBecomeActiveHandler:resignActiveHandler:", v9, v7);
    appStateObserver = self->_appStateObserver;
    self->_appStateObserver = v5;

    -[SYApplicationStateObserver registerForAppStateNotifications](self->_appStateObserver, "registerForAppStateNotifications");
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  return (id)sharedInstance___instance;
}

void __54__SYActivityObserver_registerForAppStateNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAppBecomeActive:", v3);

}

+ (void)loadSynapseObserver
{
  if (loadSynapseObserver_onceToken != -1)
    dispatch_once(&loadSynapseObserver_onceToken, &__block_literal_global_2);
}

- (void)set_lastReportedActivityWasLinkable:(BOOL)a3
{
  self->__lastReportedActivityWasLinkable = a3;
}

- (void)set_lastReportedActivityTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastReportedActivityTime, a3);
}

- (void)indexedContentItemsDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SYActivityObserver_indexedContentItemsDidChange__block_invoke;
  block[3] = &unk_1E757B758;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__SYActivityObserver_indexedContentItemsDidChange__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  SYActivityObserverContext *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appIsActive");
  v3 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "ActivityObserver: Indexed content items did change. App is active: %d", (uint8_t *)v6, 8u);
  }

  if (v2)
  {
    v4 = objc_alloc_init(SYActivityObserverContext);
    -[SYActivityObserverContext setNeedsCacheUpdate:](v4, "setNeedsCacheUpdate:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_discoverAndProcessActiveUserActivityWithContext:", v4);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_defaultActivityObserverContext");
    v4 = (SYActivityObserverContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reportActiveUserActivityChangeIfNeeded:context:", 0, v4);
  }

}

void __78__SYActivityObserver_q_processActiveUserActivity_identifier_linkable_context___block_invoke_21(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(const __CFString **)(a1 + 32);
    if (!v5)
      v5 = CFSTR("None");
    v6 = CFSTR("Y");
    if (!a2)
      v6 = CFSTR("N");
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "ActivityObserver: Finished request for activity: %@. Success: %@", (uint8_t *)&v8, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SYRemoteCurrentActivityDidChange"), 0, 0, 1u);
}

- (void)userActivityTargetContentIdentifierWasChanged:(id)a3 targetContentIdentifier:(id)a4 previousValue:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityTargetContentIdentifierWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", v6, v8);

  }
}

- (void)userActivityWebpageURLWasChanged:(id)a3 webpageURL:(id)a4 previousValue:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityWebpageURLWasChanged", v9, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v6))
  {
    -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsCacheUpdate:", 1);
    -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", v6, v8);

  }
}

- (void)userActivityCanonicalURLWasChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: userActivityCanonicalURLWasChanged", v7, 2u);
  }

  if (SYIsCurrentLocalUserActivity(v4))
  {
    -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", v4, v6);

  }
}

void __54__SYActivityObserver_registerForAppStateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAppResignActive:", v3);

}

- (void)_handleAppResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "ActivityObserver: app is inactive %@", (uint8_t *)&v7, 0xCu);
  }

  -[SYActivityObserver _defaultActivityObserverContext](self, "_defaultActivityObserverContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYActivityObserver _reportActiveUserActivityChangeIfNeeded:context:](self, "_reportActiveUserActivityChangeIfNeeded:context:", 0, v6);

}

- (void)set_observerQueue:(id)a3
{
  objc_storeStrong((id *)&self->__observerQueue, a3);
}

- (SYUserActivityIdentifierInfo)_pendingActivityInfo
{
  return self->__pendingActivityInfo;
}

- (void)set_pendingActivityInfo:(id)a3
{
  objc_storeStrong((id *)&self->__pendingActivityInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__delayedEvaluationBlock, 0);
  objc_storeStrong((id *)&self->__pendingActivityInfo, 0);
  objc_storeStrong((id *)&self->__lastReportedActivityTime, 0);
  objc_storeStrong((id *)&self->__defaultsClient, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->__observerQueue, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
}

@end
