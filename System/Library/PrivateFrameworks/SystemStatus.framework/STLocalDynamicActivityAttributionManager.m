@implementation STLocalDynamicActivityAttributionManager

- (STLocalDynamicActivityAttributionManager)init
{
  STLocalDynamicActivityAttributionManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *clientAttributionMap;
  NSMutableSet *v7;
  NSMutableSet *monitorClients;
  STDynamicActivityAttributionListener *v9;
  STDynamicActivityAttributionListener *dynamicAttributionListener;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STLocalDynamicActivityAttributionManager;
  v2 = -[STLocalDynamicActivityAttributionManager init](&v12, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clientAttributionMap = v2->_clientAttributionMap;
    v2->_clientAttributionMap = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    monitorClients = v2->_monitorClients;
    v2->_monitorClients = v7;

    v9 = -[STDynamicActivityAttributionListener initWithServerHandle:]([STDynamicActivityAttributionListener alloc], "initWithServerHandle:", v2);
    dynamicAttributionListener = v2->_dynamicAttributionListener;
    v2->_dynamicAttributionListener = v9;

  }
  return v2;
}

- (id)currentAttributionKeyForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (v4)
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__STLocalDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke;
    block[3] = &unk_1E91E4BC8;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(internalQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __75__STLocalDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizationKey");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)currentAttributedAppForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (v4)
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__STLocalDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke;
    block[3] = &unk_1E91E4BC8;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(internalQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __74__STLocalDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)currentAttributionForClient:(id *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  void (*v15)(uint64_t);
  id v16;

  v4 = *(_OWORD *)&a3->var0[4];
  v13 = *(_OWORD *)a3->var0;
  v14 = v4;
  BSExecutablePathForAuditToken();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)&v13 = 0;
    *((_QWORD *)&v13 + 1) = &v13;
    *(_QWORD *)&v14 = 0x3032000000;
    *((_QWORD *)&v14 + 1) = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__STLocalDynamicActivityAttributionManager_currentAttributionForClient___block_invoke;
    block[3] = &unk_1E91E4BC8;
    v12 = &v13;
    block[4] = self;
    v11 = v6;
    dispatch_sync(internalQueue, block);
    v8 = *(id *)(*((_QWORD *)&v13 + 1) + 40);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __72__STLocalDynamicActivityAttributionManager_currentAttributionForClient___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)currentAttributionForAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  v5 = v4;
  v19 = 0u;
  v20 = 0u;
  if (v4)
    objc_msgSend(v4, "auditToken");
  v15 = v19;
  v16 = v20;
  BSExecutablePathForAuditToken();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "pid");
    BSExecutablePathForPID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v15 + 1) = &v15;
    *(_QWORD *)&v16 = 0x3032000000;
    *((_QWORD *)&v16 + 1) = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__STLocalDynamicActivityAttributionManager_currentAttributionForAttribution___block_invoke;
    block[3] = &unk_1E91E4BC8;
    v14 = &v15;
    block[4] = self;
    v13 = v7;
    dispatch_sync(internalQueue, block);
    v10 = *(id *)(*((_QWORD *)&v15 + 1) + 40);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __77__STLocalDynamicActivityAttributionManager_currentAttributionForAttribution___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__STLocalDynamicActivityAttributionManager_setLocalizableAttributionKey_andApplication_forClient___block_invoke;
  v15[3] = &unk_1E91E4BF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __98__STLocalDynamicActivityAttributionManager_setLocalizableAttributionKey_andApplication_forClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = (unint64_t)*(id *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  v7 = v6;
  if (v1)
  {
    if (v6)
      objc_msgSend(v6, "auditToken");
    memset(buf, 0, 32);
    BSExecutablePathForAuditToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "lastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        STSystemStatusLogDynamicAttribution();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v4;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v5;
          _os_log_impl(&dword_1D12C7000, v11, OS_LOG_TYPE_DEFAULT, "setAttributionKey:andApplication:forClient: updating dynamic attribution map with values ={%@ : (%@, %@)}", buf, 0x20u);
        }

      }
      if (v4 | v5)
      {
        memset(buf, 0, 32);
        +[STDynamicActivityAttribution attributionForClientAuditToken:clientExecutablePath:bundleID:localizationKey:](STDynamicActivityAttribution, "attributionForClientAuditToken:clientExecutablePath:bundleID:localizationKey:", buf, v9, v5, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v1, v12, v10);

    }
    else
    {
      STSystemStatusLogDynamicAttribution();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BSProcessDescriptionForAuditToken();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_error_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_ERROR, "setAttributionKey:andApplication:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);

      }
    }

  }
}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  __int128 v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[1] = 3221225472;
  v11 = *(_OWORD *)&a4->var0[4];
  v17 = *(_OWORD *)a4->var0;
  v18 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __107__STLocalDynamicActivityAttributionManager_setAttributionLocalizableKey_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E91E4C18;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(internalQueue, block);

}

void __107__STLocalDynamicActivityAttributionManager_setAttributionLocalizableKey_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 72);
  v17 = *(_OWORD *)(a1 + 56);
  v18 = v4;
  v5 = v1;
  v6 = v3;
  v7 = v6;
  if (v2)
  {
    v15 = 0u;
    v16 = 0u;
    if (v6)
      objc_msgSend(v6, "auditToken");
    *(_OWORD *)buf = v15;
    v20 = v16;
    BSExecutablePathForAuditToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      *(_OWORD *)buf = v17;
      v20 = v18;
      BSExecutablePathForAuditToken();
      v9 = objc_claimAutoreleasedReturnValue();
      if (v5 | v9)
      {
        *(_OWORD *)buf = v15;
        v20 = v16;
        v14[0] = v17;
        v14[1] = v18;
        +[STDynamicActivityAttribution attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:localizationKey:](STDynamicActivityAttribution, "attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:localizationKey:", buf, v14, v8, v9, v5);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        STSystemStatusLogDynamicAttribution();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_1D12C7000, v12, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v8, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v10, v13);

    }
    else
    {
      STSystemStatusLogDynamicAttribution();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BSProcessDescriptionForAuditToken();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_error_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_ERROR, "setAttributionLocalizableKey:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);

      }
    }

  }
}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  __int128 v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[1] = 3221225472;
  v11 = *(_OWORD *)&a4->var0[4];
  v17 = *(_OWORD *)a4->var0;
  v18 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __109__STLocalDynamicActivityAttributionManager_setAttributionStringWithFormat_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E91E4C18;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(internalQueue, block);

}

void __109__STLocalDynamicActivityAttributionManager_setAttributionStringWithFormat_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _OWORD v13[2];
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[16];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 56);
  v17 = v4;
  v5 = v1;
  v6 = v3;
  if (v2)
  {
    if ((objc_msgSend(v5, "containsString:", CFSTR("%@")) & 1) != 0)
    {
      *(_OWORD *)buf = 0u;
      v15 = 0u;
      if (v6)
        objc_msgSend(v6, "auditToken");
      *(_OWORD *)v18 = *(_OWORD *)buf;
      v19 = v15;
      BSExecutablePathForAuditToken();
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        *(_OWORD *)v18 = v16;
        v19 = v17;
        BSExecutablePathForAuditToken();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          *(_OWORD *)v18 = *(_OWORD *)buf;
          v19 = v15;
          v13[0] = v16;
          v13[1] = v17;
          +[STDynamicActivityAttribution attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:stringWithFormat:](STDynamicActivityAttribution, "attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:stringWithFormat:", v18, v13, v7, v8, v5);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
          dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
        if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
        {
          STSystemStatusLogDynamicAttribution();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v18 = 138412290;
            *(_QWORD *)&v18[4] = v9;
            _os_log_impl(&dword_1D12C7000, v11, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", v18, 0xCu);
          }

        }
        -[NSObject lastPathComponent](v7, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v9, v12);

      }
      else
      {
        STSystemStatusLogDynamicAttribution();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          BSProcessDescriptionForAuditToken();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v18 = 138412290;
          *(_QWORD *)&v18[4] = v10;
          _os_log_error_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_ERROR, "setAttributionStringWithFormat:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", v18, 0xCu);

        }
      }

    }
    else
    {
      STSystemStatusLogDynamicAttribution();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D12C7000, v7, OS_LOG_TYPE_ERROR, "Attribution string with format did not include a wild card for the app name. Please include a %%@.", buf, 2u);
      }
    }

  }
}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  __int128 v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[1] = 3221225472;
  v11 = *(_OWORD *)&a4->var0[4];
  v17 = *(_OWORD *)a4->var0;
  v18 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __106__STLocalDynamicActivityAttributionManager_setAttributionWebsiteString_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E91E4C18;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(internalQueue, block);

}

void __106__STLocalDynamicActivityAttributionManager_setAttributionWebsiteString_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 72);
  v17 = *(_OWORD *)(a1 + 56);
  v18 = v4;
  v5 = v1;
  v6 = v3;
  v7 = v6;
  if (v2)
  {
    v15 = 0u;
    v16 = 0u;
    if (v6)
      objc_msgSend(v6, "auditToken");
    *(_OWORD *)buf = v15;
    v20 = v16;
    BSExecutablePathForAuditToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      *(_OWORD *)buf = v17;
      v20 = v18;
      BSExecutablePathForAuditToken();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        *(_OWORD *)buf = v15;
        v20 = v16;
        v14[0] = v17;
        v14[1] = v18;
        +[STDynamicActivityAttribution attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:website:](STDynamicActivityAttribution, "attributionForClientAuditToken:maskingClientAuditToken:clientExecutablePath:maskingClientExecutablePath:website:", buf, v14, v8, v9, v5);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        STSystemStatusLogDynamicAttribution();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_1D12C7000, v12, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v8, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v10, v13);

    }
    else
    {
      STSystemStatusLogDynamicAttribution();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BSProcessDescriptionForAuditToken();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_error_impl(&dword_1D12C7000, v10, OS_LOG_TYPE_ERROR, "setAttributionWebsiteString:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);

      }
    }

  }
}

- (void)subscribeToUpdates:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__STLocalDynamicActivityAttributionManager_subscribeToUpdates___block_invoke;
  v7[3] = &unk_1E91E4AD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __63__STLocalDynamicActivityAttributionManager_subscribeToUpdates___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "currentAttributionsDidChange:", v2);

}

- (void)unsubscribeFromUpdates:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke;
  v7[3] = &unk_1E91E4AD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke_2;
  v14[3] = &unk_1E91E4C40;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v4;
  v17 = &v18;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (*((_BYTE *)v19 + 24) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "currentAttributionsDidChange:", v5, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v22, 16);
      }
      while (v7);
    }

  }
  _Block_object_dispose(&v18, 8);
}

void __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "clientAuditToken");
  v8 = BSVersionedPIDForAuditToken();
  v9 = (void *)a1[4];
  if (v9)
    objc_msgSend(v9, "auditToken");
  if (v8 == BSVersionedPIDForAuditToken())
  {
    objc_msgSend(*(id *)(a1[5] + 24), "removeObjectForKey:", v5);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (void)_updateAttributionMapWithAttribution:(void *)a3 clientID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 24);
  if (v5)
    objc_msgSend(v7, "setObject:forKey:", v5, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 24), "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "currentAttributionsDidChange:", v8, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitorClients, 0);
  objc_storeStrong((id *)&self->_clientAttributionMap, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_dynamicAttributionListener, 0);
}

@end
