@implementation WLKSubscriptionStore

+ (id)sharedInstance
{
  if (sharedInstance___once_3 != -1)
    dispatch_once(&sharedInstance___once_3, &__block_literal_global_34);
  return (id)sharedInstance___singleInstance_0;
}

- (void)fetchSubscriptionData:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id buf;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v6 = a4;
  -[WLKSubscriptionStore _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke;
  v18[3] = &unk_1E68A7E88;
  v9 = v6;
  v19 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WLKSubscriptionSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "calling out to daemon to fetch subscription data", (uint8_t *)&buf, 2u);
  }

  -[WLKSubscriptionStore _setIsSubscriptionSyncInProgress:](self, "_setIsSubscriptionSyncInProgress:", 1);
  objc_initWeak(&buf, self);
  v12 = getpid();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_11;
  v14[3] = &unk_1E68A9048;
  objc_copyWeak(&v16, &buf);
  v14[4] = self;
  v13 = v9;
  v15 = v13;
  objc_msgSend(v10, "fetchSubscriptionData:callerProcessID:completion:", v4, v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);

}

- (void)_setIsSubscriptionSyncInProgress:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__syncInProgressLock);
  subscriptionSyncInProgress = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&__syncInProgressLock);
}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4];
    objc_storeStrong(v3 + 4, *(id *)(a1 + 32));
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {

LABEL_11:
        WLKSubscriptionSyncLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSubscriptionData did change. Firing in-process notification", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "postNotificationName:object:", CFSTR("WLKSubscriptionStoreSubscriptionDataDidChange"), 0);

        goto LABEL_14;
      }
      v10 = objc_msgSend(v6, "isEqual:", v7);

      if ((v10 & 1) == 0)
        goto LABEL_11;
    }
LABEL_14:

  }
  if (*(_QWORD *)(a1 + 48))
  {
    WLKSubscriptionSyncLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "Fetched subscription data", v14, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_connection
{
  WLKSubscriptionStore *v2;
  NSXPCConnection *connection;
  uint64_t v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = v2->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    v8 = v2->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_17_0);
    objc_initWeak(&location, v2);
    v10 = v2->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __35__WLKSubscriptionStore__connection__block_invoke_18;
    v16 = &unk_1E68A7FC0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v13);
    -[NSXPCConnection resume](v2->_connection, "resume", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = v2->_connection;
  }
  v11 = connection;
  objc_sync_exit(v2);

  return v11;
}

void __38__WLKSubscriptionStore_sharedInstance__block_invoke()
{
  WLKSubscriptionStore *v0;
  void *v1;

  v0 = objc_alloc_init(WLKSubscriptionStore);
  v1 = (void *)sharedInstance___singleInstance_0;
  sharedInstance___singleInstance_0 = (uint64_t)v0;

}

- (WLKSubscriptionStore)init
{
  WLKSubscriptionStore *v2;
  NSObject *v3;
  id v4;
  WLKSubscriptionStore *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  _QWORD handler[4];
  WLKSubscriptionStore *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WLKSubscriptionStore;
  v2 = -[WLKSubscriptionStore init](&v13, sel_init);
  if (v2)
  {
    subscriptionSyncInProgress = 0;
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__WLKSubscriptionStore_init__block_invoke;
    handler[3] = &unk_1E68A8FF8;
    v5 = v2;
    v10 = v5;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.WatchListKit._WLKSubscriptionStoreSubscriptionDataDidChangeInternal", &v2->_subscriptionSyncSubscriptionDataDidChangeNotificationToken, v3, handler);

    v6 = dispatch_queue_create("com.apple.WatchListKit.SubscriptionStoreClient", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__WLKSubscriptionStore_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[8];
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), &state64);
  if (state64 != getpid())
  {
    WLKSubscriptionSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "Handling internal sync notification", v4, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "fetchSubscriptionData:completion:", 0, &__block_literal_global_5_0);

  }
}

void __28__WLKSubscriptionStore_init__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSubscriptionSyncLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "Internal sync complete", v1, 2u);
  }

}

- (void)dealloc
{
  int subscriptionSyncSubscriptionDataDidChangeNotificationToken;
  objc_super v4;

  subscriptionSyncSubscriptionDataDidChangeNotificationToken = self->_subscriptionSyncSubscriptionDataDidChangeNotificationToken;
  if (subscriptionSyncSubscriptionDataDidChangeNotificationToken)
    notify_cancel(subscriptionSyncSubscriptionDataDidChangeNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)WLKSubscriptionStore;
  -[WLKSubscriptionStore dealloc](&v4, sel_dealloc);
}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSubscriptionSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setIsSubscriptionSyncInProgress:", 0);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_2;
  v12[3] = &unk_1E68A9020;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v13 = v5;
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, v12);

  objc_destroyWeak(&v16);
}

- (void)refreshSubscriptionDataIfNeeded
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[WLKSubscriptionStore _isSubscriptionSyncInProgress](self, "_isSubscriptionSyncInProgress");
  WLKSubscriptionSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "Not refreshing subscription data as subscription sync is already in-progress", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "Start subscription refresh request", v7, 2u);
    }

    -[WLKSubscriptionStore _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13_0);
    v4 = objc_claimAutoreleasedReturnValue();

    -[NSObject refreshSubscriptionData:](v4, "refreshSubscriptionData:", 0);
  }

}

void __55__WLKSubscriptionStore_refreshSubscriptionDataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  WLKSubscriptionSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

- (id)cachedSubscriptionData
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__WLKSubscriptionStore_cachedSubscriptionData__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__WLKSubscriptionStore_cachedSubscriptionData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __35__WLKSubscriptionStore__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSubscriptionSyncLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted.", v1, 2u);
  }

}

void __35__WLKSubscriptionStore__connection__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WLKSubscriptionSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

- (BOOL)_isSubscriptionSyncInProgress
{
  char v2;

  os_unfair_lock_lock((os_unfair_lock_t)&__syncInProgressLock);
  v2 = subscriptionSyncInProgress;
  os_unfair_lock_unlock((os_unfair_lock_t)&__syncInProgressLock);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
