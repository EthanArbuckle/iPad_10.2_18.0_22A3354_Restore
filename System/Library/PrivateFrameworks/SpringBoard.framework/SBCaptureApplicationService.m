@implementation SBCaptureApplicationService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_45 != -1)
    dispatch_once(&sharedInstance_onceToken_45, &__block_literal_global_295);
  return (id)sharedInstance___result_2;
}

void __45__SBCaptureApplicationService_sharedInstance__block_invoke()
{
  SBCaptureApplicationService *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBCaptureApplicationService alloc];
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBCaptureApplicationService initWithCaptureApplicationProvider:](v0, "initWithCaptureApplicationProvider:", v3);
  v2 = (void *)sharedInstance___result_2;
  sharedInstance___result_2 = v1;

}

- (SBCaptureApplicationService)initWithCaptureApplicationProvider:(id)a3
{
  id v5;
  SBCaptureApplicationService *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableSet *connections;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v12;
  id *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id *v18;
  uint8_t buf[16];
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBCaptureApplicationService;
  v6 = -[SBCaptureApplicationService init](&v20, sel_init);
  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBCaptureApplicationService: init", buf, 2u);
    }

    objc_storeStrong((id *)&v6->_applicationProvider, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSMutableSet *)v8;

    Serial = BSDispatchQueueCreateSerial();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)Serial;

    v12 = (void *)MEMORY[0x1E0D23030];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__SBCaptureApplicationService_initWithCaptureApplicationProvider___block_invoke;
    v17[3] = &unk_1E8E9EFA0;
    v13 = v6;
    v18 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[1];
    v13[1] = (id)v14;

    objc_msgSend(v13[1], "activate");
  }

  return v6;
}

void __66__SBCaptureApplicationService_initWithCaptureApplicationProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAE00], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(int8x16_t *);
  void *v13;
  id v14;
  SBCaptureApplicationService *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBCaptureApplicationService: received connection: %{public}@", buf, 0xCu);
  }

  -[SBCaptureApplicationService queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke;
  v13 = &unk_1E8E9E820;
  v14 = v6;
  v15 = self;
  v9 = v6;
  dispatch_sync(v8, &v10);

  objc_msgSend(v9, "activate", v10, v11, v12, v13);
}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_2;
  v5[3] = &unk_1E8EA88C8;
  v4 = a1[2];
  v6 = vextq_s8(v4, v4, 8uLL);
  objc_msgSend((id)v4.i64[0], "configureConnection:", v5);
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBCaptureApplicationService: adding connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1[2].i64[1] + 16), "addObject:", a1[2].i64[0]);
}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0DAAE00];
  v4 = a2;
  objc_msgSend(v3, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v5);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v6);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetQueue:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_3;
  v10[3] = &unk_1E8EA8DA0;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v4, "setInvalidationHandler:", v10);

}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBCaptureApplicationService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v3);

}

- (id)_captureApplication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFCaptureApplicationProviding captureApplicationForBundleIdentifier:](self->_applicationProvider, "captureApplicationForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)applicationDidCompleteTransition
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Remote target is not a capture application so this is a no-op", v1, 2u);
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
