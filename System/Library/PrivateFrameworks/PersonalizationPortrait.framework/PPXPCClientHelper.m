@implementation PPXPCClientHelper

- (PPXPCClientHelper)initWithServiceName:(id)a3 allowedServerInterface:(id)a4 allowedClientInterface:(id)a5 clientExportedObject:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PPXPCClientHelper *v20;
  PPXPCClientHelper *v21;
  uint64_t v22;
  id interruptionHandler;
  uint64_t v24;
  id invalidationHandler;
  id v27;
  objc_super v28;

  v27 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PPXPCClientHelper;
  v20 = -[PPXPCClientHelper init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    pthread_mutex_init(&v20->_connLock, 0);
    objc_storeStrong((id *)&v21->_serviceName, a3);
    objc_storeStrong((id *)&v21->_allowedServerInterface, a4);
    objc_storeStrong((id *)&v21->_allowedClientInterface, a5);
    objc_storeWeak(&v21->_clientExportedObject, v17);
    v22 = MEMORY[0x18D780768](v18);
    interruptionHandler = v21->_interruptionHandler;
    v21->_interruptionHandler = (id)v22;

    v24 = MEMORY[0x18D780768](v19);
    invalidationHandler = v21->_invalidationHandler;
    v21->_invalidationHandler = (id)v24;

  }
  return v21;
}

- (id)remoteObjectProxy
{
  _opaque_pthread_mutex_t *p_connLock;
  void *v4;

  p_connLock = &self->_connLock;
  pthread_mutex_lock(&self->_connLock);
  -[PPXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_connLock);
  return v4;
}

- (void)_locked_establishConnection
{
  NSObject *v3;
  NSString *serviceName;
  NSXPCConnection *v5;
  NSXPCConnection *conn;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_conn)
  {
    pp_xpc_client_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = serviceName;
      _os_log_impl(&dword_18BE3A000, v3, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_serviceName, 0);
    conn = self->_conn;
    self->_conn = v5;

    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", self->_allowedServerInterface);
    WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    -[NSXPCConnection setExportedObject:](self->_conn, "setExportedObject:", WeakRetained);

    if (self->_allowedClientInterface)
      -[NSXPCConnection setExportedInterface:](self->_conn, "setExportedInterface:");
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__PPXPCClientHelper__locked_establishConnection__block_invoke;
    v14[3] = &unk_1E226B998;
    objc_copyWeak(&v15, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", v14);
    v9 = v8;
    v10 = 3221225472;
    v11 = __48__PPXPCClientHelper__locked_establishConnection__block_invoke_3;
    v12 = &unk_1E226B998;
    objc_copyWeak(&v13, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", &v9);
    -[NSXPCConnection resume](self->_conn, "resume", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __48__PPXPCClientHelper__locked_establishConnection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pp_xpc_client_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = WeakRetained[10];
      v4 = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(WeakRetained[14] + 16))();
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  pthread_mutex_destroy(&self->_connLock);
  v3.receiver = self;
  v3.super_class = (Class)PPXPCClientHelper;
  -[PPXPCClientHelper dealloc](&v3, sel_dealloc);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connLock;
  id v5;
  void *v6;

  p_connLock = &self->_connLock;
  v5 = a3;
  pthread_mutex_lock(p_connLock);
  -[PPXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_conn, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_allowedClientInterface, 0);
  objc_storeStrong((id *)&self->_allowedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

void __48__PPXPCClientHelper__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  char *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pp_xpc_client_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *((_QWORD *)WeakRetained + 10);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*((_QWORD *)WeakRetained + 15) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    v4 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }

}

@end
