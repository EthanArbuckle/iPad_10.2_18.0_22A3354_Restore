@implementation TSXDaemonServiceClient

+ (id)sharedDaemonServiceClient
{
  void *v2;
  TSXDaemonServiceClient *v3;
  void *v4;
  id v5;

  if (sharedDaemonServiceClient_onceToken != -1)
    dispatch_once(&sharedDaemonServiceClient_onceToken, &__block_literal_global_9);
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceLock);
  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    v3 = objc_alloc_init(TSXDaemonServiceClient);
    v4 = (void *)_sharedInstance;
    _sharedInstance = (uint64_t)v3;

    v2 = (void *)_sharedInstance;
  }
  v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceLock);
  return v5;
}

void __51__TSXDaemonServiceClient_sharedDaemonServiceClient__block_invoke()
{
  os_log_t v0;
  void *v1;

  _sharedInstanceLock = 0;
  v0 = os_log_create("TimeSync", "iokit_get_property_proxy_client");
  v1 = (void *)_gIORegSignpostLog;
  _gIORegSignpostLog = (uint64_t)v0;

}

+ (id)serviceName
{
  return CFSTR("com.apple.timesync.expositor");
}

+ (id)clientProtocol
{
  return &unk_1EF139168;
}

+ (id)serverProtocol
{
  return &unk_1EF13A568;
}

- (TSXDaemonServiceClient)init
{
  TSXDaemonServiceClient *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSXPCConnection *serverConnection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TSXDaemonServiceClient;
  v2 = -[TSXDaemonServiceClient init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMachServiceName:options:", v4, 4096);
    serverConnection = v2->_serverConnection;
    v2->_serverConnection = (NSXPCConnection *)v5;

    v7 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend((id)objc_opt_class(), "serverProtocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interfaceWithProtocol:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_serverConnection, "setRemoteObjectInterface:", v9);

    v10 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend((id)objc_opt_class(), "clientProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interfaceWithProtocol:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_serverConnection, "setExportedInterface:", v12);

    -[TSXDaemonServiceClient exportedObject](v2, "exportedObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](v2->_serverConnection, "setExportedObject:", v13);

    objc_initWeak(&location, v2);
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __30__TSXDaemonServiceClient_init__block_invoke;
    v19[3] = &unk_1E694BAC0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_serverConnection, "setInterruptionHandler:", v19);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __30__TSXDaemonServiceClient_init__block_invoke_68;
    v17[3] = &unk_1E694BAC0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_serverConnection, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](v2->_serverConnection, "resume");
    -[NSXPCConnection remoteObjectProxy](v2->_serverConnection, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openXPCConnection");

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__TSXDaemonServiceClient_init__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): Interruption Handler", (uint8_t *)&v6, 0xCu);

  }
  if (WeakRetained)
    objc_msgSend(WeakRetained, "interruptedConnection");

  objc_autoreleasePoolPop(v2);
}

void __30__TSXDaemonServiceClient_init__block_invoke_68(uint64_t a1)
{
  void *v2;
  _BYTE *WeakRetained;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): Invalidation Handler", (uint8_t *)&v6, 0xCu);

  }
  if (WeakRetained)
  {
    WeakRetained[9] = 1;
    objc_msgSend(WeakRetained, "invalidatedConnection");
  }

  objc_autoreleasePoolPop(v2);
}

- (void)interruptedConnection
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TSXDaemonServiceClient_interruptedConnection__block_invoke;
  block[3] = &unk_1E694AF60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__TSXDaemonServiceClient_interruptedConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openXPCConnection");

  objc_autoreleasePoolPop(v2);
}

- (void)invalidatedConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceLock);
  if ((TSXDaemonServiceClient *)_sharedInstance == self)
  {
    _sharedInstance = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceLock);
}

- (id)exportedObject
{
  TSXDaemonServiceClientExported *v3;

  v3 = objc_alloc_init(TSXDaemonServiceClientExported);
  -[TSXDaemonServiceClientExported setObject:](v3, "setObject:", self);
  return v3;
}

- (unsigned)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v6 = *(_QWORD *)&a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  -[TSXDaemonServiceClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke;
  v20[3] = &unk_1E694BAE8;
  v20[4] = &v21;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_71;
  v19[3] = &unk_1E694BB10;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v11, "openDaemonClientWithRegistryEntryID:clientType:reply:", a3, v6, v19);
  if (a5)
  {
    v12 = (void *)v22[5];
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v12, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend((id)v22[5], "code");
      objc_msgSend((id)v22[5], "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v17 = *((_DWORD *)v28 + 6);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v17;
}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  v4 = a2;
  v5 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_cold_1(v4);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_autoreleasePoolPop(v5);

}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_71(uint64_t a1, int a2, void *a3)
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x1B5E4E6F0]();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_autoreleasePoolPop(v6);

}

- (BOOL)closeDaemonClient:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v5 = *(_QWORD *)&a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[TSXDaemonServiceClient serverConnection](self, "serverConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke;
  v18[3] = &unk_1E694BAE8;
  v18[4] = &v19;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_74;
  v17[3] = &unk_1E694BB38;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v9, "closeDaemonClient:reply:", v5, v17);
  if (a4)
  {
    v10 = (void *)v20[5];
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend((id)v20[5], "code");
      objc_msgSend((id)v20[5], "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v15 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  v4 = a2;
  v5 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_cold_1(v4);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_autoreleasePoolPop(v5);

}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_74(uint64_t a1, char a2, void *a3)
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x1B5E4E6F0]();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_autoreleasePoolPop(v6);

}

- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11
{
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  _QWORD v29[8];
  _QWORD v30[5];
  _OWORD v31[8];
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  v38 = 0;
  memset(v31, 0, sizeof(v31));
  v32 = a6;
  __memmove_chk();
  -[TSXDaemonServiceClient serverConnection](self, "serverConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke;
  v30[3] = &unk_1E694BAE8;
  v30[4] = &v33;
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  if (a7 && a8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a7, a8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = 0;
  if (a9 && a10)
    v21 = *a10;
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_77;
  v29[3] = &unk_1E694BB60;
  v29[4] = &v39;
  v29[5] = &v33;
  v29[6] = a9;
  v29[7] = a10;
  objc_msgSend(v19, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:structInput:scalarOutputCount:reply:", v14, v13, v31, v20, v21, v29);
  if (a11)
  {
    v22 = (void *)v34[5];
    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v22, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend((id)v34[5], "code");
      objc_msgSend((id)v34[5], "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v26);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v27 = *((_BYTE *)v40 + 24);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v27;
}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  v4 = a2;
  v5 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v4);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_autoreleasePoolPop(v5);

}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_77(_QWORD *a1, char a2, unsigned int *a3, void *a4)
{
  void *v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v8 = (void *)MEMORY[0x1B5E4E6F0]();
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if (v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  }
  else if (a3)
  {
    v9 = (void *)a1[6];
    if (v9)
    {
      v10 = (unsigned int *)a1[7];
      if (v10)
      {
        v11 = *v10;
        v12 = a3[32];
        if (v11 >= v12)
        {
          memmove(v9, a3, 8 * v12);
          *(_DWORD *)a1[7] = a3[32];
        }
      }
    }
  }
  objc_autoreleasePoolPop(v8);

}

- (id)propertiesForRegistryEntryID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[TSXDaemonServiceClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_79);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke_80;
  v10[3] = &unk_1E694BBC8;
  v10[4] = &v11;
  objc_msgSend(v7, "propertiesForRegistryEntryID:signpostID:reply:", a3, self, v10);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v2);
  objc_autoreleasePoolPop(v3);

}

void __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke_80(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  v4 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_autoreleasePoolPop(v4);

}

- (id)propertyForRegistryEntryID:(unint64_t)a3 key:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  -[TSXDaemonServiceClient serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_82);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke_83;
  v12[3] = &unk_1E694BBC8;
  v12[4] = &v13;
  objc_msgSend(v9, "propertyForRegistryEntryID:signpostID:key:reply:", a3, self, v6, v12);
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v2);
  objc_autoreleasePoolPop(v3);

}

void __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke_83(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  v4 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_autoreleasePoolPop(v4);

}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): dealloc", buf, 0xCu);

  }
  self->_invalidated = 1;
  -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)TSXDaemonServiceClient;
  -[TSXDaemonServiceClient dealloc](&v5, sel_dealloc);
}

- (NSXPCConnection)serverConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_2_0(v2, v3);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v4, "TSXDaemonServiceClient openDaemonClientWithRegistryEntryID error during call %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_2_0(v2, v3);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v4, "TSXDaemonServiceClient closeDaemonClient error during call %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_2_0(v2, v3);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v4, "TSXDaemonServiceClient callMethodForDaemonClient:daemonClassName: error during call %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
