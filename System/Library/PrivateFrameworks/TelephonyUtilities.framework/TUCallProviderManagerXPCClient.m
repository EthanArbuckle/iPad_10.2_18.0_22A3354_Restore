@implementation TUCallProviderManagerXPCClient

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__TUCallProviderManagerXPCClient_setDelegate___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (TUCallProviderManagerXPCClient)init
{
  TUCallProviderManagerXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  _QWORD block[4];
  TUCallProviderManagerXPCClient *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUCallProviderManagerXPCClient;
  v2 = -[TUCallProviderManagerXPCClient init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyutilities.callprovidermanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__TUCallProviderManagerXPCClient_init__block_invoke;
    block[3] = &unk_1E38A1360;
    v8 = v2;
    dispatch_async(v5, block);

  }
  return v2;
}

void __55__TUCallProviderManagerXPCClient_providersByIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __64__TUCallProviderManagerXPCClient_blockUntilInitialStateReceived__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "requestedInitialState");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_requestInitialState");
  return result;
}

- (BOOL)requestedInitialState
{
  return self->_requestedInitialState;
}

- (NSDictionary)providersByIdentifier
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__TUCallProviderManagerXPCClient_providersByIdentifier__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)currentProcessCanAccessInitialState
{
  BOOL v2;
  id WeakRetained;

  if (currentProcessCanAccessInitialState_onceToken != -1)
    dispatch_once(&currentProcessCanAccessInitialState_onceToken, &__block_literal_global_26);
  if (currentProcessCanAccessInitialState_isCurrentProcessEntitled)
    return 1;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  v2 = WeakRetained != 0;

  return v2;
}

- (void)blockUntilInitialStateReceived
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TUCallProviderManagerXPCClient_blockUntilInitialStateReceived__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

id __46__TUCallProviderManagerXPCClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)_updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id WeakRetained;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  TUDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier providersByIdentifier,: %@", (uint8_t *)&v16, 0xCu);
  }

  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier localProvidersByIdentifier: %@", (uint8_t *)&v16, 0xCu);
  }

  TUDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier pairedHostDeviceProvidersByIdentifier: %@", (uint8_t *)&v16, 0xCu);
  }

  -[TUCallProviderManagerXPCClient setProvidersByIdentifier:](self, "setProvidersByIdentifier:", v8);
  -[TUCallProviderManagerXPCClient setLocalProvidersByIdentifier:](self, "setLocalProvidersByIdentifier:", v9);
  -[TUCallProviderManagerXPCClient setPairedHostDeviceProvidersByIdentifier:](self, "setPairedHostDeviceProvidersByIdentifier:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "providersChangedForDataSource:", self);

}

- (void)setProvidersByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPairedHostDeviceProvidersByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLocalProvidersByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)_requestInitialState
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];

  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TUCallProviderManagerXPCClient setRequestedInitialState:](self, "setRequestedInitialState:", 1);
  -[TUCallProviderManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_17_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_18;
  v5[3] = &unk_1E38A2B38;
  v5[4] = self;
  objc_msgSend(v4, "providersByIdentifier:", v5);

}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_2);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUCallProviderManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setRequestedInitialState:(BOOL)a3
{
  self->_requestedInitialState = a3;
}

- (NSXPCConnection)xpcConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.callprovidermanager"), 0);
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    objc_msgSend((id)objc_opt_class(), "callProviderManagerServerXPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    objc_msgSend((id)objc_opt_class(), "callProviderManagerClientXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke;
    v12[3] = &unk_1E38A13D0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_14;
    v10[3] = &unk_1E38A13D0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v10);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

+ (NSXPCInterface)callProviderManagerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUCallProviderManagerXPCClient_callProviderManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callProviderManagerServerXPCInterface_onceToken != -1)
    dispatch_once(&callProviderManagerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
}

+ (NSXPCInterface)callProviderManagerClientXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUCallProviderManagerXPCClient_callProviderManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callProviderManagerClientXPCInterface_onceToken != -1)
    dispatch_once(&callProviderManagerClientXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
}

void __38__TUCallProviderManagerXPCClient_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int *v18;
  NSObject *v19;
  id WeakRetained;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[TUCallProviderManager defaultProviders](TUCallProviderManager, "defaultProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v3, "copy");
  v12 = a1 + 32;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v14 = objc_msgSend(v3, "copy");
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)v12 + 56) = v14;

  v16 = objc_msgSend(v3, "copy");
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)v12 + 48) = v16;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v18 = *(int **)(a1 + 32);
  objc_msgSend(v18, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __38__TUCallProviderManagerXPCClient_init__block_invoke_2;
  v24 = &unk_1E38A1698;
  objc_copyWeak(&v25, &location);
  notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", v18 + 3, v19, &v21);

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  objc_msgSend(WeakRetained, "registerClient:", *(_QWORD *)(a1 + 32), v21, v22, v23, v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __71__TUCallProviderManagerXPCClient_callProviderManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3BC698);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface = v2;

  v4 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_, 0, 0);

  v6 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_, 1, 0);

  v8 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_, 2, 0);

}

void __71__TUCallProviderManagerXPCClient_callProviderManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7040);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface = v2;

  v4 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_providersByIdentifier_, 0, 1);

  v6 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_providersByIdentifier_, 1, 1);

  v8 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "callProviderManagerAllowedClasses");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_providersByIdentifier_, 2, 1);

}

+ (id)callProviderManagerAllowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

uint64_t __69__TUCallProviderManagerXPCClient_currentProcessCanAccessInitialState__block_invoke()
{
  uint64_t result;

  result = TUCurrentProcessHasEntitlementCapability(CFSTR("access-call-providers"));
  currentProcessCanAccessInitialState_isCurrentProcessEntitled = result;
  return result;
}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
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
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
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
    block[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __44__TUCallProviderManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  objc_msgSend(WeakRetained, "unregisterClient:", *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__TUCallProviderManagerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUCallProviderManagerXPCClient;
  -[TUCallProviderManagerXPCClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedHostDeviceProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_localProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_providersByIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (TUCallProviderManagerXPCServer)asynchronousServer
{
  return (TUCallProviderManagerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_2);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_2, a3);
}

+ (TUCallProviderManagerXPCServer)synchronousServer
{
  return (TUCallProviderManagerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_2);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_2, a3);
}

void __38__TUCallProviderManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "requestedInitialState"))
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(v2, "_requestInitialState");
  }

}

- (TUCallProviderManagerDataSourceDelegate)delegate
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__TUCallProviderManagerXPCClient_delegate__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallProviderManagerDataSourceDelegate *)v4;
}

void __42__TUCallProviderManagerXPCClient_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (NSDictionary)localProvidersByIdentifier
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__TUCallProviderManagerXPCClient_localProvidersByIdentifier__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __60__TUCallProviderManagerXPCClient_localProvidersByIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (NSDictionary)pairedHostDeviceProvidersByIdentifier
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__TUCallProviderManagerXPCClient_pairedHostDeviceProvidersByIdentifier__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __71__TUCallProviderManagerXPCClient_pairedHostDeviceProvidersByIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (BOOL)openURL:(id)a3 isSensitive:(BOOL)a4 error:(id *)a5
{
  return TUOpenURLWithError(a3, a4, 0, a5);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke;
  block[3] = &unk_1E38A1388;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E38A2310;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousServerWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "donateUserIntentForProviderWithIdentifier:", *(_QWORD *)(a1 + 40));

}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
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
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2;
  v4[3] = &unk_1E38A1448;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "serverWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchAppForDialRequest:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *MEMORY[0x1E0CB3388];
  v15[0] = *MEMORY[0x1E0CB2D50];
  v15[1] = v11;
  v16[0] = CFSTR("Error communicating with callservicesd");
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.TelephonyUtilities"), 1, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_16_0);

    WeakRetained = v3;
  }

}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2_15()
{
  NSObject *v0;
  uint8_t v1[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v1, 2u);
  }

}

- (id)server
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[TUCallProviderManagerXPCClient xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUCallProviderManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProvidersByIdentifier:localProvidersByIdentifier:pairedHostDeviceProvidersByIdentifier:", a2, a3, a4);
}

- (void)updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUCallProviderManagerXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __127__TUCallProviderManagerXPCClient_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __127__TUCallProviderManagerXPCClient_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProvidersByIdentifier:localProvidersByIdentifier:pairedHostDeviceProvidersByIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error donating intent for provider with identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error requesting app launch: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error requesting initial state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
