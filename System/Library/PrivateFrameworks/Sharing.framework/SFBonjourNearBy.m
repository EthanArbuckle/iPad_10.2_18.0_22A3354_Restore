@implementation SFBonjourNearBy

- (SFBonjourNearBy)initWithQueue:(id)a3
{
  id v5;
  SFBonjourNearBy *v6;
  SFBonjourNearBy *v7;
  NSMutableSet *v8;
  NSMutableSet *advertiserAdvs;
  NSMutableDictionary *v10;
  NSMutableDictionary *advToBrowserNwToSFendpoints;
  NSMutableDictionary *v12;
  NSMutableDictionary *advToBrowserUuidToSFendpoints;
  NSMutableDictionary *v14;
  NSMutableDictionary *browserToAdvNwToSFendpoints;
  NSMutableDictionary *v16;
  NSMutableDictionary *browserToAdvUuidToSFendpoints;
  uint64_t v18;
  NSMutableSet *resultChanges;
  uint64_t v20;
  NSString *localAdvertiserUUIDString;
  uint64_t v22;
  NSString *localBrowserUUIDString;
  NSObject *v24;
  NSString *v25;
  NSString *v26;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFBonjourNearBy;
  v6 = -[SFBonjourNearBy init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    advertiserAdvs = v7->_advertiserAdvs;
    v7->_advertiserAdvs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    advToBrowserNwToSFendpoints = v7->_advToBrowserNwToSFendpoints;
    v7->_advToBrowserNwToSFendpoints = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    advToBrowserUuidToSFendpoints = v7->_advToBrowserUuidToSFendpoints;
    v7->_advToBrowserUuidToSFendpoints = v12;

    v7->_advertiserState = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    browserToAdvNwToSFendpoints = v7->_browserToAdvNwToSFendpoints;
    v7->_browserToAdvNwToSFendpoints = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    browserToAdvUuidToSFendpoints = v7->_browserToAdvUuidToSFendpoints;
    v7->_browserToAdvUuidToSFendpoints = v16;

    v7->_browserState = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    resultChanges = v7->_resultChanges;
    v7->_resultChanges = (NSMutableSet *)v18;

    -[SFBonjourNearBy randomUUID](v7, "randomUUID");
    v20 = objc_claimAutoreleasedReturnValue();
    localAdvertiserUUIDString = v7->_localAdvertiserUUIDString;
    v7->_localAdvertiserUUIDString = (NSString *)v20;

    -[SFBonjourNearBy randomUUID](v7, "randomUUID");
    v22 = objc_claimAutoreleasedReturnValue();
    localBrowserUUIDString = v7->_localBrowserUUIDString;
    v7->_localBrowserUUIDString = (NSString *)v22;

    daemon_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v7->_localAdvertiserUUIDString;
      v26 = v7->_localBrowserUUIDString;
      *(_DWORD *)buf = 138412546;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_1A2830000, v24, OS_LOG_TYPE_DEFAULT, "LocalAdvID %@, LocalBrowserID: %@", buf, 0x16u);
    }

  }
  return v7;
}

- (id)randomUUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getUniqueServiceNameForAdvertiser
{
  void *v2;
  void *v3;

  -[NSString lowercaseString](self->_localAdvertiserUUIDString, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringWithRange:", 12, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_startAdvertiser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Unable to start SFBonjourNearbyAdvertiser", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 67109120;
      v20[1] = a2;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "advertiser state handler with state %d", (uint8_t *)v20, 8u);
    }

    if (v6)
    {
      daemon_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_2();

    }
    switch(a2)
    {
      case 4:
        daemon_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20[0]) = 0;
          _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "advertiser cancelled", (uint8_t *)v20, 2u);
        }

        objc_msgSend(WeakRetained, "setListener:", 0);
        objc_msgSend(WeakRetained, "_cleanupAdvertiser");
        v14 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (v14)
          v12 = (uint64_t)nw_error_copy_cf_error(v14);
        else
          v12 = 0;
        objc_msgSend(WeakRetained, "advertisingStateUpdateHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(WeakRetained, "advertisingStateUpdateHandler");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v17[2](v17, 0, v12);

        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = 0;

        goto LABEL_26;
      case 3:
        daemon_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_1();

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
        objc_msgSend(WeakRetained, "listener");
        v12 = objc_claimAutoreleasedReturnValue();
        nw_listener_cancel((nw_listener_t)v12);
        goto LABEL_26;
      case 2:
        daemon_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20[0]) = 0;
          _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "advertiser is ready", (uint8_t *)v20, 2u);
        }

        objc_msgSend(WeakRetained, "setAdvertiserState:", 2);
        objc_msgSend(WeakRetained, "advertisingStateUpdateHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(WeakRetained, "advertisingStateUpdateHandler");
          v12 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, 1, 0);
LABEL_26:

        }
        break;
    }
  }

}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnection:isAdvToBrowserConnection:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  daemon_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "New Adv to browser connection %@ (endpoint %@)", (uint8_t *)&v7, 0x16u);
  }

}

- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFBonjourNearBy_startAdvertisingWithData_completionHandler___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

void __62__SFBonjourNearBy_startAdvertisingWithData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "advertiserAdvs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Already advertising for advData %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "advertiserAdvs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

    daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Starting advertising with advData %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = objc_msgSend(*(id *)(a1 + 32), "advertiserState");
    v10 = *(_BYTE **)(a1 + 32);
    if (v9 == 3)
    {
      v10[25] = 1;
    }
    else
    {
      v11 = objc_msgSend(v10, "advertiserState");
      v12 = *(void **)(a1 + 32);
      if (v11 == 2)
        objc_msgSend(v12, "_sendAdvMessageWithData:isStart:completionHandler:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
      else
        objc_msgSend(v12, "_startAdvertiser");
    }
  }
}

- (void)_stopAdvertising
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[SFBonjourNearBy advertiserState](self, "advertiserState") == 2)
  {
    -[SFBonjourNearBy setAdvertiserState:](self, "setAdvertiserState:", 3);
    nw_listener_cancel((nw_listener_t)self->_listener);
  }
  else
  {
    daemon_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[SFBonjourNearBy advertiserState](self, "advertiserState");
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Unable to stop advertiser, invalid state : %d", (uint8_t *)v4, 8u);
    }

  }
}

- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SFBonjourNearBy_stopAdvertisingForData_completionHandler___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

  return 1;
}

uint64_t __60__SFBonjourNearBy_stopAdvertisingForData_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t result;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "containsObject:", *(_QWORD *)(a1 + 40));
  daemon_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Stop advertising for advData %@", (uint8_t *)&v9, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "advertiserState") == 2)
      objc_msgSend(*(id *)(a1 + 32), "_sendAdvMessageWithData:isStart:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count");
    if (!result)
    {
      daemon_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "No more advertisements, stopping advertiser completely.", (uint8_t *)&v9, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
      return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertising");
    }
  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Unable to stop advertising for advData %@", (uint8_t *)&v9, 0xCu);
    }

    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), 0);
  }
  return result;
}

- (void)_cleanupAdvertiser
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[SFBonjourNearBy advertiserState](self, "advertiserState"))
  {
    daemon_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up the advertiser", v5, 2u);
    }

    -[SFBonjourNearBy advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_51);

    -[SFBonjourNearBy _updateAdvertiserState](self, "_updateAdvertiserState");
  }
}

void __37__SFBonjourNearBy__cleanupAdvertiser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "isConnected") & 1) == 0)
    objc_msgSend(v3, "cancel");

}

- (void)_updateAdvertiserState
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[SFBonjourNearBy advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_109);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count") && !self->_listener)
  {
    -[SFBonjourNearBy setAdvertiserState:](self, "setAdvertiserState:", 0);
    if (self->_shouldRestartAdvertising)
    {
      self->_shouldRestartAdvertising = 0;
      -[SFBonjourNearBy _startAdvertiser](self, "_startAdvertiser");
    }
  }

}

uint64_t __41__SFBonjourNearBy__updateAdvertiserState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isConnected") ^ 1;
}

- (void)_startBrowser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Unable to start the browser", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __32__SFBonjourNearBy__startBrowser__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  daemon_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "nw_browser_state_t changed:%d error:%@", (uint8_t *)v12, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 - 2) >= 2)
    {
      if (a2 == 1)
      {
        objc_msgSend(WeakRetained, "setBrowserState:", 2);
        daemon_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "SFbonjourNearbyBrowser successfully started", (uint8_t *)v12, 2u);
        }

        objc_msgSend(v8, "deviceDidStartScanning");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "deviceDidStartScanning");
          v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v11[2](v11, 0);

        }
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "setBrowser:", 0);
      objc_msgSend(v8, "_cleanupBrowser");
    }
  }

}

void __32__SFBonjourNearBy__startBrowser__block_invoke_110(uint64_t a1, void *a2, void *a3, int a4)
{
  NSObject *v7;
  id WeakRetained;
  nw_browse_result_change_t changes;
  SFBonjourBrowserResultChanges *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *old_result;

  old_result = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    changes = nw_browse_result_get_changes(old_result, v7);
    if (changes >= 2)
    {
      v10 = -[SFBonjourBrowserResultChanges initWithOldResult:freshResult:change:]([SFBonjourBrowserResultChanges alloc], "initWithOldResult:freshResult:change:", old_result, v7, changes);
      objc_msgSend(WeakRetained, "resultChanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

      if (a4)
      {
        objc_msgSend(WeakRetained, "resultChanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        objc_msgSend(WeakRetained, "resultChanges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeAllObjects");

        objc_msgSend(WeakRetained, "handleBrowseResults:", v13);
      }

    }
  }

}

- (BOOL)startDiscovery
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFBonjourNearBy_startDiscovery__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(serialQueue, block);
  return 1;
}

_BYTE *__33__SFBonjourNearBy_startDiscovery__block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *result;
  int v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "browserState");
  result = *(_BYTE **)(a1 + 32);
  if (v2 == 3)
  {
    result[24] = 1;
  }
  else
  {
    v4 = objc_msgSend(result, "browserState");
    v5 = *(void **)(a1 + 32);
    if (v4 == 2)
      return (_BYTE *)objc_msgSend(v5, "_reportCachedDiscoveryResults");
    else
      return (_BYTE *)objc_msgSend(v5, "_startBrowser");
  }
  return result;
}

- (void)_stopBrowser
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[SFBonjourNearBy browserState](self, "browserState") == 2)
  {
    -[SFBonjourNearBy setBrowserState:](self, "setBrowserState:", 3);
    nw_browser_cancel((nw_browser_t)self->_browser);
  }
  else
  {
    daemon_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[SFBonjourNearBy browserState](self, "browserState");
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "StopBrowser is not stopping. current browser state %d", (uint8_t *)v4, 8u);
    }

  }
}

- (void)stopDiscovery
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SFBonjourNearBy_stopDiscovery__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __32__SFBonjourNearBy_stopDiscovery__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_stopBrowser");
}

- (void)_reportCachedDiscoveryResults
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke;
  v4[3] = &unk_1E482E2A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "browserState") == 2;
    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "browserToAdvNwToSFendpoints");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke_2;
      v5[3] = &unk_1E48331C8;
      v5[4] = v4;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

      WeakRetained = v4;
    }
  }

}

void __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "deviceFoundHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceFoundHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v11, "remoteUniqueIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
    objc_msgSend(v11, "remoteAdvDataSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v5)[2](v5, v8, v10);

  }
}

- (void)_cleanupBrowser
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  if (-[SFBonjourNearBy browserState](self, "browserState"))
  {
    daemon_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up browser", v7, 2u);
    }

    -[SFBonjourNearBy browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_113_0);

    -[SFBonjourNearBy _updateBrowserState](self, "_updateBrowserState");
    -[SFBonjourNearBy deviceDidStopScanning](self, "deviceDidStopScanning");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SFBonjourNearBy deviceDidStopScanning](self, "deviceDidStopScanning");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0);

    }
  }
}

void __34__SFBonjourNearBy__cleanupBrowser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "isConnected") & 1) == 0)
    objc_msgSend(v3, "cancel");

}

- (void)_updateBrowserState
{
  void *v3;
  id v4;

  -[SFBonjourNearBy browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_114_1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count") && !self->_browser)
  {
    -[SFBonjourNearBy setBrowserState:](self, "setBrowserState:", 0);
    if (self->_shouldRestartBrowsing)
    {
      self->_shouldRestartBrowsing = 0;
      -[SFBonjourNearBy _startBrowser](self, "_startBrowser");
    }
  }

}

uint64_t __38__SFBonjourNearBy__updateBrowserState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isConnected") ^ 1;
}

- (void)handleBrowseResults:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138412290;
    v23 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v10, "change", v23) & 2) != 0)
        {
          objc_msgSend(v10, "freshResult");
          v16 = objc_claimAutoreleasedReturnValue();
          v12 = nw_browse_result_copy_endpoint(v16);

          if (!-[SFBonjourNearBy isLocalEndpoint:](self, "isLocalEndpoint:", v12))
          {
            -[SFBonjourNearBy browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            daemon_log();
            v14 = objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v19)
              {
                *(_DWORD *)buf = v23;
                v29 = v12;
                _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate endpoint %@", buf, 0xCu);
              }
            }
            else
            {
              if (v19)
              {
                *(_DWORD *)buf = 138412546;
                v29 = v12;
                v30 = 2048;
                v31 = v12;
                _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "Found endpoint %@, (%p)", buf, 0x16u);
              }

              +[SFBonjourEndpoint createConnectionParameters](SFBonjourEndpoint, "createConnectionParameters");
              v20 = objc_claimAutoreleasedReturnValue();
              v14 = nw_connection_create(v12, v20);

              -[SFBonjourNearBy _handleConnection:isAdvToBrowserConnection:](self, "_handleConnection:isAdvToBrowserConnection:", v14, 0);
              v21 = objc_claimAutoreleasedReturnValue();
              daemon_log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v29 = v14;
                v30 = 2112;
                v31 = v21;
                _os_log_impl(&dword_1A2830000, v22, OS_LOG_TYPE_DEFAULT, "New Browser to Adv connection %@ (endpoint %@)", buf, 0x16u);
              }

            }
            goto LABEL_21;
          }
        }
        else
        {
          if ((objc_msgSend(v10, "change") & 4) == 0)
            continue;
          objc_msgSend(v10, "oldResult");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = nw_browse_result_copy_endpoint(v11);

          if (!-[SFBonjourNearBy isLocalEndpoint:](self, "isLocalEndpoint:", v12))
          {
            -[SFBonjourNearBy browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v12);
            v14 = objc_claimAutoreleasedReturnValue();

            daemon_log();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              v30 = 2112;
              v31 = v14;
              _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "Removing endpoint %@ %@", buf, 0x16u);
            }

            -[NSObject cancel](v14, "cancel");
LABEL_21:

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

}

- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  SFBonjourEndpoint *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  SFBonjourEndpoint *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;
  id from;
  id location[2];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    v7 = 40;
    if (v4)
      v7 = 32;
    v8 = *(id *)((char *)&self->super.isa + v7);
    v9 = -[SFBonjourEndpoint initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:]([SFBonjourEndpoint alloc], "initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:", v6, v4, v8, self->_serialQueue);
    if (v9)
    {
      v10 = nw_connection_copy_endpoint(v6);
      if (v4)
        -[SFBonjourNearBy advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints");
      else
        -[SFBonjourNearBy browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v9, v10);

      location[0] = 0;
      objc_initWeak(location, self);
      from = 0;
      objc_initWeak(&from, v9);
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke;
      v21[3] = &unk_1E4833230;
      objc_copyWeak(&v22, &from);
      objc_copyWeak(&v23, location);
      v24 = v4;
      -[SFBonjourEndpoint setDidConnectHandler:](v9, "setDidConnectHandler:", v21);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2;
      v18[3] = &unk_1E4833258;
      objc_copyWeak(&v19, location);
      objc_copyWeak(&v20, &from);
      -[SFBonjourEndpoint setDidDisconnectHandler:](v9, "setDidDisconnectHandler:", v18);
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124;
      v15[3] = &unk_1E4833280;
      objc_copyWeak(&v16, location);
      objc_copyWeak(&v17, &from);
      -[SFBonjourEndpoint setDidReceiveDataHandler:](v9, "setDidReceiveDataHandler:", v15);
      v13 = v9;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
    else
    {
      daemon_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFBonjourNearBy _handleConnection:isAdvToBrowserConnection:].cold.2();
    }

  }
  else
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFBonjourNearBy _handleConnection:isAdvToBrowserConnection:].cold.1(v4, v8);
    v9 = 0;
  }

  return v9;
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "remoteUniqueIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    daemon_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!v4)
    {
      if (v6)
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_1();
      goto LABEL_13;
    }
    if (v6)
      __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_2(WeakRetained, v5);

    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "advToBrowserUuidToSFendpoints");
    else
      objc_msgSend(v3, "browserToAdvUuidToSFendpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "remoteUniqueIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", WeakRetained, v8);

    if (objc_msgSend(WeakRetained, "isAdvToBrowserConnection"))
    {
      objc_msgSend(v3[20], "allObjects");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "remoteUniqueIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_sendMessage:withType:toDevice:completionCallback:", v5, CFSTR("SFBonjourNearbyMessageTypeStartAdvertiseData"), v9, &__block_literal_global_123);

LABEL_13:
    }
  }

}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
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

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (!WeakRetained || !v3)
    goto LABEL_20;
  daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2_cold_1(v4, v5);

  objc_msgSend(v4, "remoteUniqueIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "deviceDidDisconnectHandler");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v4, "isConnected");

      if (v9)
      {
        objc_msgSend(WeakRetained, "deviceDidDisconnectHandler");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v4, "remoteUniqueIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
        ((void (**)(_QWORD, void *))v10)[2](v10, v13);
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_msgSend(WeakRetained, "deviceLostHandler");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend(v4, "isAdvToBrowserConnection");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "deviceLostHandler");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v4, "remoteUniqueIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v17, "initWithUUIDString:", v12);
        ((void (*)(void (**)(_QWORD, _QWORD), void *, _QWORD))v10[2])(v10, v13, 0);
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if (objc_msgSend(v4, "isAdvToBrowserConnection"))
  {
    objc_msgSend(WeakRetained, "advToBrowserNwToSFendpoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteEndpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v19);

    objc_msgSend(v4, "remoteUniqueIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(WeakRetained, "advToBrowserUuidToSFendpoints");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteUniqueIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v22);

    }
    objc_msgSend(WeakRetained, "_updateAdvertiserState");
  }
  else
  {
    objc_msgSend(WeakRetained, "browserToAdvNwToSFendpoints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteEndpoint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObjectForKey:", v24);

    objc_msgSend(v4, "remoteUniqueIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(WeakRetained, "browserToAdvUuidToSFendpoints");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteUniqueIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeObjectForKey:", v27);

    }
    objc_msgSend(WeakRetained, "_updateBrowserState");
  }
LABEL_20:

}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, &v34, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      daemon_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124_cold_1();
      goto LABEL_20;
    }
    objc_msgSend(v6, "remoteUniqueIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    daemon_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124_cold_2();
      goto LABEL_20;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Received browser endpoint message %@ from endpoint %@", buf, 0x16u);
    }

    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SFBonjourNearbyMessageType"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SFBonjourNearbyMessageTypeStartAdvertiseData")))
    {
      objc_msgSend(v6, "remoteAdvDataSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SFBonjourNearbyMessageValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v12);

      objc_msgSend(WeakRetained, "deviceFoundHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained, "deviceFoundHandler");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v20 = v14;
        v21 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v6, "remoteUniqueIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithUUIDString:", v22);
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SFBonjourNearbyMessageValue"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v20 + 16))(v20, v23, v24);

        goto LABEL_18;
      }
    }
    else
    {
      if (!-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SFBonjourNearbyMessageTypeStopAdvertiseData")))
      {
        if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SFBonjourNearbyMessageTypeConnect")))
        {
          objc_msgSend(v6, "setIsConnected:", 1);
          objc_msgSend(WeakRetained, "deviceDidConnectHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_20;
          objc_msgSend(WeakRetained, "deviceDidConnectHandler");
          v20 = objc_claimAutoreleasedReturnValue();
          v26 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v6, "remoteUniqueIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v26, "initWithUUIDString:", v22);
          (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v23, 0);
        }
        else
        {
          if (!-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SFBonjourNearbyMessageTypeDisconnect")))
          {
            if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SFBonjourNearbyMessageTypeDataPacket")))
            {
              objc_msgSend(WeakRetained, "deviceDidReceiveDataHandler");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
                goto LABEL_20;
              -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SFBonjourNearbyMessageValue"));
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "deviceDidReceiveDataHandler");
              v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v31 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v6, "remoteUniqueIDString");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v31, "initWithUUIDString:", v32);
              ((void (**)(_QWORD, void *, uint64_t))v30)[2](v30, v33, v20);

            }
            else
            {
              daemon_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v10;
                _os_log_impl(&dword_1A2830000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "SFBonjourNearBy unknown message type:%@", buf, 0xCu);
              }
            }
            goto LABEL_19;
          }
          objc_msgSend(v6, "setIsConnected:", 0);
          objc_msgSend(WeakRetained, "deviceDidDisconnectHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
            goto LABEL_20;
          objc_msgSend(WeakRetained, "deviceDidDisconnectHandler");
          v20 = objc_claimAutoreleasedReturnValue();
          v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v6, "remoteUniqueIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v28, "initWithUUIDString:", v22);
          (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v23);
        }
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v6, "remoteAdvDataSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E60];
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("SFBonjourNearbyMessageValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minusSet:", v18);

      objc_msgSend(WeakRetained, "deviceLostHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(WeakRetained, "deviceLostHandler");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
LABEL_20:

  }
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v30[0] = CFSTR("SFBonjourNearbyMessageType");
  v30[1] = CFSTR("SFBonjourNearbyMessageValue");
  v31[0] = v11;
  v31[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  daemon_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1A2830000, v17, OS_LOG_TYPE_DEFAULT, "Sending payload %@ to endpoint %@", buf, 0x16u);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__SFBonjourNearBy__sendMessage_withType_toEndpoint_completionCallback___block_invoke;
    v22[3] = &unk_1E482E490;
    v23 = v13;
    objc_msgSend(v12, "sendDataMessage:completion:", v15, v22);
    v18 = v23;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[SFBonjourNearBy _sendMessage:withType:toEndpoint:completionCallback:].cold.1();

  if (v13)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Unable to send message, failed to serialize payload");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -6700, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v13 + 2))(v13, v18);
LABEL_9:

  }
}

uint64_t __71__SFBonjourNearBy__sendMessage_withType_toEndpoint_completionCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *serialQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke;
  v19[3] = &unk_1E48332A8;
  objc_copyWeak(&v24, &location);
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  dispatch_async(serialQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_endpointForUniqueID:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v3, "_sendMessage:withType:toEndpoint:completionCallback:");
    }
    else
    {
      daemon_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke_cold_1();

      if (*(_QWORD *)(a1 + 56))
      {
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v7 = *MEMORY[0x1E0CB2F90];
        v10 = *MEMORY[0x1E0CB2D50];
        v11[0] = CFSTR("Unable to send message, invalid params");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -6705, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
    }

  }
}

- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __CFString *v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = CFSTR("SFBonjourNearbyMessageTypeStopAdvertiseData");
  if (v6)
    v10 = CFSTR("SFBonjourNearbyMessageTypeStartAdvertiseData");
  v11 = v10;
  -[SFBonjourNearBy advToBrowserUuidToSFendpoints](self, "advToBrowserUuidToSFendpoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke;
  v16[3] = &unk_1E48332D0;
  v16[4] = self;
  v15 = v8;
  v17 = v15;
  v18 = v11;
  v13 = v9;
  v19 = v13;
  v14 = v11;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

  if (v13)
    (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v15, 0);

}

void __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v11[0] = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke_2;
  v8[3] = &unk_1E482FB00;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_sendMessage:withType:toDevice:completionCallback:", v6, v7, v5, v8);

}

uint64_t __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 40);
    if (v2)
      return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32), a2);
  }
  return result;
}

- (void)connectToDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SFBonjourNearBy_connectToDevice___block_invoke;
  v7[3] = &unk_1E482E2F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SFBonjourNearBy _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", MEMORY[0x1E0C9AA70], CFSTR("SFBonjourNearbyMessageTypeConnect"), v5, v7);

}

void __35__SFBonjourNearBy_connectToDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endpointForUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v5, "setIsConnected:", 1);
  objc_msgSend(*(id *)(a1 + 32), "deviceDidConnectHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceDidConnectHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, *(_QWORD *)(a1 + 40), v8);

  }
}

- (void)disconnectFromDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SFBonjourNearBy_disconnectFromDevice___block_invoke;
  v7[3] = &unk_1E482E2F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SFBonjourNearBy _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", MEMORY[0x1E0C9AA70], CFSTR("SFBonjourNearbyMessageTypeDisconnect"), v5, v7);

}

void __40__SFBonjourNearBy_disconnectFromDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  char v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endpointForUniqueID:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIsConnected:", 0);
  objc_msgSend(*(id *)(a1 + 32), "deviceDidDisconnectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceDidDisconnectHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "deviceLostHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v10, "isAdvToBrowserConnection");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceLostHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, *(_QWORD *)(a1 + 40), 0);

    }
  }

}

- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E48332F8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[SFBonjourNearBy _sendMessage:withType:toDevice:completionCallback:](self, "_sendMessage:withType:toDevice:completionCallback:", v14, CFSTR("SFBonjourNearbyMessageTypeDataPacket"), v11, v16);

  return 1;
}

void __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (BOOL)isLocalEndpoint:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_bonjour_service_name((nw_endpoint_t)a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBonjourNearBy getUniqueServiceNameForAdvertiser](self, "getUniqueServiceNameForAdvertiser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)_endpointForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (!v4)
  {
    daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFBonjourNearBy _endpointForUniqueID:].cold.1();
    goto LABEL_8;
  }
  -[SFBonjourNearBy advToBrowserUuidToSFendpoints](self, "advToBrowserUuidToSFendpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SFBonjourNearBy browserToAdvUuidToSFendpoints](self, "browserToAdvUuidToSFendpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      daemon_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SFBonjourNearBy _endpointForUniqueID:].cold.2();
LABEL_8:

      v6 = 0;
    }
  }

  return v6;
}

- (void)_cleanUp
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFBonjourNearBy__cleanUp__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __27__SFBonjourNearBy__cleanUp__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopBrowser");
  return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertising");
}

- (void)dealloc
{
  objc_super v3;

  -[SFBonjourNearBy _cleanUp](self, "_cleanUp");
  v3.receiver = self;
  v3.super_class = (Class)SFBonjourNearBy;
  -[SFBonjourNearBy dealloc](&v3, sel_dealloc);
}

- (id)advertisingStateUpdateHandler
{
  return self->_advertisingStateUpdateHandler;
}

- (void)setAdvertisingStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)discoveryStateUpdateHandler
{
  return self->_discoveryStateUpdateHandler;
}

- (void)setDiscoveryStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceDidStartScanning
{
  return self->_deviceDidStartScanning;
}

- (void)setDeviceDidStartScanning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceDidStopScanning
{
  return self->_deviceDidStopScanning;
}

- (void)setDeviceDidStopScanning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)deviceDidConnectHandler
{
  return self->_deviceDidConnectHandler;
}

- (void)setDeviceDidConnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)deviceDidDisconnectHandler
{
  return self->_deviceDidDisconnectHandler;
}

- (void)setDeviceDidDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceDidReceiveDataHandler
{
  return self->_deviceDidReceiveDataHandler;
}

- (void)setDeviceDidReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (OS_nw_listener)listener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 128, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_nw_browser)browser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBrowser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_nw_endpoint)endpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 144, 1);
}

- (NSMutableSet)resultChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResultChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableSet)advertiserAdvs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdvertiserAdvs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableDictionary)advToBrowserNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAdvToBrowserNwToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableDictionary)advToBrowserUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAdvToBrowserUuidToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)browserToAdvNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setBrowserToAdvNwToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)browserToAdvUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBrowserToAdvUuidToSFendpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (int)browserState
{
  return self->_browserState;
}

- (void)setBrowserState:(int)a3
{
  self->_browserState = a3;
}

- (int)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int)a3
{
  self->_advertiserState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserToAdvUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_browserToAdvNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advertiserAdvs, 0);
  objc_storeStrong((id *)&self->_resultChanges, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_deviceDidReceiveDataHandler, 0);
  objc_storeStrong(&self->_deviceDidDisconnectHandler, 0);
  objc_storeStrong(&self->_deviceDidConnectHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_deviceDidStopScanning, 0);
  objc_storeStrong(&self->_deviceDidStartScanning, 0);
  objc_storeStrong(&self->_discoveryStateUpdateHandler, 0);
  objc_storeStrong(&self->_advertisingStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_localBrowserUUIDString, 0);
  objc_storeStrong((id *)&self->_localAdvertiserUUIDString, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "advertiser failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "advertiser error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleConnection:(char)a1 isAdvToBrowserConnection:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "Got nil connection (isAdvToBrowserConnection : %d)", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)_handleConnection:isAdvToBrowserConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Failed to create endpoint for connection %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Did not get remoteUniqueIDString from endpoint %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "isAdvToBrowserConnection");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, a2, v3, "Established [%@] connection for endpoint %@", v4);
  OUTLINED_FUNCTION_8_1();
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "isAdvToBrowserConnection");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, a2, v3, "[%@] connection closed for endpoint %@", v4);
  OUTLINED_FUNCTION_8_1();
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, (uint64_t)v0, "Unable to deserialize data: %@, for endpoint %@", v1);
  OUTLINED_FUNCTION_3();
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_124_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, (uint64_t)v0, "Received browser endpoint message %@ from endpoint %@ without uuid", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_sendMessage:withType:toEndpoint:completionCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Unable to send message, failed to serialize payload %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_6_2(&dword_1A2830000, v0, v1, "Unable to send message %@ with type %@ to deviceID %@ (Invalid params)");
  OUTLINED_FUNCTION_8_1();
}

void __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_6_2(&dword_1A2830000, v0, v1, "Failed to send data %@ to device %@, error %@");
  OUTLINED_FUNCTION_8_1();
}

- (void)_endpointForUniqueID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Empty uniqueID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_endpointForUniqueID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Unable to find endpoint for deviceID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
