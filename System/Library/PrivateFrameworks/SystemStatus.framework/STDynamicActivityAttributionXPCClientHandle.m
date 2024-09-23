@implementation STDynamicActivityAttributionXPCClientHandle

- (STDynamicActivityAttributionXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  STDynamicActivityAttributionXPCClientHandle *v11;
  STDynamicActivityAttributionXPCClientHandle *v12;
  NSObject *v13;
  STDynamicActivityAttributionXPCClientHandle *v14;
  __int128 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  id location[2];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.systemstatus.activityattribution"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) != 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)STDynamicActivityAttributionXPCClientHandle;
    v11 = -[STDynamicActivityAttributionXPCClientHandle init](&v27, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_connection, a3);
      objc_storeWeak((id *)&v12->_serverHandle, v8);
      if (v7)
      {
        objc_msgSend(v7, "auditToken");
      }
      else
      {
        *(_OWORD *)location = 0u;
        v29 = 0u;
      }
      v15 = v29;
      *(_OWORD *)v12->_auditToken.val = *(_OWORD *)location;
      *(_OWORD *)&v12->_auditToken.val[4] = v15;
      objc_initWeak(location, v12);
      STDynamicAttributionXPCClientInterface();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRemoteObjectInterface:", v16);

      STDynamicAttributionXPCServerInterface();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v17);

      objc_msgSend(v7, "setExportedObject:", v12);
      v18 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v25[3] = &unk_1E91E4B50;
      objc_copyWeak(&v26, location);
      objc_msgSend(v7, "setInterruptionHandler:", v25);
      v20 = v18;
      v21 = 3221225472;
      v22 = __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
      v23 = &unk_1E91E4B50;
      objc_copyWeak(&v24, location);
      objc_msgSend(v7, "setInvalidationHandler:", &v20);
      objc_msgSend(v7, "resume", v20, v21, v22, v23);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
    }
    self = v12;
    v14 = self;
  }
  else
  {
    STSystemStatusLogDynamicAttribution();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1D12C7000, v13, OS_LOG_TYPE_ERROR, "Client (%@) attempting to access dynamic attribution without entitlement", (uint8_t *)location, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

void __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v2, "unsubscribeFromUpdates:", v4);

    objc_msgSend(v4[6], "invalidate");
    v3 = v4[6];
    v4[6] = 0;

    WeakRetained = v4;
  }

}

void __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v2, "unsubscribeFromUpdates:", v4);

    objc_msgSend(v4[6], "invalidate");
    v3 = v4[6];
    v4[6] = 0;

    WeakRetained = v4;
  }

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)currentAttributionsDidChange:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAttributionsDidChange:", v4);

}

- (void)setCurrentAttributionKey:(id)a3 application:(id)a4 reply:(id)a5
{
  STDynamicActivityAttributionServerHandle **p_serverHandle;
  id v9;
  id v10;
  id WeakRetained;
  void (**v12)(id, uint64_t);

  p_serverHandle = &self->_serverHandle;
  v12 = (void (**)(id, uint64_t))a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  objc_msgSend(WeakRetained, "setLocalizableAttributionKey:andApplication:forClient:", v10, v9, self);

  v12[2](v12, 1);
}

- (void)setCurrentAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  STDynamicActivityAttributionServerHandle **p_serverHandle;
  void (**v9)(id, uint64_t);
  id v10;
  id WeakRetained;
  __int128 v12;
  _OWORD v13[2];

  p_serverHandle = &self->_serverHandle;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  objc_msgSend(WeakRetained, "setAttributionLocalizableKey:maskingClientAuditToken:forClient:", v10, v13, self);

  v9[2](v9, 1);
}

- (void)setCurrentAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  STDynamicActivityAttributionServerHandle **p_serverHandle;
  void (**v9)(id, uint64_t);
  id v10;
  id WeakRetained;
  __int128 v12;
  _OWORD v13[2];

  p_serverHandle = &self->_serverHandle;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  objc_msgSend(WeakRetained, "setAttributionStringWithFormat:maskingClientAuditToken:forClient:", v10, v13, self);

  v9[2](v9, 1);
}

- (void)setCurrentAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  STDynamicActivityAttributionServerHandle **p_serverHandle;
  void (**v9)(id, uint64_t);
  id v10;
  id WeakRetained;
  __int128 v12;
  _OWORD v13[2];

  p_serverHandle = &self->_serverHandle;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  objc_msgSend(WeakRetained, "setAttributionWebsiteString:maskingClientAuditToken:forClient:", v10, v13, self);

  v9[2](v9, 1);
}

- (void)subscribeToUpdates
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverHandle);
  objc_msgSend(WeakRetained, "subscribeToUpdates:", self);

}

- (STDynamicActivityAttributionServerHandle)serverHandle
{
  return (STDynamicActivityAttributionServerHandle *)objc_loadWeakRetained((id *)&self->_serverHandle);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end
