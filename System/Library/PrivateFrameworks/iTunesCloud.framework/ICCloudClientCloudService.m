@implementation ICCloudClientCloudService

- (NSXPCConnection)xpcConnection
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
  v10 = __Block_byref_object_copy__1044;
  v11 = __Block_byref_object_dispose__1045;
  v12 = 0;
  -[ICCloudClientCloudService serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ICCloudClientCloudService_xpcConnection__block_invoke;
  v6[3] = &unk_1E4391568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

void __42__ICCloudClientCloudService_xpcConnection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v21 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "ICCloudClientCloudService %p - Creating XPC Client Connection [started]", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "listenerEndpointProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v5, "listenerEndpointForService:error:", 3, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;

    if (!v6 || v7)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        v21 = v18;
        v22 = 2114;
        v23 = v6;
        v24 = 2114;
        v25 = v7;
        v14 = "ICCloudClientCloudService %p - Creating XPC Client Connection [failed] - endpoint=%{public}@ - error=%{public}@";
        v15 = v11;
        v16 = OS_LOG_TYPE_ERROR;
        v17 = 32;
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionWithListenerEndpoint:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 8);
      *(_QWORD *)(v9 + 8) = v8;

      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_DWORD *)buf = 134218242;
        v21 = v12;
        v22 = 2114;
        v23 = v13;
        v14 = "ICCloudClientCloudService %p - Creating XPC Client Connection [ended] - connection=%{public}@";
        v15 = v11;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 22;
LABEL_10:
        _os_log_impl(&dword_1A03E3000, v15, v16, v14, buf, v17);
      }
    }

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (ICCloudServerListenerEndpointProviding)listenerEndpointProvider
{
  return (ICCloudServerListenerEndpointProviding *)objc_loadWeakRetained((id *)&self->_listenerEndpointProvider);
}

- (id)_xpcConnectionWithListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DD908);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_loadBooksForStoreIDs_configuration_completion_, 0, 1);

    objc_msgSend(v5, "setRemoteObjectInterface:", v6);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_initWeak(location, self);
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke;
    v14[3] = &unk_1E4391400;
    objc_copyWeak(&v15, location);
    objc_msgSend(v5, "setInterruptionHandler:", v14);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_164;
    v12[3] = &unk_1E4391400;
    objc_copyWeak(&v13, location);
    objc_msgSend(v5, "setInvalidationHandler:", v12);
    objc_msgSend(v5, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "ICCloudClientCloudService %p - Unable to create XPC Connection [no listener endpoint]", (uint8_t *)location, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (ICCloudClientCloudService)initWithListenerEndpointProvider:(id)a3
{
  id v4;
  ICCloudClientCloudService *v5;
  ICCloudClientCloudService *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICCloudClientCloudService;
  v5 = -[ICCloudClientCloudService init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listenerEndpointProvider, v4);
    v7 = dispatch_queue_create("com.apple.itunescloudd.ICCloudClientCloudService.serial.queue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listenerEndpointProvider);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_163(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientCloudService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (void)dealloc
{
  NSXPCConnection *xpcConnection;
  objc_super v4;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ICCloudClientCloudService;
  -[ICCloudClientCloudService dealloc](&v4, sel_dealloc);
}

void __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientCloudService %p - Connection to cloud availability service interrupted", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_163;
  block[3] = &unk_1E43913D8;
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_sync(v3, block);

}

void __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_164(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientCloudService %p - Connection to cloud availability service invalidated", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_165;
  block[3] = &unk_1E43913D8;
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_sync(v3, block);

}

void __64__ICCloudClientCloudService__xpcConnectionWithListenerEndpoint___block_invoke_165(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientCloudService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

@end
