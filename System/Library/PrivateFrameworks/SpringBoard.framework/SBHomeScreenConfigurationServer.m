@implementation SBHomeScreenConfigurationServer

- (uint64_t)connections
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)authenticator
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (SBHomeScreenConfigurationServer)init
{
  SBHomeScreenConfigurationServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *authenticator;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableArray *connections;
  void *v10;
  SBHomeScreenConfigurationServer *v11;
  uint64_t v12;
  BSServiceConnectionListener *listener;
  _QWORD v15[4];
  SBHomeScreenConfigurationServer *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBHomeScreenConfigurationServer;
  v2 = -[SBHomeScreenConfigurationServer init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.home-screen-configuration"));
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.SpringBoard.SBHomeScreenConfigurationServer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v8;

    v10 = (void *)MEMORY[0x1E0D23030];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__SBHomeScreenConfigurationServer_init__block_invoke;
    v15[3] = &unk_1E8E9EFA0;
    v11 = v2;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    listener = v11->_listener;
    v11->_listener = (BSServiceConnectionListener *)v12;

  }
  return v2;
}

void __39__SBHomeScreenConfigurationServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DAAE78];
  v6 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDomain:", v4);

  objc_msgSend(MEMORY[0x1E0DAAE78], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:", v5);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (uint64_t)activate
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "activate");
  return result;
}

- (uint64_t)listener
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  FBServiceClientAuthenticator *authenticator;
  FBServiceClientAuthenticator *v15;
  char v16;
  id v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  SBHomeScreenConfigurationServer *v21;
  NSObject *v22;
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    v13 = self->_queue;
    objc_initWeak(&location, self);
    authenticator = self->_authenticator;
  }
  else
  {
    v13 = 0;
    authenticator = 0;
    location = 0;
  }
  v15 = authenticator;
  v16 = -[FBServiceClientAuthenticator authenticateAuditToken:](v15, "authenticateAuditToken:", v12);

  if ((v16 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke;
    block[3] = &unk_1E8E9F018;
    v17 = v9;
    v20 = v17;
    v21 = self;
    objc_copyWeak(&v23, &location);
    v22 = v13;
    dispatch_sync(v22, block);
    objc_msgSend(v17, "activate");

    objc_destroyWeak(&v23);
  }
  else
  {
    SBLogHomeScreenConfiguration();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v9, v18);

    objc_msgSend(v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v8 = &unk_1E8E9EFF0;
  v2 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "configureConnection:", &v5);
  v3 = *(_QWORD **)(a1 + 40);
  if (v3)
    v3 = (_QWORD *)v3[5];
  v4 = v3;
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32), v5, v6, v7, v8, v9);

  objc_destroyWeak(&v12);
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAE78], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAE78], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v9 = &unk_1E8E9EFC8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 48), v6, v7, v8, v9);

  objc_destroyWeak(&v11);
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogHomeScreenConfiguration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Received Connection Invalidation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBHomeScreenConfigurationServer removeConnection:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)removeConnection:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v6);
    v3 = v6;
    if (WeakRetained == v6)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v5, "configurationServerDidEndConfigurationSession:completion:", a1, &__block_literal_global_11);

      v3 = v6;
    }
  }

}

- (id)configurationSessionConnection
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
  return WeakRetained;
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

- (void)beginConfigurationSessionWithCompletion:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  SBHomeScreenConfigurationServer *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    WeakRetained = 0;
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!WeakRetained)
  {
    v8 = self;
    v9 = 0;
    goto LABEL_8;
  }
  if (v6 == v5)
  {
    v11[2](v11, 0);
    goto LABEL_13;
  }
  if (v5)
  {
    v8 = self;
    v9 = 2;
LABEL_8:
    -[SBHomeScreenConfigurationServer makeErrorWithCode:](v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v10);

    goto LABEL_13;
  }
  if (self)
    objc_storeWeak((id *)&self->_configurationSessionConnection, v6);
  objc_msgSend(WeakRetained, "configurationServerDidBeginConfigurationSession:completion:", self, v11);
LABEL_13:

}

- (id)makeErrorWithCode:(void *)a1
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB758], a2, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)setConfigurationSessionConnection:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 6, a2);
  return result;
}

- (void)applyConfiguration:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  SBHomeScreenConfigurationServer *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, void *))a4;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    WeakRetained = 0;
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!WeakRetained)
  {
    v11 = self;
    v12 = 0;
LABEL_9:
    -[SBHomeScreenConfigurationServer makeErrorWithCode:](v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13);

    goto LABEL_10;
  }
  if (!v8 || v8 != (id)v9)
  {
    v11 = self;
    v12 = 1;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "configurationServer:didReceiveConfiguration:completion:", self, v14, v6);
LABEL_10:

}

- (void)endConfigurationSessionWithCompletion:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  SBHomeScreenConfigurationServer *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    WeakRetained = 0;
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!WeakRetained)
  {
    v8 = self;
    v9 = 0;
    goto LABEL_8;
  }
  if (!v5)
  {
    v11[2](v11, 0);
    goto LABEL_13;
  }
  if (v5 != (id)v6)
  {
    v8 = self;
    v9 = 1;
LABEL_8:
    -[SBHomeScreenConfigurationServer makeErrorWithCode:](v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v10);

    goto LABEL_13;
  }
  if (self)
    objc_storeWeak((id *)&self->_configurationSessionConnection, 0);
  objc_msgSend(WeakRetained, "configurationServerDidEndConfigurationSession:completion:", self, v11);
LABEL_13:

}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 1, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationSessionConnection);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Connection did not pass entitlement validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
