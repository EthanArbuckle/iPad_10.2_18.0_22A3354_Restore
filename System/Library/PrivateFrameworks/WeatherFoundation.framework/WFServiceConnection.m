@implementation WFServiceConnection

+ (id)allAllowedClasses
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[8];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v21[5] = objc_opt_class();
  v21[6] = objc_opt_class();
  v21[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setByAddingObjectsFromSet:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setByAddingObjectsFromSet:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)weatherServiceInterface
{
  if (weatherServiceInterface_onceToken != -1)
    dispatch_once(&weatherServiceInterface_onceToken, &__block_literal_global_30);
  return (id)weatherServiceInterface_interface;
}

void __51__WFServiceConnection_XPC__weatherServiceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254ACAB78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)weatherServiceInterface_interface;
  weatherServiceInterface_interface = v0;

}

+ (id)weatherServiceClientInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WFServiceConnection_XPC__weatherServiceClientInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (weatherServiceClientInterface_onceToken != -1)
    dispatch_once(&weatherServiceClientInterface_onceToken, block);
  return (id)weatherServiceClientInterface_interface;
}

void __57__WFServiceConnection_XPC__weatherServiceClientInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AD11F8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)weatherServiceClientInterface_interface;
  weatherServiceClientInterface_interface = v2;

  objc_msgSend(*(id *)(a1 + 32), "allAllowedClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)weatherServiceClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_serviceDidReceiveResponse_, 0, 0);
  objc_msgSend((id)weatherServiceClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_taskIdentifier_, 0, 1);

}

- (WFServiceConnection)init
{
  WFServiceConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalStateQueue;
  uint64_t v9;
  NSMutableDictionary *tasksPendingResponseForTaskIdentifier;
  uint64_t v11;
  NSMutableDictionary *dispatchGroupForTaskIdentifier;
  uint64_t v13;
  NSMutableDictionary *executionStartTimeForTaskIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFServiceConnection;
  v2 = -[WFServiceConnection init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnectionQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnection.CallbackQueue", MEMORY[0x24BDAC9C0]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnection.InternalStateQueue", 0);
    internalStateQueue = v2->_internalStateQueue;
    v2->_internalStateQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    tasksPendingResponseForTaskIdentifier = v2->_tasksPendingResponseForTaskIdentifier;
    v2->_tasksPendingResponseForTaskIdentifier = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    dispatchGroupForTaskIdentifier = v2->_dispatchGroupForTaskIdentifier;
    v2->_dispatchGroupForTaskIdentifier = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    executionStartTimeForTaskIdentifier = v2->_executionStartTimeForTaskIdentifier;
    v2->_executionStartTimeForTaskIdentifier = (NSMutableDictionary *)v13;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WFServiceConnection _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)WFServiceConnection;
  -[WFServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)accessServiceWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = (void (**)(id, _QWORD))a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[WFServiceConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__WFServiceConnection_accessServiceWithBlock___block_invoke;
  v6[3] = &unk_24CCA08A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5]);
  _Block_object_dispose(&v7, 8);

}

void __46__WFServiceConnection_accessServiceWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_onQueueOpenConnection");
  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)cancelRequestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(4uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[WFServiceConnection cancelRequestWithIdentifier:].cold.1();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke;
  v9[3] = &unk_24CCA2938;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[WFServiceConnection accessServiceWithBlock:](self, "accessServiceWithBlock:", v9);

}

void __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;

  objc_msgSend(a2, "cancelTaskWithIdentifier:", *(_QWORD *)(a1 + 32));
  WFLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke_cold_1(a1, v3, v4);

}

- (void)enqueueRequest:(id)a3
{
  -[WFServiceConnection enqueueRequest:waitUntilDone:](self, "enqueueRequest:waitUntilDone:", a3, 0);
}

- (void)enqueueRequest:(id)a3 waitUntilDone:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  CFAbsoluteTime Current;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  _BOOL4 v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  _QWORD block[5];
  id v27;
  id v28;
  CFAbsoluteTime v29;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isCancelled"))
  {
    objc_msgSend(v6, "handleCancellation");
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    Current = CFAbsoluteTimeGetCurrent();
    WFLogForCategory(4uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[WFServiceConnection enqueueRequest:waitUntilDone:].cold.3(v6);

    v11 = objc_msgSend(v6, "requiresResponse");
    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      -[WFServiceConnection internalStateQueue](self, "internalStateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke;
      block[3] = &unk_24CCA2960;
      block[4] = self;
      v27 = v6;
      v28 = v8;
      v29 = Current;
      dispatch_async(v13, block);

    }
    if (v4)
    {
      v14 = dispatch_group_create();
      dispatch_group_enter(v14);
      -[WFServiceConnection internalStateQueue](self, "internalStateQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_2;
      v23[3] = &unk_24CCA1618;
      v23[4] = self;
      v24 = v8;
      v16 = v14;
      v25 = v16;
      dispatch_async(v15, v23);

    }
    else
    {
      v16 = 0;
    }
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_3;
    v21[3] = &unk_24CCA2988;
    v22 = v6;
    -[WFServiceConnection accessServiceWithBlock:](self, "accessServiceWithBlock:", v21);
    if (v4)
    {
      v17 = dispatch_time(0, 30000000000);
      v18 = dispatch_group_wait(v16, v17);
      WFLogForCategory(4uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
          -[WFServiceConnection enqueueRequest:waitUntilDone:].cold.2(v8, v19);
      }
      else if (v20)
      {
        -[WFServiceConnection enqueueRequest:waitUntilDone:].cold.1(v8, v19);
      }

    }
  }

}

void __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tasksPendingResponseForTaskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "executionStartTimeForTaskIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

void __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroupForTaskIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "startWithService:", a2);
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "Service Connection has been invalidated.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __33__WFServiceConnection_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 12);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_onQueueInvalidateConnection:", v2);

}

- (void)invalidateCache
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__WFServiceConnection_invalidateCache__block_invoke;
  v5[3] = &unk_24CCA2988;
  v6 = v3;
  v4 = v3;
  -[WFServiceConnection accessServiceWithBlock:](self, "accessServiceWithBlock:", v5);

}

uint64_t __38__WFServiceConnection_invalidateCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateCache:", *(_QWORD *)(a1 + 32));
}

- (void)_handleRemoteObjectProxyError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[WFServiceConnection _handleRemoteObjectProxyError:].cold.1();

  -[WFServiceConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__WFServiceConnection__handleRemoteObjectProxyError___block_invoke;
  v8[3] = &unk_24CCA17B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

uint64_t __53__WFServiceConnection__handleRemoteObjectProxyError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueInvalidateConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_onQueueOpenConnection
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "Setting up connection to service...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)_cleanup
{
  id v3;

  -[WFServiceConnection serviceProxy](self, "serviceProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);
  -[WFServiceConnection setServiceProxy:](self, "setServiceProxy:", 0);
  -[WFServiceConnection _callbackAllPendingTasksOnInvalidate:](self, "_callbackAllPendingTasksOnInvalidate:", 0);

}

- (void)_onQueueInvalidateConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[WFServiceConnection serviceProxy](self, "serviceProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeClient:", self);
  -[WFServiceConnection setServiceProxy:](self, "setServiceProxy:", 0);
  -[WFServiceConnection internalStateQueue](self, "internalStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WFServiceConnection__onQueueInvalidateConnection___block_invoke;
  block[3] = &unk_24CCA17B0;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __52__WFServiceConnection__onQueueInvalidateConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackAllPendingTasksOnInvalidate:", *(_QWORD *)(a1 + 40));
}

- (void)_callbackAllPendingTasksOnInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  WFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[WFServiceConnection _callbackAllPendingTasksOnInvalidate:].cold.1();

  -[WFServiceConnection tasksPendingResponseForTaskIdentifier](self, "tasksPendingResponseForTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke;
  v12[3] = &unk_24CCA29B0;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[WFServiceConnection tasksPendingResponseForTaskIdentifier](self, "tasksPendingResponseForTaskIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[WFServiceConnection dispatchGroupForTaskIdentifier](self, "dispatchGroupForTaskIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_31);

  -[WFServiceConnection dispatchGroupForTaskIdentifier](self, "dispatchGroupForTaskIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[WFServiceConnection executionStartTimeForTaskIdentifier](self, "executionStartTimeForTaskIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

void __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "handleError:forResponseIdentifier:", v7, v6);

}

void __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke_2(int a1, int a2, dispatch_group_t group)
{
  dispatch_group_leave(group);
}

- (void)taskIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = taskIdentifier__onceToken;
  v4 = a3;
  v5 = v4;
  if (v3 != -1)
  {
    dispatch_once(&taskIdentifier__onceToken, &__block_literal_global_15_1);
    v4 = v5;
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, taskIdentifier__defaultTaskIdentifier);

}

void __38__WFServiceConnection_taskIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[WFTaskIdentifier defaultIdentifier](WFTaskIdentifier, "defaultIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)taskIdentifier__defaultTaskIdentifier;
  taskIdentifier__defaultTaskIdentifier = v0;

}

- (void)serviceDidReceiveResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[16];
  _BYTE v40[24];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3;
  v31[4] = __Block_byref_object_dispose__3;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  v30 = 0;
  -[WFServiceConnection internalStateQueue](self, "internalStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke;
  block[3] = &unk_24CCA2A18;
  v26 = &v33;
  block[4] = self;
  v7 = v4;
  v25 = v7;
  v27 = v31;
  v28 = v29;
  dispatch_sync(v5, block);

  if (!v34[5])
  {
    WFLogForCategory(4uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFServiceConnection serviceDidReceiveResponse:].cold.2(v9, (uint64_t)v40, v8);
    }

  }
  WFLogForCategory(4uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)v34[5], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFServiceConnection serviceDidReceiveResponse:].cold.1(v11, (uint64_t)v39, v10);
  }

  -[WFServiceConnection callbackQueue](self, "callbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_16;
  v20[3] = &unk_24CCA2A40;
  v13 = v7;
  v21 = v13;
  v22 = v29;
  v23 = &v33;
  dispatch_sync(v12, v20);

  -[WFServiceConnection internalStateQueue](self, "internalStateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17;
  v16[3] = &unk_24CCA2A68;
  v16[4] = self;
  v17 = v13;
  v18 = &v33;
  v19 = v31;
  v15 = v13;
  dispatch_async(v14, v16);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "tasksPendingResponseForTaskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroupForTaskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(*(id *)(a1 + 32), "executionStartTimeForTaskIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

uint64_t __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_16(uint64_t a1)
{
  double Current;
  double v3;
  NSObject *v4;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setExecutionTime:", Current - v3);
  WFLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_16_cold_1((id *)(a1 + 32));

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "handleResponse:", *(_QWORD *)(a1 + 32));
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WFLogForCategory(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "tasksPendingResponseForTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

  v5 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v5)
  {
    dispatch_group_leave(v5);
    objc_msgSend(*(id *)(a1 + 32), "dispatchGroupForTaskIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "executionStartTimeForTaskIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_dispatch_queue)internalStateQueue
{
  return self->_internalStateQueue;
}

- (void)setInternalStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalStateQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (WeatherServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)tasksPendingResponseForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)dispatchGroupForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)executionStartTimeForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionStartTimeForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchGroupForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_tasksPendingResponseForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_internalStateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)cancelRequestWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, v0, v1, "Cancelling %@", v2);
  OUTLINED_FUNCTION_1();
}

void __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, a3, "Cancellation sent for identifier %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "Dispatch group for task %s completed successfully", v5);

  OUTLINED_FUNCTION_3_2();
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "Dispatch group for task %s timed out", v5);

  OUTLINED_FUNCTION_3_2();
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "requiresResponse");
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v1, v2, "Servicing new %s: %@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_2();
}

- (void)_handleRemoteObjectProxyError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, v0, v1, "Remote object proxy encountered an error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_callbackAllPendingTasksOnInvalidate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, v0, v1, "WFServiceConnection has had its service proxy invalidated: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)serviceDidReceiveResponse:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_21189A000, a3, (uint64_t)a3, "(%@) Received response for request", (uint8_t *)a2);

}

- (void)serviceDidReceiveResponse:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_21189A000, a3, (uint64_t)a3, "(%@) Received response for untracked task identifier", (uint8_t *)a2);

}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_16_cold_1(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "executionTime");
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v3, v4, "(%@) Response received in %2.5f", v5, v6, v7, v8, 2u);

}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "Cleaning up after %@", v5);

  OUTLINED_FUNCTION_3_2();
}

@end
