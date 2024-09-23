@implementation TUCallCapabilitiesXPCClient

void __36__TUCallCapabilitiesXPCClient_state__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_msgSend(v2, "_retrieveState");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (TUCallCapabilitiesState)state
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
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__TUCallCapabilitiesXPCClient_state__block_invoke;
  v6[3] = &unk_1E38A27F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallCapabilitiesState *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __65__TUCallCapabilitiesXPCClient_callCapabilitiesClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B8F70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callCapabilitiesClientXPCInterface_callCapabilitiesClientXPCInterface;
  callCapabilitiesClientXPCInterface_callCapabilitiesClientXPCInterface = v0;

}

void __65__TUCallCapabilitiesXPCClient_callCapabilitiesServerXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E6FE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callCapabilitiesServerXPCInterface_callCapabilitiesServerXPCInterface;
  callCapabilitiesServerXPCInterface_callCapabilitiesServerXPCInterface = v0;

}

void __49__TUCallCapabilitiesXPCClient_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

void __35__TUCallCapabilitiesXPCClient_init__block_invoke(uint64_t a1)
{
  int *v2;
  NSObject *v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(int **)(a1 + 32);
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __35__TUCallCapabilitiesXPCClient_init__block_invoke_2;
  v8 = &unk_1E38A1698;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", v2 + 2, v3, &v5);

  objc_msgSend(*(id *)(a1 + 32), "_retrieveState", v5, v6, v7, v8);
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  objc_msgSend(WeakRetained, "registerClient:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_retrieveState
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving initial call capabilities state.", buf, 2u);
  }

  -[TUCallCapabilitiesXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_12;
  v6[3] = &unk_1E38A2840;
  v6[4] = self;
  objc_msgSend(v5, "callCapabilitiesState:", v6);

}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_1);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUCallCapabilitiesXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  NSObject *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = CFSTR("com.apple.telephonyutilities.callservicesdaemon.callcapabilities");
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting up XPC connection for %@", buf, 0xCu);
    }

    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.callcapabilities"), 0);
    v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    objc_msgSend((id)objc_opt_class(), "callCapabilitiesServerXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

    objc_msgSend((id)objc_opt_class(), "callCapabilitiesClientXPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak((id *)buf, self);
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke;
    v17[3] = &unk_1E38A13D0;
    objc_copyWeak(&v18, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v17);
    v12 = v10;
    v13 = 3221225472;
    v14 = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_8;
    v15 = &unk_1E38A13D0;
    objc_copyWeak(&v16, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &v12);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

+ (NSXPCInterface)callCapabilitiesServerXPCInterface
{
  if (callCapabilitiesServerXPCInterface_onceToken != -1)
    dispatch_once(&callCapabilitiesServerXPCInterface_onceToken, &__block_literal_global_60);
  return (NSXPCInterface *)(id)callCapabilitiesServerXPCInterface_callCapabilitiesServerXPCInterface;
}

+ (NSXPCInterface)callCapabilitiesClientXPCInterface
{
  if (callCapabilitiesClientXPCInterface_onceToken != -1)
    dispatch_once(&callCapabilitiesClientXPCInterface_onceToken, &__block_literal_global_14_0);
  return (NSXPCInterface *)(id)callCapabilitiesClientXPCInterface_callCapabilitiesClientXPCInterface;
}

- (TUCallCapabilitiesXPCClient)init
{
  TUCallCapabilitiesXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMapTable *delegateToQueue;
  NSObject *v7;
  _QWORD block[4];
  TUCallCapabilitiesXPCClient *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUCallCapabilitiesXPCClient;
  v2 = -[TUCallCapabilitiesXPCClient init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyutilities.callcapabilitiesxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v2->_delegateToQueue;
    v2->_delegateToQueue = (NSMapTable *)v5;

    v7 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__TUCallCapabilitiesXPCClient_init__block_invoke;
    block[3] = &unk_1E38A1360;
    v10 = v2;
    dispatch_async(v7, block);

  }
  return v2;
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Received initial call capabilities state: %p", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateState:", v3);
}

- (void)_updateState:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_state)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke;
    v8[3] = &unk_1E38A1388;
    v8[4] = self;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    objc_storeStrong((id *)&self->_state, a3);
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Updated to newState: %@", buf, 0xCu);
    }

  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TUCallCapabilitiesXPCClient_addDelegate_queue___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

+ (TUCallCapabilitiesXPCServer)asynchronousServer
{
  return (TUCallCapabilitiesXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_1);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_1, a3);
}

+ (TUCallCapabilitiesXPCServer)synchronousServer
{
  return (TUCallCapabilitiesXPCServer *)objc_loadWeakRetained(&sSynchronousServer_1);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_1, a3);
}

void __35__TUCallCapabilitiesXPCClient_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_retrieveState");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUCallCapabilitiesXPCClient;
  -[TUCallCapabilitiesXPCClient dealloc](&v3, sel_dealloc);
}

- (void)handleServerDisconnect
{
  NSObject *v3;
  NSObject *v4;
  TUCallCapabilitiesState *state;
  uint8_t v6[16];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Server did disconnect", v6, 2u);
  }

  state = self->_state;
  self->_state = 0;

}

void __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

void __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2_9;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2_9(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

- (id)asynchronousServer
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else
  {
    -[TUCallCapabilitiesXPCClient xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUCallCapabilitiesXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TUCallCapabilitiesXPCClient_removeDelegate___block_invoke;
  block[3] = &unk_1E38A1388;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __46__TUCallCapabilitiesXPCClient_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)performDelegateCallbackBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id obj;
  _QWORD block[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke_2;
        block[3] = &unk_1E38A1FC0;
        v10 = *(id *)(a1 + 40);
        block[4] = v7;
        v13 = v10;
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

uint64_t __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallCapabilitiesXPCClient_setRelayCallingEnabled___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __54__TUCallCapabilitiesXPCClient_setRelayCallingEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelayCallingEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__TUCallCapabilitiesXPCClient_setRelayCallingEnabled_forDeviceWithID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __70__TUCallCapabilitiesXPCClient_setRelayCallingEnabled_forDeviceWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelayCallingEnabled:forDeviceWithID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__TUCallCapabilitiesXPCClient_setWiFiCallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __79__TUCallCapabilitiesXPCClient_setWiFiCallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWiFiCallingEnabled:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__TUCallCapabilitiesXPCClient_setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __86__TUCallCapabilitiesXPCClient_setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TUCallCapabilitiesXPCClient_setVoLTECallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __80__TUCallCapabilitiesXPCClient_setVoLTECallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVoLTECallingEnabled:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__TUCallCapabilitiesXPCClient_setThumperCallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __82__TUCallCapabilitiesXPCClient_setThumperCallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setThumperCallingEnabled:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__TUCallCapabilitiesXPCClient_setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID___block_invoke;
  v13[3] = &unk_1E38A2818;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __106__TUCallCapabilitiesXPCClient_setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__TUCallCapabilitiesXPCClient_setThumperCallingAllowedOnDefaultPairedDevice_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A26F0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __103__TUCallCapabilitiesXPCClient_setThumperCallingAllowedOnDefaultPairedDevice_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setThumperCallingAllowedOnDefaultPairedDevice:forSenderIdentityWithUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)endEmergencyCallbackMode
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TUCallCapabilitiesXPCClient_endEmergencyCallbackMode__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __55__TUCallCapabilitiesXPCClient_endEmergencyCallbackMode__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endEmergencyCallbackMode");

}

- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A1388;
  block[4] = self;
  v7 = v4;
  v12 = v7;
  dispatch_async(v5, block);

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2;
  v9[3] = &unk_1E38A1388;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:](TUCallCapabilities, "_sendNotificationsAndCallbacksAfterRunningBlock:", v9);

}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:", *(_QWORD *)(a1 + 40));

}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3;
  v4[3] = &unk_1E38A1388;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "senderIdentityCapabilitiesStateByUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateProvisioningURL");

}

- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E38A1388;
  block[4] = self;
  v7 = v4;
  v12 = v7;
  dispatch_async(v5, block);

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2;
  v9[3] = &unk_1E38A1388;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:](TUCallCapabilities, "_sendNotificationsAndCallbacksAfterRunningBlock:", v9);

}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:", *(_QWORD *)(a1 + 40));

}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3;
  v4[3] = &unk_1E38A1388;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "senderIdentityCapabilitiesStateByUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateProvisioningURL");

}

- (void)requestPinFromPrimaryDevice
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TUCallCapabilitiesXPCClient_requestPinFromPrimaryDevice__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__TUCallCapabilitiesXPCClient_requestPinFromPrimaryDevice__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestPinFromPrimaryDevice");

}

- (void)cancelPinRequestFromPrimaryDevice
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TUCallCapabilitiesXPCClient_cancelPinRequestFromPrimaryDevice__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __64__TUCallCapabilitiesXPCClient_cancelPinRequestFromPrimaryDevice__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "asynchronousServer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelPinRequestFromPrimaryDevice");

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TUCallCapabilitiesXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __41__TUCallCapabilitiesXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  objc_msgSend(WeakRetained, "unregisterClient:", *(_QWORD *)(a1 + 32));

}

- (void)capabilityStateUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUCallCapabilitiesXPCClient *v9;

  v4 = a3;
  -[TUCallCapabilitiesXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TUCallCapabilitiesXPCClient_capabilityStateUpdated___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__TUCallCapabilitiesXPCClient_capabilityStateUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUCallCapabilitiesXPCClient - capabilityStateUpdated: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_updateState:", *(_QWORD *)(a1 + 32));
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_cold_1((uint64_t)v2, v3);

}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_2;
  v2[3] = &unk_1E38A1388;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:](TUCallCapabilities, "_sendNotificationsAndCallbacksAfterRunningBlock:", v2);

}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_3;
  v4[3] = &unk_1E38A1388;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Error grabbing remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end
