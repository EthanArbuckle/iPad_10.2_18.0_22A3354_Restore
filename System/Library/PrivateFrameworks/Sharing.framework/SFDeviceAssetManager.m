@implementation SFDeviceAssetManager

- (SFDeviceAssetManager)init
{
  SFDeviceAssetManager *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFDeviceAssetManager;
  v2 = -[SFDeviceAssetManager init](&v8, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.sharingd.device-assets-work-queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceAssetManager *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SFDeviceAssetManager_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __32__SFDeviceAssetManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_activate");
}

- (void)onqueue_activate
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Activate already called", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)logNetworkStatus
{
  void *v3;
  NSObject *v4;
  void *v5;
  CUReachabilityMonitor *v6;
  CUReachabilityMonitor *reachabilityMonitor;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SFDeviceAssetManager networkStatus](self, "networkStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    asset_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[SFDeviceAssetManager networkStatus](self, "networkStatus");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    if (IsAppleInternalBuild())
    {
      -[CUReachabilityMonitor invalidate](self->_reachabilityMonitor, "invalidate");
      v6 = (CUReachabilityMonitor *)objc_opt_new();
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v6;

      -[CUReachabilityMonitor setTimeout:](self->_reachabilityMonitor, "setTimeout:", 10.0);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://basejumper.apple.com/"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUReachabilityMonitor setDestinationURL:](self->_reachabilityMonitor, "setDestinationURL:", v8);

      -[CUReachabilityMonitor setCompletionHandler:](self->_reachabilityMonitor, "setCompletionHandler:", &__block_literal_global_26);
      -[CUReachabilityMonitor activate](self->_reachabilityMonitor, "activate");
    }
  }
  else if (IsAppleInternalBuild())
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_436;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = MGCopyAnswer();
    v11 = (void *)v10;
    v12 = CFSTR("Production");
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Network status: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFDeviceAssetManager setNetworkStatus:](self, "setNetworkStatus:", v14);
    -[SFDeviceAssetManager logNetworkStatus](self, "logNetworkStatus");
  }
}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "code") == -6743)
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  asset_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("Reachable");
    if (v6)
      v8 = (const __CFString *)v6;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Basejumper reachability: %@", (uint8_t *)&v9, 0xCu);

  }
}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_436(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v2 = (void *)WiFiCopyCurrentNetworkInfo();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ssid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Network status: Internal device connected to \"%@\"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNetworkStatus:", v4);

  if (gSFRunningInSharingD)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    v22 = 0;
    objc_msgSend((Class)getNEConfigurationManagerClass[0](), "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      dispatch_get_global_queue(0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_441;
      v14[3] = &unk_1E4830988;
      v16 = &v17;
      v8 = v7;
      v15 = v8;
      objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", v6, v14);
      v9 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v8, v9);

    }
    if (v18[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VPN: \"%@\"), v18[5]);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("no VPN");
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "networkStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ with %@"), v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNetworkStatus:", v13);

    _Block_object_dispose(&v17, 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "logNetworkStatus");

}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_441(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = objc_msgSend(v12, "count");
  if (!v5 || v6)
  {
    objc_msgSend(v12, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Failed to load due to \"%@\"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onqueue_updateMetaDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  Class v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  asset_metadata_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SFDeviceAssetManager onqueue_updateMetaDataWithCompletionHandler:]";
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  getMADownloadOptionsClass[0]();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDiscretionary:", 0);
  objc_msgSend(v6, "setAllowsCellularAccess:", 1);
  v7 = (Class)getMAAssetClass[0]();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E48309D8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[objc_class startCatalogDownload:options:then:](v7, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"), v6, v9);

}

void __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  asset_metadata_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a2;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Download meta data completed with result %d", buf, 8u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke_457;
  block[3] = &unk_1E48309B0;
  v10 = a2;
  block[4] = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

uint64_t __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke_457(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "onqueue_updateSharingManagementAssetIfNecessary");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 0);
  return result;
}

- (void)onqueue_updateSharingManagementAssetIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  -[SFDeviceAssetManager onqueue_sharingManagementAsset](self, "onqueue_sharingManagementAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getASAttributeContentVersion[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_msgSend(objc_alloc((Class)getMAAssetQueryClass[0]()), "initWithType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"));
  objc_msgSend(v8, "returnTypes:", 0);
  SFDeviceAssetAddKeyValuePair(CFSTR("Management"), CFSTR("YES"), v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke;
  v10[3] = &unk_1E4830A50;
  v10[4] = self;
  v11 = v8;
  v12 = v7;
  v9 = v8;
  objc_msgSend(v9, "queryMetaData:", v10);

}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)a1[5];
  v4 = *(NSObject **)(a1[4] + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2;
  v7[3] = &unk_1E4830A28;
  v7[1] = 3221225472;
  v10 = a2;
  v5 = v3;
  v11 = a1[6];
  v6 = a1[4];
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, v7);

}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint8_t buf[16];

  if (!*(_QWORD *)(a1 + 48))
  {
    v2 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(*v2, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 >= 2)
      {
        asset_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_2(v2, v7);

      }
      objc_msgSend(*(id *)(a1 + 32), "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSObject attributes](v9, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getASAttributeContentVersion[0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      v14 = *(_QWORD *)(a1 + 56);
      asset_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13 <= v14)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "Installed management asset is up-to-date", buf, 2u);
        }
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "Found new management catalog asset", buf, 2u);
        }

        getMADownloadOptionsClass[0]();
        v15 = objc_opt_new();
        -[NSObject setDiscretionary:](v15, "setDiscretionary:", 0);
        -[NSObject setAllowsCellularAccess:](v15, "setAllowsCellularAccess:", 1);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_461;
        v24[3] = &unk_1E4830A00;
        v24[4] = *(_QWORD *)(a1 + 40);
        -[NSObject startDownload:then:](v9, "startDownload:then:", v15, v24);
      }

    }
    else
    {
      asset_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_1(v9, v17, v18, v19, v20, v21, v22, v23);
    }

  }
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_461(uint64_t a1, uint64_t a2)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  if (a2)
  {
    v2 = a2;
    charging_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_461_cold_1(v2, v3, v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_462;
    block[3] = &unk_1E482DF78;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_462(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  asset_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded new management catalog asset", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  asset_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Updating cached management catalog asset", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "onqueue_sharingManagementAsset");
}

- (void)invalidate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFDeviceAssetManager_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__SFDeviceAssetManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidate");
}

- (void)onqueue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!self->_invalidateCalled)
    *(_WORD *)&self->_invalidateCalled = 257;
}

- (void)variantsMatchingQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  asset_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SFDeviceAssetManager variantsMatchingQuery:completionHandler:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SFDeviceAssetManager_variantsMatchingQuery_completionHandler___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(workQueue, block);

}

void __64__SFDeviceAssetManager_variantsMatchingQuery_completionHandler___block_invoke(uint64_t a1)
{
  SFDeviceAssetManager *v1;
  SEL v2;
  id v3;
  id v4;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_variantsMatchingQuery:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v1 = (SFDeviceAssetManager *)FatalErrorF();
    -[SFDeviceAssetManager onqueue_variantsMatchingQuery:completionHandler:](v1, v2, v3, v4);
  }
}

- (void)onqueue_variantsMatchingQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SFDeviceAssetManager onqueue_validateProductTypeInQuery:](self, "onqueue_validateProductTypeInQuery:", v6);
  v8 = (void *)objc_msgSend(objc_alloc((Class)getMAAssetQueryClass[0]()), "initWithType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"));
  objc_msgSend(v8, "returnTypes:", 2);
  objc_msgSend(v6, "effectiveProductType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SFDeviceAssetAddKeyValuePair(CFSTR("ProductType"), v9, v8);

  if (objc_msgSend(v6, "legacyAsset"))
  {
    if (objc_msgSend(v6, "h264"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    SFDeviceAssetAddKeyValuePair(CFSTR("H264"), v10, v8);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke;
  v13[3] = &unk_1E4830AA0;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v12, "queryMetaData:", v13);

}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_2;
  block[3] = &unk_1E482D2B8;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(a1[4], "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_3;
  v20[3] = &unk_1E4830A78;
  v6 = v2;
  v21 = v6;
  v7 = v3;
  v22 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);

  objc_msgSend(a1[4], "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_4;
  v17[3] = &unk_1E4830A78;
  v18 = v7;
  v9 = v6;
  v19 = v9;
  v10 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  objc_msgSend(a1[5], "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_5;
  v14[3] = &unk_1E482E0F0;
  v12 = a1[6];
  v15 = v9;
  v16 = v12;
  v13 = v9;
  dispatch_async(v11, v14);

}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "state") == 5)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v8, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v5 = *(void **)(a1 + 40);
    objc_msgSend(v8, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VariantName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VariantName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (*(int *)objc_msgSend(v6, "ucat") <= 50)
  {
    if (*(_DWORD *)objc_msgSend(v6, "ucat") != -1
      || (objc_msgSend(v6, "ucat"), _LogCategory_Initialize()))
    {
      objc_msgSend(v6, "ucat");
      LogPrintF();
    }
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SFDeviceAssetManager_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __78__SFDeviceAssetManager_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke(uint64_t a1)
{
  SFDeviceAssetManager *v1;
  SEL v2;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_getAssetBundleForDeviceQuery:withRequestConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v1 = (SFDeviceAssetManager *)FatalErrorF();
    -[SFDeviceAssetManager onqueue_getCachedAssetBundleForTask:](v1, v2, v3);
  }
}

- (void)onqueue_getCachedAssetBundleForTask:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;

  v21 = a3;
  -[SFDeviceAssetManager locallyCachedQueryResults](self, "locallyCachedQueryResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deviceAssetQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v21, "deviceAssetQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(int *)objc_msgSend(v10, "ucat") <= 50)
    {
      objc_msgSend(v21, "deviceAssetQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)objc_msgSend(v12, "ucat") != -1)
        goto LABEL_5;
      objc_msgSend(v21, "deviceAssetQuery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ucat");
      v16 = _LogCategory_Initialize();

      if (v16)
        goto LABEL_15;
      goto LABEL_21;
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v21, "updateTaskWithAssetURL:error:isFallback:isImperfectMatch:isCached:", v8, 0, 1, 0, 1);

  objc_msgSend(v21, "completeIfPossible");
  objc_msgSend(v21, "deviceAssetQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_DWORD *)objc_msgSend(v10, "ucat");
  if (!v9)
  {
    if (v11 <= 90)
    {
      objc_msgSend(v21, "deviceAssetQuery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)objc_msgSend(v13, "ucat") == -1)
      {
        objc_msgSend(v21, "deviceAssetQuery");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ucat");
        v20 = _LogCategory_Initialize();

        v14 = v21;
        if (!v20)
        {
LABEL_19:
          objc_msgSend(v14, "deviceAssetQuery");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDeviceAssetManager clearQueryResultFromLocalCache:](self, "clearQueryResultFromLocalCache:", v10);
          goto LABEL_20;
        }
      }
      else
      {

        v14 = v21;
      }
      objc_msgSend(v14, "deviceAssetQuery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ucat");
      LogPrintF();
    }

    v14 = v21;
    goto LABEL_19;
  }
  if (v11 > 50)
    goto LABEL_20;
  objc_msgSend(v21, "deviceAssetQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)objc_msgSend(v12, "ucat") != -1)
  {
LABEL_5:

LABEL_15:
    objc_msgSend(v21, "deviceAssetQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ucat");
    LogPrintF();
    goto LABEL_20;
  }
  objc_msgSend(v21, "deviceAssetQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ucat");
  v18 = _LogCategory_Initialize();

  if (v18)
    goto LABEL_15;
LABEL_21:

}

- (void)onqueue_getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  SFDeviceAssetTask *v9;
  void *v10;
  SFDeviceAssetTask *v11;
  _QWORD v12[4];
  SFDeviceAssetTask *v13;

  v6 = a3;
  workQueue = self->_workQueue;
  v8 = a4;
  dispatch_assert_queue_V2(workQueue);
  -[SFDeviceAssetManager onqueue_validateProductTypeInQuery:](self, "onqueue_validateProductTypeInQuery:", v6);
  v9 = [SFDeviceAssetTask alloc];
  -[SFDeviceAssetManager dispatchQueue](self, "dispatchQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFDeviceAssetTask initWithDeviceQuery:requestConfiguration:dispatchQueue:useProcessLocalCache:](v9, "initWithDeviceQuery:requestConfiguration:dispatchQueue:useProcessLocalCache:", v6, v8, v10, -[SFDeviceAssetManager useProcessLocalCache](self, "useProcessLocalCache"));

  if (-[SFDeviceAssetManager useProcessLocalCache](self, "useProcessLocalCache"))
    -[SFDeviceAssetManager onqueue_getCachedAssetBundleForTask:](self, "onqueue_getCachedAssetBundleForTask:", v11);
  if (-[SFDeviceAssetManager canUseMobileAssetSPI](self, "canUseMobileAssetSPI"))
  {
    -[SFDeviceAssetManager onqueue_executeNextMAQueryForTask:](self, "onqueue_executeNextMAQueryForTask:", v11);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__SFDeviceAssetManager_onqueue_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke;
    v12[3] = &unk_1E4830AC8;
    v13 = v11;
    -[SFDeviceAssetManager onqueue_manuallyFindFallbackAssetBundleMatchingQuery:withCompletionHandler:](self, "onqueue_manuallyFindFallbackAssetBundleMatchingQuery:withCompletionHandler:", v6, v12);

  }
}

void __86__SFDeviceAssetManager_onqueue_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cancelTimeout");
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(int *)objc_msgSend(v6, "ucat") > 50)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)objc_msgSend(v7, "ucat") != -1)
  {

LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ucat");
    LogPrintF();
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ucat");
  v9 = _LogCategory_Initialize();

  if (v9)
    goto LABEL_5;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "updateTaskWithAssetBundleURL:error:isFallback:isImperfectMatch:isCached:", v10, v5, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "completeIfPossible");

}

- (void)purgeAssetsMatchingQuery:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (*(int *)objc_msgSend(v4, "ucat") <= 50)
  {
    if (*(_DWORD *)objc_msgSend(v4, "ucat") != -1
      || (objc_msgSend(v4, "ucat"), _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "ucat");
      LogPrintF();
    }
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceAssetManager_purgeAssetsMatchingQuery___block_invoke;
  block[3] = &unk_1E482D3A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

}

void __49__SFDeviceAssetManager_purgeAssetsMatchingQuery___block_invoke(uint64_t a1)
{
  SFDeviceAssetManager *v1;
  SEL v2;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_purgeAssetsMatchingQuery:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v1 = (SFDeviceAssetManager *)FatalErrorF();
    -[SFDeviceAssetManager onqueue_purgeAssetsMatchingQuery:](v1, v2, v3);
  }
}

- (void)onqueue_purgeAssetsMatchingQuery:(id)a3
{
  id v4;
  void *v5;
  SFDeviceQueryParameters *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id obj;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SFDeviceAssetManager onqueue_validateProductTypeInQuery:](self, "onqueue_validateProductTypeInQuery:", v4);
  v5 = (void *)objc_opt_new();
  v6 = -[SFDeviceQueryParameters initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:]([SFDeviceQueryParameters alloc], "initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:", v4, 1, 0, 0);
  -[SFDeviceQueryParameters maQuery](v6, "maQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFDeviceAssetAddKeyValuePairsForStrictMatch(v4, v7);

  objc_msgSend(v5, "addObject:", v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "maQuery");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "ucat");
        objc_msgSend(v12, "queryType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v12, "fallback");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke;
        v18[3] = &unk_1E4830AF0;
        v19 = v4;
        -[SFDeviceAssetManager onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:](self, "onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:", v13, v14, v15, v16, 0, v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

void __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_DWORD *)objc_msgSend(*(id *)(a1 + 32), "ucat");
  if (v5)
  {
    if (v7 <= 50)
    {
      if (*(_DWORD *)objc_msgSend(*(id *)(a1 + 32), "ucat") != -1
        || (objc_msgSend(*(id *)(a1 + 32), "ucat"), _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 32), "ucat");
        LogPrintF();
      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke_2;
    v8[3] = &unk_1E4830A00;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "purge:", v8);

  }
  else if (v7 <= 10)
  {
    if (*(_DWORD *)objc_msgSend(*(id *)(a1 + 32), "ucat") != -1
      || (objc_msgSend(*(id *)(a1 + 32), "ucat"), _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "ucat");
      LogPrintF();
    }
  }

}

int *__57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke_2(uint64_t a1)
{
  int *result;

  result = (int *)objc_msgSend(*(id *)(a1 + 32), "ucat");
  if (*result <= 50)
  {
    if (*(_DWORD *)objc_msgSend(*(id *)(a1 + 32), "ucat") != -1
      || (objc_msgSend(*(id *)(a1 + 32), "ucat"), result = (int *)_LogCategory_Initialize(), (_DWORD)result))
    {
      objc_msgSend(*(id *)(a1 + 32), "ucat");
      return (int *)LogPrintF();
    }
  }
  return result;
}

- (id)cacheDirectory
{
  NSURL *cacheDirectory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;
  void *v13;
  NSURL *v14;
  NSObject *v15;
  NSURL *v16;
  id v18;
  unsigned __int8 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  cacheDirectory = self->_cacheDirectory;
  if (!cacheDirectory)
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.sharing"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v19);
    v11 = v19;

    if (v10)
      v12 = v11 == 0;
    else
      v12 = 1;
    if (!v12)
      goto LABEL_11;
    objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);
    v20 = *MEMORY[0x1E0CB2AE0];
    v21[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, v13, &v18);
    v14 = (NSURL *)v18;

    if (v14)
    {
      asset_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SFDeviceAssetManager cacheDirectory].cold.1();

    }
    else
    {
LABEL_11:
      v16 = v7;
      v14 = self->_cacheDirectory;
      self->_cacheDirectory = v16;
    }

    cacheDirectory = self->_cacheDirectory;
  }
  return cacheDirectory;
}

- (id)locallyCachedProductMappings
{
  NSDictionary *cachedProductMappingsTable;
  NSDictionary *v4;
  NSDictionary *v5;

  cachedProductMappingsTable = self->_cachedProductMappingsTable;
  if (!cachedProductMappingsTable)
  {
    -[SFDeviceAssetManager localCacheWithFileName:](self, "localCacheWithFileName:", CFSTR("DeviceMapping.plist"));
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedProductMappingsTable;
    self->_cachedProductMappingsTable = v4;

    cachedProductMappingsTable = self->_cachedProductMappingsTable;
  }
  return cachedProductMappingsTable;
}

- (void)storeProductMappingsInLocalCache:(id)a3
{
  -[SFDeviceAssetManager storeEntries:inLocalCacheWithFileName:](self, "storeEntries:inLocalCacheWithFileName:", a3, CFSTR("DeviceMapping.plist"));
}

- (id)locallyCachedQueryResults
{
  NSMutableDictionary *cachedQueryPaths;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;

  cachedQueryPaths = self->_cachedQueryPaths;
  if (!cachedQueryPaths)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_cachedQueryPaths;
    self->_cachedQueryPaths = v4;

    v6 = self->_cachedQueryPaths;
    -[SFDeviceAssetManager localCacheWithFileName:](self, "localCacheWithFileName:", CFSTR("QueryResults.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v7);

    cachedQueryPaths = self->_cachedQueryPaths;
  }
  return cachedQueryPaths;
}

- (void)addQueryResultToLocalCache:(id)a3 url:(id)a4 isFallback:(BOOL)a5
{
  id v8;
  NSMutableDictionary *cachedQueryPaths;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(a4, "path");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    cachedQueryPaths = self->_cachedQueryPaths;
    objc_msgSend(v17, "stringIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](cachedQueryPaths, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!a5)
      {
        v12 = v11;
        if (v12 == v8)
        {

        }
        else
        {
          v13 = v12;
          v14 = objc_msgSend(v12, "isEqual:", v8);

          if ((v14 & 1) == 0)
          {
            if (*(int *)objc_msgSend(v17, "ucat") > 50)
              goto LABEL_16;
            if (*(_DWORD *)objc_msgSend(v17, "ucat") == -1)
            {
              objc_msgSend(v17, "ucat");
              if (!_LogCategory_Initialize())
                goto LABEL_16;
            }
            goto LABEL_11;
          }
        }
      }
LABEL_17:

      goto LABEL_18;
    }
    if (*(int *)objc_msgSend(v17, "ucat") > 50)
      goto LABEL_16;
    if (*(_DWORD *)objc_msgSend(v17, "ucat") == -1)
    {
      objc_msgSend(v17, "ucat");
      if (!_LogCategory_Initialize())
        goto LABEL_16;
    }
LABEL_11:
    objc_msgSend(v17, "ucat");
    LogPrintF();
LABEL_16:
    v15 = self->_cachedQueryPaths;
    objc_msgSend(v17, "stringIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v8, v16);

    -[SFDeviceAssetManager storeEntries:inLocalCacheWithFileName:](self, "storeEntries:inLocalCacheWithFileName:", self->_cachedQueryPaths, CFSTR("QueryResults.plist"));
    goto LABEL_17;
  }
LABEL_18:

}

- (void)clearQueryResultFromLocalCache:(id)a3
{
  id v4;
  NSMutableDictionary *cachedQueryPaths;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  cachedQueryPaths = self->_cachedQueryPaths;
  v10 = v4;
  objc_msgSend(v4, "stringIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedQueryPaths, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (*(int *)objc_msgSend(v10, "ucat") <= 50)
    {
      if (*(_DWORD *)objc_msgSend(v10, "ucat") != -1
        || (objc_msgSend(v10, "ucat"), _LogCategory_Initialize()))
      {
        objc_msgSend(v10, "ucat");
        LogPrintF();
      }
    }
    v8 = self->_cachedQueryPaths;
    objc_msgSend(v10, "stringIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

    -[SFDeviceAssetManager storeEntries:inLocalCacheWithFileName:](self, "storeEntries:inLocalCacheWithFileName:", self->_cachedQueryPaths, CFSTR("QueryResults.plist"));
  }

}

- (BOOL)pathInLocalCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SFDeviceAssetManager locallyCachedQueryResults](self, "locallyCachedQueryResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)canUseMobileAssetSPI
{
  return softLinkMKBDeviceUnlockedSinceBoot[0]() == 1;
}

- (void)onqueue_manuallyFindFallbackAssetBundleMatchingQuery:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  void (**v24)(id, void *, _QWORD);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = (void (**)(id, void *, _QWORD))a4;
  if (*(int *)objc_msgSend(v5, "ucat") <= 50)
  {
    if (*(_DWORD *)objc_msgSend(v5, "ucat") != -1
      || (objc_msgSend(v5, "ucat"), _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "ucat");
      v22 = "-[SFDeviceAssetManager onqueue_manuallyFindFallbackAssetBundleMatchingQuery:withCompletionHandler:]";
      LogPrintF();
    }
  }
  v25 = v5;
  objc_msgSend(v5, "effectiveProductType", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/PreinstalledAssetsV2/RequiredByOs/com_apple_MobileAsset_SharingDeviceAssets/"), 1);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C99A90];
  v11 = *MEMORY[0x1E0C999D0];
  v34[0] = *MEMORY[0x1E0C99A90];
  v34[1] = v11;
  v34[2] = *MEMORY[0x1E0C99A00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v8;
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v12, 6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      v26 = v16;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v18);
        v28 = 0;
        objc_msgSend(v19, "getResourceValue:forKey:error:", &v28, v11, 0);
        v20 = v28;
        v27 = 0;
        objc_msgSend(v19, "getResourceValue:forKey:error:", &v27, v10, 0);
        v21 = v27;
        if (objc_msgSend(v20, "BOOLValue") && objc_msgSend(v21, "hasPrefix:", v7))
        {
          if (*(int *)objc_msgSend(v25, "ucat") <= 50)
          {
            if (*(_DWORD *)objc_msgSend(v25, "ucat") != -1
              || (objc_msgSend(v25, "ucat"), _LogCategory_Initialize()))
            {
              objc_msgSend(v25, "ucat");
              LogPrintF();
            }
          }
          v24[2](v24, v19, 0);
          v16 = v26;
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

}

- (void)onqueue_executeNextMAQueryForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  SFDeviceAssetManager *v22;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(v4, "deviceAssetQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceQueryParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "deviceQueryParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (v7)
  {
    objc_msgSend(v7, "queryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "fallback");
    objc_msgSend(v7, "maQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "ucat");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke;
    v20[3] = &unk_1E4830B18;
    v21 = v5;
    v22 = self;
    v25 = v10;
    v23 = v4;
    v24 = v7;
    -[SFDeviceAssetManager onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:](self, "onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:", v11, v12, v9, v10, 0, v20);

  }
  else
  {
    if (*(int *)objc_msgSend(v5, "ucat") <= 50)
    {
      if (*(_DWORD *)objc_msgSend(v5, "ucat") != -1
        || (objc_msgSend(v5, "ucat"), _LogCategory_Initialize()))
      {
        objc_msgSend(v5, "ucat");
        v18 = "-[SFDeviceAssetManager onqueue_executeNextMAQueryForTask:]";
        v19 = v5;
        LogPrintF();
      }
    }
    if ((objc_msgSend(v4, "queryResultCalled", v18, v19) & 1) == 0)
    {
      objc_msgSend(v4, "fallbackBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0CB2FE0];
        v26 = *MEMORY[0x1E0CB2D50];
        v27[0] = CFSTR("No assets found");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 22, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "updateTaskWithBundle:error:isFallback:isImperfectMatch:isCached:", 0, v17, 0, 0, 0);

        objc_msgSend(v4, "completeWithBundle:isFallback:isCached:", 0, 0, 0);
      }
    }
  }

}

void __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "getLocalFileUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (*(int *)objc_msgSend(*(id *)(a1 + 32), "ucat") <= 50)
    {
      if (*(_DWORD *)objc_msgSend(*(id *)(a1 + 32), "ucat") != -1
        || (objc_msgSend(*(id *)(a1 + 32), "ucat"), _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 32), "ucat");
        objc_msgSend(v5, "attributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VariantName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "useProcessLocalCache", v13))
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    objc_msgSend(*(id *)(a1 + 40), "addQueryResultToLocalCache:url:isFallback:", *(_QWORD *)(a1 + 32), v7, *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "updateTaskWithAssetURL:error:isFallback:isImperfectMatch:isCached:", v7, v6, *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "imperfectMatch"), 0);

  if (objc_msgSend(*(id *)(a1 + 48), "completeIfPossible"))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v12 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke_2;
    block[3] = &unk_1E482D3A0;
    block[4] = v10;
    v15 = v11;
    dispatch_async(v12, block);

  }
}

uint64_t __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_executeNextMAQueryForTask:", *(_QWORD *)(a1 + 40));
}

- (void)onqueue_findAssetBundleForAssetQuery:(id)a3 ucat:(LogCategory *)a4 queryType:(id)a5 fallback:(BOOL)a6 retryAttempt:(BOOL)a7 withCompletionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  int *v16;
  int *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int *v25;
  BOOL v26;
  BOOL v27;
  int v28;

  v13 = a3;
  v14 = a5;
  v15 = a8;
  v28 = 0;
  v16 = (int *)LogCategoryCreateEx();
  v17 = v16;
  if (*v16 <= 50 && (*v16 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E4830BE0;
  v21[4] = self;
  v22 = v13;
  v24 = v15;
  v25 = v17;
  v23 = v14;
  v26 = a6;
  v27 = a7;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  objc_msgSend(v20, "queryMetaData:", v21);

}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4830BB8;
  block[1] = 3221225472;
  v13 = a2;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 64);
  v9 = v5;
  v14 = v6;
  v10 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v15 = *(_WORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  dispatch_async(v4, block);

}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 64)
    || (objc_msgSend(*(id *)(a1 + 32), "results"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3))
  {
    v4 = **(_DWORD **)(a1 + 72);
    if (v4 <= 50 && (v4 != -1 || _LogCategory_Initialize()))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "results");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v5;
      v33 = objc_msgSend(v6, "count");
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "results", v32, v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "results");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_3;
      v41[3] = &unk_1E4830B68;
      v46 = *(_QWORD *)(a1 + 72);
      v42 = *(id *)(a1 + 40);
      v43 = *(id *)(a1 + 32);
      v47 = *(_BYTE *)(a1 + 80);
      v12 = *(id *)(a1 + 56);
      v44 = *(_QWORD *)(a1 + 48);
      v45 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v41);

    }
    else
    {
      v13 = *(_QWORD *)(a1 + 56);
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2FE0];
      v50 = *MEMORY[0x1E0CB2D50];
      v51[0] = CFSTR("Failed to find any assets");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v17);

    }
    return;
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 == 5)
  {
    v18 = **(_DWORD **)(a1 + 72);
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v20 = 80;
    goto LABEL_26;
  }
  if (v7 != 2 || *(_BYTE *)(a1 + 81))
  {
    v8 = **(_DWORD **)(a1 + 72);
    if (v8 <= 90)
    {
      if (v8 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_23;
        v7 = *(_QWORD *)(a1 + 64);
      }
      v32 = *(void **)(a1 + 40);
      v33 = v7;
      LogPrintF();
    }
LABEL_23:
    v20 = 14;
LABEL_26:
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2FE0];
    v48 = *MEMORY[0x1E0CB2D50];
    v23 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64), v32, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v20, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v26);

    return;
  }
  v19 = **(_DWORD **)(a1 + 72);
  if (v19 <= 50 && (v19 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v27 = *(void **)(a1 + 48);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_5;
  v34[3] = &unk_1E4830B90;
  v34[4] = v27;
  v28 = *(id *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 72);
  v35 = v28;
  v38 = v29;
  v36 = *(id *)(a1 + 40);
  v40 = *(_BYTE *)(a1 + 80);
  v30 = *(id *)(a1 + 56);
  v31 = *(_QWORD *)(a1 + 64);
  v37 = v30;
  v39 = v31;
  objc_msgSend(v27, "onqueue_updateMetaDataWithCompletionHandler:", v34);

}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  int *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = **(_DWORD **)(a1 + 64);
  if (v8 <= 50 && (v8 != -1 || _LogCategory_Initialize()))
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "assetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "state");
    objc_msgSend(v7, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection(v12);
    v35 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    v34 = v10;
    LogPrintF();

  }
  objc_msgSend(v7, "logAsset", v30, v34, v35, v36);
  objc_msgSend(*(id *)(a1 + 40), "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = objc_msgSend(v7, "state");
  if (v15 == 5)
    goto LABEL_13;
  v16 = v14 - 1;
  if (v15 != 3)
  {
    if (v15 != 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "onqueue_downloadAsset:ucat:queryLogString:withCompletionHandler:", v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
      goto LABEL_18;
    }
    if (*(_BYTE *)(a1 + 72))
    {
      v17 = **(_DWORD **)(a1 + 64);
      if (v16 == a3)
      {
        if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v7, "assetId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7);
      }
      else if (v17 <= 50 && (v17 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v7, "assetId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      goto LABEL_39;
    }
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_18:
    *a4 = 1;
    goto LABEL_39;
  }
  v18 = **(_DWORD **)(a1 + 64);
  if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v7, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection(v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(v7, "getLocalFileUrl", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21
    && objc_msgSend(*(id *)(a1 + 48), "useProcessLocalCache")
    && objc_msgSend(*(id *)(a1 + 48), "pathInLocalCache:", v21))
  {
    v22 = **(_DWORD **)(a1 + 64);
    if (v22 <= 50 && (v22 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v23 = *(int **)(a1 + 64);
    if (*v23 <= 50)
    {
      if (*v23 != -1 || (v24 = _LogCategory_Initialize(), v23 = *(int **)(a1 + 64), v24))
      {
        LogPrintF();
        v23 = *(int **)(a1 + 64);
      }
    }
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_4;
    v37[3] = &unk_1E4830B40;
    v39 = v23;
    v38 = v7;
    objc_msgSend(v38, "purge:", v37);

  }
  if (v16 == a3)
  {
    v25 = *(_QWORD *)(a1 + 56);
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2FE0];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Failed to find any still valid assets");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 79, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v29);

  }
LABEL_39:

}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  int v1;
  void *v3;

  v1 = **(_DWORD **)(a1 + 40);
  if (v1 <= 50 && (v1 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_5(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), 1, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = **(_DWORD **)(a1 + 64);
    if (v3 <= 60 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = *(_QWORD *)(a1 + 56);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2FE0];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v9);

  }
}

- (void)onqueue_downloadAsset:(id)a3 ucat:(LogCategory *)a4 queryLogString:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  LogCategory *v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  getMADownloadOptionsClass[0]();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDiscretionary:", 0);
  objc_msgSend(v13, "setAllowsCellularAccess:", 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E4830C30;
  v20 = v12;
  v21 = a4;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v14, "startDownload:then:", v13, v17);

}

void __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4830C08;
  v5 = *(_QWORD *)(a1 + 64);
  v10 = a2;
  v11 = v5;
  v7 = v3;
  v9 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = **(_DWORD **)(a1 + 64);
  if (v2)
  {
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 56), v4))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = v2;
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 56);
      }
    }
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2FE0];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 35, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v10);

  }
  else
  {
    if (v3 <= 50 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
}

- (void)onqueue_validateProductTypeInQuery:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  id v7;
  id v8;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(v5, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceAssetManager onqueue_mappedProductTypeForProductType:](self, "onqueue_mappedProductTypeForProductType:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    v7 = v8;
  else
    v7 = 0;
  objc_msgSend(v5, "setMappedProductType:", v7);

}

- (void)mappedProductTypeForProductType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  asset_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SFDeviceAssetManager mappedProductTypeForProductType:completionHandler:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFDeviceAssetManager_mappedProductTypeForProductType_completionHandler___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(workQueue, block);

}

void __74__SFDeviceAssetManager_mappedProductTypeForProductType_completionHandler___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFDeviceAssetManager *v6;
  SEL v7;
  id v8;
  id v9;

  v2 = (_BYTE *)a1[4];
  if (v2[16])
  {
    objc_msgSend(v2, "onqueue_mappedProductTypeForProductType:", a1[5]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = a1[6];
    v4 = objc_msgSend(v9, "length");
    v5 = v9;
    if (!v4)
      v5 = (id)a1[5];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
  else
  {
    v6 = (SFDeviceAssetManager *)FatalErrorF();
    -[SFDeviceAssetManager onqueue_mappedProductTypeForProductType:](v6, v7, v8);
  }
}

- (id)onqueue_mappedProductTypeForProductType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SFDeviceAssetManager hardcodedMappedProducts](self, "hardcodedMappedProducts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    asset_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      v8 = "Mapped product type using hardcoded mapping %@ => %@";
LABEL_11:
      _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (-[SFDeviceAssetManager useProcessLocalCache](self, "useProcessLocalCache"))
  {
    -[SFDeviceAssetManager locallyCachedProductMappings](self, "locallyCachedProductMappings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      asset_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v6;
        v8 = "Mapped product type using cached mapping %@ => %@";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:](self, "onqueue_assetMappedProductTypeForProductType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    asset_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      v8 = "Mapped product type using remote mapping %@ => %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (id)onqueue_sharingManagementAsset
{
  MAAsset *deviceAssetManagement;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MAAsset *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  deviceAssetManagement = self->_deviceAssetManagement;
  if (!deviceAssetManagement)
  {
    if (!-[SFDeviceAssetManager canUseMobileAssetSPI](self, "canUseMobileAssetSPI"))
    {
      v8 = 0;
      return v8;
    }
    v4 = (void *)objc_msgSend(objc_alloc((Class)getMAAssetQueryClass[0]()), "initWithType:", CFSTR("com.apple.MobileAsset.SharingDeviceAssets"));
    objc_msgSend(v4, "returnTypes:", 1);
    SFDeviceAssetAddKeyValuePair(CFSTR("Management"), CFSTR("YES"), v4);
    if (!objc_msgSend(v4, "queryMetaDataSync"))
    {
      objc_msgSend(v4, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke;
      v11[3] = &unk_1E4830C58;
      v11[4] = self;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

      objc_msgSend(v4, "results");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_2;
      v10[3] = &unk_1E4830C58;
      v10[4] = self;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    }
    deviceAssetManagement = self->_deviceAssetManagement;
  }
  v8 = deviceAssetManagement;
  return v8;
}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getASAttributeContentVersion[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v12, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getASAttributeContentVersion[0]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 > v7)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);

}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) & 1) == 0
    && objc_msgSend(v3, "state") != 5)
  {
    objc_msgSend(v3, "purge:", &__block_literal_global_529);
  }

}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  asset_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Purging of old management asset completed with result %d", (uint8_t *)v4, 8u);
  }

}

- (id)onqueue_assetMappedProductTypeForProductType:(id)a3
{
  id v4;
  NSDictionary *productTypesMappingTable;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  productTypesMappingTable = self->_productTypesMappingTable;
  if (!productTypesMappingTable)
  {
    -[SFDeviceAssetManager onqueue_sharingManagementAsset](self, "onqueue_sharingManagementAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceAssetManager hardcodedMappedProducts](self, "hardcodedMappedProducts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v6, "getLocalFileUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("DeviceMapping.plist"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v19 = v6;
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 0, &v21);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v21;
      if (v11)
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v20);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v20;

        if (v13)
        {
          objc_msgSend(v8, "addEntriesFromDictionary:", v13);
          asset_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = -[NSObject count](v13, "count");
            *(_DWORD *)buf = 136315394;
            v23 = "-[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]";
            v24 = 1024;
            v25 = v16;
            _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "%s Loaded mapping table with %d entries", buf, 0x12u);
          }
        }
        else
        {
          asset_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:].cold.3();
        }

      }
      else
      {
        asset_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:].cold.2();
        v14 = v12;
      }

      v6 = v19;
    }
    else
    {
      asset_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:].cold.1();
      v14 = 0;
    }

    objc_storeStrong((id *)&self->_productTypesMappingTable, v8);
    if (-[SFDeviceAssetManager useProcessLocalCache](self, "useProcessLocalCache"))
      -[SFDeviceAssetManager storeProductMappingsInLocalCache:](self, "storeProductMappingsInLocalCache:", v8);

    productTypesMappingTable = self->_productTypesMappingTable;
  }
  -[NSDictionary objectForKeyedSubscript:](productTypesMappingTable, "objectForKeyedSubscript:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)hardcodedMappedProducts
{
  if (hardcodedMappedProducts_onceToken != -1)
    dispatch_once(&hardcodedMappedProducts_onceToken, &__block_literal_global_532);
  return (id)hardcodedMappedProducts_hardcodedMappedProducts;
}

void __47__SFDeviceAssetManager_hardcodedMappedProducts__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _QWORD v24[30];
  _QWORD v25[32];

  v25[30] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("AudioAccessory1,1");
  v24[1] = CFSTR("Device1,8194");
  v25[0] = &stru_1E483B8E8;
  v25[1] = CFSTR("AirPods1,1");
  v24[2] = CFSTR("Device1,8195");
  v24[3] = CFSTR("Device1,8197");
  v25[2] = CFSTR("PowerBeats3,1");
  v25[3] = CFSTR("BeatsX1,1");
  v24[4] = CFSTR("Device1,8198");
  v24[5] = CFSTR("Device1,8199");
  v25[4] = CFSTR("BeatsSolo3,1");
  v25[5] = CFSTR("BeatsStudio3,1");
  v24[6] = CFSTR("Device1,8201");
  v24[7] = CFSTR("Device1,8203");
  v25[6] = CFSTR("BeatsStudio3,2");
  v25[7] = CFSTR("PowerbeatsPro1,1");
  v24[8] = CFSTR("Device1,8206");
  v24[9] = CFSTR("Device1,8207");
  v25[8] = CFSTR("AirPodsPro1,1");
  v25[9] = CFSTR("AirPods1,2");
  v24[10] = CFSTR("Device1,8209");
  v24[11] = CFSTR("Device1,65536");
  v25[10] = CFSTR("BeatsStudioBuds1,1");
  v25[11] = CFSTR("AirPods1,2");
  v24[12] = CFSTR("Device1,8205");
  v24[13] = CFSTR("AirTag1,1");
  v25[12] = CFSTR("Powerbeats4,1");
  v25[13] = &stru_1E483B8E8;
  v24[14] = CFSTR("Device1,8204");
  v24[15] = CFSTR("Device1,8202");
  v25[14] = CFSTR("BeatsSoloPro1,1");
  v25[15] = CFSTR("AirPodsMax1,1");
  v24[16] = CFSTR("Device1,8208");
  v24[17] = CFSTR("AudioAccessory5,1");
  v25[16] = CFSTR("BeatsX2,1");
  v25[17] = &stru_1E483B8E8;
  +[SFHeadphoneProduct b688](SFHeadphoneProduct, "b688");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bluetoothModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v22;
  v25[18] = CFSTR("AirPods1,3");
  +[SFHeadphoneProduct b768e](SFHeadphoneProduct, "b768e");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bluetoothModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[19] = v20;
  v25[19] = CFSTR("AirPods1,4");
  +[SFHeadphoneProduct b768m](SFHeadphoneProduct, "b768m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bluetoothModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[20] = v18;
  v25[20] = CFSTR("AirPods1,5");
  +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bluetoothModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[21] = v16;
  v25[21] = CFSTR("BeatsFitPro1,1");
  +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bluetoothModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[22] = v14;
  v24[23] = CFSTR("Device1,8228");
  v25[22] = CFSTR("AirPodsPro1,2");
  v25[23] = CFSTR("AirPodsPro1,2");
  +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bluetoothModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[24] = v12;
  v25[24] = CFSTR("BeatsStudioBuds1,2");
  +[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bluetoothModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[25] = v1;
  v25[25] = CFSTR("BeatsSoloBuds1,1");
  +[SFHeadphoneProduct b453](SFHeadphoneProduct, "b453");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bluetoothModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[26] = v3;
  v25[26] = CFSTR("BeatsStudioPro1,1");
  +[SFHeadphoneProduct b465](SFHeadphoneProduct, "b465");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bluetoothModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[27] = v5;
  v25[27] = CFSTR("BeatsSolo4,1");
  +[SFHeadphoneProduct b487](SFHeadphoneProduct, "b487");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bluetoothModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[28] = v7;
  v25[28] = CFSTR("BeatsPill1,2");
  +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bluetoothModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[29] = v9;
  v25[29] = CFSTR("PowerbeatsPro2,1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 30);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)hardcodedMappedProducts_hardcodedMappedProducts;
  hardcodedMappedProducts_hardcodedMappedProducts = v10;

}

- (id)localCacheWithFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int CanAccessURL;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFDeviceAssetManager cacheDirectory](self, "cacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  CanAccessURL = SFDeviceAssetProcessCanAccessURL(v6, (uint64_t)&v18);
  v8 = v18;
  if (CanAccessURL)
  {
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 0, &v17);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v17;

    if (v9)
    {
      v15 = 0;
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, &v16, &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;

      if (objc_msgSend(v11, "count"))
      {
        asset_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 67109378;
          v20 = v13;
          v21 = 2112;
          v22 = v4;
          _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "Loaded %d %@ entries from cache", buf, 0x12u);
        }

LABEL_18:
        goto LABEL_19;
      }

    }
    else
    {
      v8 = v10;
    }

  }
  if (v8 && objc_msgSend(v8, "code") != -1100 && objc_msgSend(v8, "code") != 260 && objc_msgSend(v8, "code") != 4)
  {
    asset_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFDeviceAssetManager localCacheWithFileName:].cold.1();
    v11 = 0;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (void)storeEntries:(id)a3 inLocalCacheWithFileName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  asset_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v19 = objc_msgSend(v6, "count");
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Persisting %d entries to %@ cache", buf, 0x12u);
  }

  -[SFDeviceAssetManager cacheDirectory](self, "cacheDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v16 = 0;
    objc_msgSend(v11, "writeToURL:options:error:", v10, 0x10000000, &v16);
    v13 = v16;
    if (v13)
    {
      v14 = v13;
      asset_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SFDeviceAssetManager storeEntries:inLocalCacheWithFileName:].cold.1();

    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)useProcessLocalCache
{
  return self->_useProcessLocalCache;
}

- (void)setUseProcessLocalCache:(BOOL)a3
{
  self->_useProcessLocalCache = a3;
}

- (NSString)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(id)a3
{
  objc_storeStrong((id *)&self->_networkStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStatus, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cachedQueryPaths, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_cachedProductMappingsTable, 0);
  objc_storeStrong((id *)&self->_productTypesMappingTable, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_deviceAssetManagement, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Failed to find any management catalog asset", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109120;
  v5[1] = objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_8(&dword_1A2830000, a2, v4, "Found %d management catalog assets", (uint8_t *)v5);

  OUTLINED_FUNCTION_3();
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_461_cold_1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_8(&dword_1A2830000, a2, a3, "Failed to download the new management asset with result %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_5();
}

- (void)cacheDirectory
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v3, "Failed to get cache directory at path %@ (%@)", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v1, "%s Failed to get URL to mapping file for asset %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v1, "%s Failed to load mapping data (%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5_1();
  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]";
  v5 = 2048;
  v6 = objc_msgSend(v2, "length");
  v7 = 2112;
  v8 = v1;
  _os_log_error_impl(&dword_1A2830000, v0, OS_LOG_TYPE_ERROR, "%s Failed create mappings with data of size %ld (%@)", (uint8_t *)&v3, 0x20u);
}

- (void)localCacheWithFileName:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v3, "Failed to load local cache at path %@ (%@)", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)storeEntries:inLocalCacheWithFileName:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_5_1();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v3, "Failed to persist local cached entries to path %@ (%@)", v4);

  OUTLINED_FUNCTION_5_0();
}

@end
