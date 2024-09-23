@implementation MCCSecretAgentConnection

- (MCCSecretAgentConnection)init
{
  return -[MCCSecretAgentConnection initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (MCCSecretAgentConnection)initWithListenerEndpoint:(id)a3
{
  id v5;
  MCCSecretAgentConnection *v6;
  MCCSecretAgentConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCCSecretAgentConnection;
  v6 = -[MCCSecretAgentConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24B68B000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCCSecretAgentConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCCSecretAgentConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connection
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__MCCSecretAgentConnection__connection__block_invoke;
  v5[3] = &unk_251C89D00;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __39__MCCSecretAgentConnection__connection__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return v3;
}

id __39__MCCSecretAgentConnection__connection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    if (v4)
      v6 = objc_msgSend(v5, "initWithListenerEndpoint:", v4);
    else
      v6 = objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.icloudmailagent.secret.xpc"), 0);
    v7 = v6;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    +[MCCSecretAgentInterface XPCInterface](MCCSecretAgentInterface, "XPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v13 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __39__MCCSecretAgentConnection__connection__block_invoke_2;
    v18[3] = &unk_251C89CD8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v12, "setInterruptionHandler:", v18);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __39__MCCSecretAgentConnection__connection__block_invoke_3;
    v16[3] = &unk_251C89CD8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v14, "setInvalidationHandler:", v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3;
}

void __39__MCCSecretAgentConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterruptionHandler");

}

void __39__MCCSecretAgentConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidationHandler");

}

- (void)_connectionInterruptionHandler
{
  OUTLINED_FUNCTION_0(&dword_24B68B000, a1, a3, "Connection to authorization service interrupted", a5, a6, a7, a8, 0);
}

- (void)_connectionInvalidationHandler
{
  OUTLINED_FUNCTION_0(&dword_24B68B000, a1, a3, "Connection to authorization service invalidated", a5, a6, a7, a8, 0);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
