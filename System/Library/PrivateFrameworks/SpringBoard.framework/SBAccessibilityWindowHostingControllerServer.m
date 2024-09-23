@implementation SBAccessibilityWindowHostingControllerServer

- (SBAccessibilityWindowHostingControllerServer)init
{
  SBAccessibilityWindowHostingControllerServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v7;
  SBAccessibilityWindowHostingControllerServer *v8;
  uint64_t v9;
  BSServiceConnectionListener *connectionListener;
  _QWORD v12[4];
  SBAccessibilityWindowHostingControllerServer *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBAccessibilityWindowHostingControllerServer;
  v2 = -[SBAccessibilityWindowHostingControllerServer init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.accessibility-window-hosting"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v7 = (void *)MEMORY[0x1E0D23030];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__SBAccessibilityWindowHostingControllerServer_init__block_invoke;
    v12[3] = &unk_1E8E9EFA0;
    v8 = v2;
    v13 = v8;
    objc_msgSend(v7, "listenerWithConfigurator:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;

  }
  return v2;
}

void __52__SBAccessibilityWindowHostingControllerServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAD48], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBAccessibilityWindowHostingControllerServer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SBAccessibilityWindowHostingControllerServer *v22;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke;
  v20[3] = &unk_1E8EA88C8;
  v8 = v6;
  v21 = v8;
  v22 = self;
  objc_msgSend(v8, "configureConnection:", v20);
  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v8, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v11);

  if ((_DWORD)clientAuthenticator)
  {
    queue = self->_queue;
    v14 = v7;
    v15 = 3221225472;
    v16 = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_10;
    v17 = &unk_1E8E9E820;
    v18 = self;
    v13 = v8;
    v19 = v13;
    dispatch_barrier_async(queue, &v14);
    objc_msgSend(v13, "activate", v14, v15, v16, v17, v18);

  }
  else
  {
    objc_msgSend(v8, "invalidate");
  }

}

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _SBAccessibilityWindowHostingControllerServerTarget *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAD48], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  v5 = -[_SBAccessibilityWindowHostingControllerServerTarget initWithConnection:proxyInterface:]([_SBAccessibilityWindowHostingControllerServerTarget alloc], "initWithConnection:proxyInterface:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setInterfaceTarget:", v5);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(MEMORY[0x1E0DAAD48], "serviceQuality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v6);

  objc_initWeak(&location, *(id *)(a1 + 40));
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_1E8EA1010;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
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
    SBLogAccessibilityWindowHosting();
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

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1, void *a2)
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
    SBLogAccessibilityWindowHosting();
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

uint64_t __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1)
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

- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSMapTable *connectionToHostedContextIDs;
  NSMapTable *v12;
  NSMapTable *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  +[_SBAccessibilityWindowHostingControllerServerTarget currentTarget](_SBAccessibilityWindowHostingControllerServerTarget, "currentTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMapTable objectForKey:](self->_connectionToHostedContextIDs, "objectForKey:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
    if (!connectionToHostedContextIDs)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_connectionToHostedContextIDs;
      self->_connectionToHostedContextIDs = v12;

      connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
    }
    -[NSMapTable setObject:forKey:](connectionToHostedContextIDs, "setObject:forKey:", v10, v9);
    if (objc_msgSend(v10, "containsObject:", v6))
    {

    }
    else
    {
      objc_msgSend(v10, "addObject:", v6);

      v14 = v6;
      v15 = v7;
      BSDispatchMain();

    }
  }

}

uint64_t __84__SBAccessibilityWindowHostingControllerServer_registerWindowWithContextID_atLevel___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue");
  objc_msgSend(*(id *)(a1 + 48), "doubleValue");
  return objc_msgSend(v2, "_beginHostingWindowWithContextID:atLevel:", v3);
}

- (void)unregisterWindowWithContextID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[_SBAccessibilityWindowHostingControllerServerTarget currentTarget](_SBAccessibilityWindowHostingControllerServerTarget, "currentTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMapTable objectForKey:](self->_connectionToHostedContextIDs, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v4))
    {
      objc_msgSend(v7, "removeObject:", v4);
      if (!objc_msgSend(v7, "count"))
        -[NSMapTable removeObjectForKey:](self->_connectionToHostedContextIDs, "removeObjectForKey:", v6);

      v8 = v4;
      BSDispatchMain();

    }
    else
    {

    }
  }

}

uint64_t __78__SBAccessibilityWindowHostingControllerServer_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endHostingWindowWithContextID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"));
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)_beginHostingWindowWithContextID:(unsigned int)a3 atLevel:(double)a4
{
  uint64_t v5;
  void *v7;
  id v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *contextIDToScene;
  NSMutableDictionary *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CEAC38], "specification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init((Class)objc_msgSend(v7, "clientSettingsClass"));
  v9 = a4;
  if (a4 < 0.0)
  {
    SBLogAccessibilityWindowHosting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBAccessibilityWindowHostingControllerServer _beginHostingWindowWithContextID:atLevel:].cold.1(v10, a4);

    v9 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v7, "settingsClass"), "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setDisplayConfiguration:", v11);
  objc_msgSend(v11, "bounds");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setLevel:", v9);
  objc_msgSend(v13, "setInterfaceOrientation:", 1);
  objc_msgSend(v13, "setForeground:", 1);
  objc_msgSend(MEMORY[0x1E0D23148], "parametersForSpecification:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSettings:", v13);
  v31 = v8;
  objc_msgSend(v14, "setClientSettings:", v8);
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Accessibility-%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23140], "definition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:workspaceIdentifier:", v18, CFSTR("AccessibilitySceneWorkspace"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentity:", v20);

  objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClientIdentity:", v21);

  objc_msgSend(v19, "setSpecification:", v7);
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createSceneWithDefinition:initialParameters:", v19, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    contextIDToScene = self->_contextIDToScene;
    if (!contextIDToScene)
    {
      v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = self->_contextIDToScene;
      self->_contextIDToScene = v25;

      contextIDToScene = self->_contextIDToScene;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](contextIDToScene, "setObject:forKey:", v23, v27);

    objc_msgSend(MEMORY[0x1E0D22908], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fbsSceneForScene:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23098]), "initWithCAContextID:level:", v5, a4);
      objc_msgSend(v29, "attachSceneContext:", v30);

    }
  }

}

- (void)_endHostingWindowWithContextID:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *contextIDToScene;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  contextIDToScene = self->_contextIDToScene;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](contextIDToScene, "objectForKey:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v13)
  {
    v8 = self->_contextIDToScene;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    if (!-[NSMutableDictionary count](self->_contextIDToScene, "count"))
    {
      v10 = self->_contextIDToScene;
      self->_contextIDToScene = 0;

    }
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "destroyScene:withTransitionContext:", v12, 0);

    v7 = v13;
  }

}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  id v4;
  NSMutableArray *activeConnections;
  void *v6;
  void *v7;
  NSMapTable *connectionToHostedContextIDs;
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeObject:](self->_activeConnections, "removeObject:", v4);
  if (!-[NSMutableArray count](self->_activeConnections, "count"))
  {
    activeConnections = self->_activeConnections;
    self->_activeConnections = 0;

  }
  -[NSMapTable objectForKey:](self->_connectionToHostedContextIDs, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    -[NSMapTable removeObjectForKey:](self->_connectionToHostedContextIDs, "removeObjectForKey:", v4);
    if (!-[NSMapTable count](self->_connectionToHostedContextIDs, "count"))
    {
      connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
      self->_connectionToHostedContextIDs = 0;

    }
  }
  v9 = v7;
  BSDispatchMain();

}

void __86__SBAccessibilityWindowHostingControllerServer__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(a1 + 40), "_endHostingWindowWithContextID:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "unsignedIntValue", (_QWORD)v7));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextIDToScene, 0);
  objc_storeStrong((id *)&self->_connectionToHostedContextIDs, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
}

- (void)_beginHostingWindowWithContextID:(os_log_t)log atLevel:(double)a2 .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "preferred scene level %f is out of bounds; setting level to default, preferredLevel",
    (uint8_t *)&v2,
    0xCu);
}

@end
