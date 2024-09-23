@implementation _TPSXPCConnection

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_underlyingConnection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak((id *)&self->_exportedObject, a3);
}

- (void)resume
{
  id WeakRetained;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSXPCConnection *underlyingConnection;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  NSXPCConnection *v13;
  __CFString *v14;
  __CFString *v15;
  NSXPCConnection *v16;
  void *v17;
  NSXPCConnection *v18;
  void *v19;
  _TPSXPCExportedObjectProxy *v20;
  _QWORD v21[4];
  __CFString *v22;
  __CFString *v23;
  id v24;
  _QWORD v25[4];
  __CFString *v26;
  __CFString *v27;
  id v28;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  if (WeakRetained)
  {
    if (self->_debugIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), self->_debugIdentifier);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_1E39608B8;
    }
    -[NSXPCConnection serviceName](self->_underlyingConnection, "serviceName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("<anonymous>");
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_initWeak(&location, self);
    underlyingConnection = self->_underlyingConnection;
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __27___TPSXPCConnection_resume__block_invoke;
    v25[3] = &unk_1E395DAD8;
    objc_copyWeak(&v28, &location);
    v11 = v4;
    v26 = v11;
    v12 = v8;
    v27 = v12;
    -[NSXPCConnection setInterruptionHandler:](underlyingConnection, "setInterruptionHandler:", v25);
    v13 = self->_underlyingConnection;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __27___TPSXPCConnection_resume__block_invoke_10;
    v21[3] = &unk_1E395DAD8;
    objc_copyWeak(&v24, &location);
    v14 = v11;
    v22 = v14;
    v15 = v12;
    v23 = v15;
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v21);
    v16 = self->_underlyingConnection;
    objc_msgSend(WeakRetained, "exportedInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v17);

    v18 = self->_underlyingConnection;
    objc_msgSend(WeakRetained, "remoteInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v18, "setRemoteObjectInterface:", v19);

    v20 = objc_alloc_init(_TPSXPCExportedObjectProxy);
    -[_TPSXPCExportedObjectProxy setWeakExportedObject:](v20, "setWeakExportedObject:", WeakRetained);
    -[NSXPCConnection setExportedObject:](self->_underlyingConnection, "setExportedObject:", v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "connectionConfigured");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  -[NSXPCConnection resume](self->_underlyingConnection, "resume");

}

- (_TPSXPCConnection)initWithUnderlyingConnection:(id)a3
{
  id v5;
  _TPSXPCConnection *v6;
  _TPSXPCConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TPSXPCConnection;
  v6 = -[_TPSXPCConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
    -[_TPSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", 0);
    -[_TPSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", 0);
  }

  return v7;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  id invalidationHandler;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44___TPSXPCConnection_setInvalidationHandler___block_invoke;
    v7[3] = &unk_1E395BA00;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  v5 = _Block_copy(v4);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v5;

}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  void *v5;
  id interruptionHandler;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44___TPSXPCConnection_setInterruptionHandler___block_invoke;
    v7[3] = &unk_1E395BA00;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  v5 = _Block_copy(v4);
  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = v5;

}

- (_TPSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  _TPSXPCConnection *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v6, a4);
  if (v7)
  {
    self = -[_TPSXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v7);
    v8 = self;
  }
  else
  {
    +[TPSLogger data](TPSLogger, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_TPSXPCConnection initWithServiceName:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection setInvalidationHandler:](self->_underlyingConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_underlyingConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_TPSXPCConnection;
  -[_TPSXPCConnection dealloc](&v3, sel_dealloc);
}

- (_TPSXPCConnection)initWithServiceName:(id)a3
{
  id v4;
  void *v5;
  _TPSXPCConnection *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", v4);
  if (v5)
  {
    self = -[_TPSXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v5);
    v6 = self;
  }
  else
  {
    +[TPSLogger data](TPSLogger, "data");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_TPSXPCConnection initWithServiceName:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

    v6 = 0;
  }

  return v6;
}

- (_TPSXPCConnection)initWithListenerEndpoint:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  _TPSXPCConnection *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithListenerEndpoint:", v5);

  v7 = -[_TPSXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v6);
  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_underlyingConnection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_underlyingConnection, "invalidate");
}

- (_TPSXPCExportable)exportedObject
{
  return (_TPSXPCExportable *)objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

- (void)initWithServiceName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_19A906000, a2, a3, "Could not establish connection with %@", a5, a6, a7, a8, 2u);
}

@end
