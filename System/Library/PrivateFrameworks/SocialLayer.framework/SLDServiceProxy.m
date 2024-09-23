@implementation SLDServiceProxy

void __53__SLDServiceProxy__atomicConfigureWithNewConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
}

void __49__SLDServiceProxy__notifyDelegateProxyDidConnect__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceProxyDidConnect:", *(_QWORD *)(a1 + 32));

}

- (SLDServiceProxyDelegate)delegate
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
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SLDServiceProxy_delegate__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SLDServiceProxyDelegate *)v4;
}

+ (id)proxyForServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  SLDServiceProxy *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[SLDServiceProxy initWithServiceClass:targetSerialQueue:delegate:]([SLDServiceProxy alloc], "initWithServiceClass:targetSerialQueue:delegate:", a3, v8, v7);

  return v9;
}

- (SLDServiceProxy)initWithServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  SLDServiceProxy *v10;
  SLDServiceProxy *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *clientQueue;
  OS_dispatch_queue *v14;
  id v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *propertyConcurrentQueue;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  SLDServiceProxy *v23;
  __int16 v24;
  Class v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SLDServiceProxy;
  v10 = -[SLDServiceProxy init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_serviceClass = a3;
    if (v8)
    {
      v12 = (OS_dispatch_queue *)v8;
      clientQueue = v11->_clientQueue;
      v11->_clientQueue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      clientQueue = v11->_clientQueue;
      v11->_clientQueue = v14;
    }

    objc_storeWeak((id *)&v11->_delegate, v9);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.Properties", v16);
    propertyConcurrentQueue = v11->_propertyConcurrentQueue;
    v11->_propertyConcurrentQueue = (OS_dispatch_queue *)v17;

    v11->_connectionRetryCount = 3;
    SLDaemonLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      v24 = 2112;
      v25 = a3;
      v26 = 2112;
      v27 = v9;
      _os_log_debug_impl(&dword_199EFF000, v19, OS_LOG_TYPE_DEBUG, "[%@] Initialized SLDServiceProxy with serviceClass: %@, delegate:%@", buf, 0x20u);
    }

  }
  return v11;
}

uint64_t __39__SLDServiceProxy_waitingForConnection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void __23__SLDServiceProxy_conn__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __43__SLDServiceProxy_setWaitingForConnection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

- (id)synchronousRemoteService
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];

  -[SLDServiceProxy conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SLDServiceProxy conn](self, "conn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__SLDServiceProxy_synchronousRemoteService__block_invoke;
    v8[3] = &unk_1E3794298;
    v8[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:].cold.1();

    v5 = 0;
  }
  return v5;
}

- (BOOL)waitingForConnection
{
  SLDServiceProxy *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SLDServiceProxy_waitingForConnection__block_invoke;
  v5[3] = &unk_1E37942E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSXPCConnection)conn
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
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__SLDServiceProxy_conn__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)propertyConcurrentQueue
{
  return self->_propertyConcurrentQueue;
}

- (void)_receivedServiceConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  SLDServiceProxy *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SLDServiceProxy _receivedServiceConnection:].cold.1(self, (uint64_t)v4, v5);

    -[SLDServiceProxy _atomicConfigureWithNewConnection:](self, "_atomicConfigureWithNewConnection:", v4);
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __46__SLDServiceProxy__receivedServiceConnection___block_invoke;
    v14 = &unk_1E3794220;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "setInvalidationHandler:", &v11);
    objc_msgSend(v4, "resume", v11, v12, v13, v14);
    -[SLDServiceProxy synchronousRemoteService](self, "synchronousRemoteService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class remoteObjectProtocol](-[SLDServiceProxy serviceClass](self, "serviceClass"), "remoteObjectProtocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "conformsToProtocol:", v7);

    if ((v8 & 1) != 0)
    {
      -[SLDServiceProxy _notifyDelegateProxyDidConnect](self, "_notifyDelegateProxyDidConnect");
    }
    else
    {
      SLDaemonLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[objc_class remoteObjectProtocol](-[SLDServiceProxy serviceClass](self, "serviceClass"), "remoteObjectProtocol");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = self;
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v10;
        _os_log_error_impl(&dword_199EFF000, v9, OS_LOG_TYPE_ERROR, "[%@] The new connection (%@) either didn't yield a remote service, or it didn't conform to the expected remote object protocol:%@. Closing connection.", buf, 0x20u);

      }
      -[SLDServiceProxy _invalidateAndDestroyConnection](self, "_invalidateAndDestroyConnection");
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __42__SLDServiceProxy__establishNewConnection__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "waitingForConnection") & 1) != 0
    || (SLDAllowedServiceClasses(),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "containsObject:", objc_msgSend(*v1, "serviceClass")),
        v2,
        !v3))
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_1(v1, v6);
  }
  else
  {
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_3(v1);

    objc_msgSend(*v1, "setWaitingForConnection:", 1);
    +[SLDServiceCenter sharedCenter](SLDServiceCenter, "sharedCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionForServiceClass:", objc_msgSend(*v1, "serviceClass"));
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_6:
      objc_msgSend(*v1, "_receivedServiceConnection:", v6);
    }
    else
    {
      v8 = 0;
      *(_QWORD *)&v7 = 138413058;
      v15 = v7;
      while (1)
      {
        v9 = objc_msgSend(*v1, "connectionRetryCount", v15);
        SLDaemonLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
        if (v8 > 0x13 || v8 >= v9)
          break;
        if (v10)
        {
          v12 = *v1;
          v13 = objc_msgSend(*v1, "serviceClass");
          v14 = objc_msgSend(*v1, "connectionRetryCount");
          *(_DWORD *)buf = v15;
          v17 = v12;
          v18 = 2112;
          v19 = v13;
          v20 = 2048;
          v21 = v8;
          v22 = 2048;
          v23 = v14;
          _os_log_error_impl(&dword_199EFF000, v6, OS_LOG_TYPE_ERROR, "[%@] Didn't get a connection for service class '%@'. Attempting to recover with retry number: %lu with max retries: %lu", buf, 0x2Au);
        }

        +[SLDServiceCenter sharedCenter](SLDServiceCenter, "sharedCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "connectionForServiceClass:", objc_msgSend(*v1, "serviceClass"));
        v6 = objc_claimAutoreleasedReturnValue();

        ++v8;
        if (v6)
          goto LABEL_6;
      }
      if (v10)
        __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_2();
    }
  }

}

- (Class)serviceClass
{
  return self->_serviceClass;
}

- (void)setWaitingForConnection:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SLDServiceProxy_setWaitingForConnection___block_invoke;
  v6[3] = &unk_1E3794310;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

- (void)connect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "[%@] Client requested service connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (BOOL)connectionActive
{
  SLDServiceProxy *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SLDServiceProxy_connectionActive__block_invoke;
  v5[3] = &unk_1E37942E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_establishNewConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDServiceProxy clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLDServiceProxy__establishNewConnection__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateProxyDidConnect
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDServiceProxy clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SLDServiceProxy__notifyDelegateProxyDidConnect__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)_atomicConfigureWithNewConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SLDServiceProxy__atomicConfigureWithNewConnection___block_invoke;
  v7[3] = &unk_1E37942C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

uint64_t __35__SLDServiceProxy_connectionActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __27__SLDServiceProxy_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SLDServiceProxy: %p> %@"), self, -[SLDServiceProxy serviceClass](self, "serviceClass"));
}

- (void)disconnect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "[%@] Client requested disconnection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (id)synchronousRemoteServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[SLDServiceProxy conn](self, "conn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SLDServiceProxy conn](self, "conn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:].cold.1();

    v7 = 0;
  }

  return v7;
}

void __43__SLDServiceProxy_synchronousRemoteService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__SLDServiceProxy_synchronousRemoteService__block_invoke_cold_1(a1);

}

- (id)remoteService
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];

  -[SLDServiceProxy conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SLDServiceProxy conn](self, "conn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__SLDServiceProxy_remoteService__block_invoke;
    v8[3] = &unk_1E3794298;
    v8[4] = self;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:].cold.1();

    v5 = 0;
  }
  return v5;
}

void __32__SLDServiceProxy_remoteService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __32__SLDServiceProxy_remoteService__block_invoke_cold_1(a1);

}

- (int)remoteProcessID
{
  void *v3;
  void *v4;
  int v5;

  if (!-[SLDServiceProxy connectionActive](self, "connectionActive"))
    return 0;
  -[SLDServiceProxy conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SLDServiceProxy conn](self, "conn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "processIdentifier");

  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SLDServiceProxy_setDelegate___block_invoke;
  v7[3] = &unk_1E37942C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

id __31__SLDServiceProxy_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setConnectionActive:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SLDServiceProxy_setConnectionActive___block_invoke;
  v6[3] = &unk_1E3794310;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __39__SLDServiceProxy_setConnectionActive___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (unint64_t)connectionRetryCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SLDServiceProxy_connectionRetryCount__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SLDServiceProxy_connectionRetryCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)setConnectionRetryCount:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SLDServiceProxy_setConnectionRetryCount___block_invoke;
  v6[3] = &unk_1E3794338;
  v6[4] = self;
  v6[5] = a3;
  dispatch_barrier_async(v5, v6);

}

void __43__SLDServiceProxy_setConnectionRetryCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 24) != v2)
  {
    if (v2 >= 0x14)
      v2 = 20;
    *(_QWORD *)(v1 + 24) = v2;
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43__SLDServiceProxy_setConnectionRetryCount___block_invoke_cold_1();

  }
}

- (void)setConn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__SLDServiceProxy_setConn___block_invoke;
  v7[3] = &unk_1E37942C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __27__SLDServiceProxy_setConn___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (BOOL)shouldAutoReconnect
{
  SLDServiceProxy *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SLDServiceProxy_shouldAutoReconnect__block_invoke;
  v5[3] = &unk_1E37942E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__SLDServiceProxy_shouldAutoReconnect__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 10);
  return result;
}

- (void)setShouldAutoReconnect:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SLDServiceProxy propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SLDServiceProxy_setShouldAutoReconnect___block_invoke;
  v6[3] = &unk_1E3794310;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __42__SLDServiceProxy_setShouldAutoReconnect___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_notifyDelegateProxyDidDisconnect
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDServiceProxy clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SLDServiceProxy__notifyDelegateProxyDidDisconnect__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __52__SLDServiceProxy__notifyDelegateProxyDidDisconnect__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceProxyDidDisconnect:", *(_QWORD *)(a1 + 32));

}

void __46__SLDServiceProxy__receivedServiceConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)_connectionInvalidated
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  v5 = objc_msgSend(a1, "serviceClass");
  objc_msgSend(a1, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138413058;
  v8 = a1;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_debug_impl(&dword_199EFF000, a2, OS_LOG_TYPE_DEBUG, "[%@] Connection: %@ was invalidated for service class: %@, delegate: %@", (uint8_t *)&v7, 0x2Au);

}

- (void)_invalidateAndDestroyConnection
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "conn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "[%@] Explicitly invalidating connection: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)dealloc
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "conn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "[%@] Deallocated: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __26__SLDServiceProxy_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 10) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

- (void)setServiceClass:(Class)a3
{
  self->_serviceClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (SLDActiveCallService)activeCallService
{
  void *v2;
  id v3;

  -[SLDServiceProxy synchronousRemoteService](self, "synchronousRemoteService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE39CA60))
    v3 = v2;
  else
    v3 = 0;

  return (SLDActiveCallService *)v3;
}

- (SLDCollaborationAttributionViewService)collaborationAttributionViewService
{
  void *v2;
  id v3;

  -[SLDServiceProxy synchronousRemoteService](self, "synchronousRemoteService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE39FA08))
    v3 = v2;
  else
    v3 = 0;

  return (SLDCollaborationAttributionViewService *)v3;
}

- (void)synchronousRemoteServiceWithErrorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[%@] There is no current XPC connection, so no remote object proxy can be returned.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__SLDServiceProxy_synchronousRemoteService__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12(a1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_199EFF000, v1, v2, "[%@] Error retrieving a synchronous remote proxy to service with class: %@. Error: [%@]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

void __32__SLDServiceProxy_remoteService__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12(a1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_199EFF000, v1, v2, "[%@] Error retrieving an async remote proxy to service with class: %@. Error: [%@]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

void __43__SLDServiceProxy_setConnectionRetryCount___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_14(&dword_199EFF000, v2, (uint64_t)v2, "[%@] Client requested to set connectionRetryCount=%lu. Sanitized value we set: %lu", v3);
  OUTLINED_FUNCTION_13();
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a2, v3, "[%@] Service class: %@ is not explicitly allowed.", v4);
  OUTLINED_FUNCTION_13();
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%@] We could not retrieve a connection after attempting %lu times.", v1);
  OUTLINED_FUNCTION_5();
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_3(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v1, v2, "[%@] Establishing a new connection for service class: %@.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

- (void)_receivedServiceConnection:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 138412802;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = objc_msgSend(a1, "serviceClass");
  OUTLINED_FUNCTION_14(&dword_199EFF000, a3, v4, "[%@] Received subservice connection: %@ for service class: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_4_0();
}

@end
