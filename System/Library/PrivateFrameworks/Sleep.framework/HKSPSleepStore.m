@implementation HKSPSleepStore

- (void)connectSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  HKSPXPCMessage *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  HKSPXPCMessage *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  HKSPSleepStore *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ connecting", buf, 0xCu);
    }

    -[HKSPSleepStore description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v9 = [HKSPXPCMessage alloc];
    if (v3)
      v10 = 3;
    else
      v10 = 2;
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__HKSPSleepStore_connectSynchronously___block_invoke;
    v19[3] = &unk_1E4E3BCD0;
    objc_copyWeak(&v20, (id *)buf);
    v14 = v11;
    v15 = 3221225472;
    v16 = __39__HKSPSleepStore_connectSynchronously___block_invoke_3;
    v17 = &unk_1E4E3BCF8;
    v12 = v8;
    v18 = v12;
    v13 = -[HKSPXPCMessage initWithIdentifier:block:options:errorHandler:](v9, "initWithIdentifier:block:options:errorHandler:", CFSTR("connect"), v19, v10, &v14);
    -[HKSPXPCConnectionProvider sendMessage:](self->_connectionProvider, "sendMessage:", v13, v14, v15, v16, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCClientIdentifier loggingIdentifier](self->_clientIdentifier, "loggingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@.%@.%p]"), v5, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__HKSPSleepStore_connectSynchronously___block_invoke_2;
  v8[3] = &unk_1E4E3BCA8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v6;
  v9 = v7;
  objc_msgSend(v5, "connectWithCompletion:", v8);

  objc_destroyWeak(&v10);
}

- (HKSPSleepStore)initWithIdentifier:(id)a3
{
  return -[HKSPSleepStore initWithIdentifier:healthStore:](self, "initWithIdentifier:healthStore:", a3, 0);
}

void __48__HKSPSleepStore_currentSleepSettingsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  HKSPNilify(a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __51__HKSPSleepStore_currentSleepEventRecordWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  HKSPNilify(a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)currentSleepEventRecordWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[HKSPSleepStore _getSleepEventRecordDoSync:](self, "_getSleepEventRecordDoSync:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_currentSleepEventRecordWithError___block_invoke;
  v8[3] = &unk_1E4E3BF28;
  v8[4] = &v15;
  v8[5] = &v9;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)currentSleepSettingsWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[HKSPSleepStore _getSleepSettingsDoSync:](self, "_getSleepSettingsDoSync:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore_currentSleepSettingsWithError___block_invoke;
  v8[3] = &unk_1E4E3BEB0;
  v8[4] = &v15;
  v8[5] = &v9;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __56__HKSPSleepStore_currentSleepEventRecordWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)currentSleepEventRecordWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore currentSleepEventRecordFuture](self, "currentSleepEventRecordFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HKSPSleepStore_currentSleepEventRecordWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3BF00;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

- (id)currentSleepEventRecordFuture
{
  return -[HKSPSleepStore _getSleepEventRecordDoSync:](self, "_getSleepEventRecordDoSync:", 0);
}

- (BOOL)_cachingEnabled
{
  return (self->_options & 1) == 0;
}

HKSPThrottler *__84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKSPThrottler *v3;
  void *v4;
  HKSPThrottler *v5;

  v2 = a2;
  v3 = [HKSPThrottler alloc];
  objc_msgSend(MEMORY[0x1E0D519E8], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.sleep.HKSPSleepStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSPThrottler initWithInterval:executeBlock:scheduler:](v3, "initWithInterval:executeBlock:scheduler:", v2, v4, 0.1);

  return v5;
}

- (void)connect
{
  -[HKSPSleepStore connectSynchronously:](self, "connectSynchronously:", 0);
}

- (BOOL)_reloadsWidgets
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_connectAutomatically
{
  return (self->_options & 0x10) == 0;
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "syncAnchorContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithContainer:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKSPSyncAnchorContainer)syncAnchorContainer
{
  return self->_syncAnchorContainer;
}

id __57__HKSPSleepStore_initWithIdentifier_healthStore_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    HKSPSleepServerInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sleepStoreExportedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPSleepClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSPXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](HKSPXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.sleepd.sleepserver"), v5, v6, v7, CFSTR("com.apple.sleepd.wakeup"), CFSTR("com.apple.private.sleepd"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKSPXPCConnectionProvider providerWithConnectionInfo:](HKSPXPCConnectionProvider, "providerWithConnectionInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HKSPSleepStoreExportedObject)sleepStoreExportedObject
{
  return self->_sleepStoreExportedObject;
}

- (BOOL)_observeSleepFocusMode
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HKSPAnalyticsManager *v14;
  void *v15;
  HKSPAnalyticsManager *v16;
  void *v17;
  void *v18;
  HKSPSleepStore *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  unint64_t v25;

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_2;
  v24 = &__block_descriptor_40_e33____HKSPSleepFocusModeBridge__8__0l;
  v25 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)MEMORY[0x1A85ABD18](&v21);
  v14 = [HKSPAnalyticsManager alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_analyticsUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKSPAnalyticsManager initWithUserDefaults:](v14, "initWithUserDefaults:", v15);
  objc_msgSend(MEMORY[0x1E0D519E8], "hkspMainThreadScheduler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPCurrentDateProvider();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKSPSleepStore initWithConnectionProviderProvider:identifier:healthStore:options:analyticsManager:throttlerProvider:callbackScheduler:sleepFocusModeBridgeProvider:widgetTimelineControllersProvider:widgetRelevanceControllerProvider:currentDateProvider:](self, "initWithConnectionProviderProvider:identifier:healthStore:options:analyticsManager:throttlerProvider:callbackScheduler:sleepFocusModeBridgeProvider:widgetTimelineControllersProvider:widgetRelevanceControllerProvider:currentDateProvider:", v12, v11, v10, a6, v16, &__block_literal_global_193, v17, v13, &__block_literal_global_201, &__block_literal_global_204, v18, v21, v22, v23, v24,
          v25);

  return v19;
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (HKSPXPCClientIdentifier)clientIdentifier
{
  return self->_clientIdentifier;
}

- (HKSPSleepStore)initWithHealthStore:(id)a3
{
  id v4;
  void *v5;
  HKSPSleepStore *v6;

  v4 = a3;
  HKSPGenerateSleepStoreIdentifier(&stru_1E4E3E220);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKSPSleepStore initWithIdentifier:healthStore:](self, "initWithIdentifier:healthStore:", v5, v4);

  return v6;
}

- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4 options:(unint64_t)a5
{
  return -[HKSPSleepStore initWithConnectionProviderProvider:identifier:healthStore:options:](self, "initWithConnectionProviderProvider:identifier:healthStore:options:", &__block_literal_global_12, a3, a4, a5);
}

- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4
{
  return -[HKSPSleepStore initWithIdentifier:healthStore:options:](self, "initWithIdentifier:healthStore:options:", a3, a4, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  HKSPSleepStore *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  -[HKSPXPCConnectionProvider invalidate](self->_connectionProvider, "invalidate");
  -[HKSPSleepFocusModeBridge invalidate](self->_sleepFocusModeBridge, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)HKSPSleepStore;
  -[HKSPSleepStore dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_syncAnchorContainer, 0);
  objc_storeStrong((id *)&self->_sleepStoreExportedObject, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_sleepFocusModeBridge, 0);
  objc_storeStrong((id *)&self->_reconnectThrottler, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
  objc_storeStrong((id *)&self->_sleepStoreCache, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepHealthStore, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

- (void)suggestedSleepScheduleWithProviders:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  HKSPSleepStore *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting suggested sleep schedule", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke;
  v11[3] = &unk_1E4E3B238;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[HKSPSleepStore currentSleepScheduleWithCompletion:](self, "currentSleepScheduleWithCompletion:", v11);

}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!objc_msgSend(v5, "hasOccurrences"))
    {
      v10 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_185;
      v18[3] = &unk_1E4E3B1C0;
      v11 = *(void **)(a1 + 40);
      v18[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "na_map:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_190;
      v17[3] = &unk_1E4E3B1E8;
      v17[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0D519C0], "hksp_chainFutures:returningFirstPassingTest:ignoreErrors:", v12, v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2_192;
      v15[3] = &unk_1E4E3B210;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = *(id *)(a1 + 48);
      v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v15);

      goto LABEL_8;
    }
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ returning existing sleep schedule: %{public}@", buf, 0x16u);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();
LABEL_8:

}

id __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2;
  v9[3] = &unk_1E4E3B198;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2(int8x16_t *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_3;
  v7[3] = &unk_1E4E3B170;
  v6 = a1[2];
  v4 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "hksp_suggestedSleepScheduleWithCompletion:", v7);

}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _HKSPScheduleAndProviderPair *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v6;
      v11 = "%{public}@ provider %{public}@ failed to suggest sleep schedule: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x20u);
    }
  }
  else if (v8)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v5;
    v11 = "%{public}@ provider %{public}@ suggested sleep schedule: %{public}@";
    goto LABEL_6;
  }

  v14 = objc_alloc_init(_HKSPScheduleAndProviderPair);
  -[_HKSPScheduleAndProviderPair setProvider:](v14, "setProvider:", *(_QWORD *)(a1 + 40));
  -[_HKSPScheduleAndProviderPair setSchedule:](v14, "setSchedule:", v5);
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v14, v6);

}

uint64_t __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_resultHasSchedule:", v3)
    && objc_msgSend(*(id *)(a1 + 32), "_resultScheduleMeetsDefaultGoal:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_resultScheduleIsValid:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2_192(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  NAEmptyResult();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v17;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ no suggested sleep schedule found (error: %{public}@)", (uint8_t *)&v18, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "schedule");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "provider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ returning suggested sleep schedule: %{public}@ (provider: %{public}@)", (uint8_t *)&v18, 0x20u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "schedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v14 + 16))(v14, v15, v16, v6);

  }
}

- (BOOL)_resultHasSchedule:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "schedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_resultScheduleMeetsDefaultGoal:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v10;
  HKSPSleepStore *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "schedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "meetsDefaultSleepGoal");

  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138543362;
      v11 = self;
      v8 = "%{public}@ suggested schedule meets default sleep goal";
LABEL_6:
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    v10 = 138543362;
    v11 = self;
    v8 = "%{public}@ suggested schedule doesn't meet default sleep goal";
    goto LABEL_6;
  }

  return v5;
}

- (BOOL)_resultScheduleIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  int v19;
  HKSPSleepStore *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepStore sleepScheduleModelWithError:](self, "sleepScheduleModelWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sleepSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepEventRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:](HKSPSleepScheduleModel, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepStore currentDateProvider](self, "currentDateProvider");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:date:](HKSPSleepEventTimelineBuilder, "builderWithSleepScheduleModel:date:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "buildTimelineWithOptions:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sleepScheduleInvalid");
  HKSPLogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v19 = 138543362;
      v20 = self;
      v17 = "%{public}@ suggested schedule is invalid";
LABEL_6:
      _os_log_impl(&dword_1A4F0E000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }
  }
  else if (v16)
  {
    v19 = 138543362;
    v20 = self;
    v17 = "%{public}@ suggested schedule is valid";
    goto LABEL_6;
  }

  return v14 ^ 1;
}

- (HKSPSleepStore)init
{
  void *v3;
  HKSPSleepStore *v4;

  HKSPGenerateSleepStoreIdentifier(&stru_1E4E3E220);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKSPSleepStore initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_2(uint64_t a1)
{
  return +[HKSPDNDConfigurationService sleepFocusConfigurationServiceWithOptions:](HKSPDNDConfigurationService, "sleepFocusConfigurationServiceWithOptions:", (*(_QWORD *)(a1 + 32) >> 1) & 2);
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_3()
{
  return +[HKSPSleepWidgetManager defaultTimelineControllers](HKSPSleepWidgetManager, "defaultTimelineControllers");
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_4()
{
  return +[HKSPSleepWidgetManager defaultRelevanceController](HKSPSleepWidgetManager, "defaultRelevanceController");
}

- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6 analyticsManager:(id)a7 throttlerProvider:(id)a8 callbackScheduler:(id)a9 sleepFocusModeBridgeProvider:(id)a10 widgetTimelineControllersProvider:(id)a11 widgetRelevanceControllerProvider:(id)a12 currentDateProvider:(id)a13
{
  void (**v17)(id, HKSPSleepStore *);
  id v18;
  void (**v19)(id, _QWORD *);
  void (**v20)(_QWORD);
  id v21;
  HKSPSleepStore *v22;
  HKSPXPCClientIdentifier *v23;
  void *v24;
  uint64_t v25;
  HKSPXPCClientIdentifier *clientIdentifier;
  NSObject *v27;
  HKSPSyncAnchorContainer *v28;
  HKSPSyncAnchorContainer *syncAnchorContainer;
  HKSPSleepStoreExportedObject *v30;
  HKSPSleepStoreExportedObject *sleepStoreExportedObject;
  uint64_t v32;
  HKSPXPCConnectionProvider *connectionProvider;
  void *v34;
  uint64_t v35;
  HKSleepHealthStore *sleepHealthStore;
  HKSPSleepStoreModelCache *v37;
  HKSPSleepStoreModelCache *sleepStoreCache;
  HKSPObserverSet *v39;
  HKSPObserverSet *observers;
  uint64_t v41;
  id currentDateProvider;
  uint64_t v43;
  HKSPSleepFocusModeBridge *sleepFocusModeBridge;
  HKSPSleepWidgetManager *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  HKSPSleepWidgetManager *widgetManager;
  uint64_t v50;
  HKSPThrottler *reconnectThrottler;
  HKSPSleepStore *v52;
  id obj;
  id v56;
  void (**v58)(void);
  void (**v59)(void);
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  objc_super v64;
  uint8_t buf[4];
  HKSPSleepStore *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v17 = (void (**)(id, HKSPSleepStore *))a3;
  v18 = a4;
  v61 = a5;
  obj = a7;
  v56 = a7;
  v19 = (void (**)(id, _QWORD *))a8;
  v60 = a9;
  v59 = (void (**)(void))a10;
  v58 = (void (**)(void))a11;
  v20 = (void (**)(_QWORD))a12;
  v21 = a13;
  v64.receiver = self;
  v64.super_class = (Class)HKSPSleepStore;
  v22 = -[HKSPSleepStore init](&v64, sel_init);
  if (v22)
  {
    v23 = [HKSPXPCClientIdentifier alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HKSPXPCClientIdentifier initWithUniqueIdentifier:loggingIdentifier:](v23, "initWithUniqueIdentifier:loggingIdentifier:", v24, v18);
    clientIdentifier = v22->_clientIdentifier;
    v22->_clientIdentifier = (HKSPXPCClientIdentifier *)v25;

    HKSPLogForCategory(1uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v22;
      _os_log_impl(&dword_1A4F0E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    v28 = -[HKSPSyncAnchorContainer initWithIdentifier:]([HKSPSyncAnchorContainer alloc], "initWithIdentifier:", v18);
    syncAnchorContainer = v22->_syncAnchorContainer;
    v22->_syncAnchorContainer = v28;

    v30 = objc_alloc_init(HKSPSleepStoreExportedObject);
    sleepStoreExportedObject = v22->_sleepStoreExportedObject;
    v22->_sleepStoreExportedObject = v30;

    -[HKSPSleepStoreExportedObject setSleepStore:](v22->_sleepStoreExportedObject, "setSleepStore:", v22);
    if (v17)
    {
      v17[2](v17, v22);
      v32 = objc_claimAutoreleasedReturnValue();
      connectionProvider = v22->_connectionProvider;
      v22->_connectionProvider = (HKSPXPCConnectionProvider *)v32;
    }
    else
    {
      connectionProvider = v22->_connectionProvider;
      v22->_connectionProvider = 0;
    }

    -[HKSPXPCConnectionProvider setDelegate:](v22->_connectionProvider, "setDelegate:", v22);
    if (v61)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "hksp_supportsHealthData"))
      {
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA85B8]), "initWithHealthStore:", v61);
        sleepHealthStore = v22->_sleepHealthStore;
        v22->_sleepHealthStore = (HKSleepHealthStore *)v35;
      }
      else
      {
        sleepHealthStore = v22->_sleepHealthStore;
        v22->_sleepHealthStore = 0;
      }

    }
    else
    {
      v34 = v22->_sleepHealthStore;
      v22->_sleepHealthStore = 0;
    }

    v22->_options = a6;
    if (-[HKSPSleepStore _cachingEnabled](v22, "_cachingEnabled"))
    {
      v37 = objc_alloc_init(HKSPSleepStoreModelCache);
      sleepStoreCache = v22->_sleepStoreCache;
      v22->_sleepStoreCache = v37;
    }
    else
    {
      sleepStoreCache = v22->_sleepStoreCache;
      v22->_sleepStoreCache = 0;
    }

    v39 = -[HKSPObserverSet initWithCallbackScheduler:]([HKSPObserverSet alloc], "initWithCallbackScheduler:", v60);
    observers = v22->_observers;
    v22->_observers = v39;

    v41 = objc_msgSend(v21, "copy");
    currentDateProvider = v22->_currentDateProvider;
    v22->_currentDateProvider = (id)v41;

    objc_storeStrong((id *)&v22->_analyticsManager, obj);
    if (-[HKSPSleepStore _observeSleepFocusMode](v22, "_observeSleepFocusMode"))
    {
      v59[2]();
      v43 = objc_claimAutoreleasedReturnValue();
      sleepFocusModeBridge = v22->_sleepFocusModeBridge;
      v22->_sleepFocusModeBridge = (HKSPSleepFocusModeBridge *)v43;
    }
    else
    {
      sleepFocusModeBridge = v22->_sleepFocusModeBridge;
      v22->_sleepFocusModeBridge = 0;
    }

    -[HKSPSleepFocusModeBridge setDelegate:](v22->_sleepFocusModeBridge, "setDelegate:", v22);
    if (-[HKSPSleepStore _reloadsWidgets](v22, "_reloadsWidgets"))
    {
      v45 = [HKSPSleepWidgetManager alloc];
      v58[2]();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[HKSPSleepWidgetManager initWithTimelineControllers:relevanceController:](v45, "initWithTimelineControllers:relevanceController:", v46, v47);
      widgetManager = v22->_widgetManager;
      v22->_widgetManager = (HKSPSleepWidgetManager *)v48;

    }
    else
    {
      v46 = v22->_widgetManager;
      v22->_widgetManager = 0;
    }

    -[HKSPSleepWidgetManager setDelegate:](v22->_widgetManager, "setDelegate:", v22);
    objc_initWeak((id *)buf, v22);
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __254__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options_analyticsManager_throttlerProvider_callbackScheduler_sleepFocusModeBridgeProvider_widgetTimelineControllersProvider_widgetRelevanceControllerProvider_currentDateProvider___block_invoke;
    v62[3] = &unk_1E4E3BC80;
    objc_copyWeak(&v63, (id *)buf);
    v19[2](v19, v62);
    v50 = objc_claimAutoreleasedReturnValue();
    reconnectThrottler = v22->_reconnectThrottler;
    v22->_reconnectThrottler = (HKSPThrottler *)v50;

    if (-[HKSPSleepStore _connectAutomatically](v22, "_connectAutomatically"))
      -[HKSPSleepStore connect](v22, "connect");
    v52 = v22;
    objc_destroyWeak(&v63);
    objc_destroyWeak((id *)buf);
  }

  return v22;
}

void __254__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options_analyticsManager_throttlerProvider_callbackScheduler_sleepFocusModeBridgeProvider_widgetTimelineControllersProvider_widgetRelevanceControllerProvider_currentDateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkInWithCurrentSyncAnchor");

}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)removeAllObservers
{
  -[HKSPObserverSet removeAllObservers](self->_observers, "removeAllObservers");
}

- (void)reconnect
{
  NSObject *v3;
  int v4;
  HKSPSleepStore *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconnecting", (uint8_t *)&v4, 0xCu);
  }

  -[HKSPThrottler execute](self->_reconnectThrottler, "execute");
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to connect: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_checkInWithCurrentSyncAnchor
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HKSPXPCMessage *v8;
  id v9;
  HKSPXPCMessage *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  HKSPSleepStore *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HKSPSleepStore syncAnchorContainer](self, "syncAnchorContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ checking in with sync anchor container: %{public}@", buf, 0x16u);

    }
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [HKSPXPCMessage alloc];
    v15 = v7;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke;
    v16[3] = &unk_1E4E3BD20;
    v16[4] = self;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke_2;
    v14 = &unk_1E4E3BCF8;
    v9 = v7;
    v10 = -[HKSPXPCMessage initWithIdentifier:block:options:errorHandler:](v8, "initWithIdentifier:block:options:errorHandler:", CFSTR("checkIn"), v16, 2, &v11);
    -[HKSPXPCConnectionProvider sendMessage:](self->_connectionProvider, "sendMessage:", v10, v11, v12, v13, v14);

  }
}

void __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "syncAnchorContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInWithSyncAnchorContainer:completion:", v7, v5);

}

void __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to check in: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)-[HKSleepHealthStore healthStore](self->_sleepHealthStore, "healthStore");
}

+ (id)_sleepDisabledError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HKSPSleepStore"), 1, 0);
}

- (id)_getSleepScheduleFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  HKSPSleepStore *v25;
  uint8_t buf[4];
  HKSPSleepStore *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BD48;
    v23 = v8;
    v24 = v9;
    v25 = self;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_228;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E4E3B170;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "getSleepScheduleWithCompletion:", v6);

}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  HKSPNullify(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v8, v6);

  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep schedule from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }

}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepScheduleDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__HKSPSleepStore__getSleepScheduleDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepScheduleWithMissHandler:](sleepStoreCache, "cachedSleepScheduleWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepScheduleFromServerDoSync:](self, "_getSleepScheduleFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __42__HKSPSleepStore__getSleepScheduleDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepScheduleFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (void)currentSleepScheduleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore currentSleepScheduleFuture](self, "currentSleepScheduleFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSleepStore_currentSleepScheduleWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3BDC0;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __53__HKSPSleepStore_currentSleepScheduleWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (id)currentSleepScheduleFuture
{
  return -[HKSPSleepStore _getSleepScheduleDoSync:](self, "_getSleepScheduleDoSync:", 0);
}

- (id)currentSleepScheduleWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[HKSPSleepStore _getSleepScheduleDoSync:](self, "_getSleepScheduleDoSync:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore_currentSleepScheduleWithError___block_invoke;
  v8[3] = &unk_1E4E3BDE8;
  v8[4] = &v15;
  v8[5] = &v9;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __48__HKSPSleepStore_currentSleepScheduleWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  HKSPNilify(a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[HKSPSleepStore upcomingResolvedScheduleOccurrenceAfterDate:error:](self, "upcomingResolvedScheduleOccurrenceAfterDate:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4
{
  return -[HKSPSleepStore upcomingResolvedScheduleOccurrenceAfterDate:alarmStatus:error:](self, "upcomingResolvedScheduleOccurrenceAfterDate:alarmStatus:error:", a3, 0, a4);
}

- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  -[HKSPSleepStore upcomingResolvedScheduleOccurrenceAfterDate:alarmStatus:error:](self, "upcomingResolvedScheduleOccurrenceAfterDate:alarmStatus:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "occurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  -[HKSPSleepStore sleepScheduleModelWithError:](self, "sleepScheduleModelWithError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "upcomingResolvedOccurrenceAfterDate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
    {
      objc_msgSend(v11, "occurrence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v10, "alarmStatusForOccurrence:", v13);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)upcomingScheduleOccurrenceAfterDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[HKSPSleepStore upcomingScheduleOccurrenceAfterDateFuture:](self, "upcomingScheduleOccurrenceAfterDateFuture:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HKSPSleepStore_upcomingScheduleOccurrenceAfterDate_completion___block_invoke;
  v10[3] = &unk_1E4E3BE10;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __65__HKSPSleepStore_upcomingScheduleOccurrenceAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (id)upcomingScheduleOccurrenceAfterDateFuture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HKSPSleepStore sleepScheduleModelFuture](self, "sleepScheduleModelFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HKSPSleepStore_upcomingScheduleOccurrenceAfterDateFuture___block_invoke;
  v9[3] = &unk_1E4E3BE38;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__HKSPSleepStore_upcomingScheduleOccurrenceAfterDateFuture___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "upcomingOccurrenceAfterDate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  HKSPNilify(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getSleepSettingsFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  HKSPSleepStore *v25;
  uint8_t buf[4];
  HKSPSleepStore *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep settings from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BD48;
    v23 = v8;
    v24 = v9;
    v25 = self;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_233;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E4E3BE60;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "getSleepSettingsWithCompletion:", v6);

}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  HKSPNullify(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v8, v6);

  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep settings: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep settings from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }

}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_233(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep settings: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepSettingsDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__HKSPSleepStore__getSleepSettingsDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepSettingsWithMissHandler:](sleepStoreCache, "cachedSleepSettingsWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepSettingsFromServerDoSync:](self, "_getSleepSettingsFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __42__HKSPSleepStore__getSleepSettingsDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepSettingsFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (void)currentSleepSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore currentSleepSettingsFuture](self, "currentSleepSettingsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSleepStore_currentSleepSettingsWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3BE88;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __53__HKSPSleepStore_currentSleepSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (id)currentSleepSettingsFuture
{
  return -[HKSPSleepStore _getSleepSettingsDoSync:](self, "_getSleepSettingsDoSync:", 0);
}

- (id)_getSleepEventRecordFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  HKSPSleepStore *v25;
  uint8_t buf[4];
  HKSPSleepStore *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep event record from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BD48;
    v23 = v8;
    v24 = v9;
    v25 = self;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_235;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E4E3BED8;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "getSleepEventRecordWithCompletion:", v6);

}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  HKSPNullify(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v8, v6);

  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep event record: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep event record from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }

}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_235(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep event record: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepEventRecordDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__HKSPSleepStore__getSleepEventRecordDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepEventRecordWithMissHandler:](sleepStoreCache, "cachedSleepEventRecordWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepEventRecordFromServerDoSync:](self, "_getSleepEventRecordFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __45__HKSPSleepStore__getSleepEventRecordDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepEventRecordFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (id)_getSleepScheduleModelFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  HKSPSleepStore *v25;
  uint8_t buf[4];
  HKSPSleepStore *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule model from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BD48;
    v23 = v8;
    v24 = v9;
    v25 = self;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_237;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E4E3BF50;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "getSleepScheduleModelWithCompletion:", v6);

}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  HKSPNullify(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v8, v6);

  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule model: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep schedule model from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }

}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_237(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule model: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepScheduleModelDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__HKSPSleepStore__getSleepScheduleModelDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepScheduleModelWithMissHandler:](sleepStoreCache, "cachedSleepScheduleModelWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepScheduleModelFromServerDoSync:](self, "_getSleepScheduleModelFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __47__HKSPSleepStore__getSleepScheduleModelDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepScheduleModelFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (void)sleepScheduleModelWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore sleepScheduleModelFuture](self, "sleepScheduleModelFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_sleepScheduleModelWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3BF78;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __51__HKSPSleepStore_sleepScheduleModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (id)sleepScheduleModelFuture
{
  return -[HKSPSleepStore _getSleepScheduleModelDoSync:](self, "_getSleepScheduleModelDoSync:", 0);
}

- (id)sleepScheduleModelWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[HKSPSleepStore _getSleepScheduleModelDoSync:](self, "_getSleepScheduleModelDoSync:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HKSPSleepStore_sleepScheduleModelWithError___block_invoke;
  v8[3] = &unk_1E4E3BFA0;
  v8[4] = &v15;
  v8[5] = &v9;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __46__HKSPSleepStore_sleepScheduleModelWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  HKSPNilify(a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)_getSleepModeFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  HKSPSleepStore *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep mode from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BFF0;
    v23 = v8;
    v24 = v9;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_240;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E4E3BFC8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "getSleepModeWithCompletion:", v4);

}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:error:", v7, v5);

  if (v5)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep mode: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_240(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep mode: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepModeDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__HKSPSleepStore__getSleepModeDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepModeWithMissHandler:](sleepStoreCache, "cachedSleepModeWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepModeFromServerDoSync:](self, "_getSleepModeFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __38__HKSPSleepStore__getSleepModeDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepModeFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (id)sleepModeFuture
{
  return -[HKSPSleepStore _getSleepModeDoSync:](self, "_getSleepModeDoSync:", 0);
}

- (id)sleepModeOnFuture
{
  void *v2;
  void *v3;

  -[HKSPSleepStore sleepModeFuture](self, "sleepModeFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_242);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __35__HKSPSleepStore_sleepModeOnFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  HKSPNilify(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sleepModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore sleepModeFuture](self, "sleepModeFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__HKSPSleepStore_sleepModeWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C058;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __42__HKSPSleepStore_sleepModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, objc_msgSend(v6, "integerValue"), a2 != 0, v5);

  }
}

- (void)sleepModeOnWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore sleepModeOnFuture](self, "sleepModeOnFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HKSPSleepStore_sleepModeOnWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C058;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __44__HKSPSleepStore_sleepModeOnWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, objc_msgSend(v6, "BOOLValue"), a2 != 0, v5);

  }
}

- (int64_t)sleepModeWithError:(id *)a3
{
  void *v3;
  id v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HKSPSleepStore _getSleepModeDoSync:](self, "_getSleepModeDoSync:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HKSPSleepStore_sleepModeWithError___block_invoke;
  v7[3] = &unk_1E4E3C080;
  v7[4] = &v8;
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __37__HKSPSleepStore_sleepModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (BOOL)sleepModeOnWithError:(id *)a3
{
  return -[HKSPSleepStore sleepModeWithError:](self, "sleepModeWithError:", a3) != 0;
}

- (id)_getSleepWidgetStateFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  HKSPSleepStore *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep widget state from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BFF0;
    v23 = v8;
    v24 = v9;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_244;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E4E3BFC8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "getSleepWidgetStateWithCompletion:", v4);

}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:error:", v7, v5);

  if (v5)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep widget state: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep widget state: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)sleepWidgetStateFuture
{
  return -[HKSPSleepStore _getSleepWidgetStateDoSync:](self, "_getSleepWidgetStateDoSync:", 0);
}

- (void)sleepWidgetStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore sleepWidgetStateFuture](self, "sleepWidgetStateFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HKSPSleepStore_sleepWidgetStateWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C058;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __49__HKSPSleepStore_sleepWidgetStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, objc_msgSend(v6, "integerValue"), a2 != 0, v5);

  }
}

- (int64_t)sleepWidgetStateWithError:(id *)a3
{
  void *v3;
  id v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HKSPSleepStore _getSleepWidgetStateDoSync:](self, "_getSleepWidgetStateDoSync:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HKSPSleepStore_sleepWidgetStateWithError___block_invoke;
  v7[3] = &unk_1E4E3C080;
  v7[4] = &v8;
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__HKSPSleepStore_sleepWidgetStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (BOOL)shouldReloadWidgetOfKind:(id)a3
{
  int64_t v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.health.SleepWidget")))
    return 1;
  v11 = 0;
  v4 = -[HKSPSleepStore sleepWidgetStateWithError:](self, "sleepWidgetStateWithError:", &v11);
  v5 = v11;
  if (v5)
  {
    HKSPLogForCategory(0x12uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v5;
      v10 = v9;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch sleep widget state with error: %{public}@", buf, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    v7 = (unint64_t)(v4 - 6) < 0xFFFFFFFFFFFFFFFCLL;
  }

  return v7;
}

- (id)_getSleepScheduleStateFromServerDoSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  HKSPSleepStore *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule state from server", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke;
    v22[3] = &unk_1E4E3BFF0;
    v23 = v8;
    v24 = v9;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_246;
    v19[3] = &unk_1E4E3BD70;
    v20 = v24;
    v12 = v23;
    v21 = v12;
    v13 = v24;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:doSynchronously:](connectionProvider, "performRemoteBlock:withErrorHandler:doSynchronously:", v22, v19, v3);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E4E3C0A8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "getSleepScheduleStateWithCompletion:", v4);

}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:error:", v7, v5);

  if (v5)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule state: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_246(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule state: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)_getSleepScheduleStateOnDoSync:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepStoreModelCache *sleepStoreCache;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (-[HKSPSleepStore _cachingEnabled](self, "_cachingEnabled"))
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__HKSPSleepStore__getSleepScheduleStateOnDoSync___block_invoke;
    v8[3] = &unk_1E4E3BD98;
    v8[4] = self;
    v9 = v3;
    -[HKSPSleepStoreModelCache cachedSleepScheduleStateWithMissHandler:](sleepStoreCache, "cachedSleepScheduleStateWithMissHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSPSleepStore _getSleepScheduleStateFromServerDoSync:](self, "_getSleepScheduleStateFromServerDoSync:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __49__HKSPSleepStore__getSleepScheduleStateOnDoSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSleepScheduleStateFromServerDoSync:", *(unsigned __int8 *)(a1 + 40));
}

- (id)currentSleepScheduleStateFuture
{
  return -[HKSPSleepStore _getSleepScheduleStateOnDoSync:](self, "_getSleepScheduleStateOnDoSync:", 0);
}

- (void)currentSleepScheduleStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore currentSleepScheduleStateFuture](self, "currentSleepScheduleStateFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore_currentSleepScheduleStateWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C058;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __58__HKSPSleepStore_currentSleepScheduleStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  HKSPNilify(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL, id))(v4 + 16))(v4, objc_msgSend(v6, "integerValue"), a2 != 0, v5);

}

- (unint64_t)currentSleepScheduleStateWithError:(id *)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HKSPSleepStore _getSleepScheduleStateOnDoSync:](self, "_getSleepScheduleStateOnDoSync:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HKSPSleepStore_currentSleepScheduleStateWithError___block_invoke;
  v7[3] = &unk_1E4E3C080;
  v7[4] = &v8;
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __53__HKSPSleepStore_currentSleepScheduleStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (id)_saveCurrentSleepScheduleOnServer:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  HKSPSleepStore *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if ((v7 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v5;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep schedule on server: %{public}@", buf, 0x16u);
    }

    -[HKSPSleepStoreModelCache updateCachedSleepSchedule:](self->_sleepStoreCache, "updateCachedSleepSchedule:", v5);
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v10 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke;
    v28[3] = &unk_1E4E3BCF8;
    v28[4] = self;
    v11 = (id)objc_msgSend(v9, "addFailureBlock:", v28);
    -[HKSPSleepStore description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_2;
    v24[3] = &unk_1E4E3BD48;
    v25 = v5;
    v26 = v12;
    v27 = v9;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_247;
    v21[3] = &unk_1E4E3BD70;
    v22 = v26;
    v14 = v27;
    v23 = v14;
    v15 = v26;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v24, v21);
    v16 = v23;
    v17 = v14;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeCachedSleepSchedule");
}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_3;
  v5[3] = &unk_1E4E3BD70;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "saveSleepSchedule:completion:", v4, v5);

}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HKSPLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep schedule on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_247(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep schedule on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)saveCurrentSleepSchedule:(id)a3
{
  return -[HKSPSleepStore saveCurrentSleepSchedule:options:context:](self, "saveCurrentSleepSchedule:options:context:", a3, 0, 0);
}

- (id)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hksp_supportsHealthData");

  if ((a4 & 4) != 0 || (v12 & 1) != 0)
  {
    if ((a4 & 4) == 0 && !self->_sleepHealthStore)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepStore.m"), 791, CFSTR("Attempted to save a sleep schedule without a sleep health store"));

    }
    -[HKSPSleepStore _prepareObjectForSave:options:](self, "_prepareObjectForSave:options:", v9, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepStore _saveCurrentSleepScheduleOnServer:options:](self, "_saveCurrentSleepScheduleOnServer:options:", v16, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke;
    v21[3] = &unk_1E4E3C0F8;
    v21[4] = self;
    v22 = v16;
    v24 = a4;
    v23 = v10;
    v18 = v16;
    objc_msgSend(v17, "flatMap:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

id __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_writeHistoricalSchedule:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke_2;
  v5[3] = &unk_1E4E3C0D0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendScheduleChangedAnalyticsWithContext:", *(_QWORD *)(a1 + 40));
}

- (id)_sendScheduleChangedAnalyticsWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HKSPSleepStore currentSleepSettingsFuture](self, "currentSleepSettingsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKSPSleepStore__sendScheduleChangedAnalyticsWithContext___block_invoke;
  v9[3] = &unk_1E4E3C120;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v9);

  return v5;
}

void __59__HKSPSleepStore__sendScheduleChangedAnalyticsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HKSPAnalyticsSleepScheduleChangeInfo *v13;
  void *v14;
  void *v15;
  HKSPAnalyticsSleepScheduleChangeEvent *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch current sleep settings with error: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched current sleep settings: %@", (uint8_t *)&v17, 0x16u);
    }

    +[HKSPAnalyticsManager activePairedWatchProductType](HKSPAnalyticsManager, "activePairedWatchProductType");
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "sleepTracking");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HKSPAnalyticsSleepScheduleChangeApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPAnalyticsSleepScheduleChangeInfo initWithApplication:activePairedWatchProductType:isSleepTrackingEnabled:]([HKSPAnalyticsSleepScheduleChangeInfo alloc], "initWithApplication:activePairedWatchProductType:isSleepTrackingEnabled:", HKSPAnalyticsSleepScheduleChangeApplicationFromValue(v12), v8, v11);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HKSPAnalyticsSleepScheduleChangeProvenanceInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v16 = -[HKSPAnalyticsSleepScheduleChangeEvent initWithScheduleChangeInfo:provenanceInfo:]([HKSPAnalyticsSleepScheduleChangeEvent alloc], "initWithScheduleChangeInfo:provenanceInfo:", v13, v14);
    objc_msgSend(v15, "trackEvent:", v16);

  }
}

- (void)saveCurrentSleepSchedule:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore saveCurrentSleepSchedule:options:completion:](self, "saveCurrentSleepSchedule:options:completion:", a3, 0, a4);
}

- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  -[HKSPSleepStore saveCurrentSleepSchedule:options:context:completion:](self, "saveCurrentSleepSchedule:options:context:completion:", a3, a4, 0, a5);
}

- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  -[HKSPSleepStore saveCurrentSleepSchedule:options:context:](self, "saveCurrentSleepSchedule:options:context:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HKSPSleepStore_saveCurrentSleepSchedule_options_context_completion___block_invoke;
  v14[3] = &unk_1E4E3C148;
  v15 = v10;
  v12 = v10;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

uint64_t __70__HKSPSleepStore_saveCurrentSleepSchedule_options_context_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (id)_writeHistoricalSchedule:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HKSleepHealthStore *sleepHealthStore;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  if (self->_sleepHealthStore)
  {
    (*((void (**)(void))self->_currentDateProvider + 2))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_updatedHistoricalSleepSchedulesFromSleepSchedule:options:date:", v6, a4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_updatedHistoricalSleepGoalForSleepSchedule:options:date:", v6, a4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    sleepHealthStore = self->_sleepHealthStore;
    objc_msgSend(v10, "hksp_BOOLErrorCompletionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepHealthStore updateCurrentSleepSchedules:sleepDurationGoal:completion:](sleepHealthStore, "updateCurrentSleepSchedules:sleepDurationGoal:completion:", v8, v9, v12);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__HKSPSleepStore__writeHistoricalSchedule_options___block_invoke;
    v17[3] = &unk_1E4E3C170;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v13 = v9;
    v14 = v8;
    v15 = (id)objc_msgSend(v10, "addCompletionBlock:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __51__HKSPSleepStore__writeHistoricalSchedule_options___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = (void *)a1[5];
      v10 = a1[6];
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated current sleep schedules: %@ and sleep goal: %@ in HealthKit", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = a1[4];
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to update current sleep schedules in HealthKit with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }

}

+ (id)_updatedHistoricalSleepSchedulesFromSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5
{
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!v7
    || (v6 & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v7, "hasChangeAffectingScheduling"))
  {
    objc_msgSend(v7, "occurrences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_260);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") && objc_msgSend(v7, "isEnabled"))
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke_2;
      v36 = &unk_1E4E3C1B8;
      v11 = v8;
      v37 = v11;
      objc_msgSend(v10, "na_map:", &v33);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "weekdaysWithoutOccurrences"))
      {
        v13 = (void *)MEMORY[0x1E0CB6C08];
        v14 = HKSleepScheduleWeekdaysFromHKSPWeekdays(objc_msgSend(v7, "weekdaysWithoutOccurrences"));
        objc_msgSend(v13, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v11, v14, 0, 0, 0, 0, 0, v33, v34, v35, v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObject:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v7;
        if (objc_msgSend(v17, "hasOverrideOccurrenceRemoval"))
        {
          objc_msgSend(v17, "lastOverrideOccurrenceWakeUpComponents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = (void *)MEMORY[0x1E0CB6C08];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "hk_dayIndex"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v11, 0, 0, 0, v21, 0, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "arrayByAddingObject:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v23;
          }

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6C08], "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v8, *MEMORY[0x1E0CB5F08], 0, 0, 0, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "overrideOccurrence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v7, "overrideOccurrence");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "wakeUpComponents");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = (void *)MEMORY[0x1E0CB6C08];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "hk_dayIndex"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v8, 0, 0, 0, v29, 0, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "arrayByAddingObject:", v30);
          v31 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v31;
        }

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInitialized");
}

id __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (objc_msgSend(v3, "weekdays"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "wakeUpComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "hk_dayIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB6C08];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = HKSleepScheduleWeekdaysFromHKSPWeekdays(objc_msgSend(v3, "weekdays"));
  objc_msgSend(v3, "wakeUpComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bedtimeComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v8, v9, v10, v11, v4, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_updatedHistoricalSleepGoalForSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5
{
  char v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8
    || (v6 & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v8, "hasChangeToSleepDurationGoal"))
  {
    HKSPLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = a1;
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep duration goal changed", (uint8_t *)&v19, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6A70], "sleepDurationGoalType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB6A28];
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "sleepDurationGoal");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_quantityWithSeconds:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quantitySampleWithType:quantity:startDate:endDate:", v12, v16, v9, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_saveCurrentSleepSettingsOnServer:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  HKSPSleepStore *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if ((v7 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v5;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep settings on server: %{public}@", buf, 0x16u);
    }

    -[HKSPSleepStoreModelCache updateCachedSleepSettings:](self->_sleepStoreCache, "updateCachedSleepSettings:", v5);
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v10 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke;
    v28[3] = &unk_1E4E3BCF8;
    v28[4] = self;
    v11 = (id)objc_msgSend(v9, "addFailureBlock:", v28);
    -[HKSPSleepStore description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_2;
    v24[3] = &unk_1E4E3BD48;
    v25 = v5;
    v26 = v12;
    v27 = v9;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_267;
    v21[3] = &unk_1E4E3BD70;
    v22 = v26;
    v14 = v27;
    v23 = v14;
    v15 = v26;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v24, v21);
    v16 = v23;
    v17 = v14;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeCachedSleepSettings");
}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_3;
  v5[3] = &unk_1E4E3BD70;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "saveSleepSettings:completion:", v4, v5);

}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HKSPLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep settings on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_267(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep settings on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)saveCurrentSleepSettings:(id)a3
{
  return -[HKSPSleepStore saveCurrentSleepSettings:options:](self, "saveCurrentSleepSettings:options:", a3, 0);
}

- (id)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[HKSPSleepStore _prepareObjectForSave:options:](self, "_prepareObjectForSave:options:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepStore _saveCurrentSleepSettingsOnServer:options:](self, "_saveCurrentSleepSettingsOnServer:options:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)saveCurrentSleepSettings:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore saveCurrentSleepSettings:options:completion:](self, "saveCurrentSleepSettings:options:completion:", a3, 0, a4);
}

- (void)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HKSPSleepStore saveCurrentSleepSettings:options:](self, "saveCurrentSleepSettings:options:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HKSPSleepStore_saveCurrentSleepSettings_options_completion___block_invoke;
  v12[3] = &unk_1E4E3C148;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

uint64_t __62__HKSPSleepStore_saveCurrentSleepSettings_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (id)_prepareObjectForSave:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7969E8))
  {
    if ((v4 & 2) != 0)
      v7 = objc_msgSend(v5, "copyWithZone:", 0);
    else
      v7 = objc_msgSend(v5, "mutableCopy");
    v6 = (void *)v7;
    objc_msgSend(v5, "freeze");

  }
  return v6;
}

- (id)_saveCurrentSleepEventRecordOnServer:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  HKSPSleepStore *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if ((v7 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v5;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep event record on server: %{public}@", buf, 0x16u);
    }

    -[HKSPSleepStoreModelCache updateCachedSleepEventRecord:](self->_sleepStoreCache, "updateCachedSleepEventRecord:", v5);
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v10 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke;
    v28[3] = &unk_1E4E3BCF8;
    v28[4] = self;
    v11 = (id)objc_msgSend(v9, "addFailureBlock:", v28);
    -[HKSPSleepStore description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_2;
    v24[3] = &unk_1E4E3BD48;
    v25 = v5;
    v26 = v12;
    v27 = v9;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_363;
    v21[3] = &unk_1E4E3BD70;
    v22 = v26;
    v14 = v27;
    v23 = v14;
    v15 = v26;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v24, v21);
    v16 = v23;
    v17 = v14;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeCachedSleepEventRecord");
}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_3;
  v5[3] = &unk_1E4E3BD70;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "saveSleepEventRecord:completion:", v4, v5);

}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HKSPLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep event record on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_363(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep event record on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (id)saveCurrentSleepEventRecord:(id)a3
{
  return -[HKSPSleepStore saveCurrentSleepEventRecord:options:](self, "saveCurrentSleepEventRecord:options:", a3, 0);
}

- (id)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[HKSPSleepStore _prepareObjectForSave:options:](self, "_prepareObjectForSave:options:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepStore _saveCurrentSleepEventRecordOnServer:options:](self, "_saveCurrentSleepEventRecordOnServer:options:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)saveCurrentSleepEventRecord:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore saveCurrentSleepEventRecord:options:completion:](self, "saveCurrentSleepEventRecord:options:completion:", a3, 0, a4);
}

- (void)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HKSPSleepStore saveCurrentSleepEventRecord:options:](self, "saveCurrentSleepEventRecord:options:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HKSPSleepStore_saveCurrentSleepEventRecord_options_completion___block_invoke;
  v12[3] = &unk_1E4E3C148;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

uint64_t __65__HKSPSleepStore_saveCurrentSleepEventRecord_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (id)_setSleepModeOnServer:(int64_t)a3 reason:(unint64_t)a4
{
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  HKSPXPCConnectionProvider *connectionProvider;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  int64_t v30;
  unint64_t v31;
  _QWORD v32[5];
  uint8_t buf[4];
  HKSPSleepStore *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromHKSPSleepMode(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepModeChangeReason(a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = self;
      v35 = 2114;
      v36 = v10;
      v37 = 2114;
      v38 = v11;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating sleep mode on server: %{public}@ (%{public}@)", buf, 0x20u);

    }
    -[HKSPSleepStoreModelCache updateCachedSleepMode:](self->_sleepStoreCache, "updateCachedSleepMode:", a3);
    v12 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v13 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke;
    v32[3] = &unk_1E4E3BCF8;
    v32[4] = self;
    v14 = (id)objc_msgSend(v12, "addFailureBlock:", v32);
    -[HKSPSleepStore description](self, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_2;
    v27[3] = &unk_1E4E3C1E0;
    v30 = a3;
    v31 = a4;
    v28 = v15;
    v29 = v12;
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_364;
    v24[3] = &unk_1E4E3BD70;
    v25 = v28;
    v17 = v29;
    v26 = v17;
    v18 = v28;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v27, v24);
    v19 = v26;
    v20 = v17;

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v22);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

uint64_t __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "purgeCachedSleepMode");
}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_3;
  v6[3] = &unk_1E4E3BD70;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(a2, "setSleepMode:reason:completion:", v4, v5, v6);

}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HKSPLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to set sleep mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_364(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to set sleep mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)setSleepModeOn:(BOOL)a3 completion:(id)a4
{
  -[HKSPSleepStore setSleepModeOn:reason:completion:](self, "setSleepModeOn:reason:completion:", a3, 1, a4);
}

- (void)setSleepModeOn:(BOOL)a3 reason:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, uint64_t, _QWORD);
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a4 <= 0xA && ((1 << a4) & 0x60C) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromHKSPSleepModeChangeReason(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring set sleep mode with reason: %{public}@", buf, 0x16u);

    }
    v8[2](v8, 1, 0);
  }
  else
  {
    if (v6)
      v13 = 2;
    else
      v13 = 0;
    -[HKSPSleepStore _setSleepModeOnServer:reason:](self, "_setSleepModeOnServer:reason:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__HKSPSleepStore_setSleepModeOn_reason_completion___block_invoke;
    v16[3] = &unk_1E4E3C148;
    v17 = v8;
    v15 = (id)objc_msgSend(v14, "addCompletionBlock:", v16);

  }
}

uint64_t __51__HKSPSleepStore_setSleepModeOn_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_confirmAwakeOnServer
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSPSleepStore *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if ((v4 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Confirming awake on server", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke;
    v19[3] = &unk_1E4E3BFF0;
    v20 = v6;
    v21 = v7;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_366;
    v16[3] = &unk_1E4E3BD70;
    v17 = v21;
    v10 = v20;
    v18 = v10;
    v11 = v21;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v19, v16);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_2;
  v4[3] = &unk_1E4E3C208;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "confirmAwakeWithCompletion:", v4);

}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to confirm awake on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_366(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to confirn awake on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)confirmAwakeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore _confirmAwakeOnServer](self, "_confirmAwakeOnServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HKSPSleepStore_confirmAwakeWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C148;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __45__HKSPSleepStore_confirmAwakeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_dismissGoodMorningOnServer
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSPSleepStore *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if ((v4 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing good morning on server", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke;
    v19[3] = &unk_1E4E3BFF0;
    v20 = v6;
    v21 = v7;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_367;
    v16[3] = &unk_1E4E3BD70;
    v17 = v21;
    v10 = v20;
    v18 = v10;
    v11 = v21;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v19, v16);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_2;
  v4[3] = &unk_1E4E3C208;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "dismissGoodMorningWithCompletion:", v4);

}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_367(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)dismissGoodMorningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore _dismissGoodMorningOnServer](self, "_dismissGoodMorningOnServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_dismissGoodMorningWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C148;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __51__HKSPSleepStore_dismissGoodMorningWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_dismissSleepLockOnServer
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSPSleepStore *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if ((v4 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing sleep lock on server", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke;
    v19[3] = &unk_1E4E3BFF0;
    v20 = v6;
    v21 = v7;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_368;
    v16[3] = &unk_1E4E3BD70;
    v17 = v21;
    v10 = v20;
    v18 = v10;
    v11 = v21;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v19, v16);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_2;
  v4[3] = &unk_1E4E3C208;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "dismissSleepLockWithCompletion:", v4);

}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep lock on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_368(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)dismissSleepLockWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore _dismissSleepLockOnServer](self, "_dismissSleepLockOnServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HKSPSleepStore_dismissSleepLockWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C148;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __49__HKSPSleepStore_dismissSleepLockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore sleepAlarmWasDismissedOnDate:source:completion:](self, "sleepAlarmWasDismissedOnDate:source:completion:", a3, 0, a4);
}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HKSPSleepStore _sleepAlarmWasDismissedOnDateOnServer:source:](self, "_sleepAlarmWasDismissedOnDateOnServer:source:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HKSPSleepStore_sleepAlarmWasDismissedOnDate_source_completion___block_invoke;
  v12[3] = &unk_1E4E3C148;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

uint64_t __65__HKSPSleepStore_sleepAlarmWasDismissedOnDate_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_sleepAlarmWasDismissedOnDateOnServer:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  HKSPSleepStore *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("Local");
      if (a4 == 1)
        v10 = CFSTR("NanoSync");
      if (a4 == 2)
        v10 = CFSTR("CloudSync");
      v11 = v10;
      *(_DWORD *)buf = 138543874;
      v32 = self;
      v33 = 2114;
      v34 = v6;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was dismissed on date %{public}@ (%{public}@)", buf, 0x20u);

    }
    v12 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke;
    v26[3] = &unk_1E4E3C230;
    v27 = v6;
    v30 = a4;
    v28 = v12;
    v29 = v13;
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_369;
    v23[3] = &unk_1E4E3BD70;
    v24 = v29;
    v16 = v28;
    v25 = v16;
    v17 = v29;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v26, v23);
    v18 = v25;
    v19 = v16;

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_2;
  v6[3] = &unk_1E4E3C208;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "sleepAlarmWasDismissedOnDate:source:completion:", v5, v4, v6);

}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_369(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore sleepAlarmWasSnoozedUntilDate:source:completion:](self, "sleepAlarmWasSnoozedUntilDate:source:completion:", a3, 0, a4);
}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HKSPSleepStore _sleepAlarmWasSnoozedUntilDateOnServer:source:](self, "_sleepAlarmWasSnoozedUntilDateOnServer:source:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HKSPSleepStore_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke;
  v12[3] = &unk_1E4E3C148;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

uint64_t __66__HKSPSleepStore_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_sleepAlarmWasSnoozedUntilDateOnServer:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  HKSPSleepStore *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("Local");
      if (a4 == 1)
        v10 = CFSTR("NanoSync");
      if (a4 == 2)
        v10 = CFSTR("CloudSync");
      v11 = v10;
      *(_DWORD *)buf = 138543874;
      v32 = self;
      v33 = 2114;
      v34 = v6;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was snoozed until date %{public}@ (%{public}@)", buf, 0x20u);

    }
    v12 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke;
    v26[3] = &unk_1E4E3C230;
    v27 = v6;
    v30 = a4;
    v28 = v12;
    v29 = v13;
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_370;
    v23[3] = &unk_1E4E3BD70;
    v24 = v29;
    v16 = v28;
    v25 = v16;
    v17 = v29;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v26, v23);
    v18 = v25;
    v19 = v16;

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_2;
  v6[3] = &unk_1E4E3C208;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "sleepAlarmWasSnoozedUntilDate:source:completion:", v5, v4, v6);

}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to snooze sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_370(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to snooze sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)sleepAlarmWasModifiedWithCompletion:(id)a3
{
  -[HKSPSleepStore sleepAlarmWasModifiedFromSource:completion:](self, "sleepAlarmWasModifiedFromSource:completion:", 0, a3);
}

- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[HKSPSleepStore _sleepAlarmWasModifiedOnServer:](self, "_sleepAlarmWasModifiedOnServer:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HKSPSleepStore_sleepAlarmWasModifiedFromSource_completion___block_invoke;
  v10[3] = &unk_1E4E3C148;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

uint64_t __61__HKSPSleepStore_sleepAlarmWasModifiedFromSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_sleepAlarmWasModifiedOnServer:(unint64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  HKSPSleepStore *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("Local");
      if (a3 == 1)
        v8 = CFSTR("NanoSync");
      if (a3 == 2)
        v8 = CFSTR("CloudSync");
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v9;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was modified (%{public}@)", buf, 0x16u);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    connectionProvider = self->_connectionProvider;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke;
    v24[3] = &unk_1E4E3C258;
    v27 = a3;
    v25 = v10;
    v26 = v11;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_371;
    v21[3] = &unk_1E4E3BD70;
    v22 = v26;
    v14 = v25;
    v23 = v14;
    v15 = v26;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v24, v21);
    v16 = v23;
    v17 = v14;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_2;
  v5[3] = &unk_1E4E3C208;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "sleepAlarmWasModifiedFromSource:completion:", v4, v5);

}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_371(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)skipUpcomingWakeUpAlarmForDate:(id)a3 completion:(id)a4
{
  -[HKSPSleepStore setUpcomingWakeUpAlarmEnabled:date:completion:](self, "setUpcomingWakeUpAlarmEnabled:date:completion:", 0, a3, a4);
}

- (void)setUpcomingWakeUpAlarmEnabled:(BOOL)a3 date:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, BOOL, id);
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  HKSPSleepStore *v15;
  uint64_t v16;

  v6 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, BOOL, id))a5;
  v13 = 0;
  -[HKSPSleepStore upcomingResolvedScheduleOccurrenceAfterDate:error:](self, "upcomingResolvedScheduleOccurrenceAfterDate:error:", v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (v10)
  {
    -[HKSPSleepStore setWakeUpAlarmEnabled:resolvedOccurrence:date:completion:](self, "setWakeUpAlarmEnabled:resolvedOccurrence:date:completion:", v6, v10, v8, v9);
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ no upcoming occurrence", buf, 0xCu);
    }

    v9[2](v9, v11 != 0, v11);
  }

}

- (void)setWakeUpAlarmEnabled:(BOOL)a3 resolvedOccurrence:(id)a4 date:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  HKSPSleepStore *v22;
  id v23;
  uint8_t buf[4];
  HKSPSleepStore *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  HKSPLogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 1024;
    v27 = v8;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setting wake up alarm to %d for %{public}@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateOverrideOccurrenceForCurrentDate:gregorianCalendar:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "alarmConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "setEnabled:", v8);
  objc_msgSend(v15, "setAlarmConfiguration:", v17);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75__HKSPSleepStore_setWakeUpAlarmEnabled_resolvedOccurrence_date_completion___block_invoke;
  v20[3] = &unk_1E4E3C280;
  v21 = v15;
  v22 = self;
  v23 = v11;
  v18 = v11;
  v19 = v15;
  -[HKSPSleepStore currentSleepScheduleWithCompletion:](self, "currentSleepScheduleWithCompletion:", v20);

}

void __75__HKSPSleepStore_setWakeUpAlarmEnabled_resolvedOccurrence_date_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v6, "saveOccurrence:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "saveCurrentSleepSchedule:completion:", v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch sleep schedule: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_publishNotificationOnServerWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  void *v12;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  HKSPSleepStore *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hksp_supportsSleepDaemon");

  if ((v9 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Publishing notification with identifier on server: %{public}@", buf, 0x16u);
    }

    v11 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke;
    v24[3] = &unk_1E4E3C2A8;
    v25 = v6;
    v26 = v7;
    v27 = v11;
    v28 = v12;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_373;
    v21[3] = &unk_1E4E3BD70;
    v22 = v28;
    v15 = v27;
    v23 = v15;
    v16 = v28;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v24, v21);
    v17 = v23;
    v18 = v15;

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v16);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_2;
  v6[3] = &unk_1E4E3C208;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(a2, "publishNotificationWithIdentifier:userInfo:completion:", v4, v5, v6);

}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish notification on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_373(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish notification on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(a4, "copy");
  -[HKSPSleepStore _publishNotificationOnServerWithIdentifier:userInfo:](self, "_publishNotificationOnServerWithIdentifier:userInfo:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HKSPSleepStore_publishNotificationWithIdentifier_userInfo_completion___block_invoke;
  v14[3] = &unk_1E4E3C148;
  v15 = v8;
  v12 = v8;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

uint64_t __72__HKSPSleepStore_publishNotificationWithIdentifier_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_setLockScreenOverrideStateOnServerWithState:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  HKSPXPCConnectionProvider *connectionProvider;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  uint8_t buf[4];
  HKSPSleepStore *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromHKSPSleepLockScreenState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = self;
      v32 = 2114;
      v33 = v10;
      v34 = 2114;
      v35 = v6;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding lock screen state on server: %{public}@ (userInfo: %{public}@)", buf, 0x20u);

    }
    v11 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    connectionProvider = self->_connectionProvider;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke;
    v25[3] = &unk_1E4E3C230;
    v29 = a3;
    v26 = v6;
    v27 = v11;
    v28 = v12;
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_374;
    v22[3] = &unk_1E4E3BD70;
    v23 = v28;
    v15 = v27;
    v24 = v15;
    v16 = v28;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v25, v22);
    v17 = v24;
    v18 = v15;

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v20);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_2;
  v6[3] = &unk_1E4E3C208;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "setLockScreenOverrideState:userInfo:completion:", v4, v5, v6);

}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override lock screen state on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_374(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override lock screen state on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "copy");
  -[HKSPSleepStore _setLockScreenOverrideStateOnServerWithState:userInfo:](self, "_setLockScreenOverrideStateOnServerWithState:userInfo:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__HKSPSleepStore_setLockScreenOverrideState_userInfo_completion___block_invoke;
  v13[3] = &unk_1E4E3C148;
  v14 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v13);

}

uint64_t __65__HKSPSleepStore_setLockScreenOverrideState_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  HKSPSleepStore *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromHKSPSleepFocusConfigurationState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating sleep focus (%{public}@) mode on server", buf, 0x16u);

    }
    -[HKSPSleepStore description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke;
    v18[3] = &unk_1E4E3C2D0;
    v20 = a3;
    v19 = v6;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke_2;
    v15[3] = &unk_1E4E3C2F8;
    v16 = v11;
    v17 = v19;
    v14 = v11;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v18, v15);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v14);
  }

}

uint64_t __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createSleepFocusInState:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteSleepFocusModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  HKSPSleepStore *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting sleep focus mode on server", buf, 0xCu);
    }

    -[HKSPSleepStore description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke;
    v16[3] = &unk_1E4E3C320;
    v17 = v4;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke_2;
    v13[3] = &unk_1E4E3C2F8;
    v14 = v8;
    v15 = v17;
    v11 = v8;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v16, v13);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v12);

  }
}

uint64_t __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSleepFocusModeWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKSPXPCConnectionProvider *connectionProvider;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  HKSPSleepStore *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if ((v8 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromHKSPSleepFocusConfigurationState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Configuring sleep focus (state: %{public}@) on server", buf, 0x16u);

    }
    -[HKSPSleepStore description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke;
    v18[3] = &unk_1E4E3C2D0;
    v20 = a3;
    v19 = v6;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke_2;
    v15[3] = &unk_1E4E3C2F8;
    v16 = v11;
    v17 = v19;
    v14 = v11;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v18, v15);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v14);
  }

}

uint64_t __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configureSleepFocusWithState:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to configure sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_setWidgetOverrideStateOnServerWithState:(int64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPXPCConnectionProvider *connectionProvider;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  int64_t v26;
  uint8_t buf[4];
  HKSPSleepStore *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromHKSPSleepWidgetState(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = self;
      v29 = 2114;
      v30 = v8;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding sleep widget state on server: %{public}@", buf, 0x16u);

    }
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke;
    v23[3] = &unk_1E4E3C258;
    v26 = a3;
    v24 = v9;
    v25 = v10;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_375;
    v20[3] = &unk_1E4E3BD70;
    v21 = v25;
    v13 = v24;
    v22 = v13;
    v14 = v25;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v23, v20);
    v15 = v22;
    v16 = v13;

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v18);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_2;
  v5[3] = &unk_1E4E3C208;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "setWidgetOverrideState:completion:", v4, v5);

}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override sleep widget state on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_375(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override sleep widget state on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[HKSPSleepStore _setWidgetOverrideStateOnServerWithState:](self, "_setWidgetOverrideStateOnServerWithState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HKSPSleepStore_setWidgetOverrideState_completion___block_invoke;
  v10[3] = &unk_1E4E3C148;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

uint64_t __52__HKSPSleepStore_setWidgetOverrideState_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_clearWidgetOverrideOnServer
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSPSleepStore *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if ((v4 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing sleep widget override on server", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke;
    v19[3] = &unk_1E4E3BFF0;
    v20 = v6;
    v21 = v7;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_376;
    v16[3] = &unk_1E4E3BD70;
    v17 = v21;
    v10 = v20;
    v18 = v10;
    v11 = v21;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v19, v16);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_2;
  v4[3] = &unk_1E4E3C208;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "clearWidgetOverrideWithCompletion:", v4);

}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to clear sleep widget override on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 1000, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_376(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to clear sleep widget override on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)clearWidgetOverrideWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore _clearWidgetOverrideOnServer](self, "_clearWidgetOverrideOnServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HKSPSleepStore_clearWidgetOverrideWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C148;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __52__HKSPSleepStore_clearWidgetOverrideWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (id)_publishWakeUpResultsNotificationOnServer
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  HKSPXPCConnectionProvider *connectionProvider;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSPSleepStore *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if ((v4 & 1) != 0)
  {
    HKSPLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Publishing wake up results notification on server", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HKSPSleepStore description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    connectionProvider = self->_connectionProvider;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke;
    v19[3] = &unk_1E4E3BFF0;
    v20 = v6;
    v21 = v7;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_378;
    v16[3] = &unk_1E4E3BD70;
    v17 = v21;
    v10 = v20;
    v18 = v10;
    v11 = v21;
    -[HKSPXPCConnectionProvider performRemoteBlock:withErrorHandler:](connectionProvider, "performRemoteBlock:withErrorHandler:", v19, v16);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend((id)objc_opt_class(), "_sleepDisabledError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_2;
  v4[3] = &unk_1E4E3C348;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "publishWakeUpResultsNotificationWithCompletion:", v4);

}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    HKSPLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish wake up results notification on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    HKSPNullify(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v8);

  }
}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_378(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HKSPLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish wake up results notification on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HKSPSleepStore _publishWakeUpResultsNotificationOnServer](self, "_publishWakeUpResultsNotificationOnServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HKSPSleepStore_publishWakeUpResultsNotificationWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C370;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

void __65__HKSPSleepStore_publishWakeUpResultsNotificationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  HKSPNilify(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)nextEventDueAfterDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[HKSPSleepStore nextEventDueAfterDateFuture:](self, "nextEventDueAfterDateFuture:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HKSPSleepStore_nextEventDueAfterDate_completion___block_invoke;
  v10[3] = &unk_1E4E3C398;
  v11 = v6;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __51__HKSPSleepStore_nextEventDueAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HKSPSleepStore nextEventWithIdentifierFuture:dueAfterDate:](self, "nextEventWithIdentifierFuture:dueAfterDate:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HKSPSleepStore_nextEventWithIdentifier_dueAfterDate_completion___block_invoke;
  v12[3] = &unk_1E4E3C3C0;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

void __66__HKSPSleepStore_nextEventWithIdentifier_dueAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    HKSPNilify(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (id)nextEventDueAfterDateFuture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HKSPSleepStore sleepScheduleModelFuture](self, "sleepScheduleModelFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HKSPSleepStore_nextEventDueAfterDateFuture___block_invoke;
  v9[3] = &unk_1E4E3BE38;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __46__HKSPSleepStore_nextEventDueAfterDateFuture___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "nextEventDueAfterDate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  HKSPNullify(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextEventDueAfterDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HKSPSleepStore sleepScheduleModelWithError:](self, "sleepScheduleModelWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextEventDueAfterDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nextEventWithIdentifierFuture:(id)a3 dueAfterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKSPSleepStore sleepScheduleModelFuture](self, "sleepScheduleModelFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HKSPSleepStore_nextEventWithIdentifierFuture_dueAfterDate___block_invoke;
  v13[3] = &unk_1E4E3C3E8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __61__HKSPSleepStore_nextEventWithIdentifierFuture_dueAfterDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "nextEventWithIdentifier:dueAfterDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  HKSPNullify(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[HKSPSleepStore sleepScheduleModelWithError:](self, "sleepScheduleModelWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextEventWithIdentifier:dueAfterDate:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  HKSPSleepStore *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep coaching onboarding version to %{public}@", buf, 0x16u);

  }
  -[HKSPSleepStore currentSleepEventRecordFuture](self, "currentSleepEventRecordFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HKSPSleepStore_setSleepCoachingOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E4E3C410;
  v12[4] = self;
  v13 = v6;
  v14 = a3;
  v10 = v6;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

void __72__HKSPSleepStore_setSleepCoachingOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HKSPNilify(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSleepCoachingOnboardingCompletedVersion:completedDate:", v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "saveCurrentSleepEventRecord:completion:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep coaching onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  HKSPSleepStore *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep tracking onboarding version to %{public}@", buf, 0x16u);

  }
  -[HKSPSleepStore currentSleepEventRecordFuture](self, "currentSleepEventRecordFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HKSPSleepStore_setSleepTrackingOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E4E3C410;
  v12[4] = self;
  v13 = v6;
  v14 = a3;
  v10 = v6;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

void __72__HKSPSleepStore_setSleepTrackingOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HKSPNilify(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSleepTrackingOnboardingCompletedVersion:completedDate:", v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "saveCurrentSleepEventRecord:completion:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep tracking onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  HKSPSleepStore *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep wind down shortcuts onboarding version to %{public}@", buf, 0x16u);

  }
  -[HKSPSleepStore currentSleepEventRecordFuture](self, "currentSleepEventRecordFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HKSPSleepStore_setSleepWindDownShortcutsOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E4E3C410;
  v12[4] = self;
  v13 = v6;
  v14 = a3;
  v10 = v6;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

void __81__HKSPSleepStore_setSleepWindDownShortcutsOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HKSPNilify(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSleepWindDownShortcutsOnboardingCompletedVersion:completedDate:", v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "saveCurrentSleepEventRecord:completion:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    HKSPLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep wind down shortcuts onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_notifyObserversForChangedSleepSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  HKSPObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKSPSleepStore *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep schedule: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke;
  v8[3] = &unk_1E4E3C460;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v8);

}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke_2;
    v8[3] = &unk_1E4E3C438;
    v9 = *(id *)(a1 + 40);
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = v6;
    v7 = (id)objc_msgSend(v4, "addSuccessBlock:", v8);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepScheduleDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "sleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:](HKSPSleepScheduleModel, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v3, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "sleepStore:sleepScheduleModelDidChange:", *(_QWORD *)(a1 + 48), v7);
}

- (void)_notifyObserversForChangedSleepSettings:(id)a3
{
  id v4;
  NSObject *v5;
  HKSPObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKSPSleepStore *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep settings: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke;
  v8[3] = &unk_1E4E3C460;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v8);

}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke_2;
    v8[3] = &unk_1E4E3C438;
    v9 = *(id *)(a1 + 40);
    v10 = v4;
    v11 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = (id)objc_msgSend(v5, "addSuccessBlock:", v8);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepSettingsDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "sleepEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:](HKSPSleepScheduleModel, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v4, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "sleepStore:sleepScheduleModelDidChange:", *(_QWORD *)(a1 + 48), v7);
}

- (void)_notifyObserversForChangedSleepEventRecord:(id)a3
{
  id v4;
  NSObject *v5;
  HKSPObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKSPSleepStore *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep event record: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke;
  v8[3] = &unk_1E4E3C460;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v8);

}

void __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke_2;
    v8[3] = &unk_1E4E3C438;
    v9 = *(id *)(a1 + 40);
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = v6;
    v7 = (id)objc_msgSend(v4, "addSuccessBlock:", v8);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepEventRecordDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:](HKSPSleepScheduleModel, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v4, v5, *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "sleepStore:sleepScheduleModelDidChange:", *(_QWORD *)(a1 + 48), v6);
}

- (void)_notifyObserversForChangedSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  HKSPObserverSet *observers;
  _QWORD v11[7];
  uint8_t buf[4];
  HKSPSleepStore *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepMode(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep mode: %{public}@ (%{public}@)", buf, 0x20u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepMode_reason___block_invoke;
  v11[3] = &unk_1E4E3C488;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);
}

void __61__HKSPSleepStore__notifyObserversForChangedSleepMode_reason___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepModeDidChange:reason:", a1[4], a1[5], a1[6]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepModeOnDidChange:", a1[4], a1[5] != 0);
  }

}

- (void)_notifyObserversForSleepEvent:(id)a3
{
  id v4;
  NSObject *v5;
  HKSPObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKSPSleepStore *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep event: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore__notifyObserversForSleepEvent___block_invoke;
  v8[3] = &unk_1E4E3C460;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v8);

}

void __48__HKSPSleepStore__notifyObserversForSleepEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepStore:sleepEventDidOccur:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversForChangedSleepScheduleState:(unint64_t)a3 reason:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  HKSPObserverSet *observers;
  _QWORD v11[7];
  uint8_t buf[4];
  HKSPSleepStore *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepScheduleState(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleStateChangeReason(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep state: %{public}@ (%{public}@)", buf, 0x20u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HKSPSleepStore__notifyObserversForChangedSleepScheduleState_reason___block_invoke;
  v11[3] = &unk_1E4E3C488;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);
}

void __70__HKSPSleepStore__notifyObserversForChangedSleepScheduleState_reason___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepScheduleStateDidChange:reason:", a1[4], a1[5], a1[6]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sleepStore:sleepScheduleStateDidChange:", a1[4], a1[5]);
  }

}

- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  HKSPObserverSet *observers;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  HKSPSleepStore *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep focus mode update: %{public}@", buf, 0x16u);
  }

  -[HKSPSleepStore sleepStoreCache](self, "sleepStoreCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purgeCachedSleepMode");

  observers = self->_observers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HKSPSleepStore_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke;
  v10[3] = &unk_1E4E3C460;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v10);

}

void __72__HKSPSleepStore_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepStore:sleepFocusConfigurationDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)hasSleepFocusMode
{
  void *v2;
  char v3;

  -[HKSPSleepStore sleepFocusConfiguration](self, "sleepFocusConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSleepFocusMode");

  return v3;
}

- (HKSPSleepFocusConfiguration)sleepFocusConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  HKSPSleepStore *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HKSPSleepStore sleepFocusModeBridge](self, "sleepFocusModeBridge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[HKSPSleepFocusConfiguration initWithUUID:mirrorsFocusModes:state:]([HKSPSleepFocusConfiguration alloc], "initWithUUID:mirrorsFocusModes:state:", 0, 0, 0);
  -[HKSPSleepStore sleepFocusModeBridge](self, "sleepFocusModeBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "sleepFocusConfiguration:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "%{public}@ error retrieving sleep focus config: %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepFocusConfiguration: %{public}@", buf, 0x16u);
  }

  return (HKSPSleepFocusConfiguration *)v5;
}

- (HKSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HKSleepHealthStore)sleepHealthStore
{
  return self->_sleepHealthStore;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (HKSPXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (HKSPSleepStoreModelCache)sleepStoreCache
{
  return self->_sleepStoreCache;
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (HKSPThrottler)reconnectThrottler
{
  return self->_reconnectThrottler;
}

- (HKSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setSyncAnchorContainer:(id)a3
{
  objc_storeStrong((id *)&self->_syncAnchorContainer, a3);
}

- (HKSPSleepWidgetManager)widgetManager
{
  return self->_widgetManager;
}

@end
