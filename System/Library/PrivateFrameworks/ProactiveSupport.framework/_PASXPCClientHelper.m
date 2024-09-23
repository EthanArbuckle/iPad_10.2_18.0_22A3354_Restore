@implementation _PASXPCClientHelper

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_connLock);
  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PASXPCClientHelper;
  -[_PASXPCClientHelper dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_serverInitiatedRequestHandler, 0);
  objc_storeStrong((id *)&self->_allowlistedClientInterface, 0);
  objc_storeStrong((id *)&self->_allowlistedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9
{
  return -[_PASXPCClientHelper initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:](self, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 allowSystemToUserConnection:(BOOL)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9 logHandle:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  _PASXPCClientHelper *v20;
  _PASXPCClientHelper *v21;
  uint64_t v22;
  id interruptionHandler;
  uint64_t v24;
  id invalidationHandler;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v31.receiver = self;
  v31.super_class = (Class)_PASXPCClientHelper;
  v20 = -[_PASXPCClientHelper init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    pthread_mutex_init(&v20->_connLock, 0);
    objc_storeStrong((id *)&v21->_serviceName, a3);
    objc_storeStrong((id *)&v21->_allowlistedServerInterface, a4);
    objc_storeStrong((id *)&v21->_allowlistedClientInterface, a5);
    objc_storeStrong(&v21->_serverInitiatedRequestHandler, a6);
    v22 = MEMORY[0x1A1AFDE78](v17);
    interruptionHandler = v21->_interruptionHandler;
    v21->_interruptionHandler = (id)v22;

    v24 = MEMORY[0x1A1AFDE78](v18);
    invalidationHandler = v21->_invalidationHandler;
    v21->_invalidationHandler = (id)v24;

    objc_storeStrong((id *)&v21->_logHandle, a10);
    v21->_allowSystemToUserConnection = a7;
  }

  return v21;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connLock;
  id v5;
  void *v6;

  p_connLock = &self->_connLock;
  v5 = a3;
  pthread_mutex_lock(p_connLock);
  -[_PASXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_conn, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connLock);
  return v6;
}

- (id)remoteObjectProxy
{
  _opaque_pthread_mutex_t *p_connLock;
  void *v4;

  p_connLock = &self->_connLock;
  pthread_mutex_lock(&self->_connLock);
  -[_PASXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_connLock);
  return v4;
}

- (void)_locked_establishConnection
{
  NSObject *logHandle;
  NSString *serviceName;
  NSXPCConnection *v5;
  NSXPCConnection *conn;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_conn)
  {
    logHandle = self->_logHandle;
    if (logHandle && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      v15 = serviceName;
      _os_log_impl(&dword_1A0957000, logHandle, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_serviceName, 0);
    conn = self->_conn;
    self->_conn = v5;

    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", self->_allowlistedServerInterface);
    -[NSXPCConnection setExportedObject:](self->_conn, "setExportedObject:", self->_serverInitiatedRequestHandler);
    -[NSXPCConnection setExportedInterface:](self->_conn, "setExportedInterface:", self->_allowlistedClientInterface);
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50___PASXPCClientHelper__locked_establishConnection__block_invoke;
    v11[3] = &unk_1E4430440;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __50___PASXPCClientHelper__locked_establishConnection__block_invoke_3;
    v9[3] = &unk_1E4430440;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", v9);
    if (self->_allowSystemToUserConnection)
    {
      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        -[NSXPCConnection _xpcConnection](self->_conn, "_xpcConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();

      }
    }
    -[NSXPCConnection resume](self->_conn, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 whitelistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9
{
  return -[_PASXPCClientHelper initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:](self, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connLock;
  id v5;
  void *v6;

  p_connLock = &self->_connLock;
  v5 = a3;
  pthread_mutex_lock(p_connLock);
  -[_PASXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_conn, "remoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connLock);
  return v6;
}

@end
