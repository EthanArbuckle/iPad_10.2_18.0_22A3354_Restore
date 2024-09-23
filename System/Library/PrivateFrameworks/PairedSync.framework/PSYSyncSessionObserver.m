@implementation PSYSyncSessionObserver

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didBecomeActive:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Did become active! Possibly reconnecting to pairedsync...", buf, 2u);
    }

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PSYSyncSessionObserver_didBecomeActive___block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_currentSyncSession, 0);
}

- (void)dealloc
{
  void *v3;
  int daemonDidLaunchNotifyToken;
  objc_super v5;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  daemonDidLaunchNotifyToken = self->_daemonDidLaunchNotifyToken;
  if (daemonDidLaunchNotifyToken != -1)
    notify_cancel(daemonDidLaunchNotifyToken);
  v5.receiver = self;
  v5.super_class = (Class)PSYSyncSessionObserver;
  -[PSYSyncSessionObserver dealloc](&v5, sel_dealloc);
}

- (PSYSyncSessionObserver)init
{
  PSYSyncSessionObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PSYSyncSessionObserver;
  v2 = -[PSYSyncSessionObserver init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.pairedsync.syncsessionobserver", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    v6 = (const char *)objc_msgSend(CFSTR("com.apple.pairedsyncd.launched"), "UTF8String");
    v7 = v2->_queue;
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __30__PSYSyncSessionObserver_init__block_invoke;
    v16 = &unk_24C5E4FA0;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch(v6, &v2->_daemonDidLaunchNotifyToken, v7, &v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_willResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_willResignActive_, *MEMORY[0x24BDD0C28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_didBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_didBecomeActive_, *MEMORY[0x24BDD0C10], 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)startObservingSyncSessionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  psy_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    psy_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x212B9AF40](v4);
      *(_DWORD *)buf = 134217984;
      v14 = v8;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Starting to observe sync session, completion=%p", buf, 0xCu);

    }
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke;
  v11[3] = &unk_24C5E52C0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(queue, v11);

}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_2;
  v9[3] = &unk_24C5E53E8;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  objc_msgSend(v3, "providerWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_3;
  v7[3] = &unk_24C5E5410;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "requestActiveSyncSessionWithCompletion:", v7);

}

void __35__PSYSyncSessionObserver__checkin___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__PSYSyncSessionObserver__checkin___block_invoke_2;
  v3[3] = &unk_24C5E5438;
  v4 = *(_BYTE *)(a1 + 40);
  v3[4] = v1;
  objc_msgSend(v1, "providerWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkin:", &__block_literal_global_2);

}

- (id)providerWithErrorHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSYSyncSessionObserver _queue_loadConnectionIfNeeded](self, "_queue_loadConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_loadConnectionIfNeeded
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  PSYSyncSessionObserverExportedObject *v5;
  PSYSyncSessionObserverExportedObject *exportedObject;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.pairedsyncd.progress"), 4096);
    connection = self->_connection;
    self->_connection = v3;

    v5 = objc_alloc_init(PSYSyncSessionObserverExportedObject);
    exportedObject = self->_exportedObject;
    self->_exportedObject = v5;

    -[PSYSyncSessionObserverExportedObject setDelegate:](self->_exportedObject, "setDelegate:", self);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_exportedObject);
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A3B60));
    v7 = self->_connection;
    PSYSyncSessionProviderXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __55__PSYSyncSessionObserver__queue_loadConnectionIfNeeded__block_invoke;
    v13 = &unk_24C5E5130;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v10);
    -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __55__PSYSyncSessionObserver__queue_loadConnectionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  psy_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    psy_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver connection invalidated", v6, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

void __48__PSYSyncSessionObserver__connectionInvalidated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    psy_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      psy_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver clearing invalidated connection", buf, 2u);
      }

    }
    v5 = *(_QWORD **)(a1 + 32);
    if (v5[1])
    {
      objc_msgSend(v5, "_queue_invalidateSyncSession:");
      v5 = *(_QWORD **)(a1 + 32);
    }
    v6 = (void *)v5[4];
    v5[4] = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v11 + 40))
    {
      *(_BYTE *)(v11 + 40) = 0;
      psy_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        psy_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_20CFE4000, v14, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver - checking in following invalidation handler", v15, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_checkin:", 0);
    }
  }
}

- (void)_connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PSYSyncSessionObserver__connectionInvalidated__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_checkin:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__PSYSyncSessionObserver__checkin___block_invoke;
  v4[3] = &unk_24C5E54A0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = (void *)v3[1];
    v3[1] = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v3, "setCurrentSyncSession:", 0);
  }

}

void __42__PSYSyncSessionObserver_didBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 0;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));

    if (WeakRetained)
      objc_msgSend(*(id *)(a1 + 32), "_reconnectToPairedSync");
  }
}

void __35__PSYSyncSessionObserver__checkin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 4099)
      {
        psy_log();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          psy_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            __35__PSYSyncSessionObserver__checkin___block_invoke_2_cold_1(v9);

        }
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(NSObject **)(v10 + 24);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __35__PSYSyncSessionObserver__checkin___block_invoke_16;
        block[3] = &unk_24C5E4FC8;
        block[4] = v10;
        dispatch_async(v11, block);
      }
    }
    else
    {

    }
  }

}

void __30__PSYSyncSessionObserver_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  psy_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    psy_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncSessionObserver _daemonStarted", v6, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDaemonStarted");

}

- (void)willResignActive:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "PairedSync Client: Will resign active! Invalidating progress connection.", buf, 2u);
    }

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSYSyncSessionObserver_willResignActive___block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__PSYSyncSessionObserver_willResignActive___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectFromPairedSync");
}

- (void)_disconnectFromPairedSync
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)_reconnectToPairedSync
{
  -[PSYSyncSessionObserver startObservingSyncSessionsWithCompletion:](self, "startObservingSyncSessionsWithCompletion:", 0);
}

- (void)setCurrentSyncSession:(id)a3
{
  PSYSyncSession *v4;
  PSYSyncSession *currentSyncSession;
  BOOL v6;
  PSYSyncSession *v7;
  PSYSyncSessionObserver *v8;
  PSYSyncSession *v9;
  PSYSyncSession *v10;

  v4 = (PSYSyncSession *)a3;
  currentSyncSession = self->_currentSyncSession;
  if (currentSyncSession != v4)
  {
    v10 = v4;
    v6 = -[PSYSyncSession isEqual:](currentSyncSession, "isEqual:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = self->_currentSyncSession;
      if (v10)
      {
        v8 = self;
        if (!v7)
        {
          -[PSYSyncSessionObserver syncSessionWillStart:](self, "syncSessionWillStart:", v10);
          goto LABEL_9;
        }
        v9 = v10;
      }
      else
      {
        -[PSYSyncSessionObserver invalidateSyncSession:](self, "invalidateSyncSession:", v7);
        v8 = self;
        v9 = 0;
      }
      -[PSYSyncSessionObserver updateSyncSession:](v8, "updateSyncSession:", v9);
LABEL_9:
      v4 = v10;
    }
  }

}

void __67__PSYSyncSessionObserver_startObservingSyncSessionsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  id *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  psy_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    psy_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_20CFE4000, v13, OS_LOG_TYPE_DEFAULT, "Started observing sync session: %{public}@", (uint8_t *)&v16, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSupportsMigrationSync:", objc_opt_respondsToSelector() & 1);

  v15 = *(id **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_storeStrong(v15 + 1, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v15, "setCurrentSyncSession:", v8);
  }

}

- (void)_handleDaemonStarted
{
  -[PSYSyncSessionObserver _checkin:](self, "_checkin:", 1);
}

uint64_t __35__PSYSyncSessionObserver__checkin___block_invoke_16(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

- (void)_queue_invalidateSyncSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  PSYSyncSession *currentSyncSession;

  v4 = a3;
  -[PSYSyncSessionObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSessionObserver:didInvalidateSyncSession:", self, v4);

  objc_msgSend(v4, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSYSyncSession sessionIdentifier](self->_currentSyncSession, "sessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    currentSyncSession = self->_currentSyncSession;
    self->_currentSyncSession = 0;

  }
}

- (void)syncSessionWillStart:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PSYSyncSessionObserver *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__PSYSyncSessionObserver_syncSessionWillStart___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __47__PSYSyncSessionObserver_syncSessionWillStart___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSupportsMigrationSync:", objc_opt_respondsToSelector() & 1);

  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (v3 != *(void **)(a1 + 32) && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncSessionObserver:receivedSyncSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    psy_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      psy_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "syncSessionWillStart: %{public}@", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

- (void)updateSyncSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PSYSyncSessionObserver *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__PSYSyncSessionObserver_updateSyncSession___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__PSYSyncSessionObserver_updateSyncSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  PSYSyncSessionUpdate *v8;

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSupportsMigrationSync:", objc_opt_respondsToSelector() & 1);

  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (v3 != *(void **)(a1 + 32) && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      v8 = -[PSYSyncSessionUpdate initWithOriginalSession:updatedSession:]([PSYSyncSessionUpdate alloc], "initWithOriginalSession:updatedSession:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 32));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "syncSessionObserver:didReceiveUpdate:", *(_QWORD *)(a1 + 40), v8);

    }
  }
}

- (void)invalidateSyncSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PSYSyncSessionObserver *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__PSYSyncSessionObserver_invalidateSyncSession___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __48__PSYSyncSessionObserver_invalidateSyncSession___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSupportsMigrationSync:", objc_opt_respondsToSelector() & 1);

  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v3[1];
  if (v4)
  {
    v3[1] = 0;

    v3 = *(_QWORD **)(a1 + 40);
  }
  return objc_msgSend(v3, "_queue_invalidateSyncSession:", *(_QWORD *)(a1 + 32));
}

- (PSYSyncSessionObserverDelegate)delegate
{
  return (PSYSyncSessionObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __35__PSYSyncSessionObserver__checkin___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CFE4000, log, OS_LOG_TYPE_ERROR, "PSYSyncSessionObserver - retrying checkin because the original connection was invalidated", v1, 2u);
}

@end
