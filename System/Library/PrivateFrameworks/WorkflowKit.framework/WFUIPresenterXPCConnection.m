@implementation WFUIPresenterXPCConnection

- (WFUIPresenterXPCConnection)initWithMachServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  WFUIPresenterXPCConnection *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", v5, 0);

  v7 = -[WFUIPresenterXPCConnection initWithConnection:](self, "initWithConnection:", v6);
  return v7;
}

- (WFUIPresenterXPCConnection)initWithEndpoint:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  WFUIPresenterXPCConnection *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithListenerEndpoint:", v5);

  v7 = -[WFUIPresenterXPCConnection initWithConnection:](self, "initWithConnection:", v6);
  return v7;
}

- (WFUIPresenterXPCConnection)initWithServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  WFUIPresenterXPCConnection *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithServiceName:options:", v5, 0);

  v7 = -[WFUIPresenterXPCConnection initWithConnection:](self, "initWithConnection:", v6);
  return v7;
}

- (WFUIPresenterXPCConnection)initWithConnection:(id)a3
{
  id v5;
  WFUIPresenterXPCConnection *v6;
  WFUIPresenterXPCConnection *v7;
  void *v8;
  WFUIPresenterXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFUIPresenterXPCConnection;
  v6 = -[WFUIPresenterXPCConnection init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    -[NSXPCConnection setInvalidationHandler:](v7->_connection, "setInvalidationHandler:", &__block_literal_global_111_20175);
    objc_initWeak(&location, v7);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke_112;
    v14 = &unk_1E7AF5510;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v7->_connection, "setInterruptionHandler:", &v11);
    WFUIPresenterXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v8, v11, v12, v13, v14);

    v9 = v7;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)resumeConnectionIfNecessary
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__WFUIPresenterXPCConnection_resumeConnectionIfNecessary__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!-[WFUIPresenterXPCConnection connected](self, "connected"))
  {
    -[WFUIPresenterXPCConnection connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resume");

    -[WFUIPresenterXPCConnection setConnected:](self, "setConnected:", 1);
  }
  v3[2](v3);

}

- (id)presenterWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFUIPresenterXPCConnection resumeConnectionIfNecessary](self, "resumeConnectionIfNecessary");
  -[WFUIPresenterXPCConnection setErrorHandler:](self, "setErrorHandler:", v4);
  -[WFUIPresenterXPCConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousPresenterWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFUIPresenterXPCConnection resumeConnectionIfNecessary](self, "resumeConnectionIfNecessary");
  -[WFUIPresenterXPCConnection setErrorHandler:](self, "setErrorHandler:", v4);
  -[WFUIPresenterXPCConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHost:(id)a3
{
  WFUIPresenterHostInterface *v4;
  void (**v5)(_QWORD);
  id v6;
  _QWORD aBlock[5];

  v4 = (WFUIPresenterHostInterface *)a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFUIPresenterXPCConnection_setHost___block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  self->_host = v4;
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v4);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF728890);
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v6);

  v5[2](v5);
}

- (WFUIPresenterHostInterface)host
{
  return self->_host;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__WFUIPresenterXPCConnection_setHost___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __57__WFUIPresenterXPCConnection_resumeConnectionIfNecessary__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke_112(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "errorHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "errorHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    WFRunnerFailureErrorMessage(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setErrorHandler:", 0);

  }
}

void __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "-[WFUIPresenterXPCConnection initWithConnection:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v0, OS_LOG_TYPE_ERROR, "%s Connection to remote UI presenter was invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

@end
