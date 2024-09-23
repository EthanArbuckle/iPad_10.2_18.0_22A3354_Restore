@implementation PBUIRemoteRendererXPCConnection

+ (PBUIRemoteRendererXPCConnection)defaultConnection
{
  if (defaultConnection_onceToken != -1)
    dispatch_once(&defaultConnection_onceToken, &__block_literal_global_93);
  return (PBUIRemoteRendererXPCConnection *)(id)defaultConnection___result;
}

void __52__PBUIRemoteRendererXPCConnection_defaultConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PBUIRemoteRendererXPCConnection initToServiceName:]([PBUIRemoteRendererXPCConnection alloc], "initToServiceName:", CFSTR("com.apple.springboard.SBRendererService"));
  v1 = (void *)defaultConnection___result;
  defaultConnection___result = (uint64_t)v0;

}

- (id)initToServiceName:(id)a3
{
  id v5;
  void *v6;
  PBUIRemoteRendererXPCConnection *v7;
  uint64_t v8;
  NSString *serviceName;
  id result;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PBUIRemoteRendererXPCConnection;
    v7 = -[PBUIRemoteRendererXPCConnection init](&v12, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      serviceName = v7->_serviceName;
      v7->_serviceName = (NSString *)v8;

      v7->_connectionLock = 0;
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("serviceName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIRemoteRendererXPCConnection initToServiceName:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)initToEndpoint:(id)a3
{
  id v6;
  void *v7;
  PBUIRemoteRendererXPCConnection *v8;
  PBUIRemoteRendererXPCConnection *v9;
  id result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PBUIRemoteRendererXPCConnection;
    v8 = -[PBUIRemoteRendererXPCConnection init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_endpoint, a3);
      v9->_connectionLock = 0;
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIRemoteRendererXPCConnection initToEndpoint:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v4 = (void (**)(id, _QWORD))a3;
  -[PBUIRemoteRendererXPCConnection connectionActivateIfNeededWithError:](self, "connectionActivateIfNeededWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4[2](v4, v9);
    v7 = 0;
  }

  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v4 = (void (**)(id, _QWORD))a3;
  -[PBUIRemoteRendererXPCConnection connectionActivateIfNeededWithError:](self, "connectionActivateIfNeededWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4[2](v4, v9);
    v7 = 0;
  }

  return v7;
}

- (id)connectionActivateIfNeededWithError:(id *)a3
{
  NSXPCConnection *v5;
  NSXPCConnection *lock_connection;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_connection)
    goto LABEL_11;
  if (self->_serviceName)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", self->_serviceName);
  }
  else
  {
    if (!self->_endpoint)
      goto LABEL_7;
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_endpoint);
  }
  lock_connection = self->_lock_connection;
  self->_lock_connection = v5;

LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF196548);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBUICARemoteRenderer secureCodableRequestClasses](PBUICARemoteRenderer, "secureCodableRequestClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_renderRequest_reply_, 0, 0);

  -[NSXPCConnection setRemoteObjectInterface:](self->_lock_connection, "setRemoteObjectInterface:", v7);
  objc_initWeak(&location, self);
  v9 = self->_lock_connection;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __71__PBUIRemoteRendererXPCConnection_connectionActivateIfNeededWithError___block_invoke;
  v17 = &unk_1E6B95B70;
  objc_copyWeak(&v18, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v14);
  -[NSXPCConnection activate](self->_lock_connection, "activate");
  if (a3 && !self->_lock_connection)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v20[0] = *MEMORY[0x1E0CB2D60];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection to service (%@) refused on activation."), self->_serviceName, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = *MEMORY[0x1E0CB2D68];
    v21[0] = v11;
    v21[1] = CFSTR("Ensure this process has the correct sandbox for connection and that the service is not crashing or failing to load.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 61, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

LABEL_11:
  os_unfair_recursive_lock_unlock();
  return self->_lock_connection;
}

void __71__PBUIRemoteRendererXPCConnection_connectionActivateIfNeededWithError___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    os_unfair_recursive_lock_lock_with_options();
    v2 = (void *)v3[4];
    v3[4] = 0;

    os_unfair_recursive_lock_unlock();
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  NSXPCConnection *lock_connection;
  NSXPCConnection *v4;
  objc_super v5;

  os_unfair_recursive_lock_lock_with_options();
  lock_connection = self->_lock_connection;
  if (lock_connection)
  {
    -[NSXPCConnection invalidate](lock_connection, "invalidate");
    v4 = self->_lock_connection;
    self->_lock_connection = 0;

  }
  os_unfair_recursive_lock_unlock();
  v5.receiver = self;
  v5.super_class = (Class)PBUIRemoteRendererXPCConnection;
  -[PBUIRemoteRendererXPCConnection dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)initToServiceName:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)initToEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
