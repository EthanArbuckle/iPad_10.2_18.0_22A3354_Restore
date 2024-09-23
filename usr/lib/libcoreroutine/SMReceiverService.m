@implementation SMReceiverService

- (SMReceiverService)initWithDefaultsManager:(id)a3 platform:(id)a4 messagingService:(id)a5 safetyCacheStore:(id)a6 xpcActivityManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SMReceiverService *v18;
  SMReceiverService *v19;
  uint64_t v20;
  NSHashTable *observers;
  NSMutableArray *v22;
  NSMutableArray *cacheManagerArray;
  RTInvocationDispatcher *v24;
  void *v25;
  uint64_t v26;
  RTInvocationDispatcher *dispatcher;
  SMReceiverService *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  id v34;
  objc_super v35;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v29 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_15;
  }
  if (!v14)
  {
    v29 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: platform";
    goto LABEL_14;
  }
  if (!v15)
  {
    v29 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: messagingService";
      goto LABEL_14;
    }
LABEL_15:

    v28 = 0;
    goto LABEL_20;
  }
  v34 = v17;
  if (v16)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMReceiverService;
    v18 = -[RTNotifier init](&v35, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      objc_storeStrong((id *)&v19->_platform, a4);
      objc_storeStrong((id *)&v19->_messagingService, a5);
      objc_storeStrong((id *)&v19->_safetyCacheStore, a6);
      objc_storeStrong((id *)&v19->_xpcActivityManager, a7);
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v20 = objc_claimAutoreleasedReturnValue();
      observers = v19->_observers;
      v19->_observers = (NSHashTable *)v20;

      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      cacheManagerArray = v19->_cacheManagerArray;
      v19->_cacheManagerArray = v22;

      v19->_attemptedToLoadFromDisk = 0;
      v24 = [RTInvocationDispatcher alloc];
      -[RTNotifier queue](v19, "queue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[RTInvocationDispatcher initWithQueue:](v24, "initWithQueue:", v25);
      dispatcher = v19->_dispatcher;
      v19->_dispatcher = (RTInvocationDispatcher *)v26;

      v19->_prevCKAccountStatus = 3;
      -[RTService setup](v19, "setup");
    }
    self = v19;
    v28 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: safetyCacheStore", buf, 2u);
    }

    v28 = 0;
  }
  v29 = v34;
LABEL_20:

  return v28;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SMReceiverService messagingService](self, "messagingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SMReceiverService;
  -[SMReceiverService dealloc](&v4, sel_dealloc);
}

- (void)_setup
{
  char v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_feature_enabled_impl();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@", (uint8_t *)&v17, 0x16u);

    }
    -[SMReceiverService safetyCacheStore](self, "safetyCacheStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:", self, sel_onSafetyCacheStoreNotification_, v11);

    -[SMReceiverService messagingService](self, "messagingService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](SMMessageReceivedNotification, "notificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:", self, sel_onMessageReceived_, v13);

    -[SMReceiverService _registerForCKAccountChangedNotification](self, "_registerForCKAccountChangedNotification");
    -[SMReceiverService _registerInitializeSentinelZoneActivity](self, "_registerInitializeSentinelZoneActivity");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,feature not enabled", (uint8_t *)&v17, 0x16u);

    }
  }
}

- (void)_setupCacheManagers:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  -[SMReceiverService safetyCacheStore](self, "safetyCacheStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SMReceiverService__setupCacheManagers___block_invoke;
  v8[3] = &unk_1E9297600;
  objc_copyWeak(v10, &location);
  v8[4] = self;
  v10[1] = (id)a2;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "fetchReceiverContactsWithHandler:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __41__SMReceiverService__setupCacheManagers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SMReceiverService__setupCacheManagers___block_invoke_19;
    block[3] = &unk_1E92975D8;
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v29 = v10;
    v30 = v11;
    v34 = *(_QWORD *)(a1 + 56);
    v33 = v12;
    v31 = v5;
    v32 = v8;
    dispatch_async(v9, block);

    v13 = v29;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v16;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,receiver service released before receiver contacts fetch returned", buf, 0x16u);

    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, %@, was not able to acquire strongSelf"), v20, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v13;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18598];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 5, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v27);

    }
  }

}

uint64_t __41__SMReceiverService__setupCacheManagers___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  SMReceiverCacheManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SMReceiverCacheManager *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,failed to fetch receiver contacts with error %@", buf, 0x20u);

    }
    result = *(_QWORD *)(a1 + 64);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(a1 + 48);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "sessionUUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 72));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v33 = v11;
            v34 = 2112;
            v35 = v13;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,loaded receiver contact from disk", buf, 0x20u);

          }
          v15 = [SMReceiverCacheManager alloc];
          objc_msgSend(*(id *)(a1 + 56), "safetyCacheStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "defaultsManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "queue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "messagingService");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[SMReceiverCacheManager initWithReceiverContact:safetyCacheStore:defaultsManager:queue:messagingService:](v15, "initWithReceiverContact:safetyCacheStore:defaultsManager:queue:messagingService:", v9, v16, v17, v18, v19);

          -[SMReceiverCacheManager setDelegate:](v20, "setDelegate:", *(_QWORD *)(a1 + 56));
          objc_msgSend(*(id *)(a1 + 56), "cacheManagerArray");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v20);

          -[SMReceiverCacheManager onSessionStatusLoadedFromDisk](v20, "onSessionStatusLoadedFromDisk");
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v6);
    }

    result = *(_QWORD *)(a1 + 64);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)_setupOnceDiskAvailable
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSMutableArray count](self->_cacheManagerArray, "count");
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,has already run. cacheManagerArray Count, %lu", buf, 0x20u);
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v9 = -[SMReceiverService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v9 != 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[SMReceiverService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = (uint64_t)v15;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,Deferring - Store is not available. Safety Cache Store, %@", buf, 0x20u);

      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,Setting up cache managers", buf, 0x16u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__SMReceiverService__setupOnceDiskAvailable__block_invoke;
  v16[3] = &unk_1E9297628;
  v16[4] = self;
  v16[5] = a2;
  -[SMReceiverService _setupCacheManagers:](self, "_setupCacheManagers:", v16);
}

void __44__SMReceiverService__setupOnceDiskAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,attempted to load cacheManagers from disk, %@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAttemptedToLoadFromDisk:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "invocationsPending");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "dispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dispatchPendingInvocations");

  }
}

- (void)onSafetyCacheStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SMReceiverService_onSafetyCacheStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__SMReceiverService_onSafetyCacheStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSafetyCacheStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onSafetyCacheStoreNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_msgSend(v5, "availability");
    if (-[SMReceiverService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability") != v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_safetyCacheStoreAvailability);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTStore availabilityToString:](RTStore, "availabilityToString:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138413058;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,safetyCacheStoreAvailability availability change from,%@,to,%@", (uint8_t *)&v16, 0x2Au);

      }
      -[SMReceiverService setSafetyCacheStoreAvailability:](self, "setSafetyCacheStoreAvailability:", v9);
      if (-[SMReceiverService safetyCacheStoreAvailability](self, "safetyCacheStoreAvailability") == 2)
        -[SMReceiverService _setupOnceDiskAvailable](self, "_setupOnceDiskAvailable");
    }
  }

}

- (id)invocationError
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation - store did not become available"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v14 = *MEMORY[0x1E0CB2D50];
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SMReceiverService_addObserver___block_invoke;
    v7[3] = &unk_1E9297540;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __33__SMReceiverService_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SMReceiverService_removeObserver___block_invoke;
    v7[3] = &unk_1E9297540;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer", buf, 2u);
    }

  }
}

void __36__SMReceiverService_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)notifyObserversOfReceiverSessionStatusChangeWithSessionID:(id)a3 sessionStatus:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: sessionID";
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_18;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: sessionStatus";
    goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = v7;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sending session status update to observers", buf, 0x20u);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SMReceiverService observers](self, "observers", 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "onReceiverSessionStatusChangeForSessionID:sessionStatus:", v7, v9);
      }
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
LABEL_18:

}

- (void)notifyObserversOfReceiverSafetyCacheChangeWithSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v9;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sending safety cache update to observers", buf, 0x20u);

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SMReceiverService observers](self, "observers", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v21, "onReceiverSafetyCacheChangeForSessionID:phoneCache:watchCache:", v9, v10, v11);
        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }

}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SMReceiverService_fetchAllReceiverSessionStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__SMReceiverService_fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllReceiverSessionStatusWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t v19[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
    {
      *(_QWORD *)v19 = 0;
      v20 = v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__3;
      v23 = __Block_byref_object_dispose__3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      -[SMReceiverService cacheManagerArray](self, "cacheManagerArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_31;
      v18[3] = &unk_1E92976A0;
      v18[4] = v19;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(*((id *)v20 + 5), "count");
        *(_DWORD *)buf = 138412802;
        v30 = v9;
        v31 = 2112;
        v32 = v10;
        v33 = 1024;
        v34 = v11;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,returning array of %d session status", buf, 0x1Cu);

      }
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, *((_QWORD *)v20 + 5), 0);
      _Block_object_dispose(v19, 8);

    }
    else
    {
      -[SMReceiverService dispatcher](self, "dispatcher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke;
      v27[3] = &unk_1E9297650;
      v27[4] = self;
      v28 = v5;
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_2;
      v25[3] = &unk_1E9297678;
      v25[4] = self;
      v26 = v28;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "enqueueBlock:failureBlock:description:", v27, v25, CFSTR("%@-%@"), v16, v17);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v19, 2u);
    }

  }
}

uint64_t __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllReceiverSessionStatusWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__SMReceiverService__fetchAllReceiverSessionStatusWithCompletion___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "sessionStatus");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SMReceiverService_fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__SMReceiverService_fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReceiverSessionStatusForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject sessionStatus](v10, "sessionStatus");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = v7;
        v36 = 2112;
        v37 = v14;
        v38 = 2112;
        v39 = v15;
        v40 = 2112;
        v41 = v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning session status %@", buf, 0x2Au);

      }
      -[NSObject sessionStatus](v10, "sessionStatus");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v17, 0);
    }
    else
    {
      if (v12)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v7;
        v36 = 2112;
        v37 = v25;
        v38 = 2112;
        v39 = v26;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);

      }
      v42 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no cache manager found for sessionID %@"), v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v28);

    }
    goto LABEL_18;
  }
  -[SMReceiverService dispatcher](self, "dispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  v31[3] = &unk_1E9296F70;
  v31[4] = self;
  v32 = v7;
  v33 = v9;
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke_2;
  v29[3] = &unk_1E9297678;
  v29[4] = self;
  v30 = v33;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "enqueueBlock:failureBlock:description:", v31, v29, CFSTR("%@-%@"), v22, v23);

LABEL_19:
}

uint64_t __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReceiverSessionStatusForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __72__SMReceiverService__fetchReceiverSessionStatusForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SMReceiverService_userRequestedCacheDownloadForSessionID_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__SMReceiverService_userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userRequestedCacheDownloadForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[5];
  id v31;
  void (**v32)(_QWORD, _QWORD);
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Invalid parameter not satisfying: sessionID";
LABEL_12:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Invalid parameter not satisfying: completion";
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v7;
        v37 = 2112;
        v38 = v14;
        v39 = 2112;
        v40 = v15;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,notifying cache manager of user intent to download cache", buf, 0x20u);

      }
      -[NSObject onUserCacheDownloadRequest](v10, "onUserCacheDownloadRequest");
      v9[2](v9, 0);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v7;
        v37 = 2112;
        v38 = v26;
        v39 = 2112;
        v40 = v27;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);

      }
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no cache manager found for sessionID %@"), v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v24);

    }
    goto LABEL_17;
  }
  -[SMReceiverService dispatcher](self, "dispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke;
  v30[3] = &unk_1E9296F70;
  v30[4] = self;
  v31 = v7;
  v32 = v9;
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke_2;
  v28[3] = &unk_1E9297678;
  v28[4] = self;
  v29 = v32;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enqueueBlock:failureBlock:description:", v30, v28, CFSTR("%@-%@"), v20, v21);

LABEL_18:
}

uint64_t __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userRequestedCacheDownloadForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __72__SMReceiverService__userRequestedCacheDownloadForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SMReceiverService_fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __69__SMReceiverService_fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReceiverSafetyCacheForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  void (**v48)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v49[5];
  id v50;
  void (**v51)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[4];

  v67[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: sessionID";
LABEL_13:
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: completion";
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      -[NSObject sessionStatus](v10, "sessionStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "sessionState");

      if (v13 != 6)
      {
        -[NSObject phoneCache](v11, "phoneCache");
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject watchCache](v11, "watchCache");
        v33 = objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v32 | v33)
        {
          if (v35)
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v32, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v33, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v53 = v7;
            v54 = 2112;
            v55 = v43;
            v56 = 2112;
            v57 = v44;
            v58 = 2112;
            v59 = v45;
            v60 = 2112;
            v61 = v46;
            _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully fetched safety cache info,phoneCacheIdentifier,%@,watchCacheIdentifier,%@", buf, 0x34u);

          }
          v9[2](v9, v32, v33, 0);
        }
        else
        {
          if (v35)
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v53 = v7;
            v54 = 2112;
            v55 = v37;
            v56 = 2112;
            v57 = v38;
            _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache info not available", buf, 0x20u);

          }
          v62 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cache info not available for sessionID %@"), v7);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, v41);

          v33 = 0;
          v32 = 0;
        }
        goto LABEL_19;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v7;
        v54 = 2112;
        v55 = v16;
        v56 = 2112;
        v57 = v17;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,session is being cleaned up", buf, 0x20u);

      }
      v64 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session is being cleaned up"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v18;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v65;
      v21 = &v64;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v7;
        v54 = 2112;
        v55 = v30;
        v56 = 2112;
        v57 = v31;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager found", buf, 0x20u);

      }
      v66 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no cache manager found for sessionID %@"), v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v18;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = (void **)v67;
      v21 = &v66;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, 0, v33);
LABEL_19:

    goto LABEL_20;
  }
  -[SMReceiverService dispatcher](self, "dispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  v49[3] = &unk_1E9296F70;
  v49[4] = self;
  v50 = v7;
  v51 = v9;
  v47[0] = v24;
  v47[1] = 3221225472;
  v47[2] = __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2;
  v47[3] = &unk_1E9297678;
  v47[4] = self;
  v48 = v51;
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "enqueueBlock:failureBlock:description:", v49, v47, CFSTR("%@-%@"), v26, v27);

LABEL_21:
}

uint64_t __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReceiverSafetyCacheForSessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __70__SMReceiverService__fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "invocationError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
    goto LABEL_13;
  }
  if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v5;
        v23 = 2112;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, notifying cache manager of user viewing session details", buf, 0x20u);

      }
      -[NSObject onViewingSessionDetails](v6, "onViewingSessionDetails");
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v5;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, no cache manager to remove", buf, 0x20u);

      }
    }
LABEL_13:

    goto LABEL_14;
  }
  -[SMReceiverService dispatcher](self, "dispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__SMReceiverService_detailsViewOpenedForSessionID___block_invoke;
  v19[3] = &unk_1E9297540;
  v19[4] = self;
  v20 = v5;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enqueueBlock:description:", v19, CFSTR("%@-%@"), v14, v15);

LABEL_14:
}

uint64_t __51__SMReceiverService_detailsViewOpenedForSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "detailsViewOpenedForSessionID:", *(_QWORD *)(a1 + 40));
}

- (id)getReceiverCacheManagerForSessionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    -[SMReceiverService cacheManagerArray](self, "cacheManagerArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SMReceiverService_getReceiverCacheManagerForSessionID___block_invoke;
    v9[3] = &unk_1E92976C8;
    v10 = v4;
    v11 = buf;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

void __57__SMReceiverService_getReceiverCacheManagerForSessionID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)createReceiverCacheManagerForSessionID:(id)a3 initiatorHandle:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  SMReceiverCacheManager *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  SMReceiverCacheManager *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (SMReceiverCacheManager *)v9;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v7;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v14;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,already have a cache manager", (uint8_t *)&v25, 0x20u);
LABEL_10:

      }
    }
    else
    {
      v17 = [SMReceiverCacheManager alloc];
      -[SMReceiverService safetyCacheStore](self, "safetyCacheStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverService defaultsManager](self, "defaultsManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier queue](self, "queue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverService messagingService](self, "messagingService");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SMReceiverCacheManager initWithSessionID:initiatorHandle:safetyCacheStore:defaultsManager:queue:messagingService:](v17, "initWithSessionID:initiatorHandle:safetyCacheStore:defaultsManager:queue:messagingService:", v7, v8, v18, v19, v20, v21);

      -[SMReceiverCacheManager setDelegate:](v10, "setDelegate:", self);
      -[SMReceiverService cacheManagerArray](self, "cacheManagerArray");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v10);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v7;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,created cache manager", (uint8_t *)&v25, 0x20u);
        goto LABEL_10;
      }
    }

    v15 = v10;
    v16 = v15;
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v25) = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", (uint8_t *)&v25, 2u);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)removeReceiverCacheManagerForSessionID:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SMReceiverService cacheManagerArray](self, "cacheManagerArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v6);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject sessionID](v6, "sessionID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v9;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,removed cache manager", (uint8_t *)&v14, 0x20u);

LABEL_9:
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v5;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no cache manager to remove", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }

    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", (uint8_t *)&v14, 2u);
  }
LABEL_11:

}

- (void)onMessageReceived:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,unrecognized notification,%@", buf, 0x20u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2080;
      v19 = "-[SMReceiverService onMessageReceived:]";
      v20 = 1024;
      LODWORD(v21) = 607;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
LABEL_10:

    goto LABEL_11;
  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__SMReceiverService_onMessageReceived___block_invoke;
  v14[3] = &unk_1E9297540;
  v14[4] = self;
  v15 = v5;
  dispatch_async(v6, v14);

LABEL_11:
}

uint64_t __39__SMReceiverService_onMessageReceived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMessageReceived:", *(_QWORD *)(a1 + 40));
}

- (void)_onMessageReceived:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[SMReceiverService attemptedToLoadFromDisk](self, "attemptedToLoadFromDisk"))
    {
      objc_msgSend(v5, "message");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend((id)objc_opt_class(), "messageType");

      switch(v7)
      {
        case 1:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedSessionStartMessage:fromHandle:fromMe:](self, "receivedSessionStartMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 2:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedSessionEndMessage:fromHandle:fromMe:](self, "receivedSessionEndMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 3:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedKeyReleaseMessage:fromHandle:fromMe:](self, "receivedKeyReleaseMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 6:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedCacheUpdatedMessage:fromHandle:fromMe:](self, "receivedCacheUpdatedMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 7:
        case 8:
        case 9:
        case 11:
        case 12:
        case 14:
        case 16:
        case 17:
        case 18:
        case 19:
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            goto LABEL_7;
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v24 = v10;
          v25 = 2112;
          v26 = v11;
          v27 = 1024;
          v28 = objc_msgSend((id)objc_opt_class(), "messageType");
          _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,%@,%@,ignore message type,%d", buf, 0x1Cu);
          goto LABEL_6;
        case 10:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedEstimatedEndTimeUpdateMessage:fromHandle:fromMe:](self, "receivedEstimatedEndTimeUpdateMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 13:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedSessionStartInfoMessage:fromHandle:fromMe:](self, "receivedSessionStartInfoMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 15:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService receivedKeyReleaseInfoMessage:fromHandle:fromMe:](self, "receivedKeyReleaseInfoMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
          goto LABEL_22;
        case 20:
          objc_msgSend(v5, "message");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "from");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverService _receivedLowPowerModeWarningStateUpdateMessage:fromHandle:fromMe:](self, "_receivedLowPowerModeWarningStateUpdateMessage:fromHandle:fromMe:", v18, v19, objc_msgSend(v5, "fromMe"));
LABEL_22:

          break;
        default:
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v24 = v10;
          v25 = 2112;
          v26 = v11;
          v27 = 1024;
          v28 = objc_msgSend((id)objc_opt_class(), "messageType");
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,unrecognized message type,%d", buf, 0x1Cu);
LABEL_6:

LABEL_7:
          break;
      }
    }
    else
    {
      -[SMReceiverService dispatcher](self, "dispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __40__SMReceiverService__onMessageReceived___block_invoke;
      v21[3] = &unk_1E9297540;
      v21[4] = self;
      v22 = v5;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueBlock:description:", v21, CFSTR("%@-%@"), v16, v17);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }

  }
}

uint64_t __40__SMReceiverService__onMessageReceived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMessageReceived:", *(_QWORD *)(a1 + 40));
}

- (void)receivedSessionStartMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v28) = 0;
    v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v28, 2u);
    goto LABEL_16;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v28) = 0;
    v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413570;
      v29 = v18;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = (uint64_t)v21;
      v34 = 2112;
      v35 = v11;
      v36 = 1024;
      v37 = 0;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v9, "lowPowerModeWarningState");
      v28 = 138412802;
      v29 = v25;
      v30 = 2112;
      v31 = v26;
      v32 = 2048;
      v33 = v27;
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "%@,%@ message.lowPowerModeWarningState %ld", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(v9, "sessionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService createReceiverCacheManagerForSessionID:initiatorHandle:](self, "createReceiverCacheManagerForSessionID:initiatorHandle:", v23, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    -[NSObject onSessionStartMessageReceived:](v13, "onSessionStartMessageReceived:", v9);
  }
LABEL_16:

}

- (void)receivedSessionStartInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v17);
    v12 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413570;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = 0;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

      }
      -[NSObject onSessionStartInfoMessageReceived:](v12, "onSessionStartInfoMessageReceived:", v9);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v24;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);

      }
      v12 = 0;
    }
  }
LABEL_18:

}

- (void)receivedEstimatedEndTimeUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v17);
    v12 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413570;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = 0;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

      }
      -[NSObject onEstimatedEndTimeUpdateMessageReceived:](v12, "onEstimatedEndTimeUpdateMessageReceived:", v9);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v24;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);

      }
      v12 = 0;
    }
  }
LABEL_18:

}

- (void)_receivedLowPowerModeWarningStateUpdateMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v17);
    v12 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413570;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = 0;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

      }
      -[NSObject onLowPowerModeWarningStateUpdateMessageReceived:](v12, "onLowPowerModeWarningStateUpdateMessageReceived:", v9);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v24;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);

      }
      v12 = 0;
    }
  }
LABEL_18:

}

- (void)receivedSessionEndMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v23) = 0;
    v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 2u);
    goto LABEL_15;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v23) = 0;
    v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413570;
      v24 = v18;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v11;
      v31 = 1024;
      v32 = 0;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v23, 0x3Au);

    }
    objc_msgSend(v9, "sessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v22);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
      -[NSObject onSessionEndMessageReceived:](v13, "onSessionEndMessageReceived:", v9);
  }
LABEL_15:

}

- (void)receivedKeyReleaseMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v29) = 0;
    v17 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v29) = 0;
    v17 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v29, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413570;
      v30 = v18;
      v31 = 2112;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = v11;
      v37 = 1024;
      v38 = 0;
      v39 = 2112;
      v40 = v9;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v29, 0x3Au);

    }
    objc_msgSend(v9, "sessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v22);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412802;
        v30 = v24;
        v31 = 2112;
        v32 = v26;
        v33 = 2112;
        v34 = v27;
        _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v29, 0x20u);

      }
      objc_msgSend(v9, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverService createReceiverCacheManagerForSessionID:initiatorHandle:](self, "createReceiverCacheManagerForSessionID:initiatorHandle:", v28, v11);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    -[NSObject onKeyReleaseMessageReceived:](v13, "onKeyReleaseMessageReceived:", v9);
  }
LABEL_18:

}

- (void)receivedKeyReleaseInfoMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v17);
    v12 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413570;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = 0;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

      }
      -[NSObject onKeyReleaseInfoMessageReceived:](v12, "onKeyReleaseInfoMessageReceived:", v9);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v24;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);

      }
      v12 = 0;
    }
  }
LABEL_18:

}

- (void)receivedCacheUpdatedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: from";
    goto LABEL_10;
  }
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,message from my own device", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverService getReceiverCacheManagerForSessionID:](self, "getReceiverCacheManagerForSessionID:", v17);
    v12 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413570;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = 0;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,from,%@,fromMe,%d,message,%@", (uint8_t *)&v28, 0x3Au);

      }
      -[NSObject onCacheUpdatedMessageReceived:](v12, "onCacheUpdatedMessageReceived:", v9);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "sessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v24;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing cache manager", (uint8_t *)&v28, 0x20u);

      }
      v12 = 0;
    }
  }
LABEL_18:

}

- (void)_registerForCKAccountChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__onCKAccountChangedNotification, *MEMORY[0x1E0C94690], 0);

}

- (void)_onCKAccountChangedNotification
{
  void *v4;
  _QWORD v5[5];
  id v6[2];
  id location;

  +[SMCloudKitZone getContainer](SMSentinelZone, "getContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__SMReceiverService__onCKAccountChangedNotification__block_invoke;
    v5[3] = &unk_1E9297718;
    v5[4] = self;
    v6[1] = (id)a2;
    objc_copyWeak(v6, &location);
    objc_msgSend(v4, "accountStatusWithCompletionHandler:", v5);
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }

}

void __52__SMReceiverService__onCKAccountChangedNotification__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2048;
    v32 = a2;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,Receiver,%@,%@,new CKAccountStatus,%lu", buf, 0x20u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 40) != a2)
  {
    *(_QWORD *)(v7 + 40) = a2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    switch(a2)
    {
      case 4:
        goto LABEL_7;
      case 3:
LABEL_15:

        goto LABEL_16;
      case 0:
LABEL_7:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          v31 = 2048;
          v32 = a2;
          v33 = 2112;
          v34 = v5;
          _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,CKAccountStatus,%lu,error,%@", buf, 0x2Au);

        }
        break;
    }
    if (WeakRetained)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __52__SMReceiverService__onCKAccountChangedNotification__block_invoke_46;
      v24[3] = &unk_1E92976F0;
      v10 = *(_QWORD *)(a1 + 48);
      v24[4] = *(_QWORD *)(a1 + 32);
      v24[5] = v10;
      v24[6] = a2;
      objc_msgSend(WeakRetained, "_initializeSentinelZoneWithCompletion:", v24);
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = *MEMORY[0x1E0D18598];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("Receiver service released before sentinel zone setup");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 5, v13);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,receiver service released before account change could be processed", buf, 0x16u);

      }
      +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:error:](SMReceiverService, "_submitSentinelZoneMaintenanceMetricForSuccess:error:", 0, WeakRetained);
    }
    goto LABEL_15;
  }
LABEL_16:

}

void __52__SMReceiverService__onCKAccountChangedNotification__block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 138413314;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 1024;
    v16 = a2;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,sentinel zone init success,%d,accountStatus,%lu,error,%@", (uint8_t *)&v11, 0x30u);

  }
  +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:error:](SMReceiverService, "_submitSentinelZoneMaintenanceMetricForSuccess:error:", a2, v5);

}

- (void)_initializeSentinelZoneWithCompletion:(id)a3
{
  id v5;
  SMSentinelZone *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v6 = [SMSentinelZone alloc];
    -[RTNotifier queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SMSentinelZone initWithQueue:](v6, "initWithQueue:", v7);

    -[SMReceiverService xpcActivityManager](self, "xpcActivityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "runningTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.routined.cloudkit.initializeSentinelZone"));

    if (v12)
    {
      -[SMReceiverService xpcActivityManager](self, "xpcActivityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "runningTask");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__SMReceiverService__initializeSentinelZoneWithCompletion___block_invoke;
    v16[3] = &unk_1E9297740;
    v16[4] = self;
    v18 = a2;
    v17 = v5;
    -[NSObject saveZoneWithXPCActivity:completion:](v8, "saveZoneWithXPCActivity:completion:", v15, v16);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }

}

void __59__SMReceiverService__initializeSentinelZoneWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,sentinel zone init success,%d,error,%@", (uint8_t *)&v10, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_registerInitializeSentinelZoneActivity
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  RTXPCActivityCriteria *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19[2];
  id location;

  -[SMReceiverService defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:value:", CFSTR("RTDefaultsInitializeSentinelZoneInterval"), &unk_1E932CD00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[SMReceiverService defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:value:", CFSTR("RTDefaultsInitializeSentinelZoneGracePeriod"), &unk_1E932CD10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[SMReceiverService defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:value:", CFSTR("RTDefaultsInitializeSentinelZoneIgnoreNetworkConnectivity"), &unk_1E93268A0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue") ^ 1;

  LOBYTE(v17) = 1;
  v15 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 2, v14, 0, 0, 0, 1, v7, v11, 0.0, v17, 0);
  objc_initWeak(&location, self);
  -[SMReceiverService xpcActivityManager](self, "xpcActivityManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke;
  v18[3] = &unk_1E9297790;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  objc_msgSend(v16, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.cloudkit.initializeSentinelZone"), v15, v18);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void (**v26)(id, id);
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v18;
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v6;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,RTXPCActivity error,%@", buf, 0x20u);

      }
      +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:error:](SMReceiverService, "_submitSentinelZoneMaintenanceMetricForSuccess:error:", 0, v6);
      if (v5)
        v5[2](v5, v6);
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_58;
      v23[3] = &unk_1E9297768;
      v15 = WeakRetained;
      v16 = *(_QWORD *)(a1 + 40);
      v24 = v15;
      v27 = v16;
      v25 = 0;
      v26 = v5;
      objc_msgSend(v15, "_initializeSentinelZoneWithCompletion:", v23);

    }
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("Receiver service released before sentinel zone setup");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 5, v12);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,error,%@", buf, 0x20u);

    }
    +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:error:](SMReceiverService, "_submitSentinelZoneMaintenanceMetricForSuccess:error:", 0, v13);
    if (v5)
      v5[2](v5, v13);

  }
}

void __60__SMReceiverService__registerInitializeSentinelZoneActivity__block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,%@,%@,sentinel zone error,%@", (uint8_t *)&v11, 0x20u);

    }
  }
  +[SMReceiverService _submitSentinelZoneMaintenanceMetricForSuccess:error:](SMReceiverService, "_submitSentinelZoneMaintenanceMetricForSuccess:error:", a2, v5);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40));

}

+ (void)_submitSentinelZoneMaintenanceMetricForSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = a4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("success"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E93268B8, CFSTR("attempt"));
  if (v12)
  {
    objc_msgSend(v12, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("errorCode"));

  }
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorReceiverSentinelZoneMaintenance, 1);
  log_analytics_submission(v10, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (int64_t)prevCKAccountStatus
{
  return self->_prevCKAccountStatus;
}

- (void)setPrevCKAccountStatus:(int64_t)a3
{
  self->_prevCKAccountStatus = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (unint64_t)safetyCacheStoreAvailability
{
  return self->_safetyCacheStoreAvailability;
}

- (void)setSafetyCacheStoreAvailability:(unint64_t)a3
{
  self->_safetyCacheStoreAvailability = a3;
}

- (BOOL)attemptedToLoadFromDisk
{
  return self->_attemptedToLoadFromDisk;
}

- (void)setAttemptedToLoadFromDisk:(BOOL)a3
{
  self->_attemptedToLoadFromDisk = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableArray)cacheManagerArray
{
  return self->_cacheManagerArray;
}

- (void)setCacheManagerArray:(id)a3
{
  objc_storeStrong((id *)&self->_cacheManagerArray, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_cacheManagerArray, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
