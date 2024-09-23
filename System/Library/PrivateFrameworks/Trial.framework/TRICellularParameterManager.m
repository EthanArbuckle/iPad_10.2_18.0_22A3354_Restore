@implementation TRICellularParameterManager

- (TRICellularParameterManager)init
{
  TRICellularParameterManager *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CoreTelephonyClient *telephonyClient;
  CoreTelephonyClient *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _PASLock *lock;
  NSObject *v21;
  void *v23;
  id v24;
  objc_super v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 buf;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)TRICellularParameterManager;
  v3 = -[TRICellularParameterManager init](&v25, sel_init);
  if (v3)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v4 = (void *)getCoreTelephonyClientClass_softClass;
    v29 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v31 = __getCoreTelephonyClientClass_block_invoke;
      v32 = &unk_1E3BFF5D0;
      v33 = &v26;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&buf);
      v4 = (void *)v27[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v26, 8);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("TRICellularParameterManager.m"), 60, CFSTR("Unable to load soft-linked CoreTelephonyClient class"));

    }
    v6 = [v5 alloc];
    -[TRICellularParameterManager _dispatchQueueForCarrierInfoGathering](v3, "_dispatchQueueForCarrierInfoGathering");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithQueue:", v7);
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v8;

    v10 = v3->_telephonyClient;
    v24 = 0;
    -[CoreTelephonyClient getPreferredDataSubscriptionContextSync:](v10, "getPreferredDataSubscriptionContextSync:", &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (!v11)
    {
      TRILogCategory_ClientFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
    v14 = (_QWORD *)objc_opt_new();
    -[TRICellularParameterManager _fetchCarrierBundleIdentifier:](v3, "_fetchCarrierBundleIdentifier:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v14[1];
    v14[1] = v15;

    -[TRICellularParameterManager _fetchCarrierCountryIsoCode:](v3, "_fetchCarrierCountryIsoCode:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v14[2];
    v14[2] = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v14);
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v19;

    -[CoreTelephonyClient setDelegate:](v3->_telephonyClient, "setDelegate:", v3);
    TRILogCategory_ClientFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B89C000, v21, OS_LOG_TYPE_DEFAULT, "Set up TRICellularParameterManager", (uint8_t *)&buf, 2u);
    }

  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1ECED7EB0 != -1)
    dispatch_once(&qword_1ECED7EB0, &__block_literal_global_19);
  return (id)_MergedGlobals_15;
}

void __45__TRICellularParameterManager_sharedInstance__block_invoke()
{
  void *v0;
  TRICellularParameterManager *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = objc_alloc_init(TRICellularParameterManager);
  v2 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_dispatchQueueForCarrierInfoGathering
{
  if (qword_1ECED7EC0 != -1)
    dispatch_once(&qword_1ECED7EC0, &__block_literal_global_19);
  return (id)qword_1ECED7EB8;
}

void __68__TRICellularParameterManager__dispatchQueueForCarrierInfoGathering__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.system-config.carrier", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED7EB8;
  qword_1ECED7EB8 = v1;

  objc_autoreleasePoolPop(v0);
}

- (NSString)carrierBundleIdentifier
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = &stru_1E3C00710;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__TRICellularParameterManager_carrierBundleIdentifier__block_invoke;
  v5[3] = &unk_1E3BFFB88;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __54__TRICellularParameterManager_carrierBundleIdentifier__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (NSString)carrierCountryIsoCode
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = &stru_1E3C00710;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__TRICellularParameterManager_carrierCountryIsoCode__block_invoke;
  v5[3] = &unk_1E3BFFB88;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __52__TRICellularParameterManager_carrierCountryIsoCode__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

- (id)_fetchCarrierBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  CoreTelephonyClient *telephonyClient;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v6 = (void *)getCTBundleClass_softClass;
    v22 = getCTBundleClass_softClass;
    if (!getCTBundleClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v24 = __getCTBundleClass_block_invoke;
      v25 = &unk_1E3BFF5D0;
      v26 = &v19;
      __getCTBundleClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v20[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v19, 8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICellularParameterManager.m"), 117, CFSTR("Unable to load soft-linked CTBundle class"));

    }
    v8 = (void *)objc_msgSend([v7 alloc], "initWithBundleType:", 1);
    telephonyClient = self->_telephonyClient;
    v18 = 0;
    v10 = (__CFString *)-[CoreTelephonyClient copyBundleIdentifier:bundleType:error:](telephonyClient, "copyBundleIdentifier:bundleType:error:", v5, v8, &v18);
    v11 = v18;
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Unable to get carrier bundle identifier: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v14 = &stru_1E3C00710;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_19B89C000, v13, OS_LOG_TYPE_DEFAULT, "Fetched Carrier bundle identifier from CoreTelephony: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v15 = &stru_1E3C00710;
      if (v10)
        v15 = v10;
      v14 = v15;
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context", (uint8_t *)&buf, 2u);
    }
    v14 = &stru_1E3C00710;
  }

  return v14;
}

- (id)_fetchCarrierCountryIsoCode:(id)a3
{
  CoreTelephonyClient *telephonyClient;
  void *v5;
  NSObject *v6;
  CoreTelephonyClient *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    telephonyClient = self->_telephonyClient;
    v16 = 0;
    v5 = (void *)-[CoreTelephonyClient copyLastKnownMobileSubscriberCountryCode:error:](telephonyClient, "copyLastKnownMobileSubscriberCountryCode:error:", a3, &v16);
    v6 = v16;
    if (v5)
    {
      v7 = self->_telephonyClient;
      v15 = v6;
      v8 = -[CoreTelephonyClient copyMobileSubscriberIsoCountryCode:error:](v7, "copyMobileSubscriberIsoCountryCode:error:", v5, &v15);
      v9 = v15;

      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v9;
          _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "Unable to get carrier country code: %{public}@", buf, 0xCu);
        }

        v12 = &stru_1E3C00710;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v8;
          _os_log_impl(&dword_19B89C000, v11, OS_LOG_TYPE_DEFAULT, "Fetched Carrier country code from CoreTelephony: %{public}@", buf, 0xCu);
        }

        v13 = &stru_1E3C00710;
        if (v8)
          v13 = (__CFString *)v8;
        v12 = v13;
        v9 = 0;
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "Unable to get last known mobile subscriber country code: %{public}@", buf, 0xCu);
      }
      v12 = &stru_1E3C00710;
      v9 = v6;
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context", buf, 2u);
    }
    v12 = &stru_1E3C00710;
  }

  return v12;
}

- (void)preferredDataSimChanged:(id)a3
{
  id v5;
  NSObject *v6;
  _PASLock *lock;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  TRICellularParameterManager *v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: preferredDataSimChanged", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__TRICellularParameterManager_preferredDataSimChanged___block_invoke;
  v12 = &unk_1E3BFFBB0;
  v13 = self;
  v14 = v5;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v9);
  -[TRICellularParameterManager _updateSystemInfo](self, "_updateSystemInfo", v9, v10, v11, v12, v13);

}

void __55__TRICellularParameterManager_preferredDataSimChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_fetchCarrierBundleIdentifier:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4[1];
  v4[1] = v5;

}

- (void)subscriberCountryCodeDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  _PASLock *lock;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  TRICellularParameterManager *v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: subscriberCountryCodeDidChange", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__TRICellularParameterManager_subscriberCountryCodeDidChange___block_invoke;
  v12 = &unk_1E3BFFBB0;
  v13 = self;
  v14 = v5;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v9);
  -[TRICellularParameterManager _updateSystemInfo](self, "_updateSystemInfo", v9, v10, v11, v12, v13);

}

void __62__TRICellularParameterManager_subscriberCountryCodeDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_fetchCarrierCountryIsoCode:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4[2];
  v4[2] = v5;

}

- (void)carrierBundleChange:(id)a3
{
  id v5;
  NSObject *v6;
  _PASLock *lock;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  TRICellularParameterManager *v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: carrierBundleChange", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __51__TRICellularParameterManager_carrierBundleChange___block_invoke;
  v12 = &unk_1E3BFFBB0;
  v13 = self;
  v14 = v5;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v9);
  -[TRICellularParameterManager _updateSystemInfo](self, "_updateSystemInfo", v9, v10, v11, v12, v13);

}

void __51__TRICellularParameterManager_carrierBundleChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_fetchCarrierBundleIdentifier:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4[1];
  v4[1] = v5;

}

- (void)_updateSystemInfo
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  TRISystemConfiguration *v7;
  id v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (+[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald"))
  {
    TRILogCategory_ClientFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19B89C000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to update System info due to cellular parameter change", (uint8_t *)&v10, 2u);
    }

    +[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISystemInfo createSystemInfoWithFactorProvider:](TRISystemInfo, "createSystemInfoWithFactorProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "save") & 1) != 0)
    {
      +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = -[TRISystemConfiguration initWithPaths:]([TRISystemConfiguration alloc], "initWithPaths:", v6);
      v8 = -[TRISystemConfiguration reloadSystemInfo](v7, "reloadSystemInfo");

      TRILogCategory_ClientFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_DEFAULT, "System info update successful", (uint8_t *)&v10, 2u);
      }

    }
    else
    {
      TRILogCategory_ClientFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = CFSTR("TRICellularParameterManager failed to update system info");
        _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }

  }
}

- (void)setCarrierBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, a3);
}

- (void)setCarrierCountryIsoCode:(id)a3
{
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
