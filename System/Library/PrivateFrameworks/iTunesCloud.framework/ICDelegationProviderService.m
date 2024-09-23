@implementation ICDelegationProviderService

- (id)_init
{
  ICDelegationProviderService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDelegationProviderService;
  v2 = -[ICDelegationProviderService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *assertionTimeoutSource;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_discoveredServices;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[ICDelegationProviderService _unregisterNotificationsForDelegationNetService:](self, "_unregisterNotificationsForDelegationNetService:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("ICUserIdentityStoreDidChangeNotification"), self->_identityStore);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  assertionTimeoutSource = self->_assertionTimeoutSource;
  if (assertionTimeoutSource)
    dispatch_source_cancel(assertionTimeoutSource);

  v10.receiver = self;
  v10.super_class = (Class)ICDelegationProviderService;
  -[ICDelegationProviderService dealloc](&v10, sel_dealloc);
}

- (void)addAssertion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICDelegationProviderService_addAssertion___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)removeAssertion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ICDelegationProviderService_removeAssertion___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)startSystemXPCService
{
  NSObject *v3;
  NSObject *accessQueue;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderService *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_isSystemService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICDelegationProviderService.m"), 140, CFSTR("Cannot start XPC service for non-system service."));

  }
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting XPC service.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ICDelegationProviderService_startSystemXPCService__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  ICDelegationProviderNetService *v8;
  NSObject *accessQueue;
  ICDelegationProviderNetService *v10;
  _QWORD v11[5];
  ICDelegationProviderNetService *v12;
  uint8_t buf[4];
  ICDelegationProviderService *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found service %{public}@", buf, 0x16u);
    }

    v8 = -[ICDelegationProviderNetService initWithNetService:]([ICDelegationProviderNetService alloc], "initWithNetService:", v6);
    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__ICDelegationProviderService_netServiceBrowser_didFindService_moreComing___block_invoke;
    v11[3] = &unk_1E4391110;
    v11[4] = self;
    v12 = v8;
    v10 = v8;
    dispatch_barrier_async(accessQueue, v11);

  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  NSObject *accessQueue;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  ICDelegationProviderService *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing service %{public}@", buf, 0x16u);
    }

    accessQueue = self->_accessQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__ICDelegationProviderService_netServiceBrowser_didRemoveService_moreComing___block_invoke;
    v9[3] = &unk_1E4391110;
    v9[4] = self;
    v10 = v6;
    dispatch_barrier_async(accessQueue, v9);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *accessQueue;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ICDelegationProviderService *v15;
  id v16;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.itunescloud.delegation-provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    accessQueue = self->_accessQueue;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke;
    v14 = &unk_1E4391110;
    v15 = self;
    v9 = v5;
    v16 = v9;
    dispatch_barrier_sync(accessQueue, &v11);
    objc_msgSend(v9, "resume", v11, v12, v13, v14, v15);

  }
  return v7;
}

- (void)delegationProviderServiceAddAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *accessQueue;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  ICDelegationProviderService *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v12 = self;
        v13 = 2114;
        v14 = v5;
        v15 = 2114;
        v16 = v4;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection %{public}@ did add assertion: %{public}@", buf, 0x20u);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__ICDelegationProviderService_delegationProviderServiceAddAssertion___block_invoke;
      block[3] = &unk_1E4391230;
      block[4] = self;
      v9 = v5;
      v10 = v4;
      dispatch_barrier_async(accessQueue, block);

    }
  }

}

- (void)delegationProviderServiceRemoveAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *accessQueue;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  ICDelegationProviderService *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v12 = self;
        v13 = 2114;
        v14 = v5;
        v15 = 2114;
        v16 = v4;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection %{public}@ did remove assertion: %{public}@", buf, 0x20u);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__ICDelegationProviderService_delegationProviderServiceRemoveAssertion___block_invoke;
      block[3] = &unk_1E4391230;
      block[4] = self;
      v9 = v5;
      v10 = v4;
      dispatch_barrier_async(accessQueue, block);

    }
  }

}

- (void)_netServiceDelegationAccountUUIDsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderService *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegation account UUIDs did change for with notification: %{public}@", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ICDelegationProviderService__netServiceDelegationAccountUUIDsDidChangeNotification___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);

}

- (void)_addConnection:(id)a3
{
  id v4;
  NSMutableSet *connections;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  connections = self->_connections;
  v8 = v4;
  if (!connections)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_connections;
    self->_connections = v6;

    v4 = v8;
    connections = self->_connections;
  }
  -[NSMutableSet addObject:](connections, "addObject:", v4);

}

- (void)_registerNotificationsForDelegationNetService:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__netServiceDelegationAccountUUIDsDidChangeNotification_, CFSTR("ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification"), v5);

}

- (void)_unregisterNotificationsForDelegationNetService:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification"), v5);

}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableSet *connections;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4);
  -[NSMapTable objectForKey:](self->_connectionToAssertions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "expirationDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            -[NSMutableSet removeObject:](self->_assertions, "removeObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    -[NSMapTable removeObjectForKey:](self->_connectionToAssertions, "removeObjectForKey:", v4);
  }
  if (!-[NSMutableSet count](self->_connections, "count"))
  {
    connections = self->_connections;
    self->_connections = 0;

  }
  -[ICDelegationProviderService _updateBrowsingStatus](self, "_updateBrowsingStatus");

}

- (void)_updateAssertionTimeouts
{
  NSObject *assertionTimeoutSource;
  OS_dispatch_source *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  NSObject *v20;
  dispatch_source_t v21;
  OS_dispatch_source *v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  ICDelegationProviderService *v26;
  _QWORD handler[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  assertionTimeoutSource = self->_assertionTimeoutSource;
  if (assertionTimeoutSource)
  {
    dispatch_source_cancel(assertionTimeoutSource);
    v4 = self->_assertionTimeoutSource;
    self->_assertionTimeoutSource = 0;

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = self;
  v5 = self->_assertions;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "expirationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "timeIntervalSinceNow");
          if (v15 <= 0.00000011920929)
          {
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "addObject:", v12);
          }
          else if (!v8
                 || (objc_msgSend(v8, "earlierDate:", v14),
                     v16 = (void *)objc_claimAutoreleasedReturnValue(),
                     v16,
                     v16 == v14))
          {
            v17 = v14;

            v8 = v17;
          }
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  if (objc_msgSend(v9, "count"))
    -[NSMutableSet minusSet:](v26->_assertions, "minusSet:", v9);
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceNow");
    v19 = v18;
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v20);
    v22 = v26->_assertionTimeoutSource;
    v26->_assertionTimeoutSource = (OS_dispatch_source *)v21;

    v23 = v26->_assertionTimeoutSource;
    v24 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v19 * 0.01 * 1000000000.0));
    objc_initWeak(&location, v26);
    v25 = v26->_assertionTimeoutSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke;
    handler[3] = &unk_1E4391400;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v25, handler);
    dispatch_resume((dispatch_object_t)v26->_assertionTimeoutSource);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (void)_updateBrowsingStatus
{
  NSObject *v3;
  _BOOL4 isNetServiceBrowserSearching;
  NSNetServiceBrowser *v5;
  NSObject *v6;
  NSNetServiceBrowser *v7;
  NSNetServiceBrowser *v8;
  NSNetServiceBrowser *v9;
  NSObject *netServiceBrowserQueue;
  _QWORD v11[4];
  NSNetServiceBrowser *v12;
  ICDelegationProviderService *v13;
  _QWORD v14[5];
  NSNetServiceBrowser *v15;
  char v16;
  _QWORD block[5];
  uint8_t buf[4];
  ICDelegationProviderService *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isSystemService)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating browsing status", buf, 0xCu);
    }

    -[ICDelegationProviderService _updateAssertionTimeouts](self, "_updateAssertionTimeouts");
    if (!-[NSMutableSet count](self->_assertions, "count"))
    {
      self->_isNetServiceBrowserSearching = 0;
      v9 = self->_netServiceBrowser;
      netServiceBrowserQueue = self->_netServiceBrowserQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_28;
      v11[3] = &unk_1E4391110;
      v12 = v9;
      v13 = self;
      v7 = v9;
      dispatch_async(netServiceBrowserQueue, v11);
      v8 = v12;
      goto LABEL_10;
    }
    if (!self->_netServiceBrowser)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke;
      block[3] = &unk_1E43913D8;
      block[4] = self;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
    isNetServiceBrowserSearching = self->_isNetServiceBrowserSearching;
    self->_isNetServiceBrowserSearching = 1;
    if (!isNetServiceBrowserSearching)
    {
      v5 = self->_netServiceBrowser;
      v6 = self->_netServiceBrowserQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_2;
      v14[3] = &unk_1E438E9A0;
      v16 = 0;
      v14[4] = self;
      v15 = v5;
      v7 = v5;
      dispatch_async(v6, v14);
      v8 = v15;
LABEL_10:

    }
  }
}

- (void)_updateDelegationForDiscoveredServices
{
  NSObject *v3;
  NSMutableDictionary *supportedDelegationAccountUUIDToUserIdentity;
  NSMutableSet *discoveredServices;
  __int128 v6;
  uint64_t i;
  ICDelegationProviderService *v8;
  NSMutableSet *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  NSObject *v37;
  ICDelegationProviderServiceSession *v38;
  NSMapTable *activeServiceSessions;
  NSMapTable *v40;
  NSMapTable *v41;
  __int128 v42;
  id obj;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  ICDelegationProviderService *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  ICDelegationProviderService *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  NSMutableSet *v70;
  __int16 v71;
  ICDelegationProviderService *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (self->_isSystemService)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      supportedDelegationAccountUUIDToUserIdentity = self->_supportedDelegationAccountUUIDToUserIdentity;
      discoveredServices = self->_discoveredServices;
      *(_DWORD *)buf = 138543874;
      v66 = self;
      v67 = 2114;
      v68 = (uint64_t)supportedDelegationAccountUUIDToUserIdentity;
      v69 = 2114;
      v70 = discoveredServices;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating delegation UUIDs [discovered services] - currentUUIDs=%{public}@ - discoveredServices=%{public}@", buf, 0x20u);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = (id)-[NSMutableSet copy](self->_discoveredServices, "copy");
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
    if (v46)
    {
      v45 = *(_QWORD *)v62;
      *(_QWORD *)&v6 = 138544130;
      v42 = v6;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v62 != v45)
            objc_enumerationMutation(obj);
          v8 = *(ICDelegationProviderService **)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[ICDelegationProviderService delegationAccountUUIDs](v8, "delegationAccountUUIDs", v42);
          v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
          v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v66 = v8;
            v67 = 2114;
            v68 = (uint64_t)v9;
            _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "   |_ Processing service %{public}@ - delegationAccountUUIDs=%{public}@", buf, 0x16u);
          }

          if (-[NSMutableSet count](v9, "count"))
          {
            v47 = i;
            v48 = v8;
            v11 = (void *)-[NSMutableSet mutableCopy](v9, "mutableCopy");
            -[NSMutableDictionary allKeys](self->_supportedDelegationAccountUUIDToUserIdentity, "allKeys");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v13 = (void *)objc_msgSend(v11, "copy");
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v58;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v58 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                  if ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0)
                    objc_msgSend(v11, "removeObject:", v18);
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
              }
              while (v15);
            }

            v19 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v48;
              v67 = 2114;
              v68 = (uint64_t)v11;
              _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - eligibleDelegationAccountUUIDs=%{public}@", buf, 0x16u);
            }

            if (objc_msgSend(v11, "count"))
            {
              -[NSMapTable objectForKey:](self->_activeServiceSessions, "objectForKey:", v48);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v66 = v48;
                v67 = 2114;
                v68 = (uint64_t)v20;
                _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - activeSessions=%{public}@", buf, 0x16u);
              }

              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v22 = v20;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v54;
LABEL_28:
                v26 = 0;
                while (1)
                {
                  if (*(_QWORD *)v54 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v26), "delegationAccountUUIDs");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "removeObjectsInArray:", v27);

                  if (!-[NSMutableSet count](v9, "count"))
                    break;
                  if (v24 == ++v26)
                  {
                    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
                    if (v24)
                      goto LABEL_28;
                    break;
                  }
                }
              }
              v44 = v22;

              v28 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = -[NSMutableSet count](v9, "count");
                *(_DWORD *)buf = 138543874;
                v66 = v48;
                v67 = 2048;
                v68 = v29;
                v69 = 2114;
                v70 = v9;
                _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - %lu new delegated accounts - delegationAccountUUIDs=%{public}@", buf, 0x20u);
              }

              if (-[NSMutableSet count](v9, "count"))
              {
                v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v31 = v11;
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v50;
                  do
                  {
                    for (k = 0; k != v33; ++k)
                    {
                      if (*(_QWORD *)v50 != v34)
                        objc_enumerationMutation(v31);
                      -[NSMutableDictionary objectForKey:](self->_supportedDelegationAccountUUIDToUserIdentity, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "addObject:", v36);

                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
                  }
                  while (v33);
                }

                v37 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v42;
                  v66 = self;
                  v67 = 2114;
                  v68 = (uint64_t)v30;
                  v69 = 2114;
                  v70 = v9;
                  v71 = 2114;
                  v72 = v48;
                  _os_log_impl(&dword_1A03E3000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating delegation provider session [new delegated account] - userIdentity=%{public}@ - delegationAccountUUIDs=%{public}@ -  netService=%{public}@", buf, 0x2Au);
                }

                v38 = -[ICDelegationProviderServiceSession initWithUserIdentities:userIdentityStore:requestContext:netService:delegationAccountUUIDs:]([ICDelegationProviderServiceSession alloc], "initWithUserIdentities:userIdentityStore:requestContext:netService:delegationAccountUUIDs:", v30, self->_identityStore, self->_requestContext, v48, v9);
                -[ICDelegationProviderServiceSession setDelegate:](v38, "setDelegate:", self);
                v22 = v44;
                if (!v44)
                {
                  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
                  activeServiceSessions = self->_activeServiceSessions;
                  if (!activeServiceSessions)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                    v40 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                    v41 = self->_activeServiceSessions;
                    self->_activeServiceSessions = v40;

                    activeServiceSessions = self->_activeServiceSessions;
                  }
                  -[NSMapTable setObject:forKey:](activeServiceSessions, "setObject:forKey:", v22, v48);
                }
                objc_msgSend(v22, "addObject:", v38);
                -[ICDelegationProviderServiceSession start](v38, "start");

              }
            }

            i = v47;
          }

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
      }
      while (v46);
    }

  }
}

- (void)_updateSupportedDelegationAccountUUIDs
{
  ICAsyncBlockOperation *v3;
  ICAsyncBlockOperation *v4;
  _QWORD v5[5];

  if (self->_isSystemService)
  {
    v3 = [ICAsyncBlockOperation alloc];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke;
    v5[3] = &unk_1E438D788;
    v5[4] = self;
    v4 = -[ICAsyncBlockOperation initWithStartHandler:](v3, "initWithStartHandler:", v5);
    -[NSOperationQueue addOperation:](self->_identityStoreOperationQueue, "addOperation:", v4);

  }
}

- (id)_xpcConnection
{
  NSXPCConnection *v2;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id from;
  id location;

  if (self->_isSystemService)
  {
    v2 = 0;
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      v5 = (NSXPCConnection *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloud.delegation-provider"), 0);
      v6 = self->_xpcConnection;
      self->_xpcConnection = v5;

      v7 = self->_xpcConnection;
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5B0E18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

      -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
      v9 = self->_xpcConnection;
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDB48);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

      objc_initWeak(&location, self->_xpcConnection);
      objc_initWeak(&from, self);
      v11 = self->_xpcConnection;
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke;
      v21[3] = &unk_1E438D8F8;
      objc_copyWeak(&v22, &from);
      objc_copyWeak(&v23, &location);
      -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v21);
      v13 = self->_xpcConnection;
      v15 = v12;
      v16 = 3221225472;
      v17 = __45__ICDelegationProviderService__xpcConnection__block_invoke_2;
      v18 = &unk_1E438D8F8;
      objc_copyWeak(&v19, &from);
      objc_copyWeak(&v20, &location);
      -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v15);
      -[NSXPCConnection resume](self->_xpcConnection, "resume", v15, v16, v17, v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      xpcConnection = self->_xpcConnection;
    }
    v2 = xpcConnection;
  }
  return v2;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_supportedDelegationAccountUUIDToUserIdentity, 0);
  objc_storeStrong((id *)&self->_identityStoreOperationQueue, 0);
  objc_storeStrong((id *)&self->_netServiceBrowserQueue, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_discoveredServices, 0);
  objc_storeStrong((id *)&self->_assertionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_connectionToAssertions, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activeServiceSessions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke_40;
    v7[3] = &unk_1E4391110;
    v8 = WeakRetained;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection invalidated.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke_41;
    v7[3] = &unk_1E4391110;
    v8 = WeakRetained;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 120);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 120) = 0;

  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v3 == v2)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = 0;

  }
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "qualityOfService");

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.supportedDelegationAccountUUIDsAccessQueue", v6);

  v8 = dispatch_group_create();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  dispatch_group_enter(v8);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v11 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_2;
  v36[3] = &unk_1E438AF68;
  v12 = v7;
  v37 = v12;
  v13 = v9;
  v38 = v13;
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_4;
  v34[3] = &unk_1E43913D8;
  v14 = v8;
  v35 = v14;
  objc_msgSend(v10, "enumerateDelegateTokensWithType:usingBlock:completionHandler:", 1, v36, v34);
  dispatch_group_enter(v14);
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_5;
  v30[3] = &unk_1E438E6F0;
  v17 = v12;
  v31 = v17;
  v18 = v13;
  v32 = v18;
  v33 = v14;
  v19 = v14;
  objc_msgSend(v15, "getPropertiesForUserIdentity:completionHandler:", v16, v30);

  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_7;
  block[3] = &unk_1E438AF90;
  v28 = v3;
  v29 = v5;
  v20 = *(_QWORD *)(a1 + 32);
  v25 = v18;
  v26 = v20;
  v27 = v17;
  v21 = v3;
  v22 = v17;
  v23 = v18;
  dispatch_group_notify(v19, v22, block);

}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_3;
  v7[3] = &unk_1E4391110;
  v5 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "DSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_6;
      block[3] = &unk_1E4391230;
      v4 = *(NSObject **)(a1 + 32);
      v6 = *(id *)(a1 + 40);
      v7 = v3;
      v8 = *(id *)(a1 + 48);
      dispatch_async(v4, block);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_7(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ICAsyncBlockOperation *v10;
  void *v11;
  ICAsyncBlockOperation *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id obj;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[6];
  id v24;
  id v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v3, "setMaxConcurrentOperationCount:", 3);
  objc_msgSend(v3, "setQualityOfService:", *(_QWORD *)(a1 + 64));
  v4 = dispatch_group_create();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        v10 = [ICAsyncBlockOperation alloc];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_8;
        v23[3] = &unk_1E4391280;
        v11 = *(void **)(a1 + 48);
        v23[4] = *(_QWORD *)(a1 + 40);
        v23[5] = v9;
        v24 = v11;
        v25 = v2;
        v26 = v4;
        v12 = -[ICAsyncBlockOperation initWithStartHandler:](v10, "initWithStartHandler:", v23);
        objc_msgSend(v3, "addOperation:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_11;
  block[3] = &unk_1E43912A8;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(NSObject **)(a1 + 48);
  v19 = v3;
  v20 = v13;
  v21 = v2;
  v22 = *(id *)(a1 + 56);
  v15 = v2;
  v16 = v3;
  dispatch_group_notify(v4, v14, block);

}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_9;
  v9[3] = &unk_1E4391258;
  v10 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = v3;
  v14 = *(id *)(a1 + 64);
  v8 = v3;
  objc_msgSend(v5, "getDelegationUUIDsForUserIdentity:completionHandler:", v4, v9);

}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_12;
  v9 = &unk_1E4391110;
  v10 = v2;
  v11 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_barrier_async(v4, &v6);
  objc_msgSend(*(id *)(a1 + 56), "finish", v6, v7, v8, v9, v10);

}

uint64_t __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_12(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateDelegationForDiscoveredServices");
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_10;
  block[3] = &unk_1E4391230;
  v12 = v5;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v9 = v5;
  v10 = a3;
  dispatch_async(v6, block);
  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v10);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_10(uint64_t a1)
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
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C92C40]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setIncludesPeerToPeer:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setDelegate:");
}

uint64_t __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(result + 48))
  {
    v1 = result;
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = *(_QWORD *)(v1 + 40);
      v5 = 138543618;
      v6 = v3;
      v7 = 2114;
      v8 = v4;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Searching for services with browser: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    return objc_msgSend(*(id *)(v1 + 40), "searchForServicesOfType:inDomain:", CFSTR("_itsdlgt._tcp."), CFSTR("local"));
  }
  return result;
}

void __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stop");
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping service search with browser: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke_2;
    block[3] = &unk_1E43913D8;
    v5 = WeakRetained;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[73])
    return objc_msgSend(v1, "_updateBrowsingStatus");
  else
    return objc_msgSend(v1, "_updateAssertionTimeouts");
}

uint64_t __86__ICDelegationProviderService__netServiceDelegationAccountUUIDsDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDelegationForDiscoveredServices");
}

void __72__ICDelegationProviderService_delegationProviderServiceRemoveAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
      {
        v2 = *(_QWORD *)(a1 + 32);
        v3 = *(void **)(v2 + 32);
        *(_QWORD *)(v2 + 32) = 0;

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateBrowsingStatus");

  }
}

void __69__ICDelegationProviderService_delegationProviderServiceAddAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v12 = v3;
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 32);
        *(_QWORD *)(v6 + 32) = v5;

        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      }
      objc_msgSend(v4, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
      v2 = (uint64_t)v12;
    }
    v13 = (id)v2;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateBrowsingStatus");

  }
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id from;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDB48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5B0E18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  v6 = *(void **)(a1 + 40);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_2;
  v15[3] = &unk_1E438D8F8;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend(v6, "setInterruptionHandler:", v15);
  v8 = *(void **)(a1 + 40);
  v9 = v7;
  v10 = 3221225472;
  v11 = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_20;
  v12 = &unk_1E438D8F8;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  objc_msgSend(v8, "setInvalidationHandler:", &v9);
  objc_msgSend(*(id *)(a1 + 32), "_addConnection:", *(_QWORD *)(a1 + 40), v9, v10, v11, v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection interrupted.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection invalidated.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

void __77__ICDelegationProviderService_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      objc_msgSend(v7, "netService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);

      if (v8 == v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    objc_msgSend(*(id *)(a1 + 32), "_unregisterNotificationsForDelegationNetService:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "stop");
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v10);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 16);
      *(_QWORD *)(v16 + 16) = 0;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v10);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = 0;

    }
  }
  else
  {
LABEL_9:
    v10 = v2;
  }

}

uint64_t __75__ICDelegationProviderService_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_registerNotificationsForDelegationNetService:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateDelegationForDiscoveredServices");
}

uint64_t __52__ICDelegationProviderService_startSystemXPCService__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 80))
  {
    v1 = result;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.itunescloud.delegation-provider"));
    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 80), "setDelegate:");
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 80), "resume");
  }
  return result;
}

uint64_t __47__ICDelegationProviderService_removeAssertion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[73])
    return objc_msgSend(v2, "_updateBrowsingStatus");
  objc_msgSend(v2, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegationProviderServiceRemoveAssertion:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateAssertionTimeouts");
}

uint64_t __44__ICDelegationProviderService_addAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  void *v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[73])
    return objc_msgSend(v6, "_updateBrowsingStatus");
  objc_msgSend(v6, "_xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegationProviderServiceAddAssertion:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateAssertionTimeouts");
}

+ (ICDelegationProviderService)sharedService
{
  if (sharedService_sOnceToken != -1)
    dispatch_once(&sharedService_sOnceToken, &__block_literal_global_6750);
  return (ICDelegationProviderService *)(id)sharedService_sSharedService;
}

+ (id)systemServiceWithRequestContext:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD *v21;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 73) = 1;
    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.netServiceBrowserQueue", 0);
    v8 = (void *)v6[12];
    v6[12] = v7;

    v9 = objc_msgSend(v4, "copy");
    v10 = (void *)v6[16];
    v6[16] = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v11, "setName:", CFSTR("com.apple.iTunesCloud.ICDelegationProviderService.identityStoreOperationQueue"));
    objc_msgSend(v11, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v11, "setQualityOfService:", 17);
    v12 = (void *)v6[13];
    v6[13] = v11;
    v13 = v11;

    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v6[8];
    v6[8] = v14;
    v16 = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__userIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), v16);
    +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__ICDelegationProviderService_systemServiceWithRequestContext___block_invoke;
    v20[3] = &unk_1E43913D8;
    v21 = v6;
    objc_msgSend(v18, "performBlockAfterFirstUnlock:", v20);

  }
  return v6;
}

uint64_t __63__ICDelegationProviderService_systemServiceWithRequestContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSupportedDelegationAccountUUIDs");
}

void __44__ICDelegationProviderService_sharedService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICDelegationProviderService _init]([ICDelegationProviderService alloc], "_init");
  v1 = (void *)sharedService_sSharedService;
  sharedService_sSharedService = (uint64_t)v0;

}

@end
