@implementation RTPersistenceDriver

- (RTPersistenceDriver)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_dataProtectionManager_defaultsManager_keychainManager_lifecycleManager_persistenceManager_platform_timerManager_);
}

- (RTPersistenceDriver)initWithAccountManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 keychainManager:(id)a6 lifecycleManager:(id)a7 persistenceManager:(id)a8 platform:(id)a9 timerManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  RTPersistenceDriver *v19;
  RTPersistenceDriver *v20;
  uint64_t v21;
  RTDarwinNotificationHelper *notificationHelper;
  NSMutableDictionary *v23;
  NSMutableDictionary *fileDescriptorsForPersistenceStoreDict;
  RTPersistenceDriver *v25;
  RTPersistenceDriver *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v33;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  uint8_t buf[16];

  v41 = a3;
  v16 = a4;
  v38 = a5;
  v39 = a6;
  v37 = a7;
  v17 = a8;
  v40 = a9;
  v18 = a10;
  if (!v17)
  {
    v28 = v16;
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v26 = 0;
    goto LABEL_15;
  }
  v35 = v16;
  if (!v16)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: dataProtectionManager";
LABEL_28:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_29;
  }
  if (!v41)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: accountManager";
    goto LABEL_28;
  }
  if (!v40)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: platform";
    goto LABEL_28;
  }
  if (!v39)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: keychainManager";
    goto LABEL_28;
  }
  if (!v38)
  {
    v27 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_28;
  }
  if (!v18)
  {
    v27 = 0;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_28;
    }
LABEL_29:

    v26 = 0;
    v25 = self;
LABEL_30:
    v28 = v35;
    goto LABEL_31;
  }
  v34 = v18;
  if (v37)
  {
    v42.receiver = self;
    v42.super_class = (Class)RTPersistenceDriver;
    v19 = -[RTNotifier init](&v42, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_persistenceManager, a8);
      objc_storeStrong((id *)&v20->_dataProtectionManager, a4);
      objc_storeStrong((id *)&v20->_accountManager, a3);
      objc_storeStrong((id *)&v20->_currentPlatform, a9);
      objc_storeStrong((id *)&v20->_keychainManager, a6);
      objc_storeStrong((id *)&v20->_defaultsManager, a5);
      objc_storeStrong((id *)&v20->_lifecycleManager, a7);
      objc_storeStrong((id *)&v20->_timerManager, a10);
      objc_storeWeak((id *)&v20->_metricsDelegate, v20);
      v21 = objc_opt_new();
      notificationHelper = v20->_notificationHelper;
      v20->_notificationHelper = (RTDarwinNotificationHelper *)v21;

      v20->_cloudSyncAuthorization = 0;
      v20->_encryptedDataAvailability = 0;
      v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      fileDescriptorsForPersistenceStoreDict = v20->_fileDescriptorsForPersistenceStoreDict;
      v20->_fileDescriptorsForPersistenceStoreDict = v23;

    }
    v25 = v20;
    v26 = v25;
    v27 = v34;
    goto LABEL_30;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v33 = objc_claimAutoreleasedReturnValue();
  v28 = v16;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager", buf, 2u);
  }

  v26 = 0;
  v27 = v34;
LABEL_15:
  v25 = self;
LABEL_31:

  return v26;
}

- (RTPersistenceDriver)initWithPersistenceManager:(id)a3 dataProtectionManager:(id)a4 accountManager:(id)a5 platform:(id)a6 keychainManager:(id)a7 defaultsManager:(id)a8 lifecycleManager:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTTimerManager *v23;
  RTPersistenceDriver *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = objc_alloc_init(RTTimerManager);
  v24 = -[RTPersistenceDriver initWithAccountManager:dataProtectionManager:defaultsManager:keychainManager:lifecycleManager:persistenceManager:platform:timerManager:](self, "initWithAccountManager:dataProtectionManager:defaultsManager:keychainManager:lifecycleManager:persistenceManager:platform:timerManager:", v20, v21, v17, v18, v16, v22, v19, v23);

  return v24;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RTPersistenceDriver_start__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __28__RTPersistenceDriver_start__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "dataProtectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:", v3, sel_onDataProtectionChange_, v4);

  objc_msgSend(*(id *)(a1 + 32), "dataProtectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", v6, sel_onDataProtectionNotification_, v7);

  objc_msgSend(*(id *)(a1 + 32), "accountManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:", v9, sel_onCloudSyncAuthorizationChange_, v10);

  objc_msgSend(*(id *)(a1 + 32), "accountManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  +[RTNotification notificationName](RTAccountManagerNotificationAccountChanged, "notificationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:", v12, sel_onAccountChange_, v13);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[RTNotifier removeObserver:](self->_dataProtectionManager, "removeObserver:", self);
  -[RTNotifier removeObserver:](self->_accountManager, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceDriver;
  -[RTPersistenceDriver dealloc](&v4, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RTPersistenceDriver setSetupTransaction:](self, "setSetupTransaction:", 0);
  -[RTPersistenceDriver dataProtectionManager](self, "dataProtectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTPersistenceDriver accountManager](self, "accountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)onDataProtectionChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__RTPersistenceDriver_onDataProtectionChange___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[RTPersistenceDriver onDataProtectionChange:]";
      v16 = 1024;
      v17 = 240;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __46__RTPersistenceDriver_onDataProtectionChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDataProtectionChange:", *(_QWORD *)(a1 + 40));
}

- (void)onDataProtectionNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTPersistenceDriver *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__RTPersistenceDriver_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __52__RTPersistenceDriver_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "unlockedSinceBoot");
      v10 = CFSTR("NO");
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      if (v9)
        v10 = CFSTR("YES");
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, RTDataProtectionManagerNotificationUnlockedSinceBoot, %@", (uint8_t *)&v13, 0x20u);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "unlockedSinceBoot") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKey:", 0, CFSTR("RTDefaultsPersistenceBackgroundAssertionDate"));
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v12;
        v15 = 1024;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, isDeviceUnlockedSinceBoot, %d, clearing RTDefaultsPersistenceBackgroundAssertionDate since routined has lost previous background assertion after reboot ", (uint8_t *)&v13, 0x12u);

      }
    }
  }
}

- (void)_onDataProtectionChange:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2080;
      v14 = "-[RTPersistenceDriver _onDataProtectionChange:]";
      v15 = 1024;
      v16 = 271;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);

    }
  }
  -[RTPersistenceDriver setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", objc_msgSend(v4, "availability"));
  -[RTPersistenceDriver _evaluateBackgroundProcessingAfterAssertionConfigurationChange:](self, "_evaluateBackgroundProcessingAfterAssertionConfigurationChange:", -[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability"));
  -[RTPersistenceDriver _evaluteDirtyTransactionAfterConfigurationChange:](self, "_evaluteDirtyTransactionAfterConfigurationChange:", -[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability"));
  v6 = -[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability");
  v7 = -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization");
  -[RTPersistenceDriver currentAccount](self, "currentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver _setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:](self, "_setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:", v6, v7, v8);

}

- (void)onCloudSyncAuthorizationChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__RTPersistenceDriver_onCloudSyncAuthorizationChange___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[RTPersistenceDriver onCloudSyncAuthorizationChange:]";
      v16 = 1024;
      v17 = 290;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __54__RTPersistenceDriver_onCloudSyncAuthorizationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCloudSyncAuthorizationChange:", *(_QWORD *)(a1 + 40));
}

- (void)_onCloudSyncAuthorizationChange:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2080;
      v14 = "-[RTPersistenceDriver _onCloudSyncAuthorizationChange:]";
      v15 = 1024;
      v16 = 297;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);

    }
  }
  -[RTPersistenceDriver setCloudSyncAuthorization:](self, "setCloudSyncAuthorization:", objc_msgSend(v4, "cloudSyncAuthorizationState"));
  v6 = -[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability");
  v7 = -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization");
  -[RTPersistenceDriver currentAccount](self, "currentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver _setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:](self, "_setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:", v6, v7, v8);

}

- (void)onAccountChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__RTPersistenceDriver_onAccountChange___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[RTPersistenceDriver onAccountChange:]";
      v16 = 1024;
      v17 = 313;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __39__RTPersistenceDriver_onAccountChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAccountChange:", *(_QWORD *)(a1 + 40));
}

- (void)_onAccountChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v16;
      v19 = 2080;
      v20 = "-[RTPersistenceDriver _onAccountChange:]";
      v21 = 1024;
      v22 = 320;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v17, 0x1Cu);

    }
  }
  -[RTPersistenceDriver accountManager](self, "accountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accountStatus");

  objc_msgSend(v4, "latestAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "oldAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 || v7 == 1)
    {
      -[RTPersistenceDriver defaultsManager](self, "defaultsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", 0, CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"));

    }
  }
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", 0, CFSTR("RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"));
  objc_msgSend(v4, "latestAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver setCurrentAccount:](self, "setCurrentAccount:", v11);

  v12 = -[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability");
  v13 = -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization");
  -[RTPersistenceDriver currentAccount](self, "currentAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver _setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:](self, "_setupPersistenceAfterConfigurationChange:cloudSyncAuthorization:account:", v12, v13, v14);

}

- (void)_startBackgroundProcessingAssertionBufferTimerWithLatency:(double)a3
{
  RTTimerManager *timerManager;
  void *v7;
  RTTimer *v8;
  RTTimer *backgroundProcessingAssertionDeferralTimer;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  timerManager = self->_timerManager;
  -[RTNotifier queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__RTPersistenceDriver__startBackgroundProcessingAssertionBufferTimerWithLatency___block_invoke;
  v14[3] = &unk_1E92977B8;
  v14[4] = self;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("RTPersistenceDriverBackgroundAssertionTimer"), v7, v14);
  v8 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
  self->_backgroundProcessingAssertionDeferralTimer = v8;

  -[RTTimer fireWithInterval:](self->_backgroundProcessingAssertionDeferralTimer, "fireWithInterval:", a3);
  -[RTTimer resume](self->_backgroundProcessingAssertionDeferralTimer, "resume");
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f", buf, 0x20u);

  }
}

uint64_t __81__RTPersistenceDriver__startBackgroundProcessingAssertionBufferTimerWithLatency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBackgroundProcessingAssertionTimerExpiry");
}

- (void)_onBackgroundProcessingAssertionTimerExpiry
{
  RTTimer *backgroundProcessingAssertionDeferralTimer;

  if (-[RTPersistenceDriver _releasePersistenceStoreBackgroundProcessingAssertions](self, "_releasePersistenceStoreBackgroundProcessingAssertions"))
  {
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", 0, CFSTR("RTDefaultsPersistenceBackgroundAssertionDate"));
  }
  -[RTTimer invalidate](self->_backgroundProcessingAssertionDeferralTimer, "invalidate");
  backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
  self->_backgroundProcessingAssertionDeferralTimer = 0;

}

- (void)_startBackgroundProcessingAssertionAcquireRetryWithLatency:(double)a3
{
  RTTimer *backgroundProcessingAssertionAcquireRetryTimer;
  RTTimer *v7;
  RTTimerManager *timerManager;
  void *v9;
  RTTimer *v10;
  RTTimer *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
  if (backgroundProcessingAssertionAcquireRetryTimer)
  {
    -[RTTimer invalidate](backgroundProcessingAssertionAcquireRetryTimer, "invalidate");
    v7 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

  }
  timerManager = self->_timerManager;
  -[RTNotifier queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__RTPersistenceDriver__startBackgroundProcessingAssertionAcquireRetryWithLatency___block_invoke;
  v17[3] = &unk_1E92977B8;
  v17[4] = self;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("RTPersistenceDriverBackgroundAssertionAcquireRetryTimer"), v9, v17);
  v10 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  v11 = self->_backgroundProcessingAssertionAcquireRetryTimer;
  self->_backgroundProcessingAssertionAcquireRetryTimer = v10;

  -[RTTimer fireWithInterval:](self->_backgroundProcessingAssertionAcquireRetryTimer, "fireWithInterval:", a3);
  -[RTTimer resume](self->_backgroundProcessingAssertionAcquireRetryTimer, "resume");
  -[RTPersistenceDriver setBackgroundAssertionRetryCount:](self, "setBackgroundAssertionRetryCount:", -[RTPersistenceDriver backgroundAssertionRetryCount](self, "backgroundAssertionRetryCount") + 1);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[RTPersistenceDriver backgroundAssertionRetryCount](self, "backgroundAssertionRetryCount");
    *(_DWORD *)buf = 138413058;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = v16;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f, backgroundAssertionRetryCount, %lu", buf, 0x2Au);

  }
}

uint64_t __82__RTPersistenceDriver__startBackgroundProcessingAssertionAcquireRetryWithLatency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBackgroundProcessingAssertionAcquireRetryExpiry");
}

- (void)_cleanUpFileDescriptoersForPersistenceStore
{
  void *v3;
  id v4;

  -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_35);

  -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

uint64_t __66__RTPersistenceDriver__cleanUpFileDescriptoersForPersistenceStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "intValue");
  if ((result & 0x80000000) == 0)
    return close(result);
  return result;
}

- (void)_onBackgroundProcessingAssertionAcquireRetryExpiry
{
  RTTimer *backgroundProcessingAssertionAcquireRetryTimer;
  RTTimer *v4;
  RTDefaultsManager *defaultsManager;
  void *v6;

  backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
  if (backgroundProcessingAssertionAcquireRetryTimer)
  {
    -[RTTimer invalidate](backgroundProcessingAssertionAcquireRetryTimer, "invalidate");
    v4 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

  }
  if (-[RTPersistenceDriver _didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:](self, "_didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:", 1))
  {
    defaultsManager = self->_defaultsManager;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v6, CFSTR("RTDefaultsPersistenceBackgroundAssertionDate"));

  }
  else if (-[RTPersistenceDriver backgroundAssertionRetryCount](self, "backgroundAssertionRetryCount") <= 2)
  {
    -[RTPersistenceDriver _startBackgroundProcessingAssertionAcquireRetryWithLatency:](self, "_startBackgroundProcessingAssertionAcquireRetryWithLatency:", 3.0);
    return;
  }
  -[RTPersistenceDriver setBackgroundAssertionRetryCount:](self, "setBackgroundAssertionRetryCount:", 0);
  -[RTPersistenceDriver _cleanUpFileDescriptoersForPersistenceStore](self, "_cleanUpFileDescriptoersForPersistenceStore");
}

- (BOOL)_isBackgroundProcessingAssertionActive
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceBackgroundAssertionDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    v5 = v4 < 43200.0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, starting the attempt to acquire background processing assertion for every storeType", (uint8_t *)&v12, 0xCu);

  }
  v8 = -[RTPersistenceDriver _acquireBackgroundProcessingPermissionsForStoreType:isRetry:](self, "_acquireBackgroundProcessingPermissionsForStoreType:isRetry:", 0, v3);
  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = v9;
      if (v9 == 3)
        break;
      ++v9;
    }
    while (-[RTPersistenceDriver _acquireBackgroundProcessingPermissionsForStoreType:isRetry:](self, "_acquireBackgroundProcessingPermissionsForStoreType:isRetry:", v10 + 1, v3));
    LOBYTE(v8) = v10 > 2;
  }
  return v8;
}

- (BOOL)_acquireBackgroundProcessingPermissionsForStoreType:(unint64_t)a3 isRetry:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForStoreType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "protectedStoreFilesExtensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!-[RTPersistenceDriver _acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:isRetry:](self, "_acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:isRetry:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v4))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4 isRetry:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  int *v22;
  char *v23;
  NSObject *v24;
  int v26;
  int v27;
  void *v28;
  __int16 v29;
  _BYTE v30[10];
  _BYTE v31[10];
  __int16 v32;
  char *v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sqlite"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    if ((v15 & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    v15 = -[RTPersistenceDriver _getFileDescriptorForPersistenceStoreFile:](self, "_getFileDescriptorForPersistenceStoreFile:", v12);
    if ((v15 & 0x80000000) == 0)
    {
LABEL_3:
      v16 = -[RTPersistenceDriver _acquireBackgroundAssertionForFileDescriptor:](self, "_acquireBackgroundAssertionForFileDescriptor:", v15);
      v17 = v16 == 0;
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v16)
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *__error();
        v22 = __error();
        v23 = strerror(*v22);
        v27 = 138413314;
        v28 = v20;
        v29 = 2112;
        *(_QWORD *)v30 = v9;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)v31 = v16;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v21;
        v32 = 2080;
        v33 = v23;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@ Failure to acquire background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v27, 0x2Cu);
      }
      else
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_13;
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v20;
        v29 = 2112;
        *(_QWORD *)v30 = v9;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)v31 = v10;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@ Success to acquire background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v27, 0x20u);
      }

LABEL_13:
      if (!v5)
        close(v15);
      goto LABEL_15;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v26 = *__error();
    v27 = 138412802;
    v28 = v12;
    v29 = 1024;
    *(_DWORD *)v30 = v5;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v26;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Unable to to get the file descriptor for the file %@ with data protection, isRetry, %d, errno, %{errno}d", (uint8_t *)&v27, 0x18u);
  }

  v17 = 0;
LABEL_15:

  return v17;
}

- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3
{
  __int128 v4;

  v4 = xmmword_1D1EED410;
  return fcntl(a3, 108, &v4);
}

- (BOOL)_releasePersistenceStoreBackgroundProcessingAssertions
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[RTPersistenceDriver _releaseBackgroundProcessingPermissionsForStoreType:](self, "_releaseBackgroundProcessingPermissionsForStoreType:", 0);
  if (v3)
  {
    v4 = 0;
    do
    {
      v5 = v4;
      if (v4 == 3)
        break;
      ++v4;
    }
    while (-[RTPersistenceDriver _releaseBackgroundProcessingPermissionsForStoreType:](self, "_releaseBackgroundProcessingPermissionsForStoreType:", v5 + 1));
    LOBYTE(v3) = v5 > 2;
  }
  return v3;
}

- (BOOL)_releaseBackgroundProcessingPermissionsForStoreType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForStoreType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "protectedStoreFilesExtensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!-[RTPersistenceDriver _releaseBackgroundProcessingPermissionForStoreURL:cacheFileExtension:](self, "_releaseBackgroundProcessingPermissionForStoreURL:cacheFileExtension:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_releaseBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int *v19;
  char *v20;
  NSObject *v21;
  int v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sqlite"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RTPersistenceDriver _getFileDescriptorForPersistenceStoreFile:](self, "_getFileDescriptorForPersistenceStoreFile:", v10);
  if ((v11 & 0x80000000) == 0)
  {
    v12 = v11;
    v13 = -[RTPersistenceDriver _releaseBackgroundAssertionForFileDescriptor:](self, "_releaseBackgroundAssertionForFileDescriptor:", v11);
    v14 = v13 == 0;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *__error();
        v19 = __error();
        v20 = strerror(*v19);
        v24 = 138413314;
        v25 = v17;
        v26 = 2112;
        v27 = v7;
        v28 = 1024;
        *(_DWORD *)v29 = v13;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)&v29[6] = v18;
        v30 = 2080;
        v31 = v20;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@ Failure to release background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v24, 0x2Cu);
LABEL_10:

      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v17;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      *(_QWORD *)v29 = v8;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@ Success to release background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v24, 0x20u);
      goto LABEL_10;
    }

    close(v12);
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v23 = *__error();
    v24 = 138412546;
    v25 = v10;
    v26 = 1024;
    LODWORD(v27) = v23;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Unable to to get the file descriptor for the file %@ with data protection, errno, %{errno}d", (uint8_t *)&v24, 0x12u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (int)_releaseBackgroundAssertionForFileDescriptor:(int)a3
{
  return fcntl(a3, 109, 0);
}

- (void)_prepareFileDescriptorsForPersistenceStore
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  RTPersistenceDriver *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, starting the attempt to open every file descriptor for every storeType to be handy for a retry", buf, 0xCu);

  }
  v6 = 0;
  v7 = CFSTR("sqlite");
  do
  {
    -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v8, "URLForStoreType:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v9;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "protectedStoreFilesExtensions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v33)
      goto LABEL_17;
    v13 = *(_QWORD *)v35;
    v31 = *(_QWORD *)v35;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14);
        objc_msgSend(v10, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v7, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
            v21 = self;
            v22 = v10;
            v23 = v7;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "integerValue");

            v7 = v23;
            v10 = v22;
            self = v21;
            v13 = v31;

            if ((v26 & 0x8000000000000000) == 0)
              goto LABEL_15;
          }
          else
          {

          }
          v27 = -[RTPersistenceDriver _getFileDescriptorForPersistenceStoreFile:](self, "_getFileDescriptorForPersistenceStoreFile:", v17);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPersistenceDriver fileDescriptorsForPersistenceStoreDict](self, "fileDescriptorsForPersistenceStoreDict");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v17);

        }
LABEL_15:

        ++v14;
      }
      while (v33 != v14);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
LABEL_17:

    v6 = v30 + 1;
  }
  while (v30 != 3);
}

- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3
{
  return open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 2, 2, 0, 416);
}

- (void)_evaluateBackgroundProcessingAfterAssertionConfigurationChange:(int64_t)a3
{
  RTTimer *backgroundProcessingAssertionDeferralTimer;
  RTTimer *v5;
  RTTimer *backgroundProcessingAssertionAcquireRetryTimer;
  RTTimer *v7;
  RTDefaultsManager *defaultsManager;
  RTTimer *v9;
  RTTimer *v10;
  RTTimer *v11;

  if (-[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability", a3) == 3)
  {
    if (-[RTPersistenceDriver _isBackgroundProcessingAssertionActive](self, "_isBackgroundProcessingAssertionActive"))
    {
      backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
      if (backgroundProcessingAssertionDeferralTimer)
      {
        -[RTTimer invalidate](backgroundProcessingAssertionDeferralTimer, "invalidate");
        v5 = self->_backgroundProcessingAssertionDeferralTimer;
        self->_backgroundProcessingAssertionDeferralTimer = 0;
LABEL_12:

        return;
      }
    }
    -[RTPersistenceDriver _cleanUpFileDescriptoersForPersistenceStore](self, "_cleanUpFileDescriptoersForPersistenceStore");
    if (-[RTPersistenceDriver _didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:](self, "_didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:", 0))
    {
      defaultsManager = self->_defaultsManager;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (RTTimer *)objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v11, CFSTR("RTDefaultsPersistenceBackgroundAssertionDate"));
      v5 = v11;
      goto LABEL_12;
    }
    -[RTPersistenceDriver _prepareFileDescriptorsForPersistenceStore](self, "_prepareFileDescriptorsForPersistenceStore");
    -[RTPersistenceDriver _startBackgroundProcessingAssertionAcquireRetryWithLatency:](self, "_startBackgroundProcessingAssertionAcquireRetryWithLatency:", 3.0);
  }
  else if (-[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability") == 2)
  {
    backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
    if (backgroundProcessingAssertionAcquireRetryTimer)
    {
      -[RTTimer invalidate](backgroundProcessingAssertionAcquireRetryTimer, "invalidate");
      v7 = self->_backgroundProcessingAssertionAcquireRetryTimer;
      self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

      -[RTPersistenceDriver _cleanUpFileDescriptoersForPersistenceStore](self, "_cleanUpFileDescriptoersForPersistenceStore");
    }
    if (-[RTPersistenceDriver _isBackgroundProcessingAssertionActive](self, "_isBackgroundProcessingAssertionActive"))
      -[RTPersistenceDriver _startBackgroundProcessingAssertionBufferTimerWithLatency:](self, "_startBackgroundProcessingAssertionBufferTimerWithLatency:", 30.0);
  }
  else if (-[RTPersistenceDriver encryptedDataAvailability](self, "encryptedDataAvailability") == 1)
  {
    v9 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    if (v9)
    {
      -[RTTimer invalidate](v9, "invalidate");
      v10 = self->_backgroundProcessingAssertionAcquireRetryTimer;
      self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

      -[RTPersistenceDriver _cleanUpFileDescriptoersForPersistenceStore](self, "_cleanUpFileDescriptoersForPersistenceStore");
    }
  }
}

- (void)_evaluteDirtyTransactionAfterConfigurationChange:(int64_t)a3
{
  void *v5;
  uint64_t v6;

  -[RTPersistenceDriver setRequiresDirtyTransaction:](self, "setRequiresDirtyTransaction:", 0);
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "availability");

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && v6 == 2)
    -[RTPersistenceDriver setRequiresDirtyTransaction:](self, "setRequiresDirtyTransaction:", 1);
  -[RTPersistenceDriver evaluateTransactions](self, "evaluateTransactions");
}

- (BOOL)_shouldAttemptSetupAccordingToDeviceConfiguration:(int64_t)a3
{
  NSObject *v3;
  const char *v4;
  BOOL v5;
  NSObject *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v11) = 0;
      v4 = "encrypted data availability unknown";
      break;
    case 1:
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "encrypted data unavailable", (uint8_t *)&v11, 2u);
      }

      v8 = -[RTPersistenceDriver _isBackgroundProcessingAssertionActive](self, "_isBackgroundProcessingAssertionActive");
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v3 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        v5 = 1;
        if (v9)
        {
          v11 = 67109120;
          v12 = 1;
          _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "Background Processing Assertion is still active, set attemptSetup to %d", (uint8_t *)&v11, 8u);
        }
      }
      else
      {
        if (v9)
        {
          v11 = 67109120;
          v12 = 0;
          _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "Background Processing Assertion is not active, set attemptSetup to %d", (uint8_t *)&v11, 8u);
        }
        v5 = 0;
      }
      goto LABEL_14;
    case 2:
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v11) = 0;
      v4 = "encrypted data became available";
      break;
    case 3:
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_13;
      LOWORD(v11) = 0;
      v4 = "encrypted data transitioning to unavailable";
      break;
    default:
      return 1;
  }
  _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v11, 2u);
LABEL_13:
  v5 = 1;
LABEL_14:

  return v5;
}

- (void)_setupPersistenceAfterConfigurationChange:(int64_t)a3 cloudSyncAuthorization:(int64_t)a4 account:(id)a5
{
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v7 = -[RTPersistenceDriver _shouldAttemptSetupAccordingToDeviceConfiguration:](self, "_shouldAttemptSetupAccordingToDeviceConfiguration:", a3, a4, a5);
  if (a4 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v9 = "cloud sync state enabled";
LABEL_19:
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 2u);
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v9 = "cloud sync state disabled";
    goto LABEL_19;
  }
  if (a4)
    goto LABEL_11;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "cloud sync state unknown", buf, 2u);
  }
  v7 = 0;
LABEL_10:

LABEL_11:
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "availability");

  if (v11 != 2)
  {
    -[RTPersistenceDriver setRequiresSetupTransaction:](self, "setRequiresSetupTransaction:", 1);
    -[RTPersistenceDriver evaluateTransactions](self, "evaluateTransactions");
    -[RTPersistenceDriver accountManager](self, "accountManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "accountStatus");

    if (v13)
      v14 = v7;
    else
      v14 = 0;
    if (v14)
    {
      -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __96__RTPersistenceDriver__setupPersistenceAfterConfigurationChange_cloudSyncAuthorization_account___block_invoke;
      v16[3] = &unk_1E929BEB0;
      v16[4] = self;
      objc_msgSend(v15, "setupPersistenceContainers:", v16);

    }
  }
}

uint64_t __96__RTPersistenceDriver__setupPersistenceAfterConfigurationChange_cloudSyncAuthorization_account___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setRequiresSetupTransaction:", 0);
    return objc_msgSend(*(id *)(v2 + 32), "evaluateTransactions");
  }
  return result;
}

- (void)evaluateTransactions
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[RTPersistenceDriver requiresDirtyTransaction](self, "requiresDirtyTransaction")
    || -[RTPersistenceDriver requiresSetupTransaction](self, "requiresSetupTransaction"))
  {
    -[RTPersistenceDriver setupTransaction](self, "setupTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, acquiring transaction", buf, 0xCu);

      }
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "UTF8String");
      v13 = (void *)os_transaction_create();
      -[RTPersistenceDriver setSetupTransaction:](self, "setSetupTransaction:", v13);

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v20;
        v24 = 2112;
        v25 = v21;
        _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

      }
    }
  }
  else
  {
    -[RTPersistenceDriver setupTransaction](self, "setupTransaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, releasing transactions", buf, 0xCu);

      }
      -[RTPersistenceDriver setSetupTransaction:](self, "setSetupTransaction:", 0);
    }
  }
}

- (BOOL)store:(id)a3 validateAppleIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[RTPersistenceDriver currentAccount](self, "currentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") || objc_msgSend(v5, "count"))
    v8 = objc_msgSend(v7, "intersectsSet:", v5);
  else
    v8 = 1;

  return v8;
}

- (id)appleIDsForStore:(id)a3
{
  void *v3;
  void *v4;

  -[RTPersistenceDriver currentAccount](self, "currentAccount", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)optionsForStoreWithType:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (id)mirroringOptionsForStoreWithType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceManagerDisableMirroringDelegate2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = -[RTPersistenceDriver persistenceDeviceClassForPlatform](self, "persistenceDeviceClassForPlatform") & v6;
  v8 = -[RTPersistenceDriver persistenceDeviceClassForPlatform](self, "persistenceDeviceClassForPlatform");
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7 == v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      v23 = v6;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "sync is disabled for device, current mask, %lu", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218240;
      v23 = a3;
      v24 = 2048;
      v25 = -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization");
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "mirroring options for store with type, %lu, cloud sync auth, %ld", buf, 0x16u);
    }

    if (a3 != 1 || -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization") != 2)
      return 0;
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceManagerMirroringOverrideDefaultContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[RTPlatform internalInstall](self->_currentPlatform, "internalInstall") && v12)
    {
      -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceManagerMirroringOverrideDefaultContainer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97AD0]), "initWithContainerIdentifier:", v13);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "override default container is set, setting mirroring delegate option", buf, 2u);
      }

    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97AD0]), "initWithContainerIdentifier:", CFSTR("com.apple.CoreRoutine-3"));
    }
    -[NSObject setUseDeviceToDeviceEncryption:](v9, "setUseDeviceToDeviceEncryption:", 1);
    -[NSObject setOperationMemoryThresholdBytes:](v9, "setOperationMemoryThresholdBytes:", &unk_1E9327E90);
    -[NSObject setPreserveLegacyRecordMetadataBehavior:](v9, "setPreserveLegacyRecordMetadataBehavior:", 1);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setUseZoneWidePCS:", 1);
    objc_msgSend(v16, "setBypassPCSEncryption:", 0);
    -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceManagerMirroringDisablePCSEncryption"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (-[RTPlatform internalInstall](self->_currentPlatform, "internalInstall") && v18)
    {
      -[NSObject setUseDeviceToDeviceEncryption:](v9, "setUseDeviceToDeviceEncryption:", 0);
      objc_msgSend(v16, "setUseZoneWidePCS:", 0);
      objc_msgSend(v16, "setBypassPCSEncryption:", 1);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "disable PCS encryption is set, setting container option", buf, 2u);
      }

    }
    -[NSObject setContainerOptions:](v9, "setContainerOptions:", v16);
    v20 = CFSTR("RTPersistenceDriverMirroringDelegateOptionsKey");
    v21 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)remoteServerOptionsForStoreWithType:(unint64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;

  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "internalInstall");

  v6 = 0;
  if (a3 <= 1 && v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A50]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C97A40]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C97970]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB2AB8], *MEMORY[0x1E0C97940]);
    if (a3 == 1)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("com.apple.routined.store.cloud"), *MEMORY[0x1E0C97A60]);
      v9 = *MEMORY[0x1E0C97900];
      v8 = (const __CFString *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v8 = CFSTR("com.apple.routined.store.cache");
      v9 = *MEMORY[0x1E0C97A60];
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);
  }
  return v6;
}

- (void)cleanupOlderPersistentStores
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = objc_msgSend(&unk_1E932C3E8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v16;
    *(_QWORD *)&v3 = 138412546;
    v13 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(&unk_1E932C3E8);
        objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6), v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          objc_msgSend(v10, "removeItemAtPath:error:", v7, &v14);
          v11 = v14;

          if (v11)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v13;
              v20 = v7;
              v21 = 2112;
              v22 = v11;
              _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "older core routine persistent store file, %@, existed but couldn't be removed due to error, %@", buf, 0x16u);
            }

          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E932C3E8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }
}

- (id)persistCurrentDeviceWithIdentifier:(id)a3 inStore:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  RTPersistenceDriver *v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceStore", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("persistenceStore");
LABEL_17:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("context");
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  *(_QWORD *)buf = 0;
  v36 = buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__48;
  v39 = __Block_byref_object_dispose__48;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__48;
  v33 = __Block_byref_object_dispose__48;
  v34 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __80__RTPersistenceDriver_persistCurrentDeviceWithIdentifier_inStore_context_error___block_invoke;
  v22 = &unk_1E929BED8;
  v23 = self;
  v24 = v10;
  v25 = v13;
  v27 = &v29;
  v26 = v11;
  v28 = buf;
  objc_msgSend(v25, "performBlockAndWait:", &v19);
  if (*((_QWORD *)v36 + 5) && !v30[5])
    -[RTDarwinNotificationHelper postNotification:](self->_notificationHelper, "postNotification:", CFSTR("kRTPersistenceDeviceIdentityChanged"), v19, v20, v21, v22, v23, v24, v25);
  if (a6)
    *a6 = objc_retainAutorelease((id)v30[5]);
  v14 = *((id *)v36 + 5);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v14;
}

void __80__RTPersistenceDriver_persistCurrentDeviceWithIdentifier_inStore_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "internalInstall");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPlatform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAssignedDeviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v10;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "creating new device record with identifier, %@", buf, 0xCu);

  }
  v11 = (void *)MEMORY[0x1E0C97B20];
  +[NSManagedObject entityName](RTDeviceMO, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertNewObjectForEntityForName:inManagedObjectContext:", v12, *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIdentifier:", v8);
  objc_msgSend(v13, "setDeviceName:", v5);
  objc_msgSend(*(id *)(a1 + 32), "currentPlatform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDeviceClass:", v15);

  objc_msgSend(*(id *)(a1 + 32), "currentPlatform");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDeviceModel:", v17);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCreationDate:", v18);

  if (v13
    && (objc_msgSend(v13, "identifier"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v21;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "created new device record with identifier, %@", buf, 0xCu);

    }
    v22 = *(void **)(a1 + 48);
    v52 = 0;
    v23 = objc_msgSend(v22, "save:", &v52);
    v24 = v52;
    v25 = v52;
    v26 = v25;
    if (!v23 || v25)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v24);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v26;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "failed to save generated device record due to error, %@", buf, 0xCu);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "objectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v28;
        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "will persist device MOID %@ to store metadata", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "persistentStoreForURL:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "metadataForPersistentStore:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (!v33)
        v33 = (void *)MEMORY[0x1E0C9AA70];
      v35 = (void *)objc_msgSend(v33, "mutableCopy");

      objc_msgSend(v13, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("RTPersistentStoreMetadataDeviceRecordIDKey"));

      objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMetadata:forPersistentStore:", v35, v31);

      v39 = *(void **)(a1 + 48);
      v51 = 0;
      v40 = objc_msgSend(v39, "save:", &v51);
      v41 = v51;
      v42 = v51;
      v26 = v42;
      if (!v40 || v42)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v41);
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v26;
          _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "failed to save device MOID to store metadata due to error, %@", buf, 0xCu);
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "objectID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v44;
          _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "did persist device MOID %@ to store metadata", buf, 0xCu);

        }
        objc_msgSend(v13, "objectID");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v47 = *(NSObject **)(v46 + 40);
        *(_QWORD *)(v46 + 40) = v45;
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "failed to create device record, record or identifier is nil", buf, 2u);
    }

    v53 = *MEMORY[0x1E0CB2D50];
    v54 = CFSTR("Failed to create device record, record or identifier is nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v26);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v31 = *(NSObject **)(v50 + 40);
    *(_QWORD *)(v50 + 40) = v49;
  }

}

- (BOOL)persistCurrentDeviceRecordInStore:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  RTPersistenceDriver *v33;
  id v34;
  id v35;
  uint8_t *v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: store", buf, 2u);
    }

    if (a5)
    {
      v28 = CFSTR("store");
LABEL_18:
      _RTErrorInvalidParameterCreate((uint64_t)v28);
      v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_19:
    v24 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a5)
    {
      v28 = CFSTR("context");
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "storeTypeForURL:", v12);

  if (v13 == 1)
  {
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__48;
    v41 = __Block_byref_object_dispose__48;
    v42 = 0;
    objc_msgSend(v10, "persistentStoreCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistentStoreForURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "persistentStoreCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "metadataForPersistentStore:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
      v18 = (void *)MEMORY[0x1E0C9AA70];
    v20 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataDeviceRecordIDKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__RTPersistenceDriver_persistCurrentDeviceRecordInStore_context_error___block_invoke;
    v31[3] = &unk_1E929BF28;
    v22 = v21;
    v32 = v22;
    v33 = self;
    v34 = v8;
    v35 = v10;
    v36 = buf;
    objc_msgSend(v35, "performBlockAndWait:", v31);
    v23 = (void *)*((_QWORD *)v38 + 5);
    v24 = v23 == 0;
    if (a5 && v23)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v23, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v24 = 1;
  }
LABEL_21:

  return v24;
}

void __71__RTPersistenceDriver_persistCurrentDeviceRecordInStore_context_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  NSObject *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v51 = v3;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "metadata has device record with identifier %@", buf, 0xCu);
    }

    +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3880];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v4, "setPredicate:", v7);

    -[NSObject setFetchLimit:](v4, "setFetchLimit:", 1);
    v8 = *(void **)(a1 + 56);
    v48 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v4, &v48);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v48;
    v11 = v48;
    if (v11)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v11;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "failed to fetch device record due to error, %@", buf, 0xCu);
      }
LABEL_7:

      goto LABEL_34;
    }
    if (-[NSObject count](v9, "count"))
    {
      -[NSObject firstObject](v9, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[NSObject identifier](v19, "identifier");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v21;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "fetched device record with identifier %@", buf, 0xCu);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v51 = v23;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "device record with identifier %@ was lost, creating a new one.", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 48);
      v27 = *(_QWORD *)(a1 + 56);
      v47 = 0;
      objc_msgSend(v24, "persistCurrentDeviceWithIdentifier:inStore:context:error:", v25, v26, v27, &v47);
      v20 = objc_claimAutoreleasedReturnValue();
      v28 = v47;
      v12 = v47;

      if (!v20 || v12)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v28);
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v12;
          _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "error creating new device record, %@", buf, 0xCu);
        }

        goto LABEL_7;
      }
      objc_msgSend(*(id *)(a1 + 56), "objectWithID:", v20);
      v19 = objc_claimAutoreleasedReturnValue();
    }

    -[NSObject creationDate](v19, "creationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCreationDate:](v19, "setCreationDate:", v30);

      v31 = *(void **)(a1 + 56);
      v46 = 0;
      v32 = objc_msgSend(v31, "save:", &v46);
      v33 = v46;
      v34 = v33;
      if (!v32 || v33)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v34;
          _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "unable to update device record creation date when there was none previously due to error, %@", buf, 0xCu);
        }

      }
    }

    goto LABEL_31;
  }
  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v49 = 0;
  objc_msgSend(v13, "persistCurrentDeviceWithIdentifier:inStore:context:error:", v14, v15, v16, &v49);
  v11 = objc_claimAutoreleasedReturnValue();
  v17 = v49;
  v4 = v49;

  if (v11)
    v18 = v4 == 0;
  else
    v18 = 0;
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectWithID:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    v4 = v11;
LABEL_31:

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      -[NSObject objectID](v19, "objectID");
      v37 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v19, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v37;
      v52 = 2112;
      v53 = v38;
      _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "setting moid, %@, of current device record with identifier, %@", buf, 0x16u);

    }
    -[NSObject objectID](v19, "objectID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    -[NSObject objectID](v19, "objectID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "userInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    v43 = *(void **)(a1 + 40);
    objc_msgSend(v43, "persistenceManager");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject outstandingContexts](v11, "outstandingContexts");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectID](v19, "objectID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_updatePersistenceContexts:deviceObjectID:", v9, v44);

    v4 = v19;
    goto LABEL_34;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v17);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v4;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "error creating new device record, %@", buf, 0xCu);
  }
LABEL_34:

}

- (BOOL)prepareStore:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  BOOL v18;
  id WeakRetained;
  id v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: store", buf, 2u);
    }

    if (a5)
    {
      v16 = CFSTR("store");
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_14:
    v18 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v22, 2u);
    }

    if (a5)
    {
      v16 = CFSTR("context");
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[RTPersistenceDriver cleanupOlderPersistentStores](self, "cleanupOlderPersistentStores");
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "storeTypeForURL:", v12);

  if (v13 == 1)
  {
    v21 = 0;
    -[RTPersistenceDriver persistCurrentDeviceRecordInStore:context:error:](self, "persistCurrentDeviceRecordInStore:context:error:", v8, v10, &v21);
    v14 = v21;
  }
  else
  {
    v14 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "persistenceStore:didPrepareWithContext:", v8, v10);
  if (a5)
    *a5 = objc_retainAutorelease(v14);
  v18 = v14 == 0;

LABEL_21:
  return v18;
}

- (void)persistenceStore:(id)a3 failedWithError:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "persistenceStoreFailedWithError:", v6);

}

- (void)persistenceStore:(id)a3 encounteredCriticalError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Exiting due to critical error, %@", (uint8_t *)&v8, 0xCu);
  }

  -[RTPersistenceDriver lifecycleManager](self, "lifecycleManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exit");

}

- (BOOL)copyPersistenceStore:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  NSObject *v57;
  void *v58;
  int v59;
  id v60;
  int v61;
  int v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  const char *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  int v73;
  NSObject *v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  id v79;
  int v80;
  int v81;
  NSObject *v82;
  sqlite3 **p_ppDb;
  sqlite3 *v84;
  id v85;
  const char *v86;
  sqlite3 *v87;
  id v88;
  sqlite3_backup *v89;
  int v90;
  int v91;
  NSObject *v92;
  objc_class *v93;
  uint64_t v94;
  void *v95;
  objc_class *v96;
  void *v97;
  void *v98;
  objc_class *v99;
  void *v100;
  void *v101;
  const char *v102;
  objc_class *v103;
  void *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  id v108;
  BOOL v109;
  void *v110;
  uint64_t v111;
  void *v112;
  __int128 v114;
  id *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  id obj;
  uint64_t v126;
  id v127;
  sqlite3 *db;
  sqlite3 *ppDb;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  void *v136;
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  id v142;
  __int16 v143;
  _BYTE v144[14];
  __int16 v145;
  const char *v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v121 = a4;
  if (!-[RTPlatform internalInstall](self->_currentPlatform, "internalInstall"))
  {
    v109 = 1;
    goto LABEL_60;
  }
  v115 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v11);
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(".bak"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v11;
  objc_msgSend(v11, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("-wal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v21);
  objc_msgSend(v21, "stringByDeletingPathExtension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingString:", CFSTR(".bak"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v21;
  objc_msgSend(v21, "pathExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathExtension:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0C99E98];
  v119 = v8;
  objc_msgSend(v8, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByAppendingString:", CFSTR("-shm"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fileURLWithPath:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v31);
  objc_msgSend(v31, "stringByDeletingPathExtension");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringByAppendingString:", CFSTR(".bak"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v31;
  objc_msgSend(v31, "pathExtension");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringByAppendingPathExtension:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v35);

  v122 = (void *)objc_opt_new();
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = v9;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
  v38 = v121;
  if (!v36)
    goto LABEL_51;
  v39 = v36;
  v40 = 0x1E0CB3000uLL;
  v126 = *(_QWORD *)v132;
  *(_QWORD *)&v37 = 138413570;
  v114 = v37;
  do
  {
    v41 = 0;
    v123 = v39;
    do
    {
      if (*(_QWORD *)v132 != v126)
        objc_enumerationMutation(obj);
      v42 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v41);
      objc_msgSend(v38, "path", v114);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringByAppendingPathComponent:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "stringByDeletingLastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v40 + 1568), "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "fileExistsAtPath:", v42);

      if ((v47 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v68 = (objc_class *)objc_opt_class();
          NSStringFromClass(v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v138 = v69;
          v139 = 2112;
          v140 = (uint64_t)v70;
          v141 = 2112;
          v142 = v42;
          _os_log_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_INFO, "%@ %@, skipping, %@, file does not exist at path", buf, 0x20u);

        }
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(*(id *)(v40 + 1568), "defaultManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "fileExistsAtPath:", v45);

      if ((v49 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v138 = v52;
          v139 = 2112;
          v140 = (uint64_t)v53;
          v141 = 2112;
          v142 = v45;
          _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%@ %@, creating destination directory, %@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(v40 + 1568), "defaultManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = 0;
        v55 = objc_msgSend(v54, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v45, 1, 0, &v130);
        v56 = v130;

        if (!v55 || v56)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v93 = (objc_class *)objc_opt_class();
            NSStringFromClass(v93);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v94 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v138 = v120;
            v139 = 2112;
            v140 = v94;
            v95 = (void *)v94;
            v141 = 2112;
            v142 = v45;
            v143 = 2112;
            *(_QWORD *)v144 = v56;
            _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@ %@, failed to create directory, %@, error, %@", buf, 0x2Au);

          }
          if (v56)
            objc_msgSend(v122, "addObject:", v56);
        }

      }
      objc_msgSend(v42, "pathExtension");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "isEqualToString:", CFSTR(".sqlite"));

      if (v59)
      {
        ppDb = 0;
        v60 = objc_retainAutorelease(v42);
        v61 = sqlite3_open_v2((const char *)objc_msgSend(v60, "UTF8String"), &ppDb, 1, 0);
        if (v61)
        {
          v62 = v61;
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = sqlite3_errmsg(ppDb);
            *(_DWORD *)buf = 138413314;
            v138 = v65;
            v139 = 2112;
            v140 = (uint64_t)v66;
            v141 = 2112;
            v142 = v60;
            v143 = 1024;
            *(_DWORD *)v144 = v62;
            *(_WORD *)&v144[4] = 2080;
            *(_QWORD *)&v144[6] = v67;
            _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "%@ %@, failed to open source database, %@, error, %d, %s", buf, 0x30u);

            v39 = v123;
          }
          goto LABEL_24;
        }
        db = 0;
        v79 = objc_retainAutorelease(v44);
        v80 = sqlite3_open_v2((const char *)objc_msgSend(v79, "UTF8String"), &db, 6, 0);
        if (v80)
        {
          v81 = v80;
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            v99 = (objc_class *)objc_opt_class();
            NSStringFromClass(v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = sqlite3_errmsg(db);
            *(_DWORD *)buf = 138413314;
            v138 = v100;
            v139 = 2112;
            v140 = (uint64_t)v101;
            v141 = 2112;
            v142 = v79;
            v143 = 1024;
            *(_DWORD *)v144 = v81;
            *(_WORD *)&v144[4] = 2080;
            *(_QWORD *)&v144[6] = v102;
            _os_log_error_impl(&dword_1D1A22000, v82, OS_LOG_TYPE_ERROR, "%@ %@, failed to open destination database, %@, error, %d, %s", buf, 0x30u);

            v39 = v123;
          }

          p_ppDb = &ppDb;
        }
        else
        {
          v84 = db;
          objc_msgSend(v79, "lastPathComponent");
          v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v86 = (const char *)objc_msgSend(v85, "UTF8String");
          v87 = ppDb;
          objc_msgSend(v60, "lastPathComponent");
          v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v89 = sqlite3_backup_init(v84, v86, v87, (const char *)objc_msgSend(v88, "UTF8String"));

          if (v89)
          {
            sqlite3_backup_step(v89, -1);
            sqlite3_backup_finish(v89);
          }
          v90 = sqlite3_errcode(db);
          v38 = v121;
          v40 = 0x1E0CB3000;
          v39 = v123;
          if (v90)
          {
            v91 = v90;
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              v103 = (objc_class *)objc_opt_class();
              NSStringFromClass(v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = sqlite3_errmsg(db);
              *(_DWORD *)buf = v114;
              v138 = v104;
              v139 = 2112;
              v140 = (uint64_t)v105;
              v141 = 2112;
              v142 = v60;
              v143 = 2112;
              *(_QWORD *)v144 = v79;
              *(_WORD *)&v144[8] = 1024;
              *(_DWORD *)&v144[10] = v91;
              v145 = 2080;
              v146 = v106;
              _os_log_error_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_ERROR, "%@ %@, failed to copy source, %@, to destination, %@, error, %d, %s", buf, 0x3Au);

              v40 = 0x1E0CB3000;
              v39 = v123;
            }

          }
          sqlite3_close(ppDb);
          p_ppDb = &db;
        }
        sqlite3_close(*p_ppDb);
LABEL_25:
        v71 = 0;
        goto LABEL_26;
      }
      objc_msgSend(*(id *)(v40 + 1568), "defaultManager");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = 0;
      v73 = objc_msgSend(v72, "copyItemAtPath:toPath:error:", v42, v44, &v127);
      v71 = v127;

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (!v73 || v71)
      {
        v39 = v123;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v96 = (objc_class *)objc_opt_class();
          NSStringFromClass(v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v138 = v97;
          v139 = 2112;
          v140 = (uint64_t)v98;
          v141 = 2112;
          v142 = v42;
          v143 = 2112;
          *(_QWORD *)v144 = v71;
          _os_log_error_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_ERROR, "%@ %@, error while copying up file %@, error, %@", buf, 0x2Au);

          v39 = v123;
        }

        if (v71)
          objc_msgSend(v122, "addObject:", v71);
        v40 = 0x1E0CB3000;
      }
      else
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v138 = v77;
          v139 = 2112;
          v140 = (uint64_t)v78;
          v141 = 2112;
          v142 = v42;
          v143 = 2112;
          *(_QWORD *)v144 = v44;
          _os_log_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_INFO, "%@ %@, finished copying file %@ to %@", buf, 0x2Au);

        }
        v71 = 0;
        v40 = 0x1E0CB3000;
        v39 = v123;
      }
LABEL_26:

      ++v41;
    }
    while (v39 != v41);
    v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
    v39 = v107;
  }
  while (v107);
LABEL_51:

  if (objc_msgSend(v122, "count"))
  {
    v8 = v119;
    if ((unint64_t)objc_msgSend(v122, "count") > 1)
    {
      v110 = (void *)MEMORY[0x1E0CB35C8];
      v111 = *MEMORY[0x1E0D18598];
      v135 = *MEMORY[0x1E0D18590];
      v136 = v122;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "errorWithDomain:code:userInfo:", v111, 9, v112);
      v108 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v122, "firstObject");
      v108 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v115)
    {
      v108 = objc_retainAutorelease(v108);
      *v115 = v108;
    }
  }
  else
  {
    v108 = 0;
    v8 = v119;
  }
  v109 = v108 == 0;

LABEL_60:
  return v109;
}

- (BOOL)backupPersistenceStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  BOOL v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id *v59;
  id v60;
  char v61;
  void *v62;
  void *v63;
  id obj;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  void *v78;
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[RTPlatform internalInstall](self->_currentPlatform, "internalInstall"))
  {
    v39 = 1;
    goto LABEL_46;
  }
  v59 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("-wal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0C99E98];
  v60 = v6;
  objc_msgSend(v6, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("-shm"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  obj = v22;
  if (!v23)
  {

    goto LABEL_19;
  }
  v24 = v23;
  v61 = 0;
  v65 = *(id *)v74;
  v25 = *MEMORY[0x1E0CB2A38];
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(id *)v74 != v65)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
      objc_msgSend(v27, "stringByDeletingPathExtension", v59);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingString:", CFSTR(".bak"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pathExtension");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByAppendingPathExtension:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      objc_msgSend(v32, "attributesOfItemAtPath:error:", v31, &v72);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v72;

      objc_msgSend(v33, "objectForKeyedSubscript:", v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v36 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject fileExistsAtPath:](v36, "fileExistsAtPath:", v31))
      {
        objc_msgSend(v35, "laterDate:", v63);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToDate:", v35);

        if (!v38)
          goto LABEL_13;
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v81 = v31;
          v82 = 2112;
          v83 = v63;
          v84 = 2112;
          v85 = v35;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "a backup already exists at the path %@ or is recent (%@, %@), skipping", buf, 0x20u);
        }
        v61 = 1;
      }

LABEL_13:
    }
    v22 = obj;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  }
  while (v24);

  if ((v61 & 1) != 0)
  {
    v39 = 1;
    v6 = v60;
    goto LABEL_45;
  }
LABEL_19:
  v62 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v66 = v22;
  v40 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v69 != v42)
          objc_enumerationMutation(v66);
        v44 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(v44, "stringByDeletingPathExtension", v59);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringByAppendingString:", CFSTR(".bak"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "pathExtension");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringByAppendingPathExtension:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        LODWORD(v46) = objc_msgSend(v49, "copyItemAtPath:toPath:error:", v44, v48, &v67);
        v50 = v67;

        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if ((_DWORD)v46)
          v53 = v50 == 0;
        else
          v53 = 0;
        if (v53)
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v81 = v44;
            v82 = 2112;
            v83 = v48;
            _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "finished backing up file %@ to %@", buf, 0x16u);
          }

        }
        else
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v81 = v44;
            v82 = 2112;
            v83 = v50;
            _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "error while backing up file %@, error, %@", buf, 0x16u);
          }

          if (v50)
            objc_msgSend(v62, "addObject:", v50);
        }

      }
      v41 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    }
    while (v41);
  }

  if (objc_msgSend(v62, "count"))
  {
    if ((unint64_t)objc_msgSend(v62, "count") > 1)
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0D18598];
      v77 = *MEMORY[0x1E0D18590];
      v78 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", v56, 9, v57);
      v54 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v62, "firstObject");
      v54 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v60;
    v22 = obj;
    if (v59)
    {
      v54 = objc_retainAutorelease(v54);
      *v59 = v54;
    }
  }
  else
  {
    v54 = 0;
    v6 = v60;
    v22 = obj;
  }
  v39 = v54 == 0;

LABEL_45:
LABEL_46:

  return v39;
}

- (BOOL)persistenceMirroringManagerDidFinishZonePurge:(id)a3 store:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  RTPersistenceDriver *v27;
  __int128 *p_buf;
  id v29;
  uint8_t v30[4];
  uint64_t v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "device record was deleted in a zone purge, creating a new one.", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[RTPersistenceDriver persistCurrentDeviceWithIdentifier:inStore:context:error:](self, "persistCurrentDeviceWithIdentifier:inStore:context:error:", v14, v11, v12, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v29;

  if (!v15 || v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "error creating new device record, %@", (uint8_t *)&buf, 0xCu);
    }

    v18 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__48;
    v35 = __Block_byref_object_dispose__48;
    v36 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __89__RTPersistenceDriver_persistenceMirroringManagerDidFinishZonePurge_store_context_error___block_invoke;
    v23[3] = &unk_1E929BF00;
    v24 = v12;
    v25 = v15;
    p_buf = &buf;
    v26 = v11;
    v27 = self;
    objc_msgSend(v24, "performBlockAndWait:", v23);
    v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v18 = v17 == 0;
    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v30 = 138412290;
        v31 = v22;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "error getting new device record, %@", v30, 0xCu);
      }

      if (a6)
        *a6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    }

    _Block_object_dispose(&buf, 8);
  }

  return v18;
}

void __89__RTPersistenceDriver_persistenceMirroringManagerDidFinishZonePurge_store_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "setting moid, %@, of current device record with identifier, %@", buf, 0x16u);

    }
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    objc_msgSend(v5, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    v13 = *(void **)(a1 + 56);
    objc_msgSend(v5, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_updatePersistenceStoresWithDeviceObjectID:", v14);

    v15 = *(void **)(a1 + 56);
    objc_msgSend(v15, "persistenceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "outstandingContexts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_updatePersistenceContexts:deviceObjectID:", v17, v18);

  }
}

- (void)persistenceManagerWillStartResetSync:(id)a3 userInfo:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  RTDefaultsManager *defaultsManager;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v10)
    {
LABEL_3:
      v12 = (void *)objc_opt_new();
      -[RTPersistenceDriver setResetSyncContext:](self, "setResetSyncContext:", v12);

      -[RTPersistenceDriver resetSyncContext](self, "resetSyncContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setManagedObjectContext:", v11);

      WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject persistenceStoreResetSyncWithUserInfo:](WeakRetained, "persistenceStoreResetSyncWithUserInfo:", v9);
      -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "historyTokenForStoreType:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceDriver resetSyncContext](self, "resetSyncContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHistoryToken:", v16);

      defaultsManager = self->_defaultsManager;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v19, CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"));

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __77__RTPersistenceDriver_persistenceManagerWillStartResetSync_userInfo_context___block_invoke;
      v21[3] = &unk_1E9297540;
      v21[4] = self;
      v22 = v11;
      objc_msgSend(v22, "performBlockAndWait:", v21);

      goto LABEL_11;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTPersistenceDriver persistenceManagerWillStartResetSync:userInfo:context:]";
      v25 = 1024;
      v26 = 1526;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }
LABEL_11:

}

void __77__RTPersistenceDriver_persistenceManagerWillStartResetSync_userInfo_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetSyncContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentDeviceObjectID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetSyncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentDeviceIdentifier:", v6);

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshObject:mergeChanges:", v9, 0);

  objc_msgSend(*(id *)(a1 + 40), "reset");
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "resetSyncContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDeviceObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resetSyncContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDeviceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v12;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "cached current device information, MOID, %@, identifier, %@", (uint8_t *)&v16, 0x16u);

  }
}

- (BOOL)_evaluatePersistentHistoryForDeletedDeviceDuringResetSync:(BOOL *)a3 resetSyncContext:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  RTPersistenceDriver *v28;
  id v29;
  id v30;
  uint8_t *v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  char v35;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: resetSyncContext", buf, 2u);
    }

    if (a6)
    {
      v19 = CFSTR("resetSyncContext");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v19);
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_21;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }

    if (a6)
    {
      v19 = CFSTR("managedObjectContext");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v13 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x2020000000;
  v35 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __125__RTPersistenceDriver__evaluatePersistentHistoryForDeletedDeviceDuringResetSync_resetSyncContext_managedObjectContext_error___block_invoke;
  v26 = &unk_1E929BF28;
  v27 = v10;
  v28 = self;
  v29 = v12;
  v14 = v13;
  v30 = v14;
  v31 = buf;
  objc_msgSend(v29, "performBlockAndWait:", &v23);
  _RTSafeArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (objc_msgSend(v14, "count", 1, v23, v24, v25, v26, v27, v28, v29))
      v17 = 1;
    else
      v17 = v33[24];
    *a3 = v17;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v16);
  v21 = v16 == 0;

  _Block_object_dispose(buf, 8);
LABEL_21:

  return v21;
}

void __125__RTPersistenceDriver__evaluatePersistentHistoryForDeletedDeviceDuringResetSync_resetSyncContext_managedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *context;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "historyToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "using history change token for history query", buf, 2u);
    }

    v5 = (void *)MEMORY[0x1E0C97BD8];
    objc_msgSend(*(id *)(a1 + 32), "historyToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchHistoryAfterToken:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "using date for history query", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  objc_msgSend(v8, "setResultType:", 5);
  objc_msgSend(v8, "setFetchBatchSize:", 10);
  v9 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97BF0], "entityDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithEntityName:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("author"), CFSTR("NSCloudKitMirroringDelegate.reset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(v8, "setFetchRequest:", v12);
  v14 = *(void **)(a1 + 48);
  v57 = 0;
  objc_msgSend(v14, "executeRequest:error:", v8, &v57);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v57;
  if (v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (uint64_t)v16;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "error querying persistent history, %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
  }
  else
  {
    objc_msgSend(v15, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v42 = v12;
      v43 = v8;
      v41 = v15;
      objc_msgSend(v15, "result");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "currentDeviceObjectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = (uint64_t)v21;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "searching for device record with MOID, %@", buf, 0xCu);

      }
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v19;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      if (v47)
      {
        v45 = *MEMORY[0x1E0C97838];
        v46 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v54 != v46)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            context = (void *)MEMORY[0x1D8231EA8]();
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = objc_msgSend(v23, "transactionNumber");
              objc_msgSend(v23, "author");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v60 = v25;
              v61 = 2112;
              v62 = v26;
              _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "transaction ID, %lld, transaction author, %@", buf, 0x16u);

            }
            objc_msgSend(v23, "objectIDNotification");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v27, "userInfo");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = (uint64_t)v29;
              _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "objectIDNotification, %@", buf, 0xCu);

            }
            objc_msgSend(v27, "userInfo");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", v45);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v32 = v31;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v50;
              while (2)
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v50 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                  objc_msgSend(*(id *)(a1 + 32), "currentDeviceObjectID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v37) = objc_msgSend(v37, "isEqual:", v38);

                  if ((_DWORD)v37)
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
                    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "previous current device was deleted.", buf, 2u);
                    }

                    goto LABEL_36;
                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
                if (v34)
                  continue;
                break;
              }
            }
LABEL_36:

            objc_autoreleasePoolPop(context);
          }
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        }
        while (v47);
      }

      v12 = v42;
      v8 = v43;
      v15 = v41;
      v16 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "error while fetching history; historyResult is nil",
          buf,
          2u);
      }

    }
  }

}

- (void)persistenceManagerDidFinishResetSync:(id)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v13 = a4;
  -[RTPersistenceDriver resetSyncContext](self, "resetSyncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_FAULT, "error recreating device record during reset-sync because there was no context.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Error recreating device record during reset-sync because there was no context."), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  objc_msgSend(v6, "persistenceContextWithOptions:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__RTPersistenceDriver_persistenceManagerDidFinishResetSync_userInfo___block_invoke;
  v14[3] = &unk_1E9299D78;
  v14[4] = self;
  v15 = v8;
  v16 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  -[RTPersistenceDriver setResetSyncContext:](self, "setResetSyncContext:", 0);

}

void __69__RTPersistenceDriver_persistenceManagerDidFinishResetSync_userInfo___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v2 = a1[4];
  objc_msgSend(v2, "resetSyncContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v32 = 0;
  objc_msgSend(v2, "_evaluatePersistentHistoryForDeletedDeviceDuringResetSync:resetSyncContext:managedObjectContext:error:", &v33, v3, v4, &v32);
  v5 = v32;

  v6 = a1[5];
  objc_msgSend(a1[4], "resetSyncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDeviceObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v6, "existingObjectWithID:error:", v8, &v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;

  if (v33 || v10 || v5)
  {
    v14 = a1[4];
    objc_msgSend(v14, "resetSyncContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_repersistPreviousDeviceWithResetSyncContext:persistenceManager:managedObjectContext:", v15, a1[6], a1[5]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "failed to recreate device record after reset sync", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("failed to recreate device record after reset sync"), 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v29);
    }
    objc_msgSend(a1[5], "existingObjectWithID:error:", v16, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v12;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "keeping the previous device after reset sync, %@", buf, 0xCu);

    }
    v13 = v9;
  }
  objc_msgSend(v13, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

  v19 = a1[4];
  objc_msgSend(v13, "objectID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_updatePersistenceStoresWithDeviceObjectID:", v20);

  v21 = a1[4];
  objc_msgSend(a1[6], "outstandingContexts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_updatePersistenceContexts:deviceObjectID:", v22, v23);

  v24 = a1[4];
  objc_msgSend(a1[6], "latestModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a1[5];
  v27 = a1[6];
  v30 = 0;
  objc_msgSend(v24, "_purgeLocalEntityRowsUsingModel:managedObjectContext:persistenceManager:error:", v25, v26, v27, &v30);

}

- (id)_repersistPreviousDeviceWithResetSyncContext:(id)a3 persistenceManager:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  _QWORD v16[4];
  id v17;
  RTPersistenceDriver *v18;
  id v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: resetSyncContext";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_11;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: managedObjectContext";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__48;
  v26 = __Block_byref_object_dispose__48;
  v27 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__RTPersistenceDriver__repersistPreviousDeviceWithResetSyncContext_persistenceManager_managedObjectContext___block_invoke;
  v16[3] = &unk_1E929BF28;
  v21 = buf;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v11;
  objc_msgSend(v20, "performBlockAndWait:", v16);
  v12 = *((id *)v23 + 5);

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v12;
}

void __108__RTPersistenceDriver__repersistPreviousDeviceWithResetSyncContext_persistenceManager_managedObjectContext___block_invoke(uint64_t a1, __n128 a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  __n128 v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v3 = 0;
  v31 = *MEMORY[0x1E0C80C00];
  a2.n128_u64[0] = 138412290;
  v25 = a2;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistenceStoreForType:", 1, *(_OWORD *)&v25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "currentDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v26 = 0;
    objc_msgSend(v5, "persistCurrentDeviceWithIdentifier:inStore:context:error:", v6, v4, v7, &v26);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v26;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v8;

    if (!v9)
      break;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v25.n128_u32[0];
      v30 = v9;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "error attempting to re-persist device to the store after reset sync, %@", buf, 0xCu);
    }

    if (v3 > 3)
      goto LABEL_17;
LABEL_11:

    ++v3;
  }

  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v13)
    v14 = 1;
  else
    v14 = v3 >= 4;
  if (!v14)
    goto LABEL_11;
  if (!v13)
  {
LABEL_17:
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = v25.n128_u32[0];
      v30 = v9;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "failed to recreate device record after reset sync, %@", buf, 0xCu);
    }

    v27 = *MEMORY[0x1E0CB3388];
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("failed to recreate device record after reset sync");
    goto LABEL_20;
  }
  v15 = objc_msgSend(v13, "isTemporaryID");
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "objectID of freshly persisted device is temporary", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("objectID of freshly persisted device is temporary");
    v20 = 0;
LABEL_20:
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, v20);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = v25.n128_u32[0];
    v30 = v18;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "successfully re-persisted device after reset sync with MOID, %@", buf, 0xCu);
  }

}

- (BOOL)_purgeLocalEntityRowsUsingModel:(id)a3 managedObjectContext:(id)a4 persistenceManager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectModel", buf, 2u);
    }

    if (!a6)
      goto LABEL_20;
    v19 = CFSTR("managedObjectModel");
    goto LABEL_19;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }

    if (!a6)
      goto LABEL_20;
    v19 = CFSTR("managedObjectContext");
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    if (a6)
    {
      v19 = CFSTR("persistenceManager");
      goto LABEL_19;
    }
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  v13 = (void *)objc_opt_new();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__RTPersistenceDriver__purgeLocalEntityRowsUsingModel_managedObjectContext_persistenceManager_error___block_invoke;
  v23[3] = &unk_1E9299D78;
  v24 = v12;
  v25 = v10;
  v14 = v13;
  v26 = v14;
  objc_msgSend(v25, "performBlockAndWait:", v23);
  _RTSafeArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = objc_retainAutorelease(v16);
  v17 = v16 == 0;

LABEL_21:
  return v17;
}

void __101__RTPersistenceDriver__purgeLocalEntityRowsUsingModel_managedObjectContext_persistenceManager_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "latestModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitiesForConfiguration:", CFSTR("Cache"));
  v3 = objc_claimAutoreleasedReturnValue();
  v27 = v2;
  objc_msgSend(v2, "entitiesForConfiguration:", CFSTR("Local"));
  v4 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v4;
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v13 = objc_alloc(MEMORY[0x1E0C97B48]);
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithEntityName:", v14);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v15);
        v17 = *(void **)(a1 + 40);
        v28 = 0;
        v18 = (id)objc_msgSend(v17, "executeRequest:error:", v16, &v28);
        v19 = v28;
        if (v19)
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_12;
          objc_msgSend(v12, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v34 = v21;
          v35 = 2112;
          v36 = v19;
          v22 = v20;
          v23 = "error batch deleting entity type during reset sync, %@, error, %@";
          v24 = 22;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_12;
          objc_msgSend(v12, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v21;
          v22 = v20;
          v23 = "batch deleting entity type during reset sync, %@";
          v24 = 12;
        }
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);

LABEL_12:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v9);
  }

}

- (void)_updatePersistenceStoresWithDeviceObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Updating stores with new device MOID %@", (uint8_t *)&v12, 0xCu);
  }

  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countOfPersistenceStores");

  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "persistenceStoreForType:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    }
  }

}

- (void)_updatePersistenceContexts:(id)a3 deviceObjectID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v23 = objc_msgSend(v5, "count");
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Updating %lu contexts with new device MOID %@", buf, 0x16u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15[0] = v12;
        v15[1] = 3221225472;
        v15[2] = __65__RTPersistenceDriver__updatePersistenceContexts_deviceObjectID___block_invoke;
        v15[3] = &unk_1E9297540;
        v15[4] = v14;
        v16 = v6;
        objc_msgSend(v14, "performBlockAndWait:", v15);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

void __65__RTPersistenceDriver__updatePersistenceContexts_deviceObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "queryGenerationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || (objc_msgSend(v2, "isEqual:", v3) & 1) != 0)
    goto LABEL_9;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "updating query generation for MOC %@ to current generation", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v6, "setQueryGenerationFromToken:error:", v3, &v17);
  v7 = v17;
  if (v7)
  {
    v8 = v7;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "error while setting the query generation to the current generation (%@), %@", buf, 0x16u);

    }
  }
  else
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "updating MOC %@ with current device MOID, %@", buf, 0x16u);
    }

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "refreshObject:mergeChanges:", v8, 1);
  }

}

- (unint64_t)persistenceDeviceClassForPlatform
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;

  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iPhonePlatform");

  if ((v4 & 1) != 0)
    return 1;
  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "watchPlatform");

  if ((v7 & 1) != 0)
    return 2;
  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "macOSPlatform");

  if ((v9 & 1) != 0)
    return 4;
  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "simulatorPlatform");

  if ((v11 & 1) != 0)
    return 8;
  -[RTPersistenceDriver currentPlatform](self, "currentPlatform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "realityDevice");

  if (v13)
    return 32;
  else
    return 0;
}

- (void)persistenceMigrator:(id)a3 didStartMigratingStore:(id)a4 withModelProvider:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "persistenceDriver:persistenceMigrator:didStartMigratingStore:withModelProvider:", self, v11, v8, v9);

}

- (void)persistenceMigrator:(id)a3 didFinishMigratingStore:(id)a4 withModelProvider:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "persistenceDriver:persistenceMigrator:didFinishMigratingStore:withModelProvider:", self, v11, v8, v9);

}

- (BOOL)shouldResetCloudStore
{
  void *v2;
  void *v3;
  char v4;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPersistenceShouldResetCloudStore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setShouldResetCloudStore:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[RTPersistenceDriver defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsPersistenceShouldResetCloudStore"));

}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;

  v15 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (a3 != 3)
  {
    v10 = v15;
    -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceContextWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__RTPersistenceDriver_performPurgeOfType_referenceDate_completion___block_invoke;
    v16[3] = &unk_1E9298238;
    v16[4] = self;
    v17 = v12;
    v18 = v10;
    v19 = a2;
    v13 = v10;
    v14 = v12;
    objc_msgSend(v14, "performBlockAndWait:", v16);

  }
  if (v9)
    v9[2](v9, 0);

}

void __67__RTPersistenceDriver_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForStoreType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v3);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_21;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v31 = v15;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "purging transaction history for the local store prior to %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C97BD8], "deleteHistoryBeforeDate:", *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAffectedStores:", v17);

    objc_msgSend(v16, "setResultType:", 2);
    v18 = *(void **)(a1 + 40);
    v25 = 0;
    objc_msgSend(v18, "executeRequest:error:", v16, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v23;
        v32 = 2112;
        v33 = v20;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, encountered error purging transaction history for the local store, error, %@", buf, 0x16u);
LABEL_18:

      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "result");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, purged %@ transaction history items in the local store", buf, 0x16u);

      goto LABEL_18;
    }

    goto LABEL_20;
  }
LABEL_9:
  v13 = v5;
LABEL_20:

LABEL_21:
}

- (id)prepareForDatabaseRekey:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "preparing for database rekey", buf, 2u);
  }

  -[RTPersistenceDriver keychainManager](self, "keychainManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v6, "encryptionKeyWithSize:identifier:error:", 0, CFSTR("com.apple.routined.security.database.rekey"), &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;

  if (v8)
  {
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (objc_msgSend(v10, "code") == -25300)
      {

        goto LABEL_7;
      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v8;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "error while checking to see if re-key key material already exists in database, %@", buf, 0xCu);
      }

      if (!a3)
        goto LABEL_27;
    }
    else if (!a3)
    {
      goto LABEL_27;
    }
    v14 = v8;
    goto LABEL_22;
  }
LABEL_7:
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "found pre-existing re-key data, attempting to remove it.", buf, 2u);
    }

    -[RTPersistenceDriver keychainManager](self, "keychainManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v12, "removeEncryptionKeyWithIdentifier:error:", CFSTR("com.apple.routined.security.database.rekey"), &v23);
    v10 = v23;

    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "error while removing pre-existing re-key key from keychain, %@", buf, 0xCu);
      }

      if (a3)
      {
        v14 = v10;
LABEL_22:
        v19 = objc_retainAutorelease(v14);
        v16 = 0;
        goto LABEL_23;
      }
LABEL_27:
      v16 = 0;
      goto LABEL_31;
    }
  }
  -[RTPersistenceDriver keychainManager](self, "keychainManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v15, "createSymmetricKeyWithSize:identifier:storeInKeychain:error:", 0, CFSTR("com.apple.routined.security.database.rekey"), 1, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "error while creating new re-key key, %@", buf, 0xCu);
    }

    if (a3)
    {
      v19 = objc_retainAutorelease(v10);
LABEL_23:
      *a3 = v19;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "successfully generated re-key data", buf, 2u);
    }

  }
LABEL_31:

  return v16;
}

- (BOOL)importSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 managedObjectModel:(id)a7 configuration:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  RTPersistenceStoreImporter *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  BOOL v43;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  RTPersistenceStoreImporter *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v20;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceStore", buf, 2u);
    }

    if (!a9)
      goto LABEL_38;
    v37 = CFSTR("sourceStore");
    goto LABEL_37;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceCoordinator", buf, 2u);
    }

    if (!a9)
      goto LABEL_38;
    v37 = CFSTR("sourceCoordinator");
    goto LABEL_37;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationStore", buf, 2u);
    }

    if (!a9)
      goto LABEL_38;
    v37 = CFSTR("destinationStore");
    goto LABEL_37;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationCoordinator", buf, 2u);
    }

    if (!a9)
      goto LABEL_38;
    v37 = CFSTR("destinationCoordinator");
    goto LABEL_37;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectModel", buf, 2u);
    }

    if (!a9)
      goto LABEL_38;
    v37 = CFSTR("managedObjectModel");
LABEL_37:
    _RTErrorInvalidParameterCreate((uint64_t)v37);
    v43 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration", buf, 2u);
    }

    if (a9)
    {
      v37 = CFSTR("configuration");
      goto LABEL_37;
    }
LABEL_38:
    v43 = 0;
    goto LABEL_39;
  }
  v66 = v19;
  v67 = v20;
  v22 = (void *)MEMORY[0x1E0CB3940];
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-%@"), v24, v25);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v26, "UTF8String");
  v65 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v48;
    v73 = 2112;
    v74 = v49;
    _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v28 = objc_claimAutoreleasedReturnValue();
  v19 = v66;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "URL");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "path");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "lastPathComponent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringByDeletingPathExtension");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "path");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingPathExtension");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v29;
    v73 = 2112;
    v74 = v31;
    _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "preparing to import data from store, %@ to store, %@", buf, 0x16u);

  }
  v32 = -[RTPersistenceStoreImporter initWithManagedObjectModel:configuration:sourceStore:sourceCoordinator:destinationStore:destinationCoordinator:]([RTPersistenceStoreImporter alloc], "initWithManagedObjectModel:configuration:sourceStore:sourceCoordinator:destinationStore:destinationCoordinator:", v66, v67, v15, v16, v17, v18);
  v33 = (void *)objc_opt_new();
  v70 = 0;
  v64 = v32;
  v34 = -[RTPersistenceStoreImporter import:](v32, "import:", &v70);
  v35 = v70;
  v62 = v35;
  if (v35)
  {
    objc_msgSend(v33, "addObject:", v35);
  }
  else if (v34 && objc_msgSend(v67, "isEqualToString:", CFSTR("Cloud")))
  {
    v69 = 0;
    objc_msgSend(v15, "retrieveMetadataWithCoordinator:error:", v16, &v69);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v69;
    if (v46)
    {
      objc_msgSend(v33, "addObject:", v46);
    }
    else
    {
      v57 = (void *)objc_msgSend(v45, "mutableCopy");
      objc_msgSend(v45, "allKeys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_validateKeys:", v50);
      v51 = objc_claimAutoreleasedReturnValue();

      v59 = (void *)v51;
      objc_msgSend(v57, "removeObjectsForKeys:", v51);
      v68 = 0;
      objc_msgSend(v17, "updateMetadata:coordinator:error:", v57, v18, &v68);
      v52 = v68;
      if (v52)
        objc_msgSend(v33, "addObject:", v52);

      v46 = 0;
    }

  }
  v53 = v33;
  _RTSafeArray();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (a9)
    *a9 = objc_retainAutorelease(v55);
  v43 = v55 == 0;

  v21 = v67;
LABEL_39:

  return v43;
}

- (RTPersistenceManager)persistenceManager
{
  return (RTPersistenceManager *)objc_getProperty(self, a2, 40, 1);
}

- (RTDataProtectionManager)dataProtectionManager
{
  return (RTDataProtectionManager *)objc_getProperty(self, a2, 48, 1);
}

- (RTAccountManager)accountManager
{
  return (RTAccountManager *)objc_getProperty(self, a2, 56, 1);
}

- (RTPlatform)currentPlatform
{
  return (RTPlatform *)objc_getProperty(self, a2, 64, 1);
}

- (RTKeychainManager)keychainManager
{
  return (RTKeychainManager *)objc_getProperty(self, a2, 72, 1);
}

- (RTDefaultsManager)defaultsManager
{
  return (RTDefaultsManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (RTLifeCycleManager)lifecycleManager
{
  return (RTLifeCycleManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLifecycleManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_os_transaction)setupTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSetupTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)requiresDirtyTransaction
{
  return self->_requiresDirtyTransaction;
}

- (void)setRequiresDirtyTransaction:(BOOL)a3
{
  self->_requiresDirtyTransaction = a3;
}

- (BOOL)requiresSetupTransaction
{
  return self->_requiresSetupTransaction;
}

- (void)setRequiresSetupTransaction:(BOOL)a3
{
  self->_requiresSetupTransaction = a3;
}

- (int64_t)cloudSyncAuthorization
{
  return self->_cloudSyncAuthorization;
}

- (void)setCloudSyncAuthorization:(int64_t)a3
{
  self->_cloudSyncAuthorization = a3;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTAccount)currentAccount
{
  return (RTAccount *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (RTPersistenceMetricsDelegate)metricsDelegate
{
  return (RTPersistenceMetricsDelegate *)objc_loadWeakRetained((id *)&self->_metricsDelegate);
}

- (void)setMetricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metricsDelegate, a3);
}

- (RTPersistenceResetSyncContext)resetSyncContext
{
  return (RTPersistenceResetSyncContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setResetSyncContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return (RTDarwinNotificationHelper *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTTimer)backgroundProcessingAssertionDeferralTimer
{
  return self->_backgroundProcessingAssertionDeferralTimer;
}

- (void)setBackgroundProcessingAssertionDeferralTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionDeferralTimer, a3);
}

- (RTTimer)backgroundProcessingAssertionAcquireRetryTimer
{
  return self->_backgroundProcessingAssertionAcquireRetryTimer;
}

- (void)setBackgroundProcessingAssertionAcquireRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionAcquireRetryTimer, a3);
}

- (unint64_t)backgroundAssertionRetryCount
{
  return self->_backgroundAssertionRetryCount;
}

- (void)setBackgroundAssertionRetryCount:(unint64_t)a3
{
  self->_backgroundAssertionRetryCount = a3;
}

- (NSMutableDictionary)fileDescriptorsForPersistenceStoreDict
{
  return self->_fileDescriptorsForPersistenceStoreDict;
}

- (void)setFileDescriptorsForPersistenceStoreDict:(id)a3
{
  objc_storeStrong((id *)&self->_fileDescriptorsForPersistenceStoreDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDescriptorsForPersistenceStoreDict, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionAcquireRetryTimer, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionDeferralTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_resetSyncContext, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_setupTransaction, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_currentPlatform, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)persistenceStore:(id)a3 didPrepareWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  RTPersistenceDriver *v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: store";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: context";
    goto LABEL_11;
  }
  objc_msgSend(v6, "storeBaseName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Cloud-V2"));

  if ((v10 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__RTPersistenceDriver_Metrics__persistenceStore_didPrepareWithContext___block_invoke;
    v13[3] = &unk_1E9297540;
    v14 = v8;
    v15 = self;
    objc_msgSend(v14, "performBlockAndWait:", v13);

  }
LABEL_9:

}

void __71__RTPersistenceDriver_Metrics__persistenceStore_didPrepareWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  uint64_t v104;
  void *v105;
  __CFString *v106;
  __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t j;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id obj;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *context;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  id v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchBatchSize:", 10);
  v3 = *(void **)(a1 + 32);
  v170 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v170);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v170;
  if (!v5)
  {
    v122 = v2;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v121 = v4;
    obj = v4;
    v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v173, 16);
    v6 = 0;
    v7 = 0;
    if (v125)
    {
      v142 = 0;
      v124 = *(_QWORD *)v167;
      v8 = &off_1E9294000;
      v9 = &off_1E9294000;
      do
      {
        v10 = 0;
        do
        {
          v140 = v7;
          if (*(_QWORD *)v167 != v124)
            objc_enumerationMutation(obj);
          v136 = v10;
          v11 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v10);
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v11, "creationDate");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CB3880];
          v129 = v11;
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("device"), CFSTR("identifier"), v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v15 = *(void **)(a1 + 40);
          objc_msgSend(v8[354], "entity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(a1 + 32);
          v165 = 0;
          objc_msgSend(v15, "latestCloudManagedObjectWithEntityDescription:predicate:context:error:", v16, v14, v17, &v165);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = *(void **)(a1 + 40);
          objc_msgSend(v9[367], "entity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 32);
          v164 = 0;
          objc_msgSend(v19, "latestCloudManagedObjectWithEntityDescription:predicate:context:error:", v20, v14, v21, &v164);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = *(void **)(a1 + 40);
          +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 32);
          v163 = 0;
          objc_msgSend(v23, "latestCloudManagedObjectWithEntityDescription:predicate:context:error:", v24, v14, v25, &v163);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v163;

          v138 = v18;
          objc_msgSend(v18, "creationDate");
          v28 = objc_claimAutoreleasedReturnValue();
          v137 = v22;
          objc_msgSend(v22, "creationDate");
          v29 = objc_claimAutoreleasedReturnValue();
          v135 = v26;
          objc_msgSend(v26, "creationDate");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_opt_new();
          v32 = v31;
          if (v28)
            objc_msgSend(v31, "addObject:", v28);
          if (v29)
            objc_msgSend(v32, "addObject:", v29);
          v141 = v6;
          v146 = (void *)v29;
          v147 = (void *)v28;
          if (v30)
            objc_msgSend(v32, "addObject:", v30);
          v145 = (void *)v30;
          objc_msgSend(v32, "sortUsingSelector:", sel_compare_);
          objc_msgSend(v32, "lastObject");
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = *(void **)(a1 + 40);
          objc_msgSend(v8[354], "entity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(a1 + 32);
          v162 = 0;
          objc_msgSend(v33, "earliestCloudManagedObjectWithEntityDescription:predicate:context:error:", v34, v14, v35, &v162);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = *(void **)(a1 + 40);
          objc_msgSend(v9[367], "entity");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *(_QWORD *)(a1 + 32);
          v161 = 0;
          objc_msgSend(v37, "earliestCloudManagedObjectWithEntityDescription:predicate:context:error:", v38, v14, v39, &v161);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = *(void **)(a1 + 40);
          +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(a1 + 32);
          v160 = 0;
          v44 = (void *)v14;
          objc_msgSend(v41, "earliestCloudManagedObjectWithEntityDescription:predicate:context:error:", v42, v14, v43, &v160);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v160;

          v133 = v36;
          objc_msgSend(v36, "creationDate");
          v47 = objc_claimAutoreleasedReturnValue();
          v132 = v40;
          objc_msgSend(v40, "creationDate");
          v48 = objc_claimAutoreleasedReturnValue();
          v131 = v45;
          objc_msgSend(v45, "creationDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_opt_new();
          v51 = v50;
          if (v47)
            objc_msgSend(v50, "addObject:", v47);
          v130 = (void *)v47;
          if (v48)
            objc_msgSend(v51, "addObject:", v48);
          v128 = (void *)v48;
          v134 = v32;
          v52 = v44;
          if (v49)
            objc_msgSend(v51, "addObject:", v49);
          objc_msgSend(v51, "sortUsingSelector:", sel_compare_);
          objc_msgSend(v51, "firstObject");
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = *(void **)(a1 + 40);
          objc_msgSend(v8[354], "entity");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(a1 + 32);
          v159 = 0;
          v143 = objc_msgSend(v53, "countOfCloudManagedObjectWithEntityDescription:predicate:context:error:", v54, v44, v55, &v159);

          v56 = *(void **)(a1 + 40);
          +[RTLearnedVisitMO entity](RTLearnedVisitMO, "entity");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = *(_QWORD *)(a1 + 32);
          v158 = 0;
          v59 = objc_msgSend(v56, "countOfCloudManagedObjectWithEntityDescription:predicate:context:error:", v57, v44, v58, &v158);

          v60 = *(void **)(a1 + 40);
          +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = *(_QWORD *)(a1 + 32);
          v157 = 0;
          v63 = objc_msgSend(v60, "countOfCloudManagedObjectWithEntityDescription:predicate:context:error:", v61, v52, v62, &v157);
          v64 = v157;

          v65 = (void *)objc_opt_new();
          v66 = (void *)MEMORY[0x1E0CB37E8];
          v67 = -1.0;
          v68 = -1.0;
          if (v148)
            objc_msgSend(v126, "timeIntervalSinceDate:", v148, -1.0);
          objc_msgSend(v66, "numberWithDouble:", v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v69, CFSTR("deviceAge"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v143);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v70, CFSTR("devicePlaceCount"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v71, CFSTR("deviceVisitCount"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v72, CFSTR("deviceTransitionCount"));

          objc_msgSend(v129, "deviceClass");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "setObject:forKeyedSubscript:", v73, CFSTR("deviceClass"));
          v74 = (void *)MEMORY[0x1E0CB37E8];
          if (v147)
          {
            objc_msgSend(v126, "timeIntervalSinceDate:");
            v67 = v75;
          }
          objc_msgSend(v74, "numberWithDouble:", v67);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v76, CFSTR("deviceLastPlaceAge"));

          v77 = (void *)MEMORY[0x1E0CB37E8];
          v78 = -1.0;
          v79 = -1.0;
          if (v146)
            objc_msgSend(v126, "timeIntervalSinceDate:", -1.0);
          objc_msgSend(v77, "numberWithDouble:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v80, CFSTR("deviceLastVisitAge"));

          v81 = (void *)MEMORY[0x1E0CB37E8];
          if (v145)
          {
            objc_msgSend(v126, "timeIntervalSinceDate:", v145);
            v78 = v82;
          }
          objc_msgSend(v81, "numberWithDouble:", v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v83, CFSTR("deviceLastTransitionAge"));

          v84 = (void *)MEMORY[0x1E0CB37E8];
          v85 = -1.0;
          v86 = -1.0;
          if (v144)
            objc_msgSend(v126, "timeIntervalSinceDate:", -1.0);
          objc_msgSend(v84, "numberWithDouble:", v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v87, CFSTR("ageOfMostRecentRecord"));

          v88 = (void *)MEMORY[0x1E0CB37E8];
          if (v127)
          {
            objc_msgSend(v126, "timeIntervalSinceDate:", v127);
            v85 = v89;
          }
          v142 += v143;
          v7 = v59 + v140;
          v6 = v63 + v141;
          objc_msgSend(v88, "numberWithDouble:", v85);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v90, CFSTR("ageOfOldestRecord"));

          v91 = objc_alloc(MEMORY[0x1E0CB3940]);
          v92 = (void *)objc_msgSend(v91, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringDeviceProfile, 1);
          log_analytics_submission(v92, v65);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          objc_autoreleasePoolPop(context);
          v10 = v136 + 1;
          v8 = &off_1E9294000;
          v9 = &off_1E9294000;
        }
        while (v125 != v136 + 1);
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v173, 16);
      }
      while (v125);
    }
    else
    {
      v142 = 0;
    }

    v94 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v142);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v95, CFSTR("totalPlaceCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v96, CFSTR("totalVisitCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v97, CFSTR("totalTransitionCount"));

    v98 = (void *)objc_opt_new();
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v99 = obj;
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v153, v172, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v101; ++i)
        {
          if (*(_QWORD *)v154 != v102)
            objc_enumerationMutation(v99);
          objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * i), "deviceClass");
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = (void *)v104;
          if (v104)
            v106 = (__CFString *)v104;
          else
            v106 = CFSTR("Unknown");
          v107 = v106;

          objc_msgSend(v98, "objectForKeyedSubscript:", v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v108, "unsignedIntegerValue") + 1);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKeyedSubscript:", v109, v107);

        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v153, v172, 16);
      }
      while (v101);
    }

    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    objc_msgSend(v98, "allKeys");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v149, v171, 16);
    if (v111)
    {
      v112 = v111;
      v113 = *(_QWORD *)v150;
      do
      {
        for (j = 0; j != v112; ++j)
        {
          if (*(_QWORD *)v150 != v113)
            objc_enumerationMutation(v110);
          v115 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("countInDeviceClass"), v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          if (v116)
          {
            objc_msgSend(v98, "objectForKeyedSubscript:", v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v117, v116);

          }
        }
        v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v149, v171, 16);
      }
      while (v112);
    }

    v118 = objc_alloc(MEMORY[0x1E0CB3940]);
    v119 = (void *)objc_msgSend(v118, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringAccountProfile, 1);
    log_analytics_submission(v119, v94);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v4 = v121;
    v2 = v122;
    v5 = 0;
  }

}

- (unint64_t)countOfCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a6)
    {
      v15 = CFSTR("entityDescription");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v15);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      v15 = CFSTR("context");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__75;
  v28 = __Block_byref_object_dispose__75;
  v29 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__RTPersistenceDriver_Metrics__countOfCloudManagedObjectWithEntityDescription_predicate_context_error___block_invoke;
  v18[3] = &unk_1E929B8F8;
  v19 = v9;
  v20 = v10;
  v22 = &v30;
  v21 = v12;
  v23 = buf;
  objc_msgSend(v21, "performBlockAndWait:", v18);
  if (a6)
    *a6 = objc_retainAutorelease(*((id *)v25 + 5));
  v13 = v31[3];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);
LABEL_16:

  return v13;
}

void __103__RTPersistenceDriver_Metrics__countOfCloudManagedObjectWithEntityDescription_predicate_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "countForFetchRequest:error:", v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

}

- (id)latestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB3928];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver cloudManagedObjectWithEntityDescription:predicate:sortDescriptors:context:error:](self, "cloudManagedObjectWithEntityDescription:predicate:sortDescriptors:context:error:", v13, v12, v15, v11, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)earliestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB3928];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceDriver cloudManagedObjectWithEntityDescription:predicate:sortDescriptors:context:error:](self, "cloudManagedObjectWithEntityDescription:predicate:sortDescriptors:context:error:", v13, v12, v15, v11, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)cloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 context:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a7)
    {
      v18 = CFSTR("entityDescription");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v18);
      v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a7)
    {
      v18 = CFSTR("context");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__75;
  v38 = __Block_byref_object_dispose__75;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__75;
  v32 = __Block_byref_object_dispose__75;
  v33 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__RTPersistenceDriver_Metrics__cloudManagedObjectWithEntityDescription_predicate_sortDescriptors_context_error___block_invoke;
  v21[3] = &unk_1E929EAE8;
  v22 = v11;
  v23 = v13;
  v24 = v12;
  v25 = v15;
  v26 = &v28;
  v27 = buf;
  objc_msgSend(v25, "performBlockAndWait:", v21);
  if (a7)
    *a7 = objc_retainAutorelease((id)v29[5]);
  v16 = *((id *)v35 + 5);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v16;
}

void __112__RTPersistenceDriver_Metrics__cloudManagedObjectWithEntityDescription_predicate_sortDescriptors_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(v4, "setSortDescriptors:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 48));
  v5 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)persistenceStoreFailedWithError:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v11 = (id)objc_msgSend([v3 alloc], "initWithCapacity:", 1);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v4, "code");

  objc_msgSend(v5, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = (void *)objc_msgSend(v8, "initWithCString:encoding:", RTAnalyticsEventPersistenceStoreDestruction, 1);
  log_analytics_submission(v9, v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)persistenceStoreResetSyncWithUserInfo:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v12 = (id)objc_msgSend([v3 alloc], "initWithCapacity:", 2);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C97820]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("reason"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("code"));
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringResetSync, 1);
  log_analytics_submission(v10, v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didStartMigratingStore:(id)a5 withModelProvider:(id)a6
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didFinishMigratingStore:(id)a5 withModelProvider:(id)a6
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", 5);
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "migrationEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migrationStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  objc_msgSend(v12, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[RTPersistenceDriver persistenceManager](self, "persistenceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "storeTypeForURL:", v17));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "didVacuumStore"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend(v10, "status");

  objc_msgSend(v18, "numberWithUnsignedInteger:", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  objc_msgSend(v8, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v20, "attributesOfItemAtPath:error:", v22, &v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v37;

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "fileSize"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v36, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v31;
      v40 = 2112;
      v41 = v24;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "error fetching file attributes for store, %@, error, %@", buf, 0x16u);

    }
    v25 = &unk_1E93282F8;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, CFSTR("migrationDuration"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, CFSTR("storeType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, CFSTR("didVacuum"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("storeSize"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("migrationStatus"));
  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  v28 = (void *)objc_msgSend(v27, "initWithCString:encoding:", RTAnalyticsEventPersistenceStoreMigration, 1);
  log_analytics_submission(v28, v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v31;
      v35 = 2080;
      v36 = "-[RTPersistenceDriver(Metrics) onDailyMetricsNotification:]";
      v37 = 1024;
      v38 = 382;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v9 & 1) != 0)
  {
    v10 = objc_opt_new();
    v11 = -[RTPersistenceDriver cloudSyncAuthorization](self, "cloudSyncAuthorization");
    v12 = MEMORY[0x1E0C9AAA0];
    v13 = MEMORY[0x1E0C9AAB0];
    if (v11 == 2)
      v14 = MEMORY[0x1E0C9AAB0];
    else
      v14 = MEMORY[0x1E0C9AAA0];
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("cloudSyncAuthorization"));
    -[RTPersistenceDriver currentAccount](self, "currentAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = v13;
    else
      v16 = v12;
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, CFSTR("iCloudAccountPresent"));
    -[RTPersistenceDriver defaultsManager](self, "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTPersistenceDriver defaultsManager](self, "defaultsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v18);
    v23 = v22;
    objc_msgSend(v21, "timeIntervalSinceDate:", v20);
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v26, CFSTR("durationSinceLastImport"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v27, CFSTR("durationSinceLastExport"));

    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    v29 = (void *)objc_msgSend(v28, "initWithCString:encoding:", RTAnalyticsEventPersistenceMirroringEngagement, 1);
    log_analytics_submission(v29, v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v32;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
  }

}

@end
