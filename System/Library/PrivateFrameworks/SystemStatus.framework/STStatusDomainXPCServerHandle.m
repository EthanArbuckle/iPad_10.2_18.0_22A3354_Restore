@implementation STStatusDomainXPCServerHandle

+ (id)sharedMachServiceServerHandle
{
  if (qword_1ED0CB3F0 != -1)
    dispatch_once(&qword_1ED0CB3F0, &__block_literal_global_3);
  return (id)_MergedGlobals_5;
}

void __62__STStatusDomainXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  STStatusDomainXPCServerHandle *v0;
  void *v1;

  v0 = objc_alloc_init(STStatusDomainXPCServerHandle);
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v0;

}

- (STStatusDomainXPCServerHandle)init
{
  void *v3;
  STStatusDomainXPCServerHandle *v4;

  +[STServerLaunchMonitor sharedInstance](STServerLaunchMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusDomainXPCServerHandle initWithXPCConnectionProvider:serverLaunchObservable:](self, "initWithXPCConnectionProvider:serverLaunchObservable:", &__block_literal_global_2, v3);

  return v4;
}

id __37__STStatusDomainXPCServerHandle_init__block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.systemstatus"), 0);
}

- (STStatusDomainXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4
{
  id v6;
  id v7;
  STStatusDomainXPCServerHandle *v8;
  BSMutableIntegerMap *v9;
  BSMutableIntegerMap *dataByDomain;
  BSMutableIntegerMap *v11;
  BSMutableIntegerMap *clientsByDomain;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v15;
  OS_dispatch_queue *clientQueue;
  uint64_t v17;
  id xpcConnectionProvider;
  id v19;
  STStatusDomainXPCServerHandle *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STStatusDomainXPCServerHandle;
  v8 = -[STStatusDomainXPCServerHandle init](&v22, sel_init);
  if (v8)
  {
    v9 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    dataByDomain = v8->_dataByDomain;
    v8->_dataByDomain = v9;

    v11 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    clientsByDomain = v8->_clientsByDomain;
    v8->_clientsByDomain = v11;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)Serial;

    v15 = BSDispatchQueueCreateSerial();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(v6, "copy");
    xpcConnectionProvider = v8->_xpcConnectionProvider;
    v8->_xpcConnectionProvider = (id)v17;

    objc_storeStrong((id *)&v8->_serverLaunchObservable, a4);
    -[STServerLaunchObservable addObserver:](v8->_serverLaunchObservable, "addObserver:", v8);
    v21 = v8;
    v19 = (id)BSLogAddStateCaptureBlockWithTitle();

  }
  return v8;
}

uint64_t __86__STStatusDomainXPCServerHandle_initWithXPCConnectionProvider_serverLaunchObservable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "description");
}

- (void)dealloc
{
  STStatusDomainXPCServerHandle *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STStatusDomainXPCServerHandle *)self->_serverLaunchObservable;
  -[STStatusDomainXPCServerHandle removeObserver:](self, "removeObserver:", v2);
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainXPCServerHandle;
  -[STStatusDomainXPCServerHandle dealloc](&v3, sel_dealloc);
}

- (id)dataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__STStatusDomainXPCServerHandle_dataForDomain___block_invoke;
  block[3] = &unk_1E91E4ED0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__STStatusDomainXPCServerHandle_dataForDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (dispatch_queue_t)_internalQueue_dataForDomain:(dispatch_queue_t *)a1
{
  dispatch_queue_t *v3;

  if (a1)
  {
    v3 = a1;
    dispatch_assert_queue_V2(a1[3]);
    -[NSObject objectForKey:](v3[1], "objectForKey:", a2);
    a1 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke;
  block[3] = &unk_1E91E4F20;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v4, "count") == 1)
  {
    -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
      v5 = (_QWORD *)v5[5];
    v6 = v5;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke_2;
    v13 = &unk_1E91E4EF8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48), v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "preferredLocalizations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "observeDomain:withPreferredLocalizations:", v8, v9);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  _QWORD *v2;
  void (*v3)(void);
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (!*(_QWORD *)(a1 + 40))
    {
      v2 = *(_QWORD **)(a1 + 48);
      v3 = (void (*)(void))v2[2];
      v4 = v2;
      v3();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      STStatusDomainXPCServerInterface();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v6);

      STStatusDomainXPCClientInterface();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExportedInterface:", v7);

      objc_msgSend(v5, "setExportedObject:", a1);
      objc_storeStrong((id *)(a1 + 40), v5);
      objc_initWeak(&location, (id)a1);
      objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_26);
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_27;
      v11 = &unk_1E91E4B50;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "setInvalidationHandler:", &v8);
      objc_msgSend(v5, "resume", v8, v9, v10, v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
  }
}

void __58__STStatusDomainXPCServerHandle_registerClient_forDomain___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogObservation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in registerClient:forDomain: -- error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);

}

- (void)_tearDownXPCConnection
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__STStatusDomainXPCServerHandle__tearDownXPCConnection__block_invoke;
    block[3] = &unk_1E91E4E40;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__STStatusDomainXPCServerHandle_removeClient_forDomain___block_invoke;
  block[3] = &unk_1E91E4F20;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __56__STStatusDomainXPCServerHandle_removeClient_forDomain___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", a1[6]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", a1[5]);
  v4 = objc_msgSend(v10, "count");
  v5 = v10;
  if (!v4)
  {
    v6 = a1[4];
    if (v6)
      v7 = *(void **)(v6 + 40);
    else
      v7 = 0;
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopObservingDomain:", v9);

    v5 = v10;
  }

}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v8 = a3;
  v9 = a4;
  if (STIsValidUserInteractionForStatusDomain(v8))
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__STStatusDomainXPCServerHandle_reportUserInteraction_forClient_domain___block_invoke;
    v11[3] = &unk_1E91E4F48;
    v11[4] = self;
    v14 = a5;
    v12 = v9;
    v13 = v8;
    dispatch_async(internalQueue, v11);

  }
}

void __72__STStatusDomainXPCServerHandle_reportUserInteraction_forClient_domain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = a1[7];
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", a1[5]);

  if (v6)
  {
    v7 = (_QWORD *)a1[4];
    if (v7)
      v7 = (_QWORD *)v7[5];
    v8 = v7;
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportUserInteraction:forDomain:", a1[6], a1[7]);

  }
}

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *internalQueue;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  if (!v8 || STIsValidDataForStatusDomain(v8))
  {
    if (v9)
    {
      if (STIsValidDataChangeContextForStatusDomain(v9))
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke;
    block[3] = &unk_1E91E4F70;
    block[4] = self;
    v16 = a4;
    v17 = v8 == 0;
    v14 = v8;
    v9 = v11;
    v15 = v9;
    dispatch_async(internalQueue, block);

  }
}

void __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 32), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    if (v3)
      v4 = (void *)v3[1];
    else
      v4 = 0;
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    if (!v2)
      goto LABEL_9;
  }
  else
  {
    if (v3)
      v3 = (_QWORD *)v3[1];
    v5 = *(void **)(a1 + 40);
    v6 = v3;
    v7 = (void *)objc_msgSend(v5, "mutableCopyWithZone:", 0);
    objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)(a1 + 56));

    if (!v2)
    {
LABEL_9:
      if (*(_BYTE *)(a1 + 64))
        goto LABEL_16;
    }
  }
  if ((objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(void **)(v8 + 16);
    else
      v9 = 0;
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(NSObject **)(v12 + 32);
    else
      v13 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke_2;
    v18[3] = &unk_1E91E4F48;
    v19 = v11;
    v14 = *(id *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v20 = v14;
    v22 = v15;
    v21 = v16;
    v17 = v11;
    dispatch_async(v13, v18);

  }
LABEL_16:

}

void __73__STStatusDomainXPCServerHandle_observeData_forDomain_withChangeContext___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "observeData:forDomain:withChangeContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)observeDiff:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v8 = a3;
  v9 = a5;
  if (STIsValidDiffForStatusDomain(v8) && (objc_msgSend(v8, "isEmpty") & 1) == 0)
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke;
    v11[3] = &unk_1E91E4F48;
    v11[4] = self;
    v14 = a4;
    v12 = v8;
    v13 = v9;
    dispatch_async(internalQueue, v11);

  }
}

void __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  -[STStatusDomainXPCServerHandle _internalQueue_dataForDomain:](*(dispatch_queue_t **)(a1 + 32), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applyDiff:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_msgSend(v3, "copyWithZone:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 16);
    else
      v6 = 0;
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(NSObject **)(v9 + 32);
    else
      v10 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke_2;
    v14[3] = &unk_1E91E4F48;
    v15 = v8;
    v16 = v4;
    v11 = *(void **)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v17 = v11;
    v12 = v4;
    v13 = v8;
    dispatch_async(v10, v14);

  }
}

void __73__STStatusDomainXPCServerHandle_observeDiff_forDomain_withChangeContext___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "observeData:forDomain:withChangeContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didObserveServerLaunch:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *internalQueue;
  NSObject *v9;
  _QWORD v10[6];

  STSystemStatusLogObservation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_1D12C7000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, re-registering to observe domains if necessary", (uint8_t *)v10, 2u);
  }

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.systemstatus.domains"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_8:
      internalQueue = self->_internalQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke;
      v10[3] = &unk_1E91E4E40;
      v10[4] = self;
      dispatch_async(internalQueue, v10);
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "count");

      if (v7)
        goto LABEL_8;
    }
    else
    {

    }
    STSystemStatusLogObservation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_fault_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_FAULT, "Server connection rejected due to missing entitlement", (uint8_t *)v10, 2u);
    }

  }
}

- (id)serverDataForDomains:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke;
  block[3] = &unk_1E91E5008;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke(uint64_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
  objc_initWeak(&location, (id)a1[4]);
  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[5];
  v3 = v2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2;
  v11[3] = &unk_1E91E4EF8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_3;
  v8[3] = &unk_1E91E4FE0;
  v6 = a1[5];
  v7 = a1[6];
  v9 = &__block_literal_global_19;
  v10 = v7;
  objc_msgSend(v5, "serverDataForDomains:reply:", v6, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogObservation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in serverDataForDomains: -- error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);

}

id __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    STValidStatusDomainDataTypes();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2_21;
    v7[3] = &unk_1E91E4FB8;
    v4 = v3;
    v8 = v4;
    v9 = &v10;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
    if (*((_BYTE *)v11 + 24))
      v5 = v2;
    else
      v5 = 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_2_21(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;

  v9 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_opt_class()) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __54__STStatusDomainXPCServerHandle_serverDataForDomains___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)description
{
  return (NSString *)-[STStatusDomainXPCServerHandle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusDomainXPCServerHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusDomainXPCServerHandle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  STStatusDomainXPCServerHandle *v14;

  v4 = a3;
  -[STStatusDomainXPCServerHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E91E5058;
  v7 = v5;
  v12 = v7;
  v13 = v4;
  v14 = self;
  v8 = v4;
  dispatch_sync(internalQueue, block);
  v9 = v7;

  return v9;
}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E91E4AD8;
  v3[4] = a1[6];
  v4 = v1;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, v2, v3);

}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 8);
  else
    v2 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v4[3] = &unk_1E91E5030;
  v5 = *(id *)(a1 + 40);
  v3 = v2;
  objc_msgSend(v3, "enumerateWithBlock:", v4);

}

void __71__STStatusDomainXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  STSystemStatusDescriptionForDomain(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v8, v6);

}

void __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  STSystemStatusLogObservation();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D12C7000, v0, OS_LOG_TYPE_DEFAULT, "Server connection interrupted", v1, 2u);
  }

}

void __77__STStatusDomainXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogObservation();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D12C7000, v2, OS_LOG_TYPE_DEFAULT, "Server connection invalidated", v3, 2u);
  }

  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);
}

void __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[STStatusDomainXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  if (objc_msgSend(v3, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[5];
    v5 = v4;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_2;
    v11[3] = &unk_1E91E4EF8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_28;
    v9[3] = &unk_1E91E5080;
    v8 = v7;
    v10 = v8;
    objc_msgSend(v3, "enumerateWithBlock:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogObservation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in _reregisterForDomainsIfNecessary -- error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STStatusDomainXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);

}

void __65__STStatusDomainXPCServerHandle__reregisterForDomainsIfNecessary__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "anyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "observeDomain:withPreferredLocalizations:", v6, v7);

  }
}

void __55__STStatusDomainXPCServerHandle__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(v1 + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong(&self->_xpcConnectionProvider, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_clientsByDomain, 0);
  objc_storeStrong((id *)&self->_dataByDomain, 0);
}

@end
