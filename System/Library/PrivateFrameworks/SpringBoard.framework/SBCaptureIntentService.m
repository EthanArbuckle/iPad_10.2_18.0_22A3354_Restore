@implementation SBCaptureIntentService

- (SBCaptureIntentService)init
{
  SBCaptureIntentService *v2;
  uint64_t v3;
  SBFCaptureApplicationProviding *applicationProvider;
  uint64_t v5;
  NSMutableSet *connections;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBCaptureIntentService;
  v2 = -[SBCaptureIntentService init](&v16, sel_init);
  if (v2)
  {
    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    applicationProvider = v2->_applicationProvider;
    v2->_applicationProvider = (SBFCaptureApplicationProviding *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v9 = (void *)MEMORY[0x1E0D23030];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __30__SBCaptureIntentService_init__block_invoke;
    v14[3] = &unk_1E8E9EFA0;
    v10 = v2;
    v15 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[1];
    v10[1] = (id)v11;

    objc_msgSend(v10[1], "activate");
  }
  return v2;
}

void __30__SBCaptureIntentService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAE18], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(int8x16_t *);
  void *v15;
  id v16;
  SBCaptureIntentService *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBCaptureIntentService: received connection: %{public}@", buf, 0xCu);
  }

  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
    v8 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  else
    v8 = 0;
  if ((LCSFeatureEnabled() & 1) != 0 || (v8 & 1) != 0)
  {
    -[SBCaptureIntentService queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke;
    v15 = &unk_1E8E9E820;
    v11 = v6;
    v16 = v11;
    v17 = self;
    dispatch_sync(v10, &v12);

    objc_msgSend(v11, "activate", v12, v13, v14, v15);
  }
  else
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBCaptureIntentService listener:didReceiveConnection:withContext:].cold.1(v6, v9);

    objc_msgSend(v6, "invalidate");
  }

}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke(int8x16_t *a1)
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
  v5[2] = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_2;
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
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBCaptureIntentService: adding connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1[2].i64[1] + 16), "addObject:", a1[2].i64[0]);
}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
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

  v3 = (void *)MEMORY[0x1E0DAAE18];
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
  v10[2] = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_3;
  v10[3] = &unk_1E8EA8DA0;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v4, "setInvalidationHandler:", v10);

}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBCaptureIntentService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);

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
  if (!v6)
  {
    -[SBFCaptureApplicationProviding captureApplicationForExtensionIdentifier:](self->_applicationProvider, "captureApplicationForExtensionIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)captureIntentContext
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[SBCaptureIntentService _captureApplication](self, "_captureApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "captureIntentContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBCaptureIntentService captureIntentContext].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }

  return v4;
}

- (void)setCaptureIntentContext:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 <= 0x1000)
  {
    -[SBCaptureIntentService _captureApplication](self, "_captureApplication");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      -[NSObject setCaptureIntentContext:](v8, "setCaptureIntentContext:", v4);
    }
    else
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBCaptureIntentService setCaptureIntentContext:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }
  else
  {
    v6 = v5;
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBCaptureIntentService setCaptureIntentContext:].cold.1(v6, v7);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remoteToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "pid");
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "SBCaptureIntentService: Invalidating connection from pid %i - Feature is not enabled", (uint8_t *)v4, 8u);

}

- (void)captureIntentContext
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Remote target is not capture eligible to retrieve a capture intent context", a5, a6, a7, a8, 0);
}

- (void)setCaptureIntentContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "SBCaptureIntentService: Capture intent size (%lu) is larger than expected. Not setting it.", (uint8_t *)&v2, 0xCu);
}

- (void)setCaptureIntentContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Remote target is not capture eligible to set a capture intent context", a5, a6, a7, a8, 0);
}

@end
