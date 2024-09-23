@implementation SKHelperClient

+ (id)sharedClient
{
  if (sharedClient_once != -1)
    dispatch_once(&sharedClient_once, &__block_literal_global_10);
  return (id)sSharedClient;
}

void __30__SKHelperClient_sharedClient__block_invoke()
{
  SKHelperClient *v0;
  void *v1;

  v0 = objc_alloc_init(SKHelperClient);
  v1 = (void *)sSharedClient;
  sSharedClient = (uint64_t)v0;

}

- (SKHelperClient)init
{
  SKHelperClient *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completionHandlers;
  id v5;
  void *v6;
  uint64_t v7;
  OS_dispatch_queue *xpcQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int);
  void *v15;
  __CFString *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SKHelperClient;
  v2 = -[SKHelperClient init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[SKHelperClient setRecacheAbuseLimiterInfo:](v2, "setRecacheAbuseLimiterInfo:", v5);

    -[SKHelperClient createXPCConnection](v2, "createXPCConnection");
    -[SKHelperClient xpcConnection](v2, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_queue");
    v7 = objc_claimAutoreleasedReturnValue();
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.StorageKit.Callbacks", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __22__SKHelperClient_init__block_invoke;
    v15 = &unk_24FDC0360;
    v16 = CFSTR("English");
    -[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:](v2, "setDaemonOptionsWithLanguage:authRef:withCompletionBlock:");

  }
  return v2;
}

void __22__SKHelperClient_init__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    SKGetOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v4;
      v5 = "Connected to daemon. Language set to: %{public}@";
      v6 = v3;
      v7 = OS_LOG_TYPE_DEFAULT;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_22FE50000, v6, v7, v5, (uint8_t *)&v10, v8);
    }
  }
  else
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_54);

    SKGetOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      v5 = "Daemon failed to respond.";
      v6 = v3;
      v7 = OS_LOG_TYPE_FAULT;
      v8 = 2;
      goto LABEL_6;
    }
  }

}

id __22__SKHelperClient_init__block_invoke_52()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKHelperClient.m", 145);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)queueWithBlocking:(BOOL)a3
{
  if (a3)
    -[SKHelperClient xpcQueue](self, "xpcQueue");
  else
    -[SKHelperClient callbackQueue](self, "callbackQueue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)syncAllDisksWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke;
  v17[3] = &unk_24FDC0388;
  v19 = v6;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v10, "-[SKHelperClient syncAllDisksWithBlocking:completionBlock:]", v4, v17);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2;
  v15[3] = &unk_24FDC03B0;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncAllDisksWithCompletionUUID:", v13);

  if (v12)
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

uint64_t __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &unk_24FDCC998);
}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
  -[SKHelperClient syncAllDisksWithBlocking:completionBlock:](self, "syncAllDisksWithBlocking:completionBlock:", 0, a3);
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SKHelperClient *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke;
  v23[3] = &unk_24FDC03D8;
  v23[4] = self;
  v24 = v8;
  v14 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:](self, "_scheduleCompletionUUID:forFunction:withBlock:", v12, "-[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:]", v23);
  v17 = v13;
  v18 = 3221225472;
  v19 = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2;
  v20 = &unk_24FDC03B0;
  v21 = self;
  v22 = v12;
  v15 = v12;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v15, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDaemonOptionsWithLanguage:authRef:withCompletionUUID:", v10, v5, v15, v17, v18, v19, v20, v21);

}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &unk_24FDCC9B0);
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  SKHelperClient *v23;
  id v24;
  _QWORD v25[5];
  id v26;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke;
  v25[3] = &unk_24FDC0400;
  v25[4] = self;
  v26 = v8;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:](self, "_scheduleCompletionUUID:forFunction:withBlock:", v13, "-[SKHelperClient renameDisk:to:withCompletionBlock:]", v25);
  v19 = v14;
  v20 = 3221225472;
  v21 = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2;
  v22 = &unk_24FDC03B0;
  v23 = self;
  v24 = v13;
  v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v16, &v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimalDictionaryRepresentation", v19, v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "renameDisk:to:withCompletionUUID:", v18, v10, v16);
}

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", a2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);

}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 blocking:(BOOL)a5 callbackBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  SKHelperClient *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if ((a4 & 2) != 0 || v7 || !-[SKHelperClient _isRecachingDiskAbuse:](self, "_isRecachingDiskAbuse:", v10))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_66;
    v28[3] = &unk_24FDC0388;
    v30 = v11;
    v28[4] = self;
    v18 = v16;
    v29 = v18;
    v14 = v11;
    -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v18, "-[SKHelperClient recacheDisk:options:blocking:callbackBlock:]", v7, v28);
    v19 = objc_claimAutoreleasedReturnValue();
    v22 = v17;
    v23 = 3221225472;
    v24 = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2;
    v25 = &unk_24FDC03B0;
    v26 = self;
    v13 = v18;
    v27 = v13;
    -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimalDictionaryRepresentation", v22, v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recacheDisk:options:withCompletionUUID:", v21, a4, v13);

    if (v19)
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    -[SKHelperClient callbackQueue](self, "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke;
    block[3] = &unk_24FDBFBC8;
    v32 = v11;
    v13 = v11;
    dispatch_async(v12, block);

    v14 = v32;
  }

}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_ERROR, "Caller has hit recacheDisk: abuse limit. Disk data may be stale", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8]);
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
  -[SKHelperClient recacheDisk:options:blocking:callbackBlock:](self, "recacheDisk:options:blocking:callbackBlock:", a3, a4, 0, a5);
}

- (void)diskForPath:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  SKHelperClient *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  BOOL v28;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke;
  v25[3] = &unk_24FDC0450;
  v25[4] = self;
  v14 = v12;
  v26 = v14;
  v27 = v8;
  v28 = v5;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]", v5, v25);
  v16 = objc_claimAutoreleasedReturnValue();
  v19 = v13;
  v20 = 3221225472;
  v21 = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3;
  v22 = &unk_24FDC03B0;
  v23 = self;
  v17 = v14;
  v24 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "diskForPath:withCompletionUUID:", v10, v17, v19, v20, v21, v22, v23);

  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKManager sharedManager](SKManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_24FDC0428;
    v12 = *(id *)(a1 + 48);
    v11 = v6;
    objc_msgSend(*(id *)(a1 + 32), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 56), v10[0], 3221225472, __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2, &unk_24FDC0428);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "knownDiskForDictionary:notify:onQueue:", v7, v10, v9);

  }
  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }

}

NSObject *__57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2(uint64_t a1)
{
  NSObject *result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]_block_invoke_3";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithUUID:didCompleteWithResult:", v5, v8);

}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
  -[SKHelperClient diskForPath:blocking:withCallbackBlock:](self, "diskForPath:blocking:withCallbackBlock:", a3, 0, a4);
}

- (void)wholeDiskForDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  SKHelperClient *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke;
  v26[3] = &unk_24FDC0450;
  v26[4] = self;
  v14 = v12;
  v27 = v14;
  v28 = v8;
  v29 = v5;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]", v5, v26);
  v16 = objc_claimAutoreleasedReturnValue();
  v20 = v13;
  v21 = 3221225472;
  v22 = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3;
  v23 = &unk_24FDC03B0;
  v24 = self;
  v17 = v14;
  v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "wholeDiskForDiskDictionary:withCompletionUUID:", v19, v17);
  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKManager sharedManager](SKManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_24FDC0428;
    v12 = *(id *)(a1 + 48);
    v11 = v6;
    objc_msgSend(*(id *)(a1 + 32), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 56), v10[0], 3221225472, __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2, &unk_24FDC0428);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "knownDiskForDictionary:notify:onQueue:", v7, v10, v9);

  }
  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }

}

NSObject *__62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2(uint64_t a1)
{
  NSObject *result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]_block_invoke_3";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithUUID:didCompleteWithResult:", v5, v8);

}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
  -[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:](self, "wholeDiskForDisk:blocking:withCallbackBlock:", a3, 0, a4);
}

- (void)childDisksForWholeDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke;
  v22[3] = &unk_24FDC0388;
  v24 = v8;
  v22[4] = self;
  v14 = v12;
  v23 = v14;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]", v5, v22);
  v16 = objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2;
  v20[3] = &unk_24FDC03B0;
  v20[4] = self;
  v17 = v14;
  v21 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "childDisksForWholeDisk:withCompletionUUID:", v19, v17);
  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v11 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v11, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    +[SKManager sharedManager](SKManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownDisksForDictionaries:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "semaphore");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    dispatch_semaphore_signal(v9);

}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]_block_invoke_2";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithUUID:didCompleteWithResult:", v5, v8);

}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
  -[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:](self, "childDisksForWholeDisk:blocking:withCallbackBlock:", a3, 0, a4);
}

- (void)isBusyWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke;
  v17[3] = &unk_24FDC0388;
  v19 = v6;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v10, "-[SKHelperClient isBusyWithBlocking:completionBlock:]", v4, v17);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2;
  v15[3] = &unk_24FDC03B0;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isBusyWithCompletionUUID:", v13);

  if (v12)
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "BOOLValue");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

uint64_t __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &unk_24FDCC9C8);
}

- (void)isBusy:(id)a3
{
  -[SKHelperClient isBusyWithBlocking:completionBlock:](self, "isBusyWithBlocking:completionBlock:", 0, a3);
}

- (void)filesystemsWithBlocking:(BOOL)a3 callbackBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke;
  v17[3] = &unk_24FDC0478;
  v17[4] = self;
  v19 = v6;
  v10 = v8;
  v18 = v10;
  v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v10, "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]", v4, v17);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2;
  v15[3] = &unk_24FDC03B0;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filesystemsWithCompletionUUID:", v13);

  if (v12)
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v9 = (id)v3;
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "semaphore");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    dispatch_semaphore_signal(v7);

}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]_block_invoke_2";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithUUID:didCompleteWithResult:", v5, v8);

}

- (void)filesystemsWithCallbackBlock:(id)a3
{
  -[SKHelperClient filesystemsWithBlocking:callbackBlock:](self, "filesystemsWithBlocking:callbackBlock:", 0, a3);
}

- (void)physicalStoresForAPFSVolume:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  SKHelperClient *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke;
  v26[3] = &unk_24FDC0450;
  v26[4] = self;
  v14 = v12;
  v29 = v5;
  v27 = v14;
  v28 = v8;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]", v5, v26);
  v16 = objc_claimAutoreleasedReturnValue();
  v20 = v13;
  v21 = 3221225472;
  v22 = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5;
  v23 = &unk_24FDC03B0;
  v24 = self;
  v17 = v14;
  v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "physicalStoresForAPFSVolume:withCompletionUUID:", v19, v17);
  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id obj;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD *v24;
  char v25;
  _QWORD block[5];
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semaphore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v17, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__3;
  v33[4] = __Block_byref_object_dispose__3;
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0);
  v7 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_74;
        block[3] = &unk_24FDC04A0;
        block[4] = v12;
        v28 = v33;
        v27 = v7;
        dispatch_async(v6, block);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3;
  v19[3] = &unk_24FDC04F0;
  v13 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v21 = v13;
  v25 = *(_BYTE *)(a1 + 56);
  v23 = *(id *)(a1 + 48);
  v24 = v33;
  v22 = v16;
  v14 = v16;
  v15 = v7;
  dispatch_sync(v6, v19);

  _Block_object_dispose(v33, 8);
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_74(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2;
  v7[3] = &unk_24FDBFC40;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v8 = v6;
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "knownDiskForDictionary:notify:onQueue:", v3, v7, v5);

}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_sync_enter(v3);
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
  objc_sync_exit(v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 40), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4;
  block[3] = &unk_24FDC04C8;
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v8 = v4;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

NSObject *__71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  NSObject *result;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  result = a1[4];
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]_block_invoke_5";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &unk_24FDCC9E0);
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
  -[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:](self, "physicalStoresForAPFSVolume:blocking:completionBlock:", a3, 0, a4);
}

- (void)volumesForAPFSPS:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  SKHelperClient *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke;
  v26[3] = &unk_24FDC0450;
  v26[4] = self;
  v14 = v12;
  v29 = v5;
  v27 = v14;
  v28 = v8;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]", v5, v26);
  v16 = objc_claimAutoreleasedReturnValue();
  v20 = v13;
  v21 = 3221225472;
  v22 = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6;
  v23 = &unk_24FDC03B0;
  v24 = self;
  v17 = v14;
  v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "volumesForAPFSPS:withCompletionUUID:", v19, v17);
  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  char v21;
  _QWORD block[5];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semaphore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v15, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0);
  v7 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2;
        block[3] = &unk_24FDC04A0;
        block[4] = v12;
        v24 = v29;
        v23 = v7;
        dispatch_async(v6, block);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v8);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4;
  v17[3] = &unk_24FDC0518;
  v17[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 56);
  v19 = *(id *)(a1 + 48);
  v20 = v29;
  v18 = v14;
  v13 = v14;
  dispatch_sync(v6, v17);

  _Block_object_dispose(v29, 8);
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3;
  v7[3] = &unk_24FDBFC40;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v8 = v6;
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "knownDiskForDictionary:notify:onQueue:", v3, v7, v5);

}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5;
  block[3] = &unk_24FDC04C8;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v6 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

NSObject *__60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  NSObject *result;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  result = a1[4];
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]_block_invoke_6";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &unk_24FDCC9F8);
}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
  -[SKHelperClient volumesForAPFSPS:blocking:completionBlock:](self, "volumesForAPFSPS:blocking:completionBlock:", a3, 0, a4);
}

- (void)updateUUID:(id)a3 progress:(float)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  float v19;

  v8 = a5;
  v9 = a3;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "progressBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "progressBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKHelperClient callbackQueue](self, "callbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__SKHelperClient_updateUUID_progress_message___block_invoke;
      block[3] = &unk_24FDC0540;
      v18 = v13;
      v19 = a4;
      v17 = v8;
      v15 = v13;
      dispatch_async(v14, block);

    }
  }

}

uint64_t __46__SKHelperClient_updateUUID_progress_message___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));
}

- (void)requestWithUUID:(id)a3 didCompleteWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v6;
      v22 = 2082;
      v23 = objc_msgSend(v9, "functionName");
      _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_DEFAULT, "Reached XPC reply for %{public}@ %{public}s", buf, 0x16u);
    }

    objc_msgSend(v9, "setProgressBlock:", 0);
    objc_msgSend(v9, "semaphore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "completionBlock");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v13)[2](v13, v7);

      SKGetOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v6;
        _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_DEFAULT, "Completion block directly executed for: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      -[SKHelperClient callbackQueue](self, "callbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke;
      block[3] = &unk_24FDC0568;
      v17 = v6;
      v18 = v9;
      v19 = v7;
      dispatch_async(v15, block);

      v14 = v17;
    }

    -[SKHelperClient completionHandlers](self, "completionHandlers");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v6);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "Error: no completion handler for %{public}@", buf, 0xCu);
  }

}

void __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "Completion callback for: %{public}@ - start", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "completionBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(_QWORD *)(a1 + 48));

  SKGetOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_DEFAULT, "Completion callback for: %{public}@ - end", (uint8_t *)&v7, 0xCu);
  }

}

- (void)initialPopulateComplete
{
  id v2;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialPopulateComplete");

}

- (void)disksAppeared:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SKManager sharedManager](SKManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disksAppeared:", v3);

}

- (void)disksChanged:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SKManager sharedManager](SKManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disksChanged:", v3);

}

- (void)disksDisappeared:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SKManager sharedManager](SKManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disksDisappeared:", v3);

}

- (void)managerStalled
{
  id v2;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managerStalled");

}

- (void)managerResumed
{
  id v2;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managerResumed");

}

- (id)remoteObjectWithUUID:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke;
  block[3] = &unk_24FDC0590;
  v15 = v6;
  v16 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

  -[SKHelperClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isInvalidated"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "setErrorBlock:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      SKGetOSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v9 = "-[SKHelperClient remoteObjectWithUUID:errorHandler:]_block_invoke";
        v10 = 2114;
        v11 = v6;
        _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_ERROR, "%s: No completion handler set for %{public}@, cannot set error block", buf, 0x16u);
      }

    }
  }
}

- (void)createXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.storagekitd"), 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  SKHelperConnectionInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  SKHelperClientInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v6);

  objc_initWeak(&location, self);
  v7 = self->_xpcConnection;
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__SKHelperClient_createXPCConnection__block_invoke;
  v12[3] = &unk_24FDC05B8;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  v9 = self->_xpcConnection;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __37__SKHelperClient_createXPCConnection__block_invoke_83;
  v10[3] = &unk_24FDC05B8;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__SKHelperClient_createXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_markConnectionInvalidAndCallAllCallbacks");

}

void __37__SKHelperClient_createXPCConnection__block_invoke_83(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_markConnectionInvalidAndCallAllCallbacks");

}

- (void)_markConnectionInvalidAndCallAllCallbacks
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SKHelperClient setIsInvalidated:](self, "setIsInvalidated:", 1);
  SKGetOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FE50000, v3, OS_LOG_TYPE_DEFAULT, "Starting interruption handler...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        SKGetOSLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v11;
          _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_DEFAULT, "Calling interruption handler for UUID: %{public}@", buf, 0xCu);
        }

        -[SKHelperClient completionHandlers](self, "completionHandlers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "errorBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "errorBlock");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v16)[2](v16, v4);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  -[SKHelperClient completionHandlers](self, "completionHandlers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

}

- (void)_scheduleCompletionUUID:(id)a3 progress:(id)a4 forFunction:(const char *)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  SKHelperClient *v19;
  id v20;
  id v21;
  const char *v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke;
  block[3] = &unk_24FDC05E0;
  v21 = v11;
  v22 = a5;
  v18 = v10;
  v19 = self;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

void __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  SKCompletionHandler *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "Setting completion callback for (%s) to: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v5 = -[SKCompletionHandler initWithCompletionBlock:progressBlock:function:]([SKCompletionHandler alloc], "initWithCompletionBlock:progressBlock:function:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "completionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

}

- (void)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
  -[SKHelperClient _scheduleCompletionUUID:progress:forFunction:withBlock:](self, "_scheduleCompletionUUID:progress:forFunction:withBlock:", a3, 0, a4, a5);
}

- (id)_scheduleSyncCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD block[4];
  id v18;
  NSObject *v19;
  SKHelperClient *v20;
  id v21;
  const char *v22;

  v8 = a3;
  v9 = a5;
  v10 = dispatch_semaphore_create(0);
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke;
  block[3] = &unk_24FDC0608;
  v21 = v9;
  v22 = a4;
  v18 = v8;
  v12 = v10;
  v19 = v12;
  v20 = self;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  v15 = v12;
  return v15;
}

void __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  SKCompletionHandler *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "Setting sync completion callback for (%s) to: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v5 = -[SKCompletionHandler initWithCompletionBlock:progressBlock:function:]([SKCompletionHandler alloc], "initWithCompletionBlock:progressBlock:function:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  -[SKCompletionHandler setSemaphore:](v5, "setSemaphore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "completionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

}

- (id)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 blocking:(BOOL)a5 withBlock:(id)a6
{
  void *v6;

  if (a5)
  {
    -[SKHelperClient _scheduleSyncCompletionUUID:forFunction:withBlock:](self, "_scheduleSyncCompletionUUID:forFunction:withBlock:", a3, a4, a6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKHelperClient _scheduleCompletionUUID:progress:forFunction:withBlock:](self, "_scheduleCompletionUUID:progress:forFunction:withBlock:", a3, 0, a4, a6);
    v6 = 0;
  }
  return v6;
}

- (id)_parameters:(id)a3 valueAtIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a3;
  if (objc_msgSend(v5, "count") <= a4)
    goto LABEL_4;
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isRecachingDiskAbuse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "minimalDictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKHelperClient recacheAbuseLimiterInfo](self, "recacheAbuseLimiterInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("FirstCallTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CallCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    v11 = v10;

    if (v11 >= 60.0)
    {
      v23[0] = CFSTR("FirstCallTime");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("CallCount");
      v24[0] = v13;
      v24[1] = &unk_24FDCC980;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v6 = (void *)v14;
    }
    else
    {
      v12 = objc_msgSend(v8, "integerValue") > 3;
    }

  }
  else
  {
    v21[0] = CFSTR("FirstCallTime");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("CallCount");
    v22[0] = v7;
    v22[1] = &unk_24FDCC980;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("CallCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue") + 1;
  v17 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("CallCount"));

  -[SKHelperClient recacheAbuseLimiterInfo](self, "recacheAbuseLimiterInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v17, v4);

  return v12;
}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
  -[SKHelperClient unmountDisk:options:blocking:withCompletionBlock:](self, "unmountDisk:options:blocking:withCompletionBlock:", a3, 0, 0, a4);
}

- (void)unmountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 withCompletionBlock:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v6 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDD1880];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke;
  v25[3] = &unk_24FDC0388;
  v27 = v10;
  v25[4] = self;
  v17 = v15;
  v26 = v17;
  v18 = v10;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v17, "-[SKHelperClient unmountDisk:options:blocking:withCompletionBlock:]", v6, v25);
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2;
  v23[3] = &unk_24FDC03B0;
  v23[4] = self;
  v20 = v17;
  v24 = v20;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v20, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimalDictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "unmountDisk:options:withCompletionUUID:", v22, v12, v20);
  if (v19)
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);

}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  -[SKHelperClient unmountDisk:options:blocking:withCompletionBlock:](self, "unmountDisk:options:blocking:withCompletionBlock:", a3, a4, 0, a5);
}

- (void)mountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v6 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDD1880];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke;
  v25[3] = &unk_24FDC0388;
  v27 = v10;
  v25[4] = self;
  v17 = v15;
  v26 = v17;
  v18 = v10;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v17, "-[SKHelperClient mountDisk:options:blocking:completionBlock:]", v6, v25);
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2;
  v23[3] = &unk_24FDC03B0;
  v23[4] = self;
  v20 = v17;
  v24 = v20;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v20, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimalDictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "mountDisk:options:withCompletionUUID:", v22, v12, v20);
  if (v19)
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);

}

- (void)mountDisk:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  -[SKHelperClient mountDisk:options:blocking:completionBlock:](self, "mountDisk:options:blocking:completionBlock:", a3, a4, 0, a5);
}

- (void)ejectDisk:(id)a3 blocking:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a3;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke;
  v22[3] = &unk_24FDC0388;
  v24 = v8;
  v22[4] = self;
  v14 = v12;
  v23 = v14;
  v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v14, "-[SKHelperClient ejectDisk:blocking:withCompletionBlock:]", v5, v22);
  v16 = objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2;
  v20[3] = &unk_24FDC03B0;
  v20[4] = self;
  v17 = v14;
  v21 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "ejectDisk:withCompletionUUID:", v19, v17);
  if (v16)
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_semaphore_signal(v6);

}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);

}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
  -[SKHelperClient ejectDisk:blocking:withCompletionBlock:](self, "ejectDisk:blocking:withCompletionBlock:", a3, 0, a4);
}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  v7 = a3;
  -[SKHelperClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke;
  v17[3] = &unk_24FDC0630;
  v17[4] = self;
  v10 = v6;
  v18 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3;
  v15[3] = &unk_24FDC03D8;
  v15[4] = self;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "eraseWithEraser:reply:", v7, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2;
  v7[3] = &unk_24FDBFBF0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_parameters:valueAtIndex:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_parameters:valueAtIndex:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[SKManager sharedManager](SKManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4;
    v9[3] = &unk_24FDC0428;
    v11 = *(id *)(a1 + 40);
    v10 = v6;
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue", v9[0], 3221225472, __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4, &unk_24FDC0428);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "knownDiskForDictionary:notify:onQueue:", v5, v9, v8);

  }
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SKHelperClient eraseWithEraser:completionBlock:]_block_invoke_4";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_DEFAULT, "%s: Erase completed successfully: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v8 = a5;
  v9 = a3;
  -[SKHelperClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke;
  v20[3] = &unk_24FDC0630;
  v20[4] = self;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimalDictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3;
  v18[3] = &unk_24FDC0630;
  v18[4] = self;
  v19 = v12;
  v15 = v12;
  objc_msgSend(v13, "resizeDisk:size:reply:", v14, a4, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2;
  v7[3] = &unk_24FDBFBF0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4;
  v7[3] = &unk_24FDBFBF0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (NSMutableDictionary)recacheAbuseLimiterInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecacheAbuseLimiterInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recacheAbuseLimiterInfo, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
