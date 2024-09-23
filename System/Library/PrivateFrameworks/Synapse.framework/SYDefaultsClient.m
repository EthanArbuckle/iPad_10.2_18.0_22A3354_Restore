@implementation SYDefaultsClient

uint64_t __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"));
}

void __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_createConnectionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_2;
  v8[3] = &unk_1E757B338;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = v3;
      v6[1] = 3221225472;
      v6[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_7;
      v6[3] = &unk_1E757B828;
      v7 = v5;
      objc_msgSend(v4, "indicatorCoverageWithCompletion:", v6);

    }
  }

}

- (void)indicatorCoverageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SYDefaultsClient _clientQueue](self, "_clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke;
  v7[3] = &unk_1E757B850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)_createConnectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SYDefaultsClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.synapse.backlink-service"), 0);
    -[SYDefaultsClient set_connection:](self, "set_connection:", v4);

    -[SYDefaultsClient _connection](self, "_connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDefaultsClient _clientQueue](self, "_clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v6);

    -[SYDefaultsClient _configureConnectionAndResume](self, "_configureConnectionAndResume");
  }
}

- (void)set_connection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (SYDefaultsClient)init
{
  SYDefaultsClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYDefaultsClient;
  v2 = -[SYDefaultsClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.defaults", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
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
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[SYDefaultsClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDefaultsClient.m"), 102, CFSTR("the XPC connection is unexpectedly nil"));

  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__SYDefaultsClient__configureConnectionAndResume__block_invoke;
  v14[3] = &unk_1E757B438;
  objc_copyWeak(&v15, &location);
  -[SYDefaultsClient _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v14);

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __49__SYDefaultsClient__configureConnectionAndResume__block_invoke_16;
  v12[3] = &unk_1E757B438;
  objc_copyWeak(&v13, &location);
  -[SYDefaultsClient _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF496920);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDefaultsClient _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);

  -[SYDefaultsClient _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYDefaultsClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SYDefaultsClient set_connection:](self, "set_connection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SYDefaultsClient;
  -[SYDefaultsClient dealloc](&v4, sel_dealloc);
}

- (void)setIndicatorCoverage:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[SYDefaultsClient _clientQueue](self, "_clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke;
  block[3] = &unk_1E757B800;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createConnectionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2;
  v6[3] = &unk_1E757B338;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIndicatorCoverage:", v4);

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

}

void __49__SYDefaultsClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Connection was invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __49__SYDefaultsClient__configureConnectionAndResume__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Connection was interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)_invalidateConnection
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[SYDefaultsClient _clientQueue](self, "_clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYDefaultsClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.synapse", "SYDefaultsClient");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "Invalidating connection.", v7, 2u);
    }

    -[SYDefaultsClient _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDefaultsClient set_connection:](self, "set_connection:", 0);
    objc_msgSend(v6, "invalidate");

  }
}

- (void)set_clientQueue:(id)a3
{
  objc_storeStrong((id *)&self->__clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Error creating remote service proxy: %@", a5, a6, a7, a8, 2u);
}

@end
