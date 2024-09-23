@implementation SYBacklinkMonitorService

- (void)backlinkMonitorOperationDidFinish:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SYBacklinkMonitorService _activeOperation](self, "_activeOperation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "inputUserActivityInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218240;
      v12 = v4;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "BacklinkService: operation finished %p for activity info %p.", (uint8_t *)&v11, 0x16u);

    }
    v8 = objc_msgSend(v4, "type");
    v9 = v4;
    if (v8 != 1)
    {
      if (objc_msgSend(v4, "type", v4) != 2)
      {
LABEL_8:
        -[SYBacklinkMonitorService set_activeOperation:](self, "set_activeOperation:", 0);
        -[SYBacklinkMonitorService _updateKeepAliveTransaction](self, "_updateKeepAliveTransaction");
        -[SYBacklinkMonitorService testingDelegate](self, "testingDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backlinkMonitorService:didFinishOperation:", self, v4);

        -[SYBacklinkMonitorService _evaluateAndBeginPendingOperations](self, "_evaluateAndBeginPendingOperations");
        goto LABEL_9;
      }
      v9 = 0;
    }
    -[SYBacklinkMonitorService set_longerLivedOperation:](self, "set_longerLivedOperation:", v9);
    goto LABEL_8;
  }
LABEL_9:

}

- (SYBacklinkMonitorOperation)_activeOperation
{
  return self->__activeOperation;
}

- (void)_evaluateAndBeginPendingOperations
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitorService.m"), 139, CFSTR("No pending operation to make active"));

    }
    -[SYBacklinkMonitorService set_activeOperation:](self, "set_activeOperation:", v7);
    -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

    -[SYBacklinkMonitorService _updateKeepAliveTransaction](self, "_updateKeepAliveTransaction");
    v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "inputUserActivityInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218240;
      v14 = v7;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkService: will begin operation %p for activity info %p.", (uint8_t *)&v13, 0x16u);

    }
    -[SYBacklinkMonitorService testingDelegate](self, "testingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backlinkMonitorService:willBeginOperation:", self, v7);

    objc_msgSend(v7, "beginProcessing");
  }
}

- (NSMutableOrderedSet)_pendingOperations
{
  return self->__pendingOperations;
}

- (void)_updateKeepAliveTransaction
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[SYBacklinkMonitorService _activeOperation](self, "_activeOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  -[SYBacklinkMonitorService _keepAliveTransaction](self, "_keepAliveTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || v6)
  {
    if (v6)
      v7 = v4;
    else
      v7 = 1;
    if ((v7 & 1) == 0)
      -[SYBacklinkMonitorService set_keepAliveTransaction:](self, "set_keepAliveTransaction:", 0);
  }
  else
  {
    v8 = (id)os_transaction_create();
    -[SYBacklinkMonitorService set_keepAliveTransaction:](self, "set_keepAliveTransaction:", v8);

  }
}

- (OS_os_transaction)_keepAliveTransaction
{
  return self->__keepAliveTransaction;
}

- (SYBacklinkMonitorServiceTestingDelegate)testingDelegate
{
  return (SYBacklinkMonitorServiceTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)set_activeOperation:(id)a3
{
  objc_storeStrong((id *)&self->__activeOperation, a3);
}

- (void)set_keepAliveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->__keepAliveTransaction, a3);
}

void __43__SYBacklinkMonitorService_initForTesting___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notesActivationDidChange:", a2);

}

- (void)_notesActivationDidChange:(BOOL)a3
{
  if (a3)
  {
    -[NSMutableOrderedSet removeAllObjects](self->__pendingOperations, "removeAllObjects");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->__handles, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
  }
}

- (void)_createAndScheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SYBacklinkMonitorOperation *v18;
  void *v19;
  SYBacklinkMonitorOperation *v20;
  void *v21;
  SYBacklinkMonitorFilterCacheOperation *v22;
  void *v23;
  SYBacklinkMonitorFilterCacheOperation *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 134218240;
      v26 = v15;
      v27 = 2048;
      v28 = v9;
      _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_INFO, "BacklinkService: cancelling pending operation %p for user activity info %p.", (uint8_t *)&v25, 0x16u);

    }
    -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

  }
  -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [SYBacklinkMonitorOperation alloc];
  -[SYBacklinkMonitorService _serviceQueue](self, "_serviceQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SYBacklinkMonitorOperation initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:](v18, "initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:", self, v19, v9, objc_msgSend(v8, "processIdentifier"));
  objc_msgSend(v17, "addObject:", v20);

  LODWORD(v17) = objc_msgSend(v10, "needsCacheUpdate");
  if ((_DWORD)v17 && !-[SYBacklinkMonitorService _forTesting](self, "_forTesting"))
  {
    -[SYBacklinkMonitorService _pendingOperations](self, "_pendingOperations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [SYBacklinkMonitorFilterCacheOperation alloc];
    -[SYBacklinkMonitorService _serviceQueue](self, "_serviceQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SYBacklinkMonitorOperation initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:](v22, "initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:", self, v23, v9, objc_msgSend(v8, "processIdentifier"));
    objc_msgSend(v21, "addObject:", v24);

  }
  -[SYBacklinkMonitorService _updateKeepAliveTransaction](self, "_updateKeepAliveTransaction");
  -[SYBacklinkMonitorService _evaluateAndBeginPendingOperations](self, "_evaluateAndBeginPendingOperations");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *handles;
  void *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitorService.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newConnection"));

  }
  -[SYBacklinkMonitorService _listener](self, "_listener");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    -[SYBacklinkMonitorService _serviceQueue](self, "_serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYBacklinkMonitorServiceHandle handleWithConnection:queue:](SYBacklinkMonitorServiceHandle, "handleWithConnection:queue:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDelegate:", self);
    handles = self->__handles;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](handles, "setObject:forKey:", v11, v13);

    objc_msgSend(v8, "resume");
  }
  v14 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v8, "processIdentifier");
    v16 = CFSTR("No");
    if (v9 == v7)
      v16 = CFSTR("Yes");
    *(_DWORD *)buf = 134218242;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_INFO, "BacklinkService: Listener should accept connection from pid %ld: %@", buf, 0x16u);
  }

  return v9 == v7;
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (void)scheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 134217984;
    v14 = v8;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "BacklinkService: Received request to process activity change. Activity info: %p.", (uint8_t *)&v13, 0xCu);
  }

  -[SYBacklinkMonitorService _createAndScheduleOperationForHandle:withUserActivity:context:](self, "_createAndScheduleOperationForHandle:withUserActivity:context:", v10, v8, v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SYRemoteCurrentActivityDidChange"), 0, 0, 1u);

}

- (void)set_longerLivedOperation:(id)a3
{
  objc_storeStrong((id *)&self->__longerLivedOperation, a3);
}

- (void)backlinkMonitorOperation:(id)a3 shouldUpdateFilterCache:(id)a4
{
  NSMutableDictionary *handles;
  void *v6;
  id v7;
  void *v8;
  id v9;

  handles = self->__handles;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(a3, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](handles, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFilterCache:", v7);
}

- (SYBacklinkMonitorService)init
{
  return (SYBacklinkMonitorService *)-[SYBacklinkMonitorService initForTesting:](self, "initForTesting:", 0);
}

- (id)initForTesting:(BOOL)a3
{
  SYBacklinkMonitorService *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serviceQueue;
  uint64_t v8;
  NSMutableDictionary *handles;
  uint64_t v10;
  NSMutableOrderedSet *pendingOperations;
  SYNotesActivationObserver *v12;
  uint64_t v13;
  SYNotesActivationObserver *notesObserver;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SYBacklinkMonitorService;
  v4 = -[SYBacklinkMonitorService init](&v19, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.synapse.UserActivityService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    handles = v4->__handles;
    v4->__handles = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    pendingOperations = v4->__pendingOperations;
    v4->__pendingOperations = (NSMutableOrderedSet *)v10;

    objc_initWeak(&location, v4);
    v12 = [SYNotesActivationObserver alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__SYBacklinkMonitorService_initForTesting___block_invoke;
    v16[3] = &unk_1E757B940;
    objc_copyWeak(&v17, &location);
    v13 = -[SYNotesActivationObserver initWithHandler:](v12, "initWithHandler:", v16);
    notesObserver = v4->__notesObserver;
    v4->__notesObserver = (SYNotesActivationObserver *)v13;

    v4->__forTesting = a3;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SYBacklinkMonitorService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[SYBacklinkMonitorService _listener](self, "_listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SYBacklinkMonitorService set_listener:](self, "set_listener:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SYBacklinkMonitorService;
  -[SYBacklinkMonitorService dealloc](&v5, sel_dealloc);
}

- (void)beginListeningToConnections
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  -[SYBacklinkMonitorService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SYBacklinkMonitorService _forTesting](self, "_forTesting");
    v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkService: Starting Backlink Monitor Service with anonymous listener for testing", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkService: Starting Backlink Monitor Service", v13, 2u);
      }

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.backlink-service"));
    }
    v8 = (void *)v7;
    -[SYBacklinkMonitorService set_listener:](self, "set_listener:", v7);

    -[SYBacklinkMonitorService _listener](self, "_listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYBacklinkMonitorService _serviceQueue](self, "_serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setQueue:", v10);

    -[SYBacklinkMonitorService _listener](self, "_listener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[SYBacklinkMonitorService _listener](self, "_listener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

  }
}

uint64_t __54__SYBacklinkMonitorService__notesActivationDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFilterCache:", 0);
}

- (void)handleDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "BacklinkService: Received handle disconnect: %p.", (uint8_t *)&v8, 0xCu);
  }

  -[SYBacklinkMonitorService _handles](self, "_handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (id)_listenerEndpoint
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[SYBacklinkMonitorService _serviceQueue](self, "_serviceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SYBacklinkMonitorService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E757B730;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__SYBacklinkMonitorService__listenerEndpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_listener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasKeepAliveTransaction
{
  void *v2;
  BOOL v3;

  -[SYBacklinkMonitorService _keepAliveTransaction](self, "_keepAliveTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (void)set_listener:(id)a3
{
  objc_storeStrong((id *)&self->__listener, a3);
}

- (SYNotesActivationObserver)_notesObserver
{
  return self->__notesObserver;
}

- (void)set_notesObserver:(id)a3
{
  objc_storeStrong((id *)&self->__notesObserver, a3);
}

- (NSMutableDictionary)_handles
{
  return self->__handles;
}

- (void)set_handles:(id)a3
{
  objc_storeStrong((id *)&self->__handles, a3);
}

- (SYBacklinkMonitorOperation)_longerLivedOperation
{
  return self->__longerLivedOperation;
}

- (void)set_pendingOperations:(id)a3
{
  objc_storeStrong((id *)&self->__pendingOperations, a3);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->__pendingOperations, 0);
  objc_storeStrong((id *)&self->__longerLivedOperation, 0);
  objc_storeStrong((id *)&self->__activeOperation, 0);
  objc_storeStrong((id *)&self->__handles, 0);
  objc_storeStrong((id *)&self->__notesObserver, 0);
  objc_storeStrong((id *)&self->__keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
}

@end
