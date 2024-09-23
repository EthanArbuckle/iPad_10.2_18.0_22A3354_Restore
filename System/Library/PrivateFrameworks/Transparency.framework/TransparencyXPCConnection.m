@implementation TransparencyXPCConnection

+ (void)invokeXPCSynchronousCallWithBlock:(id)a3 errorHandler:(id)a4
{
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = MEMORY[0x24BDAC760];
  do
  {
    *v6 = 0;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke;
    v11[3] = &unk_24DC902B8;
    v13 = &v16;
    v14 = v20;
    v15 = a1;
    v10 = v8;
    v12 = v10;
    +[TransparencyXPCConnection invokeXPCWithBlock:synchronous:errorHandler:](TransparencyXPCConnection, "invokeXPCWithBlock:synchronous:errorHandler:", v7, 1, v11);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

+ (void)invokeXPCWithBlock:(id)a3 synchronous:(BOOL)a4 errorHandler:(id)a5
{
  void (**v7)(id, uint64_t, uint64_t);
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  v8 = a5;
  +[TransparencyXPCConnection mainInstance](TransparencyXPCConnection, "mainInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v9, "createConnection"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (a4)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_27;
      v17[3] = &unk_24DC8EA78;
      v18 = v8;
      objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;
    }
    else
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke;
      v19[3] = &unk_24DC8EA78;
      v20 = v8;
      objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v19);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v20;
    }

    v13 = 0;
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("kTransparencyError"), -108, CFSTR("failed to create XPC connection"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_34_1);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v16, 2u);
    }
    v10 = 0;
    v11 = 0;
  }
  if (!(v11 | v13))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_36);
    v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21A250000, v14, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v16, 2u);
    }
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("kTransparencyError"), -1, CFSTR("unknown XPC interface creation error"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v7[2](v7, v11, v13);

}

- (id)createConnection
{
  TransparencyXPCConnection *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  -[TransparencyXPCConnection connection](v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TransparencyXPCConnection connection](v2, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v2->_machName, 4096);
    -[TransparencyXPCConnection interface](v2, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    location = 0;
    objc_initWeak(&location, v2);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__TransparencyXPCConnection_createConnection__block_invoke;
    v10[3] = &unk_24DC90270;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setInvalidationHandler:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __45__TransparencyXPCConnection_createConnection__block_invoke_5;
    v8[3] = &unk_24DC90270;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setInterruptionHandler:", v8);
    objc_msgSend(v4, "resume");
    -[TransparencyXPCConnection setConnection:](v2, "setConnection:", v4);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCInterface)interface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

+ (id)mainInstance
{
  return (id)objc_msgSend(a1, "cachedConnection:interface:", CFSTR("com.apple.transparencyd"), objc_opt_class());
}

+ (id)cachedConnection:(id)a3 interface:(Class)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedConectionLock);
  v7 = (void *)connectionCache;
  if (!connectionCache)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)connectionCache;
    connectionCache = v8;

    v7 = (void *)connectionCache;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc((Class)a1);
    -[objc_class interface](a4, "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithMachName:interface:", v6, v12);

    objc_msgSend((id)connectionCache, "setObject:forKeyedSubscript:", v10, v6);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConectionLock);

  return v10;
}

- (TransparencyXPCConnection)initWithMachName:(id)a3 interface:(id)a4
{
  id v7;
  id v8;
  TransparencyXPCConnection *v9;
  TransparencyXPCConnection *v10;
  TransparencyXPCConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TransparencyXPCConnection;
  v9 = -[TransparencyXPCConnection init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_machName, a3);
    objc_storeStrong((id *)&v10->_interface, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)retryable:(id)a3 counter:(int)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v5 && a4 <= 4)
  {
    if (objc_msgSend(v5, "code") == 4097)
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDD0B88]);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  TransparencyXPCConnection *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  -[TransparencyXPCConnection connection](v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyXPCConnection setConnection:](v2, "setConnection:", 0);
  objc_msgSend(v3, "invalidate");

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)TransparencyXPCConnection;
  -[TransparencyXPCConnection dealloc](&v4, sel_dealloc);
}

void __45__TransparencyXPCConnection_createConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_16);
  v2 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "machName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "xpc connection cannot be formed or has been terminated: %@", (uint8_t *)&v7, 0xCu);

  }
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConnection:", 0);
    objc_msgSend(v6, "invalidate");

    objc_sync_exit(v5);
  }

}

void __45__TransparencyXPCConnection_createConnection__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __45__TransparencyXPCConnection_createConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_7_0);
  v2 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "machName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "server connection exited or crashed: %@", (uint8_t *)&v5, 0xCu);

  }
}

void __45__TransparencyXPCConnection_createConnection__block_invoke_2_6()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (id)transparencySupportInstance
{
  return (id)objc_msgSend(a1, "cachedConnection:interface:", CFSTR("com.apple.transparencyd.ids-support"), objc_opt_class());
}

+ (id)idsInstance
{
  return (id)objc_msgSend(a1, "cachedConnection:interface:", CFSTR("com.apple.transparencyd.ids"), objc_opt_class());
}

+ (id)transparencyAccountsInstance
{
  return (id)objc_msgSend(a1, "cachedConnection:interface:", CFSTR("com.apple.transparencyd.accounts-support"), objc_opt_class());
}

+ (id)swTransparencyInstance
{
  return (id)objc_msgSend(a1, "cachedConnection:interface:", CFSTR("com.apple.swtransparencyd"), objc_opt_class());
}

+ (void)setupTestConnection:(id)a3 forMachName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = objc_alloc_init((Class)a1);
    objc_msgSend(v7, "setTestEndpoint:", v11);
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sharedConectionLock);
  v8 = (void *)connectionCache;
  if (!connectionCache)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)connectionCache;
    connectionCache = v9;

    v8 = (void *)connectionCache;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConectionLock);

}

- (void)setTestEndpoint:(id)a3
{
  TransparencyXPCConnection *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v7);
  +[TransparencyXPCInterface interface](TransparencyXPCInterface, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  -[TransparencyXPCConnection setConnection:](v4, "setConnection:", v5);

  objc_sync_exit(v4);
}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_24_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "xpc error: %@", (uint8_t *)&v6, 0xCu);
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), 1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_29_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "synchronous xpc error: %@", (uint8_t *)&v6, 0xCu);
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), 1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_2_28()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_33()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_35()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (void)invokeXPCAsynchronousCallWithBlock:(id)a3 errorHandler:(id)a4
{
  +[TransparencyXPCConnection invokeXPCWithBlock:synchronous:errorHandler:](TransparencyXPCConnection, "invokeXPCWithBlock:synchronous:errorHandler:", a3, 0, a4);
}

void __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v4, "retryable:counter:", v3);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_39_0);
    v5 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_21A250000, v5, OS_LOG_TYPE_ERROR, "retrying invokeXPCSynchronousCallWithBlock: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (void)invokeIDSXPCWithBlock:(id)a3 errorHandler:(id)a4
{
  void (**v5)(id, uint64_t, uint64_t);
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v5 = (void (**)(id, uint64_t, uint64_t))a3;
  v6 = a4;
  +[TransparencyXPCConnection idsInstance](TransparencyXPCConnection, "idsInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "createConnection"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke;
    v14[3] = &unk_24DC8EA78;
    v15 = v6;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorXPC"), -108, CFSTR("failed to create XPC connection"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_42);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v13, 2u);
    }
    v8 = 0;
    v9 = 0;
  }
  if (!(v9 | v10))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_44);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v13, 2u);
    }
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorXPC"), -1, CFSTR("unknown XPC interface creation error"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v5[2](v5, v9, v10);

}

void __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_40);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "xpc ids error: %@", (uint8_t *)&v6, 0xCu);
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), 1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_41()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_43()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (void)invokeIDSSupportWithBlock:(id)a3 errorHandler:(id)a4
{
  void (**v5)(id, uint64_t, uint64_t);
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v5 = (void (**)(id, uint64_t, uint64_t))a3;
  v6 = a4;
  +[TransparencyXPCConnection transparencySupportInstance](TransparencyXPCConnection, "transparencySupportInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "createConnection"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke;
    v14[3] = &unk_24DC8EA78;
    v15 = v6;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("kTransparencyError"), -108, CFSTR("failed to create XPC connection"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_47_0);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v13, 2u);
    }
    v8 = 0;
    v9 = 0;
  }
  if (!(v9 | v10))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_49_1);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v13, 2u);
    }
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("kTransparencyError"), -1, CFSTR("unknown XPC interface creation error"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v5[2](v5, v9, v10);

}

void __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_45_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "xpc ids error: %@", (uint8_t *)&v6, 0xCu);
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), 1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_46()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_48()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (void)invokeAccountsSupportWithBlock:(id)a3 errorHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, _QWORD))a3;
  v6 = a4;
  +[TransparencyXPCConnection transparencyAccountsInstance](TransparencyXPCConnection, "transparencyAccountsInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "createConnection"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke;
    v12[3] = &unk_24DC8EA78;
    v13 = v6;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v5[2](v5, v9, 0);
      goto LABEL_11;
    }
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorXPC"), -108, CFSTR("failed to create XPC connection"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_6;
  }
  +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorXPC"), -1, CFSTR("unknown XPC interface creation error"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v10;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_52);
  v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Failed to create XPC protocol: %@", buf, 0xCu);
  }
  (*((void (**)(id, void *))v6 + 2))(v6, v9);
LABEL_11:

}

void __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_50);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "xpc accounts error: %@", (uint8_t *)&v6, 0xCu);
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), 1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke_51()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

+ (id)swTransparencyConnection
{
  void *v2;
  void *v3;

  +[TransparencyXPCConnection swTransparencyInstance](TransparencyXPCConnection, "swTransparencyInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "createConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSString)machName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMachName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
