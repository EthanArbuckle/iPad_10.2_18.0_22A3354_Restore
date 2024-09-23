@implementation WCAClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_16);
  return (id)sharedClient_wcaClient;
}

- (void)executeFetchRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__WCAClient_executeFetchRequest___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __33__WCAClient_executeFetchRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  NSLog(CFSTR("Error: %@"), a2);
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, 0);

  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_3;
  block[3] = &unk_1E881C8E8;
  block[4] = v5;
  dispatch_async(v6, block);
}

void __39__WCAClient__establishDaemonConnection__block_invoke_3(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_4;
  block[3] = &unk_1E881CBD0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);

}

void __39__WCAClient__establishDaemonConnection__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_2;
  block[3] = &unk_1E881CBD0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);

}

void __39__WCAClient__establishDaemonConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("%s: xpc connection got interrupted"), "-[WCAClient _establishDaemonConnection]_block_invoke_4");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateDaemonConnectionIfPossible");

}

void __39__WCAClient__establishDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("%s: xpc connection got invalidated"), "-[WCAClient _establishDaemonConnection]_block_invoke_2");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateDaemonConnectionIfPossible");

}

void __33__WCAClient_executeFetchRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

void __33__WCAClient_executeFetchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 32), "_establishDaemonConnection");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__WCAClient_executeFetchRequest___block_invoke_2;
  v14[3] = &unk_1E881DE70;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v16 = v6;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __33__WCAClient_executeFetchRequest___block_invoke_4;
  v11[3] = &unk_1E881DE98;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v7, "executeFetchRequest:completionHandler:", v9, v11);

}

- (void)_invalidateDaemonConnectionIfPossible
{
  NSXPCConnection *connectionToService;
  NSXPCConnection *v4;

  connectionToService = self->_connectionToService;
  if (connectionToService)
  {
    -[NSXPCConnection invalidate](connectionToService, "invalidate");
    v4 = self->_connectionToService;
    self->_connectionToService = 0;

  }
}

- (void)_establishDaemonConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connectionToService;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_connectionToService)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.wifi.WiFiCloudAssetsXPCService"));
    connectionToService = self->_connectionToService;
    self->_connectionToService = v3;

    if (self->_connectionToService)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFA03680);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v5);

      -[NSXPCConnection resume](self->_connectionToService, "resume");
      objc_initWeak(&location, self);
      v6 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __39__WCAClient__establishDaemonConnection__block_invoke;
      v9[3] = &unk_1E881CBD0;
      objc_copyWeak(&v10, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_connectionToService, "setInvalidationHandler:", v9);
      v7[0] = v6;
      v7[1] = 3221225472;
      v7[2] = __39__WCAClient__establishDaemonConnection__block_invoke_3;
      v7[3] = &unk_1E881CBD0;
      objc_copyWeak(&v8, &location);
      -[NSXPCConnection setInterruptionHandler:](self->_connectionToService, "setInterruptionHandler:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (WCAClient)init
{
  WCAClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCAClient;
  v2 = -[WCAClient init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.wificloudassets.wcaclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

void __33__WCAClient_executeFetchRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v5)[2](v5, v3, 0);

  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_5;
  block[3] = &unk_1E881C8E8;
  block[4] = v6;
  dispatch_async(v7, block);

}

void __33__WCAClient_executeFetchRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = dispatch_time(0, 5000000000);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__WCAClient_executeFetchRequest___block_invoke_6;
  v6[3] = &unk_1E881D448;
  v6[4] = v4;
  v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

_QWORD *__33__WCAClient_executeFetchRequest___block_invoke_6(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == result[2])
    return (_QWORD *)objc_msgSend(result, "_invalidateDaemonConnectionIfPossible");
  return result;
}

- (void)fetchWiFiAssetsFromServer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke(uint64_t a1)
{
  id v2;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 32), "_establishDaemonConnection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchWiFiAssetsFromServer");

}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error: %@"), a2);
}

void __25__WCAClient_sharedClient__block_invoke()
{
  WCAClient *v0;
  void *v1;

  v0 = objc_alloc_init(WCAClient);
  v1 = (void *)sharedClient_wcaClient;
  sharedClient_wcaClient = (uint64_t)v0;

}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
