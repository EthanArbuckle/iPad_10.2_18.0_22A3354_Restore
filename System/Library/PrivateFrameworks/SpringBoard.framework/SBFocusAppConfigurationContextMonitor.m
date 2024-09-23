@implementation SBFocusAppConfigurationContextMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25 != -1)
    dispatch_once(&sharedInstance_onceToken_25, &__block_literal_global_173);
  return (id)sharedInstance_monitor;
}

void __55__SBFocusAppConfigurationContextMonitor_sharedInstance__block_invoke()
{
  SBFocusAppConfigurationContextMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SBFocusAppConfigurationContextMonitor);
  v1 = (void *)sharedInstance_monitor;
  sharedInstance_monitor = (uint64_t)v0;

}

- (SBFocusAppConfigurationContextMonitor)init
{
  SBFocusAppConfigurationContextMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSDictionary *lock_prefixes;
  uint64_t v8;
  DNDModeConfigurationService *configurationService;
  NSObject *v10;
  _QWORD block[4];
  SBFocusAppConfigurationContextMonitor *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFocusAppConfigurationContextMonitor;
  v2 = -[SBFocusAppConfigurationContextMonitor init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.springboard.focusappconfigurationcontextmonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v2->_lock);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    lock_prefixes = v2->_lock_prefixes;
    v2->_lock_prefixes = (NSDictionary *)v6;

    os_unfair_lock_unlock(&v2->_lock);
    objc_msgSend(MEMORY[0x1E0D1D688], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.focusappconfigurationcontextmonitor"));
    v8 = objc_claimAutoreleasedReturnValue();
    configurationService = v2->_configurationService;
    v2->_configurationService = (DNDModeConfigurationService *)v8;

    v10 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SBFocusAppConfigurationContextMonitor_init__block_invoke;
    block[3] = &unk_1E8E9DED8;
    v13 = v2;
    dispatch_async(v10, block);

  }
  return v2;
}

void __45__SBFocusAppConfigurationContextMonitor_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addListener:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v12 = 0;
  objc_msgSend(v2, "getAppConfigurationTargetContentIdentifierPrefixesForCurrentModeReturningError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePrefixes:", v3);
  }
  else
  {
    SBLogFocusModes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (id)targetContentIdentifierPrefixForBundleIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSDictionary objectForKey:](self->_lock_prefixes, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)modeConfigurationService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __123__SBFocusAppConfigurationContextMonitor_modeConfigurationService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __123__SBFocusAppConfigurationContextMonitor_modeConfigurationService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v13 = 0;
  objc_msgSend(v3, "getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:", v2, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePrefixes:", v4);
  }
  else
  {
    SBLogFocusModes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)_updatePrefixes:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *lock_prefixes;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "bundleID", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v5, "setObject:forKey:", v14, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  v15 = (NSDictionary *)objc_msgSend(v5, "copy");
  lock_prefixes = self->_lock_prefixes;
  self->_lock_prefixes = v15;

  os_unfair_lock_unlock(&self->_lock);
  SBLogFocusModes();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "FocusAppConfigurationContextMonitor updated prefixes. prefixes=%@", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationService, 0);
  objc_storeStrong((id *)&self->_lock_prefixes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__SBFocusAppConfigurationContextMonitor_init__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "FocusAppConfigurationContextMonitor error fetching target content identifier prefixes. error=%@", a5, a6, a7, a8, 2u);
}

@end
