@implementation SYLinkContextService

- (SYLinkContextService)init
{
  return (SYLinkContextService *)-[SYLinkContextService initForTesting:](self, "initForTesting:", 0);
}

- (id)initForTesting:(BOOL)a3
{
  SYLinkContextService *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serviceQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYLinkContextService;
  v4 = -[SYLinkContextService init](&v9, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.synapse.LinkContextService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SYLinkContextService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[SYLinkContextService _listener](self, "_listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SYLinkContextService set_listener:](self, "set_listener:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SYLinkContextService;
  -[SYLinkContextService dealloc](&v5, sel_dealloc);
}

- (void)beginListeningToConnections
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  -[SYLinkContextService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SYLinkContextService _forTesting](self, "_forTesting");
    v5 = os_log_create("com.apple.synapse", "LinkContext");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: Starting Link Context Service with anonymous listener for testing", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: Starting Link Context Service", v13, 2u);
      }

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.link-context-service"));
    }
    v8 = (void *)v7;
    -[SYLinkContextService set_listener:](self, "set_listener:", v7);

    -[SYLinkContextService _listener](self, "_listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLinkContextService _serviceQueue](self, "_serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setQueue:", v10);

    -[SYLinkContextService _listener](self, "_listener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[SYLinkContextService _listener](self, "_listener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

  }
}

- (void)fetchLinkContextsDataForUserActivityInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, void *, _QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "LinkContextService: Received request to fetch link context. Activity info: %p", buf, 0xCu);
  }

  -[SYLinkContextService _contextsDataForTesting](self, "_contextsDataForTesting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SYLinkContextService _contextsDataForTesting](self, "_contextsDataForTesting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, 0);

  }
  else if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SYLinkContextService_fetchLinkContextsDataForUserActivityInfo_completion___block_invoke;
    v12[3] = &unk_1E757B6E8;
    v13 = v6;
    v14 = v7;
    +[SYItemIndexingManager fetchLinkContextsDataForUserActivity:completion:](SYItemIndexingManager, "fetchLinkContextsDataForUserActivity:completion:", v13, v12);

  }
  else
  {
    v11 = os_log_create("com.apple.synapse", "LinkContext");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = 0;
      _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_DEFAULT, "LinkContextService: Finished fetch link context request for activity: %p, calling completion with no data.", buf, 0xCu);
    }

    v7[2](v7, (void *)MEMORY[0x1E0C9AA60], 0);
  }

}

void __76__SYLinkContextService_fetchLinkContextsDataForUserActivityInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218240;
    v7 = v5;
    v8 = 2048;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "LinkContextService: Finished fetch link context request for activity: %p. Found: %ld", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "LinkContextService: userWillAddLinkWithActivityData, activeConnection = %@", (uint8_t *)&v13, 0xCu);

  }
  -[SYLinkContextService _activeConnection](self, "_activeConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "userWillAddLinkWithActivityData:completion:", v6, v7);
    }
    else if (v7)
    {
      v7[2](v7, 0);
    }

  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

void __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();

}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: userDidRemoveContentItemDatas, activeConnection = %@", (uint8_t *)&v10, 0xCu);

  }
  -[SYLinkContextService _activeConnection](self, "_activeConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "userDidRemoveContentItemDatas:", v4);

  }
}

void __54__SYLinkContextService_userDidRemoveContentItemDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();

}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: userEditDidAddContentItemDatas, activeConnection = %@", (uint8_t *)&v10, 0xCu);

  }
  -[SYLinkContextService _activeConnection](self, "_activeConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SYLinkContextService _activeConnection](self, "_activeConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "userEditDidAddContentItemDatas:", v4);

  }
}

void __55__SYLinkContextService_userEditDidAddContentItemDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _BYTE location[12];
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextService.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newConnection"));

  }
  -[SYLinkContextService _listener](self, "_listener");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
    goto LABEL_4;
  if (!-[SYLinkContextService _forTesting](self, "_forTesting"))
  {
    objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.synapse.allowLinkContextRequests"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v19, "BOOLValue"))
    {
      v20 = os_log_create("com.apple.synapse", "LinkContext");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SYLinkContextService listener:shouldAcceptNewConnection:].cold.1();

LABEL_4:
      v10 = 0;
      goto LABEL_7;
    }

  }
  -[SYLinkContextService _serviceQueue](self, "_serviceQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v11);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF492560);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v12);

  objc_msgSend(v8, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF494AC8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v13);

  objc_initWeak((id *)location, self);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke;
  v24[3] = &unk_1E757B438;
  objc_copyWeak(&v25, (id *)location);
  objc_msgSend(v8, "setInvalidationHandler:", v24);
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke_2;
  v22[3] = &unk_1E757B438;
  objc_copyWeak(&v23, (id *)location);
  objc_msgSend(v8, "setInterruptionHandler:", v22);
  objc_msgSend(v8, "resume");
  -[SYLinkContextService set_activeConnection:](self, "set_activeConnection:", v8);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);
  v10 = 1;
LABEL_7:
  v15 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v8, "processIdentifier");
    v17 = CFSTR("No");
    if (v10)
      v17 = CFSTR("Yes");
    *(_DWORD *)location = 134218242;
    *(_QWORD *)&location[4] = v16;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_INFO, "LinkContextService: Listener should accept connection from pid %ld: %@", location, 0x16u);
  }

  return v10;
}

void __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_activeConnection:", 0);

}

void __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_activeConnection:", 0);

}

- (id)_listenerEndpoint
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[SYLinkContextService _serviceQueue](self, "_serviceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SYLinkContextService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E757B730;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__SYLinkContextService__listenerEndpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_listener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)set_listener:(id)a3
{
  objc_storeStrong((id *)&self->__listener, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (NSXPCConnection)_activeConnection
{
  return self->__activeConnection;
}

- (void)set_activeConnection:(id)a3
{
  objc_storeStrong((id *)&self->__activeConnection, a3);
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (NSArray)_contextsDataForTesting
{
  return self->__contextsDataForTesting;
}

- (void)set_contextsDataForTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contextsDataForTesting, 0);
  objc_storeStrong((id *)&self->__activeConnection, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
}

void __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, v0, v1, "LinkContextService: Error creating client service proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, v0, v1, "LinkContextService: Refusing connection from non-entitled client with connection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
