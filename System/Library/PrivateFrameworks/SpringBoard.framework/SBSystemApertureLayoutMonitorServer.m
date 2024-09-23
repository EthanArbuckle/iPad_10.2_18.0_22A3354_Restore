@implementation SBSystemApertureLayoutMonitorServer

- (SBSystemApertureLayoutMonitorServer)init
{
  SBSystemApertureLayoutMonitorServer *v2;
  uint64_t v3;
  NSMutableArray *connections;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *connectionQueue;
  void *v8;
  id *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBSystemApertureLayoutMonitorServer;
  v2 = -[SBSystemApertureLayoutMonitorServer init](&v16, sel_init);
  if (v2)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v2->_isValid = 1;
    *(_QWORD *)&v2->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)MEMORY[0x1E0D23030];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__SBSystemApertureLayoutMonitorServer_init__block_invoke;
    v14[3] = &unk_1E8E9EFA0;
    v9 = v2;
    v15 = v9;
    objc_msgSend(v8, "listenerWithConfigurator:", v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9[4];
    v9[4] = (id)v10;

    objc_msgSend(v9[4], "activate");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__systemApertureLayoutDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);

  }
  return v2;
}

void __43__SBSystemApertureLayoutMonitorServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAFF0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)_systemApertureLayoutDidChange:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *frames;
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("SBSystemApertureFrames"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    os_unfair_lock_lock(&self->_framesCollectionLock);
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    frames = self->_frames;
    self->_frames = v6;

    os_unfair_lock_unlock(&self->_framesCollectionLock);
    -[SBSystemApertureLayoutMonitorServer _notifyConnectedListenersOfUpdatedFrames](self, "_notifyConnectedListenersOfUpdatedFrames");
  }

}

- (void)invalidate
{
  id v3;

  self->_isValid = 0;
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogSystemApertureHosting();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer received connection %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pid");
  if (v9 == getpid())
  {

  }
  else
  {
    objc_msgSend(v6, "remoteProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "auditToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-layout-monitoring"));

    if (v12)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke;
      v14[3] = &unk_1E8EA1060;
      v14[4] = self;
      objc_msgSend(v6, "configureConnection:", v14);
      os_unfair_lock_lock(&self->_clientServiceCollectionLock);
      -[NSMutableArray addObject:](self->_connections, "addObject:", v6);
      os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
      objc_msgSend(v6, "activate");
      goto LABEL_10;
    }
  }
  SBLogSystemApertureHosting();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
  }

  objc_msgSend(v6, "invalidate");
LABEL_10:

}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAFF0], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAFF0], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  v7 = (void *)MEMORY[0x1D17E5550](v10);
  objc_msgSend(v3, "setInterruptionHandler:", v7);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9;
  v8[3] = &unk_1E8EA1038;
  objc_copyWeak(&v9, &location);
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setActivationHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 3));
  SBLogSystemApertureHosting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer interrupted/invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  objc_msgSend(*((id *)WeakRetained + 2), "removeObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[3]);
  SBLogSystemApertureHosting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer activated connection %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(v3, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemApertureLayoutDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));

}

- (void)_notifyConnectedListenersOfUpdatedFrames
{
  void *v3;
  NSObject *connectionQueue;
  id v5;
  _QWORD v6[5];
  id v7;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_framesCollectionLock);
  v3 = (void *)-[NSArray copy](self->_frames, "copy");
  os_unfair_lock_unlock(&self->_framesCollectionLock);
  connectionQueue = self->_connectionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__SBSystemApertureLayoutMonitorServer__notifyConnectedListenersOfUpdatedFrames__block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(connectionQueue, v6);

}

void __79__SBSystemApertureLayoutMonitorServer__notifyConnectedListenersOfUpdatedFrames__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "remoteTarget", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "systemApertureLayoutDidChange:", *(_QWORD *)(a1 + 40));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
