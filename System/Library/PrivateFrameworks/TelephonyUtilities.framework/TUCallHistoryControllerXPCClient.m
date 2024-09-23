@implementation TUCallHistoryControllerXPCClient

- (TUCallHistoryControllerXPCClient)init
{
  TUCallHistoryControllerXPCClient *v2;
  TUCallHistoryControllerXPCClient *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  _QWORD handler[4];
  id v12;
  id buf[2];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUCallHistoryControllerXPCClient;
  v2 = -[TUCallHistoryControllerXPCClient init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Initializing TUCallHistoryControllerXPCClient", (uint8_t *)buf, 2u);
    }

    v5 = dispatch_queue_create("com.apple.telephonyutilities.callhistorycontrollerxpcclient", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(buf, v3);
    v7 = v3->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__TUCallHistoryControllerXPCClient_init__block_invoke;
    handler[3] = &unk_1E38A1698;
    objc_copyWeak(&v12, buf);
    notify_register_dispatch("CSDCallHistoryControllerClientsShouldConnectNotification", &v3->_shouldConnectToken, v7, handler);
    WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[TUCallHistoryControllerXPCClient init].cold.1((uint64_t)v3, (uint64_t)WeakRetained, v9);

    objc_msgSend(WeakRetained, "registerClient:", v3);
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  return v3;
}

+ (TUCallHistoryControllerXPCServer)asynchronousServer
{
  return (TUCallHistoryControllerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_5);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_5, a3);
}

+ (TUCallHistoryControllerXPCServer)synchronousServer
{
  return (TUCallHistoryControllerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_5);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_5, a3);
}

void __40__TUCallHistoryControllerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "CSDCallHistoryControllerClientsShouldConnectNotification";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for CallHistoryController", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__TUCallHistoryControllerXPCClient_init__block_invoke_2;
    block[3] = &unk_1E38A1360;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __40__TUCallHistoryControllerXPCClient_init__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_requestInitialStateWithCompletionHandler:", 0);
}

- (void)dealloc
{
  os_unfair_lock_s *p_accessorLock;
  id WeakRetained;
  objc_super v5;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  notify_cancel(self->_shouldConnectToken);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
  objc_msgSend(WeakRetained, "unregisterClient:", self);

  os_unfair_lock_unlock(p_accessorLock);
  v5.receiver = self;
  v5.super_class = (Class)TUCallHistoryControllerXPCClient;
  -[TUCallHistoryControllerXPCClient dealloc](&v5, sel_dealloc);
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCallHistoryControllerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__TUCallHistoryControllerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __66__TUCallHistoryControllerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasRequestedInitialState");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "_invokeCompletionHandler:", v4);
  else
    return objc_msgSend(v3, "_requestInitialStateWithCompletionHandler:", v4);
}

- (void)recentCallsDeleted:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TUCallHistoryControllerXPCClient_recentCallsDeleted___block_invoke;
  v7[3] = &unk_1E38A2310;
  v8 = v4;
  v5 = v4;
  -[TUCallHistoryControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recentCallsDeleted:", v5);

}

void __55__TUCallHistoryControllerXPCClient_recentCallsDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error notifying CSD of deleted recent calls: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)allCallHistoryDeleted
{
  id v2;

  -[TUCallHistoryControllerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_54);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCallHistoryDeleted");

}

void __57__TUCallHistoryControllerXPCClient_allCallHistoryDeleted__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error notifying CSD of all call history deleted error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallHistoryControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TUCallHistoryControllerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __46__TUCallHistoryControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
}

- (void)_requestInitialStateIfNecessary
{
  NSObject *v3;

  -[TUCallHistoryControllerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[TUCallHistoryControllerXPCClient hasRequestedInitialState](self, "hasRequestedInitialState"))
    -[TUCallHistoryControllerXPCClient _requestInitialStateWithCompletionHandler:](self, "_requestInitialStateWithCompletionHandler:", 0);
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[TUCallHistoryControllerXPCClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[TUCallHistoryControllerXPCClient setHasRequestedInitialState:](self, "setHasRequestedInitialState:", 1);
  -[TUCallHistoryControllerXPCClient _invokeCompletionHandler:](self, "_invokeCompletionHandler:", v5);

}

- (void)_invokeCompletionHandler:(id)a3
{
  NSObject *v4;

  if (a3)
  {
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, a3);

  }
}

- (NSXPCConnection)xpcConnection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *xpcConnection;
  NSObject *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id buf[2];

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.callhistorycontroller"), 0);
    v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    objc_msgSend((id)objc_opt_class(), "callHistoryControllerServerXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

    objc_msgSend((id)objc_opt_class(), "callHistoryControllerClientXPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(buf, self);
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke;
    v18[3] = &unk_1E38A13D0;
    objc_copyWeak(&v19, buf);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v18);
    v13 = v10;
    v14 = 3221225472;
    v15 = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_9;
    v16 = &unk_1E38A13D0;
    objc_copyWeak(&v17, buf);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &v13);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
    xpcConnection = self->_xpcConnection;
  }
  v11 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);
  return v11;
}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
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
    block[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_9(uint64_t a1)
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
    block[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2_10;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2_10(uint64_t a1)
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

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
}

- (void)setXpcConnection:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection **p_xpcConnection;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8)
    objc_storeStrong((id *)p_xpcConnection, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUCallHistoryControllerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_5);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUCallHistoryControllerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (NSSet)callHistoryControllerAllowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v10 = (void *)getCHRecentCallClass_softClass_0;
  v17 = getCHRecentCallClass_softClass_0;
  if (!getCHRecentCallClass_softClass_0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getCHRecentCallClass_block_invoke_0;
    v13[3] = &unk_1E38A1710;
    v13[4] = &v14;
    __getCHRecentCallClass_block_invoke_0((uint64_t)v13);
    v10 = (void *)v15[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v11, objc_opt_class(), 0);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSXPCInterface)callHistoryControllerClientXPCInterface
{
  if (callHistoryControllerClientXPCInterface_onceToken != -1)
    dispatch_once(&callHistoryControllerClientXPCInterface_onceToken, &__block_literal_global_19_0);
  return (NSXPCInterface *)(id)callHistoryControllerClientXPCInterface_callHistoryControllerClientXPCInterface;
}

void __75__TUCallHistoryControllerXPCClient_callHistoryControllerClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D2808);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callHistoryControllerClientXPCInterface_callHistoryControllerClientXPCInterface;
  callHistoryControllerClientXPCInterface_callHistoryControllerClientXPCInterface = v0;

}

+ (NSXPCInterface)callHistoryControllerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__TUCallHistoryControllerXPCClient_callHistoryControllerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callHistoryControllerServerXPCInterface_onceToken != -1)
    dispatch_once(&callHistoryControllerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;
}

void __75__TUCallHistoryControllerXPCClient_callHistoryControllerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E71C0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;
  callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface = v2;

  v4 = (void *)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callHistoryControllerAllowedClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_recentCallsDeleted_, 0, 0);

}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (BOOL)hasInitialState
{
  return self->_hasInitialState;
}

- (void)setHasInitialState:(BOOL)a3
{
  self->_hasInitialState = a3;
}

- (int)shouldConnectToken
{
  return self->_shouldConnectToken;
}

- (void)setShouldConnectToken:(int)a3
{
  self->_shouldConnectToken = a3;
}

- (BOOL)shouldConnectToHost
{
  return self->_shouldConnectToHost;
}

- (void)setShouldConnectToHost:(BOOL)a3
{
  self->_shouldConnectToHost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_19A50D000, log, OS_LOG_TYPE_DEBUG, "Registering TUCallHistoryControllerXPCClient %p with async server %p", (uint8_t *)&v3, 0x16u);
}

@end
