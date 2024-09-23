@implementation SBRemoteAlertHandleServer

- (SBRemoteAlertHandleServer)initWithSessionManager:(id)a3
{
  id v5;
  SBRemoteAlertHandleServer *v6;
  SBRemoteAlertHandleServer *v7;
  uint64_t v8;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t v10;
  FBServiceClientAuthenticator *legacyClientAuthenticator;
  uint64_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  SBRemoteAlertHandleServer *v15;
  uint64_t v16;
  BSServiceConnectionListener *connectionListener;
  _QWORD v19[4];
  SBRemoteAlertHandleServer *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBRemoteAlertHandleServer;
  v6 = -[SBRemoteAlertHandleServer init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionManager, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:additionalCredentials:", CFSTR("com.apple.springboard.remote-alert"), 1);
    clientAuthenticator = v7->_clientAuthenticator;
    v7->_clientAuthenticator = (FBServiceClientAuthenticator *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.activateRemoteAlert"));
    legacyClientAuthenticator = v7->_legacyClientAuthenticator;
    v7->_legacyClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    v12 = BSDispatchQueueCreateWithQualityOfService();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x1E0D23030];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__SBRemoteAlertHandleServer_initWithSessionManager___block_invoke;
    v19[3] = &unk_1E8E9EFA0;
    v15 = v7;
    v20 = v15;
    objc_msgSend(v14, "listenerWithConfigurator:", v19);
    v16 = objc_claimAutoreleasedReturnValue();
    connectionListener = v15->_connectionListener;
    v15->_connectionListener = (BSServiceConnectionListener *)v16;

  }
  return v7;
}

void __52__SBRemoteAlertHandleServer_initWithSessionManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAFA0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sessionToConnections;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeSessionObserver:", self);
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBRemoteAlertHandleServer;
  -[SBRemoteAlertHandleServer dealloc](&v8, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *queue;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  SBRemoteAlertHandleServer *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SBRemoteAlertHandleServer *v19;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke;
  v17[3] = &unk_1E8EA88C8;
  v8 = v6;
  v18 = v8;
  v19 = self;
  objc_msgSend(v8, "configureConnection:", v17);
  queue = self->_queue;
  v11 = v7;
  v12 = 3221225472;
  v13 = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_14;
  v14 = &unk_1E8E9E820;
  v15 = self;
  v16 = v8;
  v10 = v8;
  dispatch_barrier_async(queue, &v11);
  objc_msgSend(v10, "activate", v11, v12, v13, v14, v15);

}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _SBRemoteAlertHandleServerTarget *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAFA0], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  v5 = -[_SBRemoteAlertHandleServerTarget initWithConnection:proxyInterface:]([_SBRemoteAlertHandleServerTarget alloc], "initWithConnection:proxyInterface:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setInterfaceTarget:", v5);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v6);

  objc_initWeak(&location, *(id *)(a1 + 40));
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_12;
  v8[3] = &unk_1E8EA1010;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
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
  if (WeakRetained)
  {
    SBLogTransientOverlay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_12(uint64_t a1, void *a2)
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
  if (WeakRetained)
  {
    SBLogTransientOverlay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

uint64_t __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_14(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "auditToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBRemoteAlertHandleServer _shouldAllowAuditToken:forDefinition:](self, "_shouldAllowAuditToken:forDefinition:", v13, v8))
  {
    -[SBRemoteTransientOverlaySessionManager existingSessionsWithDefinition:options:](self->_sessionManager, "existingSessionsWithDefinition:options:", v8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count") && objc_msgSend(v9, "BOOLValue"))
    {
      -[SBRemoteTransientOverlaySessionManager createSessionWithDefinition:](self->_sessionManager, "createSessionWithDefinition:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    v34 = v13;
    v35 = v9;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v17);
          _SBSRemoteAlertHandleContextFromRemoteTransientOverlaySession(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if (!v20)
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
            objc_msgSend(v20, "addObject:", v23, v34, v35);
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    +[_SBRemoteAlertHandleServerTarget currentTarget](_SBRemoteAlertHandleServerTarget, "currentTarget");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "connection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v17;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            -[SBRemoteAlertHandleServer _addConnection:forSession:](self, "_addConnection:forSession:", v27, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), v34, v35);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v30);
      }

    }
    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    v36 = v17;
    v10 = v10;
    v24 = v17;
    BSDispatchMain();
    v25 = v20;

    v13 = v34;
    v9 = v35;
  }
  else
  {
    SBLogTransientOverlay();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SBRemoteAlertHandleServer remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:].cold.1();
    v25 = 0;
  }

  return v25;
}

void __109__SBRemoteAlertHandleServer_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPrepared", (_QWORD)v8) & 1) == 0)
          objc_msgSend(v7, "prepareWithConfigurationContext:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBRemoteAlertHandleServer _shouldAllowAuditToken:forDefinition:](self, "_shouldAllowAuditToken:forDefinition:", v10, v6))
  {
    -[SBRemoteTransientOverlaySessionManager createSessionWithDefinition:](self->_sessionManager, "createSessionWithDefinition:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _SBSRemoteAlertHandleContextFromRemoteTransientOverlaySession(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SBRemoteAlertHandleServerTarget currentTarget](_SBRemoteAlertHandleServerTarget, "currentTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
      -[SBRemoteAlertHandleServer _addConnection:forSession:](self, "_addConnection:forSession:", v14, v11);
    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    v7 = v7;
    v15 = v11;
    BSDispatchMain();

  }
  else
  {
    SBLogTransientOverlay();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBRemoteAlertHandleServer createRemoteAlertHandleContextWithDefinition:configurationContext:].cold.1();
    v12 = 0;
  }

  return v12;
}

uint64_t __95__SBRemoteAlertHandleServer_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareWithConfigurationContext:", *(_QWORD *)(a1 + 40));
}

- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
      v8 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    -[SBRemoteTransientOverlaySessionManager existingSessionWithSessionID:options:](self->_sessionManager, "existingSessionWithSessionID:options:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v12 = v9;
      v13 = v8;
      BSDispatchMain();

      v11 = v12;
    }
    else
    {
      SBLogTransientOverlay();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SBRemoteAlertHandleServer activateRemoteAlertHandleWithID:activationContext:].cold.1((uint64_t)v6, v11);
    }

  }
}

uint64_t __79__SBRemoteAlertHandleServer_activateRemoteAlertHandleWithID_activationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateRemoteAlertHandleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SBRemoteTransientOverlaySessionManager existingSessionWithSessionID:options:](self->_sessionManager, "existingSessionWithSessionID:options:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v8 = v5;
      BSDispatchMain();
      v7 = v8;
    }
    else
    {
      SBLogTransientOverlay();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Unable to invalidate alert handle due to no handle for session ID: %{public}@", buf, 0xCu);
      }
    }

  }
}

uint64_t __63__SBRemoteAlertHandleServer_invalidateRemoteAlertHandleWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)remoteTransientOverlaySessionDidActivate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogTransientOverlay();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v5, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidActivate___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v13 = v5;
  v14 = v8;
  v10 = v8;
  v11 = v5;
  dispatch_async(queue, block);

}

void __70__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidActivate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "remoteTarget", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remoteAlertHandleWithIDDidActivate:", a1[6]);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogTransientOverlay();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v5, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidDeactivate___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v13 = v5;
  v14 = v8;
  v10 = v8;
  v11 = v5;
  dispatch_async(queue, block);

}

void __72__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidDeactivate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "remoteTarget", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remoteAlertHandleWithIDDidDeactivate:", a1[6]);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  SBLogTransientOverlay();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      _os_log_error_impl(&dword_1D0540000, v12, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@, error: %{public}@", buf, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    goto LABEL_6;
  }

  objc_msgSend(v9, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SBRemoteAlertHandleServer_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  block[3] = &unk_1E8E9E7D0;
  block[4] = self;
  v20 = v9;
  v22 = v14;
  v23 = a4;
  v21 = v10;
  v16 = v14;
  v17 = v10;
  v18 = v9;
  dispatch_async(queue, block);

}

void __89__SBRemoteAlertHandleServer_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);
  v4 = (void *)SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBSRemoteAlertHandleInvalidationErrorDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0CB2D50]);

    v7 = a1[6];
    if (v7)
      objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB940], v4, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteTarget", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "remoteAlertHandleWithID:didInvalidateWithError:", a1[7], v4);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_addConnection:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMapTable *sessionToConnections;
  NSMapTable *v10;
  NSMapTable *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMapTable objectForKey:](self->_sessionToConnections, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    sessionToConnections = self->_sessionToConnections;
    if (!sessionToConnections)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v11 = self->_sessionToConnections;
      self->_sessionToConnections = v10;

      sessionToConnections = self->_sessionToConnections;
    }
    -[NSMapTable setObject:forKey:](sessionToConnections, "setObject:forKey:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v6);
  if (objc_msgSend(v8, "count") == 1)
  {
    v12 = v7;
    BSDispatchMain();

  }
}

uint64_t __55__SBRemoteAlertHandleServer__addConnection_forSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSessionObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)-[NSMapTable copy](self->_sessionToConnections, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v4))
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v9, "count"))
  {
    v14 = v9;
    v15 = v4;
    BSDispatchMain();

  }
}

void __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke_2;
  block[3] = &unk_1E8E9E270;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  dispatch_async(v8, block);

}

void __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_removeConnection:forSession:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = 0;

  }
}

- (void)_removeConnection:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMapTable *sessionToConnections;
  uint64_t v10;
  id v11;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMapTable objectForKey:](self->_sessionToConnections, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v6))
  {
    objc_msgSend(v8, "removeObject:", v6);
    if (!objc_msgSend(v8, "count"))
    {
      v10 = MEMORY[0x1E0C809B0];
      v11 = v7;
      BSDispatchMain();
      -[NSMapTable removeObjectForKey:](self->_sessionToConnections, "removeObjectForKey:", v11, v10, 3221225472, __58__SBRemoteAlertHandleServer__removeConnection_forSession___block_invoke, &unk_1E8E9E820);
      if (!-[NSMapTable count](self->_sessionToConnections, "count"))
      {
        sessionToConnections = self->_sessionToConnections;
        self->_sessionToConnections = 0;

      }
    }
  }

}

uint64_t __58__SBRemoteAlertHandleServer__removeConnection_forSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSessionObserver:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldAllowAuditToken:(id)a3 forDefinition:(id)a4
{
  id v6;
  char v7;

  v6 = a3;
  if ((objc_msgSend(a4, "isForCarPlay") & 1) != 0)
  {
    v7 = 0;
  }
  else if ((-[FBServiceClientAuthenticator authenticateAuditToken:](self->_clientAuthenticator, "authenticateAuditToken:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[FBServiceClientAuthenticator authenticateAuditToken:](self->_legacyClientAuthenticator, "authenticateAuditToken:", v6);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToConnections, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_legacyClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
}

- (void)remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Not allowing remoteAlertHandleContexts due to audit token %{public}@ for definition: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)createRemoteAlertHandleContextWithDefinition:configurationContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Not allowing createRemoteAlertHandle due to audit token %{public}@ for definition: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)activateRemoteAlertHandleWithID:(uint64_t)a1 activationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unable to activate alert handle due to no handle for session ID: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
