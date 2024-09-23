@implementation SKStatusPublishingDaemonConnection

- (SKStatusPublishingDaemonConnection)initWithPublishingDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6;
  id v7;
  SKStatusPublishingDaemonConnection *v8;
  SKStatusPublishingDaemonConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKStatusPublishingDaemonConnection;
  v8 = -[SKStatusPublishingDaemonConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_publishingDaemonDelegate, v6);
    objc_storeWeak((id *)&v9->_connectionDelegate, v7);
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
  -[SKStatusPublishingDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__SKStatusPublishingDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __79__SKStatusPublishingDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
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
  +[SKStatusPublishingDaemonConnection logger](SKStatusPublishingDaemonConnection, "logger");
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
  -[SKStatusPublishingDaemonConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__SKStatusPublishingDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24CF73500;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __78__SKStatusPublishingDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
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
  +[SKStatusPublishingDaemonConnection logger](SKStatusPublishingDaemonConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)logger
{
  if (logger_onceToken_3 != -1)
    dispatch_once(&logger_onceToken_3, &__block_literal_global_3);
  return (id)logger__logger_3;
}

void __44__SKStatusPublishingDaemonConnection_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "PublishingDaemonConnection");
  v1 = (void *)logger__logger_3;
  logger__logger_3 = (uint64_t)v0;

}

- (NSXPCConnection)xpcConnection
{
  SKStatusPublishingDaemonConnection *v2;
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
  xpcConnection = v2->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = -[SKStatusPublishingDaemonConnection _xpcConnectionOptions](v2, "_xpcConnectionOptions");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.StatusKit.publish"), v4);
    v6 = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    +[SKStatusPublishingDaemonConnection daemonXPCInterface](SKStatusPublishingDaemonConnection, "daemonXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v7);

    +[SKStatusPublishingDaemonConnection daemonDelegateXPCInterface](SKStatusPublishingDaemonConnection, "daemonDelegateXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_xpcConnection, "setExportedInterface:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&v2->_publishingDaemonDelegate);
    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", WeakRetained);

    objc_initWeak(&location, v2);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke;
    v15[3] = &unk_24CF737D8;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v15);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke_6;
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
  objc_sync_exit(v2);

  return v11;
}

void __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SKStatusPublishingDaemonConnection logger](SKStatusPublishingDaemonConnection, "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213251000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidation Handled", v4, 2u);
  }

  objc_msgSend(WeakRetained, "setXpcConnection:", 0);
  objc_msgSend(WeakRetained, "connectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publishingDaemonConnectionDidDisconnect:", WeakRetained);

}

void __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SKStatusPublishingDaemonConnection logger](SKStatusPublishingDaemonConnection, "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213251000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection Interruption Handled", v4, 2u);
  }

  objc_msgSend(WeakRetained, "setXpcConnection:", 0);
  objc_msgSend(WeakRetained, "connectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publishingDaemonConnectionDidDisconnect:", WeakRetained);

}

- (void)setXPCConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  SKStatusPublishingDaemonConnection *obj;

  v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = v4;

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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B91118);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_provisionPayloads_statusTypeIdentifier_completion_, 0, 0);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_provisionPayloads_statusTypeIdentifier_completion_, 0, 1);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_removeInvitedHandles_statusTypeIdentifier_completion_, 0, 0);

  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_invitedHandlesForStatusTypeIdentifier_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8E1C8);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (SKStatusPublishingDaemonDelegateProtocol)publishingDaemonDelegate
{
  return (SKStatusPublishingDaemonDelegateProtocol *)objc_loadWeakRetained((id *)&self->_publishingDaemonDelegate);
}

- (void)setPublishingDaemonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_publishingDaemonDelegate, a3);
}

- (SKStatusPublishingConnectionDelegateProtocol)connectionDelegate
{
  return (SKStatusPublishingConnectionDelegateProtocol *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_destroyWeak((id *)&self->_publishingDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
