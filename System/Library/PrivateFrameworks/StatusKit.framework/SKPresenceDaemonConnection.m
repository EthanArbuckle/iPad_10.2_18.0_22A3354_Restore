@implementation SKPresenceDaemonConnection

- (SKPresenceDaemonConnection)initWithPresenceDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6;
  id v7;
  SKPresenceDaemonConnection *v8;
  SKPresenceDaemonConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKPresenceDaemonConnection;
  v8 = -[SKPresenceDaemonConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presenceDaemonDelegate, v6);
    objc_storeWeak((id *)&v9->_connectionDelegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SKPresenceDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  +[SKPresenceDaemonConnection logger](SKPresenceDaemonConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SKPresenceDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  +[SKPresenceDaemonConnection logger](SKPresenceDaemonConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SKPresenceDaemonConnection _resetConnectionHandlers](self, "_resetConnectionHandlers");
  os_unfair_lock_unlock(p_lock);
}

- (void)_resetConnectionHandlers
{
  NSXPCConnection *xpcConnection;

  os_unfair_lock_assert_owner(&self->_lock);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

+ (id)logger
{
  if (logger_onceToken_1 != -1)
    dispatch_once(&logger_onceToken_1, &__block_literal_global_1);
  return (id)logger__logger_1;
}

void __36__SKPresenceDaemonConnection_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "PresenceDaemonConnection");
  v1 = (void *)logger__logger_1;
  logger__logger_1 = (uint64_t)v0;

}

- (NSXPCConnection)xpcConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *xpcConnection;
  unint64_t v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  NSXPCConnection *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = -[SKPresenceDaemonConnection _xpcConnectionOptions](self, "_xpcConnectionOptions");
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.StatusKit.presence"), v5);
    v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    +[SKPresenceDaemonConnection daemonXPCInterface](SKPresenceDaemonConnection, "daemonXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

    +[SKPresenceDaemonConnection daemonDelegateXPCInterface](SKPresenceDaemonConnection, "daemonDelegateXPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_presenceDaemonDelegate);
    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", WeakRetained);

    objc_initWeak(&location, self);
    from = 0;
    v11 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __43__SKPresenceDaemonConnection_xpcConnection__block_invoke;
    v20[3] = &unk_24CF73528;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v20);
    v14 = v11;
    v15 = 3221225472;
    v16 = __43__SKPresenceDaemonConnection_xpcConnection__block_invoke_8;
    v17 = &unk_24CF73528;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &v14);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  v12 = xpcConnection;
  os_unfair_lock_unlock(p_lock);
  return v12;
}

void __43__SKPresenceDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  +[SKPresenceDaemonConnection logger](SKPresenceDaemonConnection, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      v6 = 134217984;
      v7 = (int)objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v6, 0xCu);

    }
    os_unfair_lock_lock(WeakRetained + 2);
    -[os_unfair_lock_s _resetConnectionHandlers](WeakRetained, "_resetConnectionHandlers");
    os_unfair_lock_unlock(WeakRetained + 2);
    -[os_unfair_lock_s connectionDelegate](WeakRetained, "connectionDelegate");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject presenceDaemonConnectionDidDisconnect:](v3, "presenceDaemonConnectionDidDisconnect:", WeakRetained);
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "_xpcConnection.invalidationHandler: The SKPresenceDaemonConnection has been deallocated, returning early...", (uint8_t *)&v6, 2u);
  }

}

void __43__SKPresenceDaemonConnection_xpcConnection__block_invoke_8(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  +[SKPresenceDaemonConnection logger](SKPresenceDaemonConnection, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      v6 = 134217984;
      v7 = (int)objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v6, 0xCu);

    }
    os_unfair_lock_lock(WeakRetained + 2);
    -[os_unfair_lock_s _resetConnectionHandlers](WeakRetained, "_resetConnectionHandlers");
    os_unfair_lock_unlock(WeakRetained + 2);
    -[os_unfair_lock_s connectionDelegate](WeakRetained, "connectionDelegate");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject presenceDaemonConnectionDidDisconnect:](v3, "presenceDaemonConnectionDidDisconnect:", WeakRetained);
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "_xpcConnection.interruptionHandler: The SKPresenceDaemonConnection has been deallocated, returning early...", (uint8_t *)&v6, 2u);
  }

}

- (void)setXPCConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;

  v4 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)_xpcConnectionOptions
{
  return 4096;
}

+ (NSXPCInterface)daemonXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B910B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_presentDevicesForPresenceIdentifier_completion_, 0, 1);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_inviteHandles_fromSenderHandle_presenceIdentifier_completion_, 0, 0);

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_removeInvitedHandles_presenceIdentifier_completion_, 0, 0);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_invitedHandlesForPresenceIdentifier_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8F000);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (SKPresenceDaemonDelegateProtocol)presenceDaemonDelegate
{
  return (SKPresenceDaemonDelegateProtocol *)objc_loadWeakRetained((id *)&self->_presenceDaemonDelegate);
}

- (void)setPresenceDaemonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenceDaemonDelegate, a3);
}

- (SKPresenceConnectionDelegateProtocol)connectionDelegate
{
  return (SKPresenceConnectionDelegateProtocol *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_destroyWeak((id *)&self->_presenceDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213251000, a2, a3, "XPC Error (async): %{public}@", a5, a6, a7, a8, 2u);
}

void __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213251000, a2, a3, "XPC Error (synchronous): %{public}@", a5, a6, a7, a8, 2u);
}

@end
