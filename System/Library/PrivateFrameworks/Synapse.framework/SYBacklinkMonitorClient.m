@implementation SYBacklinkMonitorClient

- (void)updateWithFilterCache:(id)a3
{
  -[SYBacklinkMonitorClient set_filterCache:](self, "set_filterCache:", a3);
  -[SYBacklinkMonitorClient set_previousFilterCacheMatched:](self, "set_previousFilterCacheMatched:", 0);
}

- (void)set_filterCache:(id)a3
{
  objc_storeStrong((id *)&self->__filterCache, a3);
}

- (SYBacklinkMonitorClient)init
{
  SYBacklinkMonitorClient *v2;
  uint64_t v3;
  NSMutableSet *pendingCompletionBlocks;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkMonitorClient;
  v2 = -[SYBacklinkMonitorClient init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingCompletionBlocks = v2->__pendingCompletionBlocks;
    v2->__pendingCompletionBlocks = (NSMutableSet *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.synapse.UserActivityServiceClient", v5);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_createConnectionIfNeeded");
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5;
  v5[3] = &unk_1E757B6C0;
  v5[4] = &v6;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processNotifyActiveUserActivityDidChange:context:serviceProxy:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, 0, v7[5]);
  }

  _Block_object_dispose(&v6, 8);
}

- (void)_createConnectionIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Setting up connection.", v8, 2u);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.synapse.backlink-service"), 0);
    -[SYBacklinkMonitorClient set_connection:](self, "set_connection:", v5);

    -[SYBacklinkMonitorClient _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYBacklinkMonitorClient _clientQueue](self, "_clientQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setQueue:", v7);

    -[SYBacklinkMonitorClient _configureConnectionAndResume](self, "_configureConnectionAndResume");
  }
}

- (void)_configureConnectionAndResume
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitorClient.m"), 151, CFSTR("the XPC connection is unexpectedly nil"));

  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke;
  v17[3] = &unk_1E757B438;
  objc_copyWeak(&v18, &location);
  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v17);

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke_19;
  v15[3] = &unk_1E757B438;
  objc_copyWeak(&v16, &location);
  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", v15);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF496920);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);

  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExportedObject:", self);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4965B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExportedInterface:", v11);

  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)notifyActiveUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "needsCacheUpdate"))
  {
    -[SYBacklinkMonitorClient set_filterCache:](self, "set_filterCache:", 0);
    v11 = 0;
    goto LABEL_6;
  }
  -[SYBacklinkMonitorClient _filterCache](self, "_filterCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_7:
    -[SYBacklinkMonitorClient _clientQueue](self, "_clientQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke;
    v16[3] = &unk_1E757C2D0;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    dispatch_async(v14, v16);

    goto LABEL_8;
  }
  -[SYBacklinkMonitorClient _filterCache](self, "_filterCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v13, "containsMatchingEntriesForItem:", v8);

  if (-[SYBacklinkMonitorClient _previousFilterCacheMatched](self, "_previousFilterCacheMatched")
    || (_DWORD)v11 != -[SYBacklinkMonitorClient _previousFilterCacheMatched](self, "_previousFilterCacheMatched"))
  {
LABEL_6:
    -[SYBacklinkMonitorClient set_previousFilterCacheMatched:](self, "set_previousFilterCacheMatched:", v11);
    goto LABEL_7;
  }
  v15 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v8;
    _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_INFO, "BacklinkClient: Changed activity was filtered out: %p.", buf, 0xCu);
  }

  if (v10)
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
LABEL_8:

}

- (SYBacklinkFilterCache)_filterCache
{
  return self->__filterCache;
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_previousFilterCacheMatched:(BOOL)a3
{
  self->__previousFilterCacheMatched = a3;
}

void __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pendingCompletionBlocks");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 48));
    v4 = objc_msgSend(v2, "containsObject:", v3);

  }
  else
  {
    v4 = 0;
  }
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("N");
    v7 = *(_QWORD *)(a1 + 40);
    if (v4)
      v6 = CFSTR("Y");
    v10 = 134218242;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Service request did finish for activity info %p. Call completion: %@.", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pendingCompletionBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "removeObject:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (NSMutableSet)_pendingCompletionBlocks
{
  return self->__pendingCompletionBlocks;
}

void __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke_2;
  block[3] = &unk_1E757B9B0;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  block[4] = v4;
  v7 = v5;
  dispatch_async(v2, block);

}

- (void)set_connection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (void)_processNotifyActiveUserActivityDidChange:(id)a3 context:(id)a4 serviceProxy:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    -[SYBacklinkMonitorClient _pendingCompletionBlocks](self, "_pendingCompletionBlocks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1BCCFF08C](v15);
    objc_msgSend(v16, "addObject:", v17);

  }
  else
  {
    v15 = 0;
  }
  v18 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v10;
    _os_log_impl(&dword_1BCC38000, v18, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Sending request to service for activity info: %p.", buf, 0xCu);
  }

  if (objc_msgSend(v11, "needsCacheUpdate"))
  {
    objc_msgSend(v11, "setNeedsCacheUpdate:", 1);
  }
  else
  {
    -[SYBacklinkMonitorClient _filterCache](self, "_filterCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsCacheUpdate:", v19 == 0);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke;
  v22[3] = &unk_1E757BD80;
  v23 = v10;
  v24 = v15;
  v22[4] = self;
  v20 = v10;
  v21 = v15;
  objc_msgSend(v12, "activeUserActivityDidChange:context:completion:", v20, v11, v22);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYBacklinkMonitorClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SYBacklinkMonitorClient set_connection:](self, "set_connection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SYBacklinkMonitorClient;
  -[SYBacklinkMonitorClient dealloc](&v4, sel_dealloc);
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5_cold_1((uint64_t)v4, v5, v6);

}

void __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Connection was invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Connection was interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)_invalidateConnection
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_pendingCompletionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, v4, "BacklinkClient: Invalidating connection. Pending completion blocks: %ld", (uint8_t *)&v5);

}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SYBacklinkMonitorClient _clientQueue](self, "_clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SYBacklinkMonitorClient_createConnectionWithEndpoint___block_invoke;
  block[3] = &unk_1E757B460;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __56__SYBacklinkMonitorClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_configureConnectionAndResume");
}

- (void)set_clientQueue:(id)a3
{
  objc_storeStrong((id *)&self->__clientQueue, a3);
}

- (BOOL)_previousFilterCacheMatched
{
  return self->__previousFilterCacheMatched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__filterCache, 0);
  objc_storeStrong((id *)&self->__pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, a3, "BacklinkClient: Error creating remote service proxy: %@", (uint8_t *)&v3);
}

@end
