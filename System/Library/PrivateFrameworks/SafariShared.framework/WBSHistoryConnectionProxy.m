@implementation WBSHistoryConnectionProxy

void __49__WBSHistoryConnectionProxy_releaseCloudHistory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseCloudHistory:", *(_QWORD *)(a1 + 40));

}

- (void)releaseCloudHistory:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WBSHistoryConnectionProxy_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

- (WBSHistoryConnectionProxy)init
{
  WBSHistoryConnectionProxy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionProxyQueue;
  WBSHistoryConnectionProxy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryConnectionProxy;
  v2 = -[WBSHistoryConnectionProxy init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryConnectionProxy", MEMORY[0x1E0C80D50]);
    connectionProxyQueue = v2->_connectionProxyQueue;
    v2->_connectionProxyQueue = (OS_dispatch_queue *)v3;

    -[WBSHistoryConnectionProxy _setupConnectionWithInProcessFallback:](v2, "_setupConnectionWithInProcessFallback:", 0);
    v5 = v2;
  }

  return v2;
}

- (void)_setupConnectionWithInProcessFallback:(BOOL)a3
{
  NSObject *connectionProxyQueue;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke;
  v7[3] = &unk_1E4B3B050;
  v7[4] = self;
  v9 = a3;
  objc_copyWeak(&v8, &location);
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_DETACHED, QOS_CLASS_USER_INITIATED, 0, v7);
  dispatch_barrier_async(connectionProxyQueue, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  double v12;
  WBSHistoryServiceDatabaseProxy *v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  v9 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = v9;
    objc_msgSend(v10, "timeIntervalSinceNow");
    v14 = 136446466;
    v15 = "connection_connect_with_options";
    v16 = 2048;
    v17 = -v12;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v14, 0x16u);

  }
  if (v7)
  {
    v13 = -[WBSHistoryServiceDatabaseProxy initWithProxy:]([WBSHistoryServiceDatabaseProxy alloc], "initWithProxy:", v7);

  }
  else
  {
    v13 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  WBSHistoryService *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  _QWORD v20[3];
  char v21;

  v2 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_cold_1();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
    objc_msgSend(v3, "invalidate");
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSHistoryService initWithListener:]([WBSHistoryService alloc], "initWithListener:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    v8 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend(v4, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithListenerEndpoint:", v9);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v10;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_createConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v14 + 8);
    *(_QWORD *)(v14 + 8) = v13;
  }

  WBSHistoryConnectionInterface();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRemoteObjectInterface:", v15);

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5;
  v18[3] = &unk_1E4B3B028;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v18[4] = v20;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", v18);
  v17[0] = v16;
  v17[1] = 3221225472;
  v17[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7;
  v17[3] = &unk_1E4B2A210;
  v17[4] = v20;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", v17);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
  objc_destroyWeak(&v19);
  _Block_object_dispose(v20, 8);
}

- (id)_createConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Safari.History.Service"), 0);
}

void __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_2;
  v12[3] = &unk_1E4B2B8A0;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__19;
  v10[4] = __Block_byref_object_dispose__19;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_3;
  v7[3] = &unk_1E4B3B0F0;
  v9 = v10;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "connectWithOptions:delegate:completionHandler:", v5, v6, v7);

  _Block_object_dispose(v10, 8);
}

- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *connectionProxyQueue;
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
  connectionProxyQueue = self->_connectionProxyQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke;
  v15[3] = &unk_1E4B3B118;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(connectionProxyQueue, v15);

}

- (void)invalidate
{
  NSObject *connectionProxyQueue;
  _QWORD block[5];

  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSHistoryConnectionProxy_invalidate__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_barrier_sync(connectionProxyQueue, block);
}

uint64_t __39__WBSHistoryConnectionProxy_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  v2 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5_cold_1();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(WeakRetained, "_setupConnectionWithInProcessFallback:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("WBSHistoryConnectionWasInterrupted"), v4, 0);

  }
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7(uint64_t a1)
{
  NSObject *v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7_cold_1();
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSHistoryConnectionProxy;
  -[WBSHistoryConnectionProxy dealloc](&v3, sel_dealloc);
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v7[3] = &unk_1E4B2B8A0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A8599ED0](v7);

  return v5;
}

void __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(v5, v3);
  }

}

- (void)ensureConnected:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  +[WBSHistory historyDatabaseURL](WBSHistory, "historyDatabaseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke_cold_1();
  }
  v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Calling into -[WBSHistoryConnectionProxy ensureConnected:]", v6, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ensureConnected:", *(_QWORD *)(a1 + 40));

}

- (void)getServiceInfo:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__WBSHistoryConnectionProxy_getServiceInfo___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __44__WBSHistoryConnectionProxy_getServiceInfo___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "getServiceInfo:", *(_QWORD *)(a1 + 40));
}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WBSHistoryConnectionProxy_listDatabaseURLsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __67__WBSHistoryConnectionProxy_listDatabaseURLsWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "listDatabaseURLsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)beginURLCompletionSession:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WBSHistoryConnectionProxy_beginURLCompletionSession___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __55__WBSHistoryConnectionProxy_beginURLCompletionSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "beginURLCompletionSession:", *(_QWORD *)(a1 + 40));
}

- (void)beginHistoryAccessSession:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WBSHistoryConnectionProxy_beginHistoryAccessSession___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __55__WBSHistoryConnectionProxy_beginHistoryAccessSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "beginHistoryAccessSession:", *(_QWORD *)(a1 + 40));
}

- (void)killService
{
  NSObject *connectionProxyQueue;
  _QWORD block[5];

  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WBSHistoryConnectionProxy_killService__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_barrier_async(connectionProxyQueue, block);
}

uint64_t __40__WBSHistoryConnectionProxy_killService__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_killConnection:", 9);
}

- (void)queryMemoryFootprint:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__WBSHistoryConnectionProxy_queryMemoryFootprint___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __50__WBSHistoryConnectionProxy_queryMemoryFootprint___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "queryMemoryFootprint:", *(_QWORD *)(a1 + 40));
}

- (id)queryMemoryFootprintWithError:(id *)a3
{
  NSObject *connectionProxyQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke;
  block[3] = &unk_1E4B3B0C8;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v14;
  dispatch_sync(connectionProxyQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  int8x16_t v7;
  _QWORD v8[5];

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_2;
  v8[3] = &unk_1E4B3B078;
  v8[4] = v3;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_3;
  v6[3] = &unk_1E4B3B0A0;
  v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v5, "queryMemoryFootprint:", v6);

}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *connectionProxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionProxyQueue, v7);

}

void __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E4B2B8A0;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishClearingHistoryIfNecessaryWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionProxyQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B168;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionProxyQueue, block);

}

void __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B2B8A0;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3;
  v6[3] = &unk_1E4B3B140;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "initializeCloudHistoryWithConfiguration:completionHandler:", v5, v6);

}

uint64_t __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3(uint64_t a1, WBSCloudHistoryServiceProxy *a2, void *a3)
{
  WBSCloudHistoryServiceProxy *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[WBSCloudHistoryServiceProxy initWithProxy:]([WBSCloudHistoryServiceProxy alloc], "initWithProxy:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionProxyQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSHistoryConnectionProxy_setCompletionListVendorEndpoint_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B168;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionProxyQueue, block);

}

void __79__WBSHistoryConnectionProxy_setCompletionListVendorEndpoint_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "synchronousRemoteObjectProxyWithErrorHandler:", a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletionListVendorEndpoint:completionHandler:", a1[5], a1[6]);

}

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionProxyQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B168;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionProxyQueue, block);

}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4B2B8A0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCompletionListItemsForQuery:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2_cold_1(v4, v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (OS_dispatch_queue)connectionProxyQueue
{
  return self->_connectionProxyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxyQueue, 0);
  objc_storeStrong((id *)&self->_inProcessFallbackService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "XPC connection_proxy init'd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "XPC connection_proxy was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "XPC connection_proxy was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "XPC Proxy reported: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_ERROR, "Failed to retrieve history database URL", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to connect to history service. Returning empty completion list. (%{public}@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
