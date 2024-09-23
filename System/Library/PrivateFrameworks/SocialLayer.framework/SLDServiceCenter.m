@implementation SLDServiceCenter

void __46__SLDServiceCenter_connectionForServiceClass___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3B38];
    v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithListenerEndpoint:", v4);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend(*(id *)(a1 + 40), "remoteObjectProtocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interfaceWithProtocol:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "setupInterface:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRemoteObjectInterface:", v10);

  }
}

void __32__SLDServiceCenter_sharedCenter__block_invoke()
{
  SLDServiceCenter *v0;
  void *v1;

  v0 = objc_alloc_init(SLDServiceCenter);
  v1 = (void *)sharedCenter_sClient;
  sharedCenter_sClient = (uint64_t)v0;

}

- (SLDServiceCenter)init
{
  SLDServiceCenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *propertyConcurrentQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *mainConnectionSetupQueue;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  SLDServiceCenter *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SLDServiceCenter;
  v2 = -[SLDServiceCenter init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.Properties", v3);
    propertyConcurrentQueue = v2->_propertyConcurrentQueue;
    v2->_propertyConcurrentQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.MainConnectionSetup", v6);
    mainConnectionSetupQueue = v2->_mainConnectionSetupQueue;
    v2->_mainConnectionSetupQueue = (OS_dispatch_queue *)v7;

    SLDClientGlobalWorkloop();
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__SLDServiceCenter_init__block_invoke;
    block[3] = &unk_1E3794360;
    v13 = v2;
    dispatch_async(v9, block);

    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SLDServiceCenter init].cold.1();

  }
  return v2;
}

void __24__SLDServiceCenter_conn__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __24__SLDServiceCenter_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureMainConnectionSynchronously");
}

void __28__SLDServiceCenter_setConn___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (id)_synchronousRemoteObjectProxy
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];

  -[SLDServiceCenter _ensureMainConnectionSynchronously](self, "_ensureMainConnectionSynchronously");
  -[SLDServiceCenter conn](self, "conn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:].cold.1();
    goto LABEL_9;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke;
  v9[3] = &unk_1E3794298;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (-[NSObject conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EE399DF8) & 1) == 0)
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SLDServiceCenter _synchronousRemoteObjectProxy].cold.2();

LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (void)_ensureMainConnectionSynchronously
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDServiceCenter mainConnectionSetupQueue](self, "mainConnectionSetupQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)mainConnectionSetupQueue
{
  return self->_mainConnectionSetupQueue;
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id from;
  id location;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE399DF8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sociallayerd"), 0);
    objc_msgSend(v4, "setRemoteObjectInterface:", v3);
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v4);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_2;
    v11 = &unk_1E3795890;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v4, "setInvalidationHandler:", &v8);
    objc_msgSend(v4, "resume", v8, v9, v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "setConn:", v4);
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "conn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_cold_1((uint64_t)v6, v7, buf, v5);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
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
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[SLDServiceCenter propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SLDServiceCenter_conn__block_invoke;
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

- (void)setConn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLDServiceCenter propertyConcurrentQueue](self, "propertyConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__SLDServiceCenter_setConn___block_invoke;
  v7[3] = &unk_1E37942C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

- (id)connectionForServiceClass:(Class)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id inited;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t v19[16];
  _QWORD v20[6];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id location;

  SLGeneralTelemetryLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SLGeneralTelemetryLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLDServiceCenterConnectionForServiceClass", ", buf, 2u);
  }

  inited = objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  v26 = 0;
  v10 = inited;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    NSStringFromClass(a3);
    v11 = objc_claimAutoreleasedReturnValue();
    -[SLDServiceCenter _synchronousRemoteObjectProxy](self, "_synchronousRemoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __46__SLDServiceCenter_connectionForServiceClass___block_invoke;
      v20[3] = &unk_1E3795868;
      v20[4] = buf;
      v20[5] = a3;
      objc_msgSend(v12, "endpointForServiceNamed:reply:", v11, v20);
    }
    else
    {
      SLDaemonLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SLDServiceCenter connectionForServiceClass:].cold.1();

    }
  }
  else
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SLDServiceCenter connectionForServiceClass:].cold.2();
  }

  SLGeneralTelemetryLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v16, OS_SIGNPOST_INTERVAL_END, v6, "SLDServiceCenterConnectionForServiceClass", ", v19, 2u);
  }

  v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
  return v17;
}

+ (id)sharedCenter
{
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_13);
  return (id)sharedCenter_sClient;
}

void __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mainConnectionSetupQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3;
  v6[3] = &unk_1E37942C0;
  v6[4] = WeakRetained;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  SLDaemonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "conn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);

  if (v9 == v10)
    objc_msgSend(*(id *)(a1 + 32), "setConn:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainConnectionSetupQueue, 0);
  objc_storeStrong((id *)&self->_propertyConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "[%@] Initialized SLDServiceCenter.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)connectionForServiceClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[%@] Received a nil remote object proxy, we've probably disconnected, or there was an error connecting. Returning a nil connection to the caller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)connectionForServiceClass:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[%@] Service class (%@) does implement remoteObjectProtocol. Disallowing service connection.");
  OUTLINED_FUNCTION_5();
}

- (void)_synchronousRemoteObjectProxy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[%@] Remote proxy object does not conform to <SLDServiceMultiplexing>. Returning a nil proxy object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, a2, a3, "[%@] Error retrieving a synchronous remote proxy to the main daemon service multiplexer. Error: [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "[%@] New primary connection to sociallayerd: %@", buf, 0x16u);

}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "[%@] Primary connection to sociallayerd was invalidated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
