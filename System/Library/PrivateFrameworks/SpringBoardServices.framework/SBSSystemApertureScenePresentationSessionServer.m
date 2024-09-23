@implementation SBSSystemApertureScenePresentationSessionServer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.system-aperture-scene-request-service");
}

+ (SBSSystemApertureScenePresentationSessionServer)activeInstance
{
  return (SBSSystemApertureScenePresentationSessionServer *)objc_loadWeakRetained(&SBSSystemApertureScenePresentationSessionServerActiveInstance);
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBSSystemApertureScenePresentationSessionServer_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_22 != -1)
    dispatch_once(&interface_onceToken_22, block);
  return (BSServiceInterface *)(id)interface___interface_21;
}

void __60__SBSSystemApertureScenePresentationSessionServer_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE144EA8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v3);
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface_21;
  interface___interface_21 = v4;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

- (SBSSystemApertureScenePresentationSessionServer)initWithDelegate:(id)a3
{
  id v4;
  SBSSystemApertureScenePresentationSessionServer *v5;
  SBSSystemApertureScenePresentationSessionServer *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *sceneConnections;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSSystemApertureScenePresentationSessionServer;
  v5 = -[SBSSystemApertureScenePresentationSessionServer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_connectionsLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sceneConnections = v6->_sceneConnections;
    v6->_sceneConnections = v7;

  }
  return v6;
}

- (void)startServer
{
  BSServiceConnectionListener *v3;
  BSServiceConnectionListener *connectionListener;
  _QWORD v5[5];

  if (!self->_connectionListener)
  {
    objc_storeWeak(&SBSSystemApertureScenePresentationSessionServerActiveInstance, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__SBSSystemApertureScenePresentationSessionServer_startServer__block_invoke;
    v5[3] = &unk_1E288FCD0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0D03460], "listenerWithConfigurator:", v5);
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
    connectionListener = self->_connectionListener;
    self->_connectionListener = v3;

    -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
  }
}

void __62__SBSSystemApertureScenePresentationSessionServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  +[SBSSystemApertureScenePresentationSessionServer identifier](SBSSystemApertureScenePresentationSessionServer, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSSystemApertureScenePresentationSessionServer;
  -[SBSSystemApertureScenePresentationSessionServer dealloc](&v3, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id location;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.springboard.requestSystemApertureScene"));

  if (v12)
  {
    objc_initWeak(&location, self);
    SBLogSystemApertureHosting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18EB52000, v13, OS_LOG_TYPE_DEFAULT, "SBSSystemApertureScenePresentationSessionServer received connection %@", buf, 0xCu);
    }

    -[SBSSystemApertureScenePresentationSessionServer _addConnection:](self, "_addConnection:", v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke;
    v15[3] = &unk_1E288D270;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "configureConnection:", v15);
    objc_msgSend(v9, "activate");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    SBLogSystemApertureHosting();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBSSystemApertureScenePresentationSessionServer listener:didReceiveConnection:withContext:].cold.1(v9, v14);

    objc_msgSend(v9, "invalidate");
  }

}

void __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[SBSSystemApertureScenePresentationSessionServer serviceQuality](SBSSystemApertureScenePresentationSessionServer, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSSystemApertureScenePresentationSessionServer interface](SBSSystemApertureScenePresentationSessionServer, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E288FCF8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);

}

void __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogSystemApertureHosting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSSystemApertureScenePresentationSessionServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (void)requestSystemApertureSceneForCurrentProcess
{
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3;
  BSDispatchMain();

}

void __94__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureSceneForCurrentProcess__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "sceneCreationRequestServer:didReceiveRequestForSystemApertureSceneWithClientIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestSystemApertureSceneInvalidationWithIdentityToken:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __107__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureSceneInvalidationWithIdentityToken___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneCreationRequestServer:invalidateSceneElement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeConnection:", v3);
  objc_msgSend(v3, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)requestSystemApertureScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", objc_msgSend(v5, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v14 = v3;
  v10 = v3;
  v11 = v4;
  v12 = v9;
  BSDispatchMain();

}

void __78__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureScene___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneCreationRequestServer:didReceiveRequestForSystemApertureSceneWithClientIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", *(_QWORD *)(a1 + 48), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_addConnection:(id)a3
{
  id v4;
  NSMutableSet *connectionsLock_connections;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_connectionsLock);
    connectionsLock_connections = self->_connectionsLock_connections;
    if (connectionsLock_connections)
    {
      -[NSMutableSet addObject:](connectionsLock_connections, "addObject:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
      v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_connectionsLock_connections;
      self->_connectionsLock_connections = v6;

    }
    os_unfair_lock_unlock(&self->_connectionsLock);
    v4 = v8;
  }

}

- (void)_removeConnection:(id)a3
{
  os_unfair_lock_s *p_connectionsLock;
  id v5;
  NSMutableSet *connectionsLock_connections;

  if (a3)
  {
    p_connectionsLock = &self->_connectionsLock;
    v5 = a3;
    os_unfair_lock_lock(p_connectionsLock);
    -[NSMutableSet removeObject:](self->_connectionsLock_connections, "removeObject:", v5);

    if (!-[NSMutableSet count](self->_connectionsLock_connections, "count"))
    {
      connectionsLock_connections = self->_connectionsLock_connections;
      self->_connectionsLock_connections = 0;

    }
    os_unfair_lock_unlock(p_connectionsLock);
  }
}

- (SBSSystemApertureScenePresentationSessionServerDelegate)delegate
{
  return (SBSSystemApertureScenePresentationSessionServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneConnections, 0);
  objc_storeStrong((id *)&self->_connectionsLock_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "Unauthorized process %{public}@ attempted to request system aperture scene.", (uint8_t *)&v4, 0xCu);

}

@end
