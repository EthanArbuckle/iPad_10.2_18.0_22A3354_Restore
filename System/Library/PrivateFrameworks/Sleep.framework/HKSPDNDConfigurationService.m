@implementation HKSPDNDConfigurationService

void __65__HKSPDNDConfigurationService__startListeningToModeConfigService__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory(0x13uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = WeakRetained;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully started listening for mode config updates.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while listening for mode config updates: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    -[HKSPDNDConfigurationService _startListeningToModeConfigService](self, "_startListeningToModeConfigService");
    -[HKSPDNDConfigurationService _startListeningToGlobalConfigService](self, "_startListeningToGlobalConfigService");
  }
  else
  {
    -[HKSPDNDConfigurationService _stopListeningToModeConfigService](self, "_stopListeningToModeConfigService");
    -[HKSPDNDConfigurationService _stopListeningToGlobalConfigService](self, "_stopListeningToGlobalConfigService");
  }
  -[HKSPDNDConfigurationService _checkForUpdatedSleepFocusConfig](self, "_checkForUpdatedSleepFocusConfig");
}

- (void)_startListeningToModeConfigService
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  HKSPDNDConfigurationService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0x13uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start listening for mode config updates.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[HKSPDNDConfigurationService modeConfigService](self, "modeConfigService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HKSPDNDConfigurationService__startListeningToModeConfigService__block_invoke;
  v5[3] = &unk_1E4E3AD08;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "addListener:withCompletionHandler:", self, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_startListeningToGlobalConfigService
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  HKSPDNDConfigurationService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HKSPDNDConfigurationService _readGlobalConfig](self, "_readGlobalConfig"))
  {
    HKSPLogForCategory(0x13uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start listening for global config updates.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[HKSPDNDConfigurationService globalConfigService](self, "globalConfigService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__HKSPDNDConfigurationService__startListeningToGlobalConfigService__block_invoke;
    v5[3] = &unk_1E4E3AD08;
    objc_copyWeak(&v6, (id *)buf);
    objc_msgSend(v4, "addListener:withCompletionHandler:", self, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_readGlobalConfig
{
  return objc_msgSend((id)objc_opt_class(), "_readGlobalConfigForOptions:", self->_options);
}

- (void)_checkForUpdatedSleepFocusConfig
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  HKSPDNDConfigurationService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"))
  {
    HKSPLogForCategory(0x13uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking if sleep focus config has changed...", buf, 0xCu);
    }

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__HKSPDNDConfigurationService__checkForUpdatedSleepFocusConfig__block_invoke;
    v4[3] = &unk_1E4E3C4B0;
    v4[4] = self;
    -[HKSPDNDConfigurationService _fetchUpdatedSleepFocusConfigurationWithCompletion:](self, "_fetchUpdatedSleepFocusConfigurationWithCompletion:", v4);
  }
}

- (BOOL)_cacheSleepFocusConfig
{
  return self->_options & 1;
}

+ (BOOL)_readGlobalConfigForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

+ (id)sleepFocusConfigurationService
{
  return (id)objc_msgSend(a1, "sleepFocusConfigurationServiceWithOptions:", 0);
}

+ (id)sleepFocusConfigurationServiceWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  HKSPDNDConfigurationService *v7;

  objc_msgSend(MEMORY[0x1E0D1D688], "serviceForClientIdentifier:", CFSTR("com.apple.sleep.sleep-mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_readGlobalConfigForOptions:", a3))
  {
    objc_msgSend(MEMORY[0x1E0D1D5E0], "serviceForClientIdentifier:", CFSTR("com.apple.sleep.sleep-mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[HKSPDNDConfigurationService initWithModeConfigService:globalConfigService:options:]([HKSPDNDConfigurationService alloc], "initWithModeConfigService:globalConfigService:options:", v5, v6, a3);

  return v7;
}

- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4
{
  return -[HKSPDNDConfigurationService initWithModeConfigService:globalConfigService:options:](self, "initWithModeConfigService:globalConfigService:options:", a3, a4, 0);
}

- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  HKSPDNDConfigurationService *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NAScheduler *dndScheduler;
  HKSPDNDConfigurationService *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HKSPDNDConfigurationService *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKSPDNDConfigurationService;
  v11 = -[HKSPDNDConfigurationService init](&v19, sel_init);
  if (v11)
  {
    HKSPLogForCategory(0x13uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2048;
      v23 = v11;
      v14 = v13;
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeStrong((id *)&v11->_modeConfigService, a3);
    objc_storeStrong((id *)&v11->_globalConfigService, a4);
    objc_msgSend(MEMORY[0x1E0D519E8], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.HKSPDNDConfigurationService.serial"));
    v15 = objc_claimAutoreleasedReturnValue();
    dndScheduler = v11->_dndScheduler;
    v11->_dndScheduler = (NAScheduler *)v15;

    v11->_options = a5;
    v11->_cacheLock._os_unfair_lock_opaque = 0;
    -[HKSPDNDConfigurationService _loadCachedSleepFocusConfig](v11, "_loadCachedSleepFocusConfig");
    v17 = v11;
  }

  return v11;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  void (**v4)(_QWORD);

  p_cacheLock = &self->_cacheLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)_loadCachedSleepFocusConfig
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  HKSPDNDConfigurationService *v11;
  id v12;
  uint8_t buf[4];
  HKSPDNDConfigurationService *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_sleepdUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSPSleepFocusConfiguration readFromDefaults:](HKSPSleepFocusConfiguration, "readFromDefaults:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory(0x13uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loaded cached sleep focus config: %{public}@", buf, 0x16u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __58__HKSPDNDConfigurationService__loadCachedSleepFocusConfig__block_invoke;
    v10 = &unk_1E4E3A760;
    v11 = self;
    v12 = v4;
    v6 = v4;
    -[HKSPDNDConfigurationService _withLock:](self, "_withLock:", &v7);
    -[HKSPDNDConfigurationService _checkForUpdatedSleepFocusConfig](self, "_checkForUpdatedSleepFocusConfig", v7, v8, v9, v10, v11);

  }
}

void __58__HKSPDNDConfigurationService__loadCachedSleepFocusConfig__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __63__HKSPDNDConfigurationService__checkForUpdatedSleepFocusConfig__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateCachedSleepFocusConfig:", a2);
  return result;
}

- (void)_fetchUpdatedSleepFocusConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NAScheduler *dndScheduler;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKSPDNDConfigurationService *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(0x13uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching current sleep focus config...", buf, 0xCu);
  }

  dndScheduler = self->_dndScheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HKSPDNDConfigurationService__fetchUpdatedSleepFocusConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_1E4E3C4D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NAScheduler performBlock:](dndScheduler, "performBlock:", v8);

}

void __82__HKSPDNDConfigurationService__fetchUpdatedSleepFocusConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v2, "_sleepFocusConfiguration:checkCache:", &v10, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  HKSPLogForCategory(0x13uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while updating cached sleep focus config: %{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched current sleep focus config: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateCachedSleepFocusConfig:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HKSPDNDConfigurationService__updateCachedSleepFocusConfig___block_invoke;
  v6[3] = &unk_1E4E3C500;
  v7 = v4;
  v5 = v4;
  -[HKSPDNDConfigurationService _updateCacheAndNotifyWithBlock:](self, "_updateCacheAndNotifyWithBlock:", v6);

}

id __61__HKSPDNDConfigurationService__updateCachedSleepFocusConfig___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateCachedUUID:(id)a3 state:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HKSPDNDConfigurationService_updateCachedUUID_state___block_invoke;
  v8[3] = &unk_1E4E3C528;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HKSPDNDConfigurationService _updateCacheAndNotifyWithBlock:](self, "_updateCacheAndNotifyWithBlock:", v8);

}

uint64_t __54__HKSPDNDConfigurationService_updateCachedUUID_state___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepFocusConfigurationUpdatingUUID:state:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateCachedMirrorsFocusModes:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__HKSPDNDConfigurationService_updateCachedMirrorsFocusModes___block_invoke;
  v3[3] = &__block_descriptor_33_e66___HKSPSleepFocusConfiguration_16__0__HKSPSleepFocusConfiguration_8l;
  v4 = a3;
  -[HKSPDNDConfigurationService _updateCacheAndNotifyWithBlock:](self, "_updateCacheAndNotifyWithBlock:", v3);
}

uint64_t __61__HKSPDNDConfigurationService_updateCachedMirrorsFocusModes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepFocusConfigurationUpdatingMirrorsFocusModes:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateCacheAndNotifyWithBlock:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  if (-[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__HKSPDNDConfigurationService__updateCacheAndNotifyWithBlock___block_invoke;
    v5[3] = &unk_1E4E3C570;
    v5[4] = self;
    v6 = v4;
    v7 = &v8;
    -[HKSPDNDConfigurationService _withLock:](self, "_withLock:", v5);
    if (*((_BYTE *)v9 + 24))
      -[HKSPDNDConfigurationService _notifyDelegate](self, "_notifyDelegate");

    _Block_object_dispose(&v8, 8);
  }

}

void __62__HKSPDNDConfigurationService__updateCacheAndNotifyWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3(v2, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_lock_updateCachedSleepFocusConfig:updatedSleepFocusConfig:", v4, v5);

}

- (BOOL)_lock_updateCachedSleepFocusConfig:(id)a3 updatedSleepFocusConfig:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  void *v12;
  int v14;
  HKSPDNDConfigurationService *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory(0x13uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] updatedSleepFocusConfiguration: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  HKSPLogForCategory(0x13uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] cachedSleepFocusConfiguration: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v10 = NAEqualObjects();
  if ((v10 & 1) == 0)
  {
    HKSPLogForCategory(0x13uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating cached sleep focus config: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    objc_storeStrong((id *)&self->_cachedSleepFocusConfiguration, a4);
    objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_sleepdUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeToDefaults:", v12);

  }
  return v10 ^ 1;
}

void __60__HKSPDNDConfigurationService_cachedSleepFocusConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HKSPSleepFocusModeBridgeDelegate)delegate
{
  return (HKSPSleepFocusModeBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hasSleepFocusMode:(id *)a3
{
  void *v3;
  char v4;

  -[HKSPDNDConfigurationService sleepFocusConfiguration:](self, "sleepFocusConfiguration:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSleepFocusMode");

  return v4;
}

- (id)sleepFocusConfiguration:(id *)a3
{
  return -[HKSPDNDConfigurationService _sleepFocusConfiguration:checkCache:](self, "_sleepFocusConfiguration:checkCache:", a3, -[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"));
}

- (id)_sleepFocusConfiguration:(id *)a3 checkCache:(BOOL)a4
{
  id v5;
  void *v8;
  id v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  HKSPSleepFocusConfiguration *v16;
  void *v17;
  void *v18;
  HKSPSleepFocusConfiguration *v19;
  id v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  if (a4)
  {
    if (self)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__4;
      v27 = __Block_byref_object_dispose__4;
      v28 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__HKSPDNDConfigurationService_cachedSleepFocusConfiguration__block_invoke;
      v22[3] = &unk_1E4E3AED0;
      v22[4] = self;
      v22[5] = &v23;
      -[HKSPDNDConfigurationService _withLock:](self, "_withLock:", v22);
      v5 = (id)v24[5];
      _Block_object_dispose(&v23, 8);

      return v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v21 = 0;
    -[HKSPDNDConfigurationService _uncachedModeConfiguration:](self, "_uncachedModeConfiguration:", &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    v10 = objc_msgSend(v8, "hksp_configurationState");
    v20 = 0;
    v11 = -[HKSPDNDConfigurationService _uncachedMirrorsFocusModes:](self, "_uncachedMirrorsFocusModes:", &v20);
    v12 = v20;
    v13 = v12;
    if (v9)
      v14 = v9;
    else
      v14 = v12;
    v15 = v14;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v16 = [HKSPSleepFocusConfiguration alloc];
    objc_msgSend(v8, "mode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HKSPSleepFocusConfiguration initWithUUID:mirrorsFocusModes:state:](v16, "initWithUUID:mirrorsFocusModes:state:", v18, v11, v10);

    return v19;
  }
}

- (id)_uncachedModeConfiguration:(id *)a3
{
  void *v4;
  void *v5;

  -[HKSPDNDConfigurationService modeConfigService](self, "modeConfigService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeConfigurationForModeIdentifier:error:", CFSTR("com.apple.sleep.sleep-mode"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_uncachedMirrorsFocusModes:(id *)a3
{
  void *v5;
  unint64_t v6;

  if (-[HKSPDNDConfigurationService _readGlobalConfig](self, "_readGlobalConfig"))
  {
    -[HKSPDNDConfigurationService globalConfigService](self, "globalConfigService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ((unint64_t)objc_msgSend(v5, "getPairSyncStateReturningError:", a3) >> 2) & 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)invalidate
{
  -[HKSPDNDConfigurationService _stopListeningToModeConfigService](self, "_stopListeningToModeConfigService");
  -[HKSPDNDConfigurationService _stopListeningToGlobalConfigService](self, "_stopListeningToGlobalConfigService");
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  int v5;
  NSObject *v6;
  NAScheduler *dndScheduler;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  HKSPDNDConfigurationService *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "na_any:", &__block_literal_global_13);
  HKSPLogForCategory(0x13uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveAvailableModesUpdate - hasSleepFocus: %d", buf, 0x12u);
  }

  if (-[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"))
  {
    if (v5)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_196;
      v9[3] = &unk_1E4E3C4B0;
      v9[4] = self;
      -[HKSPDNDConfigurationService _fetchUpdatedSleepFocusConfigurationWithCompletion:](self, "_fetchUpdatedSleepFocusConfigurationWithCompletion:", v9);
    }
    else
    {
      dndScheduler = self->_dndScheduler;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2;
      v8[3] = &unk_1E4E3AF48;
      v8[4] = self;
      -[NAScheduler performBlock:](dndScheduler, "performBlock:", v8);
    }
  }
  else
  {
    -[HKSPDNDConfigurationService _notifyDelegate](self, "_notifyDelegate");
  }
}

uint64_t __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.sleep.sleep-mode"));
}

void __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_196(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v3, "uuid");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "state");

    objc_msgSend(v2, "updateCachedUUID:state:", v5, v4);
  }
}

uint64_t __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCachedUUID:state:", 0, 0);
}

- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  unint64_t v5;
  NSObject *v6;
  NAScheduler *dndScheduler;
  _QWORD v8[5];
  char v9;
  uint8_t buf[4];
  HKSPDNDConfigurationService *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (a4 >> 2) & 1;
  HKSPLogForCategory(0x13uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveUpdatedPairSyncState - mirrorsFocusModes: %d", buf, 0x12u);
  }

  if (-[HKSPDNDConfigurationService _cacheSleepFocusConfig](self, "_cacheSleepFocusConfig"))
  {
    dndScheduler = self->_dndScheduler;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__HKSPDNDConfigurationService_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke;
    v8[3] = &unk_1E4E3AD30;
    v8[4] = self;
    v9 = v5;
    -[NAScheduler performBlock:](dndScheduler, "performBlock:", v8);
  }
  else
  {
    -[HKSPDNDConfigurationService _notifyDelegate](self, "_notifyDelegate");
  }
}

uint64_t __89__HKSPDNDConfigurationService_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCachedMirrorsFocusModes:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_stopListeningToModeConfigService
{
  NSObject *v3;
  void *v4;
  int v5;
  HKSPDNDConfigurationService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0x13uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop listening for mode config updates.", (uint8_t *)&v5, 0xCu);
  }

  -[HKSPDNDConfigurationService modeConfigService](self, "modeConfigService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListener:", self);

}

void __67__HKSPDNDConfigurationService__startListeningToGlobalConfigService__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory(0x13uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = WeakRetained;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully started listening for global config updates.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while listening for global config updates: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_stopListeningToGlobalConfigService
{
  NSObject *v3;
  void *v4;
  int v5;
  HKSPDNDConfigurationService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[HKSPDNDConfigurationService _readGlobalConfig](self, "_readGlobalConfig"))
  {
    HKSPLogForCategory(0x13uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop listening for global config updates.", (uint8_t *)&v5, 0xCu);
    }

    -[HKSPDNDConfigurationService globalConfigService](self, "globalConfigService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeListener:", self);

  }
}

- (void)_notifyDelegate
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  HKSPDNDConfigurationService *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0x13uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying delegate", (uint8_t *)&v8, 0xCu);
  }

  -[HKSPDNDConfigurationService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKSPDNDConfigurationService delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPDNDConfigurationService sleepFocusConfiguration:](self, "sleepFocusConfiguration:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepFocusModeBridge:didUpdateSleepFocusConfiguration:", self, v7);

  }
}

- (DNDModeConfigurationService)modeConfigService
{
  return self->_modeConfigService;
}

- (DNDGlobalConfigurationService)globalConfigService
{
  return self->_globalConfigService;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalConfigService, 0);
  objc_storeStrong((id *)&self->_modeConfigService, 0);
  objc_storeStrong((id *)&self->_dndScheduler, 0);
  objc_storeStrong((id *)&self->_cachedSleepFocusConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
