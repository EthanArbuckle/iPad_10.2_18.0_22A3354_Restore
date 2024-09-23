@implementation SBSSpotlightActivationRequestServer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.spotlight-activation-service");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBSSpotlightActivationRequestServer_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_20 != -1)
    dispatch_once(&interface_onceToken_20, block);
  return (BSServiceInterface *)(id)interface___interface_19;
}

void __48__SBSSpotlightActivationRequestServer_interface__block_invoke(uint64_t a1)
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

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE1449A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v3);
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface_19;
  interface___interface_19 = v4;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

- (SBSSpotlightActivationRequestServer)initWithDelegate:(id)a3
{
  id v4;
  SBSSpotlightActivationRequestServer *v5;
  SBSSpotlightActivationRequestServer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSSpotlightActivationRequestServer;
  v5 = -[SBSSpotlightActivationRequestServer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_connectionsLock._os_unfair_lock_opaque = 0;
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
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__SBSSpotlightActivationRequestServer_startServer__block_invoke;
    v5[3] = &unk_1E288FCD0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0D03460], "listenerWithConfigurator:", v5);
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
    connectionListener = self->_connectionListener;
    self->_connectionListener = v3;

    -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
  }
}

void __50__SBSSpotlightActivationRequestServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend((id)objc_opt_class(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  BSServiceConnectionListener *connectionListener;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_connectionListener)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSpotlightActivationRequestServer.m"), 70, CFSTR("Released without invalidation."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSSpotlightActivationRequestServer;
  -[SBSSpotlightActivationRequestServer dealloc](&v5, sel_dealloc);
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
  v12 = objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.springboard.SBSRequestSpotlightActivationEntitlement"));

  if (v12)
  {
    objc_initWeak(&location, self);
    SBLogSpotlight();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18EB52000, v13, OS_LOG_TYPE_DEFAULT, "SBSSpotlightActivationRequestServer received connection %@", buf, 0xCu);
    }

    -[SBSSpotlightActivationRequestServer _addConnection:](self, "_addConnection:", v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__SBSSpotlightActivationRequestServer_listener_didReceiveConnection_withContext___block_invoke;
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
    SBLogSpotlight();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBSSpotlightActivationRequestServer listener:didReceiveConnection:withContext:].cold.1(v9, v14);

    objc_msgSend(v9, "invalidate");
  }

}

void __81__SBSSpotlightActivationRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend((id)objc_opt_class(), "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SBSSpotlightActivationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E288FCF8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);

}

void __81__SBSSpotlightActivationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogSpotlight();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSSpotlightActivationRequestServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (void)requestSpotlightActivation
{
  BSDispatchMain();
}

void __65__SBSSpotlightActivationRequestServer_requestSpotlightActivation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spotlightActivationRequestServerDidRequestSpotlightActivation:", *(_QWORD *)(a1 + 32));

}

- (SBSSpotlightActivationRequestServerDelegate)delegate
{
  return (SBSSpotlightActivationRequestServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
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
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "Unauthorized process %{public}@ attempted to request spotlight activation.", (uint8_t *)&v4, 0xCu);

}

@end
