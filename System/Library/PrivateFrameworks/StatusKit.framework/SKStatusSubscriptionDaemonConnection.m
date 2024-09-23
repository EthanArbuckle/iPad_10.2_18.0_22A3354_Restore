@implementation SKStatusSubscriptionDaemonConnection

- (SKStatusSubscriptionDaemonConnection)initWithSubscriptionDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6;
  id v7;
  SKStatusSubscriptionDaemonConnection *v8;
  SKStatusSubscriptionDaemonConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKStatusSubscriptionDaemonConnection;
  v8 = -[SKStatusSubscriptionDaemonConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_subscriptionDaemonDelegate, v6);
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
  -[SKStatusSubscriptionDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__SKStatusSubscriptionDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __81__SKStatusSubscriptionDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
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
  +[SKStatusSubscriptionDaemonConnection logger](SKStatusSubscriptionDaemonConnection, "logger");
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
  -[SKStatusSubscriptionDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__SKStatusSubscriptionDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __80__SKStatusSubscriptionDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
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
  +[SKStatusSubscriptionDaemonConnection logger](SKStatusSubscriptionDaemonConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)logger
{
  if (logger_onceToken_10 != -1)
    dispatch_once(&logger_onceToken_10, &__block_literal_global_11);
  return (id)logger__logger_10;
}

void __46__SKStatusSubscriptionDaemonConnection_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "StatusSubscriptionDaemonConnection");
  v1 = (void *)logger__logger_10;
  logger__logger_10 = (uint64_t)v0;

}

- (NSXPCConnection)xpcConnection
{
  SKStatusSubscriptionDaemonConnection *v2;
  NSXPCConnection *xpcConnection;
  uint64_t v4;
  uint64_t v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  os_unfair_lock_lock(&v2->_lock);
  xpcConnection = v2->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = -[SKStatusSubscriptionDaemonConnection _xpcConnectionOptions](v2, "_xpcConnectionOptions");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.StatusKit.subscribe"), v4);
    v6 = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    +[SKStatusSubscriptionDaemonConnection daemonXPCInterface](SKStatusSubscriptionDaemonConnection, "daemonXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v7);

    +[SKStatusSubscriptionDaemonConnection daemonDelegateXPCInterface](SKStatusSubscriptionDaemonConnection, "daemonDelegateXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_xpcConnection, "setExportedInterface:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&v2->_subscriptionDaemonDelegate);
    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", WeakRetained);

    objc_initWeak(&location, v2);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke;
    v15[3] = &unk_24CF737D8;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v15);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke_6;
    v13[3] = &unk_24CF737D8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", v13);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    xpcConnection = v2->_xpcConnection;
  }
  v11 = xpcConnection;
  os_unfair_lock_unlock(&v2->_lock);
  objc_sync_exit(v2);

  return v11;
}

void __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SKStatusSubscriptionDaemonConnection logger](SKStatusSubscriptionDaemonConnection, "logger");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      -[os_unfair_lock_s xpcConnection](WeakRetained, "xpcConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134217984;
      v6 = (int)objc_msgSend(v3, "processIdentifier");
      _os_log_impl(&dword_213251000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v5, 0xCu);

    }
    os_unfair_lock_lock(WeakRetained + 2);
    -[os_unfair_lock_s setXpcConnection:](WeakRetained, "setXpcConnection:", 0);
    os_unfair_lock_unlock(WeakRetained + 2);
    -[os_unfair_lock_s connectionDelegate](WeakRetained, "connectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptionDaemonConnectionDidDisconnect:", WeakRetained);

  }
}

void __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke_6(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SKStatusSubscriptionDaemonConnection logger](SKStatusSubscriptionDaemonConnection, "logger");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      -[os_unfair_lock_s xpcConnection](WeakRetained, "xpcConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134217984;
      v6 = (int)objc_msgSend(v3, "processIdentifier");
      _os_log_impl(&dword_213251000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v5, 0xCu);

    }
    os_unfair_lock_lock(WeakRetained + 2);
    -[os_unfair_lock_s setXpcConnection:](WeakRetained, "setXpcConnection:", 0);
    os_unfair_lock_unlock(WeakRetained + 2);
    -[os_unfair_lock_s connectionDelegate](WeakRetained, "connectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptionDaemonConnectionDidDisconnect:", WeakRetained);

  }
}

- (void)setXPCConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  SKStatusSubscriptionDaemonConnection *obj;

  v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  os_unfair_lock_lock(&obj->_lock);
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = v4;

  os_unfair_lock_unlock(&obj->_lock);
  objc_sync_exit(obj);

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

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B91178);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion_, 0, 1);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion_, 0, 1);

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion_, 0, 1);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8F7F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_subscriptionStateChangedForSubscriptions_completion_, 0, 0);

  return (NSXPCInterface *)v2;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (SKStatusSubscriptionDaemonDelegateProtocol)subscriptionDaemonDelegate
{
  return (SKStatusSubscriptionDaemonDelegateProtocol *)objc_loadWeakRetained((id *)&self->_subscriptionDaemonDelegate);
}

- (void)setSubscriptionDaemonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subscriptionDaemonDelegate, a3);
}

- (SKStatusSubscriptionConnectionDelegateProtocol)connectionDelegate
{
  return (SKStatusSubscriptionConnectionDelegateProtocol *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
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
  objc_destroyWeak((id *)&self->_subscriptionDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
