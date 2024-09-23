@implementation PSYInitialSyncStateObserver

id __43__PSYInitialSyncStateObserver_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

void __59__PSYInitialSyncStateObserver__handleConnectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __60__PSYInitialSyncStateObserver_syncProviderWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInvalidated");

}

- (void)_handleConnectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__PSYInitialSyncStateObserver__handleConnectionInvalidated__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)syncProviderWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  PSYSyncStateObserverExportedObject *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  void *v12;
  NSXPCConnection *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.pairedsyncd.syncstate"), 4096);
    v7 = self->_connection;
    self->_connection = v6;

    v8 = objc_alloc_init(PSYSyncStateObserverExportedObject);
    -[PSYSyncStateObserverExportedObject setDelegate:](v8, "setDelegate:", self);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v8);
    v9 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A2A08);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    v11 = self->_connection;
    PSYSyncStateProviderXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, self);
    v13 = self->_connection;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __60__PSYInitialSyncStateObserver_syncProviderWithErrorHandler___block_invoke;
    v19 = &unk_24C5E5130;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v16);
    -[NSXPCConnection resume](self->_connection, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_queue_initializeIfNotInitialized
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PSYInitialSyncStateObserver syncProviderWithErrorHandler:](self, "syncProviderWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerSyncStateObserverIfNeeded");

  if (!self->_init)
  {
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAllDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v22 = objc_msgSend(v10, "count");
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v18 = 0;
    if (*((_DWORD *)v20 + 6))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      obj = v10;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v14;
        v7 = MEMORY[0x24BDAC760];
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v14 != v6)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "pairingID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v12[0] = v7;
            v12[1] = 3221225472;
            v12[2] = __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke;
            v12[3] = &unk_24C5E5040;
            v12[5] = v17;
            v12[6] = &v19;
            v12[4] = self;
            -[PSYInitialSyncStateObserver requestSyncStateForPairingIdentifier:completion:](self, "requestSyncStateForPairingIdentifier:completion:", v9, v12);

            ++v8;
          }
          while (v5 != v8);
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
        }
        while (v5);
      }

    }
    else
    {
      self->_init = 1;
    }
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);

  }
}

- (PSYInitialSyncStateObserver)initWithDelegate:(id)a3
{
  id v4;
  PSYInitialSyncStateObserver *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *syncStateCache;
  NSMutableDictionary *v12;
  NSMutableDictionary *initialSyncStateCache;
  NSMutableDictionary *v14;
  NSMutableDictionary *syncStateEntryCache;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  dispatch_queue_t v18;
  OS_dispatch_queue *delegateQueue;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD block[4];
  PSYInitialSyncStateObserver *v28;
  _QWORD v29[4];
  id v30;
  _QWORD handler[4];
  id v32;
  id buf;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PSYInitialSyncStateObserver;
  v5 = -[PSYInitialSyncStateObserver init](&v34, sel_init);
  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      psy_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "Initializing PSYInitialSyncStateObserver to monitor sync state", (uint8_t *)&buf, 2u);
      }

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    syncStateCache = v5->_syncStateCache;
    v5->_syncStateCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    initialSyncStateCache = v5->_initialSyncStateCache;
    v5->_initialSyncStateCache = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    syncStateEntryCache = v5->_syncStateEntryCache;
    v5->_syncStateEntryCache = v14;

    v16 = dispatch_queue_create("com.apple.pairedsync.syncobserver", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_create("com.apple.pairedsync.delegate", v9);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v18;

    -[PSYInitialSyncStateObserver setDelegate:](v5, "setDelegate:", v4);
    objc_initWeak(&buf, v5);
    v20 = (const char *)objc_msgSend(CFSTR("com.apple.pairedsyncd.launched"), "UTF8String");
    v21 = v5->_queue;
    v22 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke;
    handler[3] = &unk_24C5E4FA0;
    objc_copyWeak(&v32, &buf);
    notify_register_dispatch(v20, &v5->_daemonStartedNotifyToken, v21, handler);
    v23 = (const char *)objc_msgSend(CFSTR("com.apple.pairedsync.lastsyncswitchid"), "UTF8String");
    v24 = v5->_queue;
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_2;
    v29[3] = &unk_24C5E4FA0;
    objc_copyWeak(&v30, &buf);
    notify_register_dispatch(v23, &v5->_syncSwitchNotifyToken, v24, v29);
    +[PSYRegistrySingleton addDelegate:](PSYRegistrySingleton, "addDelegate:", v5);
    v25 = v5->_queue;
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_3;
    block[3] = &unk_24C5E4FC8;
    v28 = v5;
    dispatch_async(v25, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&buf);

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__PSYInitialSyncStateObserver_setDelegate___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

- (PSYInitialSyncStateObserver)init
{
  return -[PSYInitialSyncStateObserver initWithDelegate:](self, "initWithDelegate:", 0);
}

void __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_querySyncState");
    objc_msgSend(v2, "_queue_notifyCanRetryFailedRequests");
    WeakRetained = v2;
  }

}

void __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_querySyncState");

}

uint64_t __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNotInitialized");
}

- (PSYInitialSyncStateObserverDelegate)delegate
{
  NSObject *delegateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  delegateQueue = self->_delegateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__PSYInitialSyncStateObserver_delegate__block_invoke;
  v5[3] = &unk_24C5E5018;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(delegateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PSYInitialSyncStateObserverDelegate *)v3;
}

void __39__PSYInitialSyncStateObserver_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a3;
  if (v4)
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (!--*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) && !*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v5 = a1[4];
    v6 = *(NSObject **)(v5 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke_2;
    block[3] = &unk_24C5E4FC8;
    block[4] = v5;
    dispatch_async(v6, block);
  }

}

uint64_t __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  return result;
}

- (void)dealloc
{
  int daemonStartedNotifyToken;
  int syncSwitchNotifyToken;
  objc_super v5;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  daemonStartedNotifyToken = self->_daemonStartedNotifyToken;
  if (daemonStartedNotifyToken != -1)
    notify_cancel(daemonStartedNotifyToken);
  syncSwitchNotifyToken = self->_syncSwitchNotifyToken;
  if (syncSwitchNotifyToken != -1)
    notify_cancel(syncSwitchNotifyToken);
  v5.receiver = self;
  v5.super_class = (Class)PSYInitialSyncStateObserver;
  -[PSYInitialSyncStateObserver dealloc](&v5, sel_dealloc);
}

- (void)requestSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *queue;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke;
    block[3] = &unk_24C5E5108;
    block[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(queue, block);

  }
  else
  {
    PSYErrorForCode(5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_2;
  v10[3] = &unk_24C5E5090;
  v10[4] = v2;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "syncProviderWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_4;
  v7[3] = &unk_24C5E50E0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestDeviceSyncStateEntriesForPairingIDs:completion:", v5, v7);

}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_24C5E5068;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_5;
  v8[3] = &unk_24C5E50B8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCompletedSync");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    psy_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v6)
    {
      v11 = 0;
      goto LABEL_13;
    }
    psy_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "requestSyncStateForPairingIdentifier:%@ hasCompletedSync=%@", (uint8_t *)&v15, 0x16u);

    }
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.pairedsync"), 43, 0);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  psy_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    psy_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = (uint64_t)v14;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "requestSyncStateForPairingIdentifier:%@ error=%@", (uint8_t *)&v15, 0x16u);

    }
LABEL_11:

  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)requestInitialSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke;
  block[3] = &unk_24C5E5108;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_2;
  v10[3] = &unk_24C5E5090;
  v10[4] = v2;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "syncProviderWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_4;
  v7[3] = &unk_24C5E50E0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestDeviceSyncStateEntriesForPairingIDs:completion:", v5, v7);

}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_24C5E5068;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_5;
  v8[3] = &unk_24C5E50B8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCompletedInitialOrMigrationSync");

  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "requestInitialSyncStateForPairingIdentifier:%@ hasCompletedInitialOrMigrationSync=%@", (uint8_t *)&v11, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)requestInitialNonMigrationSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke;
  block[3] = &unk_24C5E5108;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_2;
  v10[3] = &unk_24C5E5090;
  v10[4] = v2;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "syncProviderWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_4;
  v7[3] = &unk_24C5E50E0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestDeviceSyncStateEntriesForPairingIDs:completion:", v5, v7);

}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_24C5E5068;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_5;
  v8[3] = &unk_24C5E50B8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCompletedInitialSync");

  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "requestInitialNonMigrationSyncStateForPairingIdentifier:%@ hasCompletedInitialSync=%@", (uint8_t *)&v11, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_queue_querySyncState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PSYInitialSyncStateObserver _queue_initializeIfNotInitialized](self, "_queue_initializeIfNotInitialized");
  -[NSMutableDictionary keyEnumerator](self->_syncStateCache, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    -[PSYInitialSyncStateObserver syncProviderWithErrorHandler:](self, "syncProviderWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke;
    v6[3] = &unk_24C5E5158;
    v6[4] = self;
    objc_msgSend(v5, "requestDeviceSyncStateEntriesForPairingIDs:completion:", v4, v6);

  }
}

void __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke_2;
  v7[3] = &unk_24C5E4FF0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_queue_notifyCanRetryFailedRequests
{
  void *v3;
  char v4;
  id v5;

  -[PSYInitialSyncStateObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PSYInitialSyncStateObserver delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialSyncStateObserverClientCanRetryFailedRequests:", self);

  }
}

- (void)_queue_updateSyncStates:(id)a3 notifyDelegateOfChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  char v56;
  void *v57;
  __int128 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *obj;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;

  v4 = a4;
  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v62 = 0;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v6, "keyEnumerator");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  v61 = v6;
  if (v7)
  {
    v9 = v7;
    v64 = *(id *)v79;
    *(_QWORD *)&v8 = 138412290;
    v58 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(id *)v79 != v64)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, v58);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncStateEntryCache, "setObject:forKeyedSubscript:", v12, v11);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_syncStateCache, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "hasCompletedSync"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "BOOLValue") & 1) == 0
          && (v15 = objc_msgSend(v14, "BOOLValue"), v16 = v62, (v15 & 1) != 0)
          || objc_msgSend(v13, "BOOLValue")
          && (v17 = objc_msgSend(v14, "BOOLValue"), v16 = v60, (v17 & 1) == 0))
        {
          objc_msgSend(v16, "addObject:", v11);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncStateCache, "setObject:forKeyedSubscript:", v14, v11);
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_initialSyncStateCache, "objectForKeyedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "hasCompletedInitialOrMigrationSync"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v18, "BOOLValue") & 1) == 0 && objc_msgSend(v19, "BOOLValue"))
        {
          objc_msgSend(v59, "addObject:", v11);
LABEL_23:
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_initialSyncStateCache, "setObject:forKeyedSubscript:", v19, v11);
          v6 = v61;
          goto LABEL_24;
        }
        if (objc_msgSend(v18, "BOOLValue") && (objc_msgSend(v19, "BOOLValue") & 1) == 0)
        {
          psy_log();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

          if (v21)
          {
            psy_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v58;
              v86 = v11;
              _os_log_impl(&dword_20CFE4000, v22, OS_LOG_TYPE_DEFAULT, "Initial sync status changed, reset cached value for: %@", buf, 0xCu);
            }

          }
          goto LABEL_23;
        }
LABEL_24:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v9);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v65 = v60;
  v23 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v75 != v25)
          objc_enumerationMutation(v65);
        v27 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        psy_log();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          psy_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v27;
            _os_log_impl(&dword_20CFE4000, v30, OS_LOG_TYPE_DEFAULT, "Resetting sync state for %{public}@", buf, 0xCu);
          }

        }
        -[PSYInitialSyncStateObserver delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) != 0)
        {
          -[PSYInitialSyncStateObserver delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "initialSyncStateObserver:syncDidResetForPairingIdentifier:", self, v27);

        }
      }
      v24 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v24);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v34 = v59;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v71 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
        psy_log();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

        if (v41)
        {
          psy_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v39;
            _os_log_impl(&dword_20CFE4000, v42, OS_LOG_TYPE_DEFAULT, "Setting completed Initial sync state for %{public}@", buf, 0xCu);
          }

        }
        -[PSYInitialSyncStateObserver delegate](self, "delegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_opt_respondsToSelector();

        if ((v44 & 1) != 0)
        {
          -[PSYInitialSyncStateObserver delegate](self, "delegate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "initialSyncStateObserver:initialSyncDidCompleteForPairingIdentifier:", self, v39);

        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    }
    while (v36);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v46 = v62;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v67 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m);
        psy_log();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

        if (v53)
        {
          psy_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v51;
            _os_log_impl(&dword_20CFE4000, v54, OS_LOG_TYPE_DEFAULT, "Setting completed Reunion sync state for %{public}@", buf, 0xCu);
          }

        }
        -[PSYInitialSyncStateObserver delegate](self, "delegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_opt_respondsToSelector();

        if ((v56 & 1) != 0)
        {
          -[PSYInitialSyncStateObserver delegate](self, "delegate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "initialSyncStateObserver:syncDidCompleteForPairingIdentifier:", self, v51);

        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v48);
  }

}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v6;
  NSObject *queue;
  _QWORD block[5];

  v6 = a5;
  if ((objc_msgSend(v6, "containsObject:", *MEMORY[0x24BE6E678]) & 1) != 0
    || objc_msgSend(v6, "containsObject:", *MEMORY[0x24BE6E670]))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PSYInitialSyncStateObserver_registry_changed_properties___block_invoke;
    block[3] = &unk_24C5E4FC8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

uint64_t __59__PSYInitialSyncStateObserver_registry_changed_properties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_querySyncState");
}

- (void)didUpdateSyncForPairingID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PSYInitialSyncStateObserver *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__PSYInitialSyncStateObserver_didUpdateSyncForPairingID___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __57__PSYInitialSyncStateObserver_didUpdateSyncForPairingID___block_invoke(uint64_t a1)
{
  PSYDeviceSyncStateEntry *v2;
  PSYDeviceSyncStateEntry *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = -[PSYDeviceSyncStateEntry initWithPairingID:syncState:]([PSYDeviceSyncStateEntry alloc], "initWithPairingID:syncState:", *(_QWORD *)(a1 + 32), 3);
    v3 = v2;
    if (v2)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6[0] = v2;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_updateSyncStates:notifyDelegateOfChanges:", v4, 1);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncStateEntryCache, 0);
  objc_storeStrong((id *)&self->_initialSyncStateCache, 0);
  objc_storeStrong((id *)&self->_syncStateCache, 0);
}

@end
