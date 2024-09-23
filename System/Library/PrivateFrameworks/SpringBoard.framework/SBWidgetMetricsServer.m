@implementation SBWidgetMetricsServer

- (SBWidgetMetricsServer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetMetricsServer.m"), 43, CFSTR("Use initWithMetricsProvider:"));

  return 0;
}

- (SBWidgetMetricsServer)initWithSystemMetricsProvider:(id)a3 lockScreenMetricsProvider:(id)a4 ambientMetricsProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBWidgetMetricsServer *v11;
  SBWidgetMetricsServer *v12;
  uint64_t v13;
  NSMutableArray *connections;
  uint64_t v15;
  FBServiceClientAuthenticator *authenticator;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v19;
  id *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  id *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBWidgetMetricsServer;
  v11 = -[SBWidgetMetricsServer init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_systemMetricsProvider, v8);
    objc_storeWeak((id *)&v12->_lockScreenMetricsProvider, v9);
    objc_storeWeak((id *)&v12->_ambientMetricsProvider, v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    connections = v12->_connections;
    v12->_connections = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.widget-metrics"));
    authenticator = v12->_authenticator;
    v12->_authenticator = (FBServiceClientAuthenticator *)v15;

    Serial = BSDispatchQueueCreateSerial();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)Serial;

    v19 = (void *)MEMORY[0x1E0D23030];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __104__SBWidgetMetricsServer_initWithSystemMetricsProvider_lockScreenMetricsProvider_ambientMetricsProvider___block_invoke;
    v24[3] = &unk_1E8E9EFA0;
    v20 = v12;
    v25 = v20;
    objc_msgSend(v19, "listenerWithConfigurator:", v24);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v20[3];
    v20[3] = (id)v21;

    objc_msgSend(v20[3], "activate");
  }

  return v12;
}

void __104__SBWidgetMetricsServer_initWithSystemMetricsProvider_lockScreenMetricsProvider_ambientMetricsProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAB098], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBWidgetMetricsServer listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBWidgetMetricsServer;
  -[SBWidgetMetricsServer dealloc](&v4, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  SBWidgetMetricsServer *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: received connection: %{public}@", buf, 0xCu);
  }

  -[SBWidgetMetricsServer authenticator](self, "authenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "authenticateAuditToken:", v10);

  if (v11)
  {
    -[SBWidgetMetricsServer queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke;
    v18 = &unk_1E8E9E820;
    v13 = v6;
    v19 = v13;
    v20 = self;
    dispatch_sync(v12, &v15);

    objc_msgSend(v13, "activate", v15, v16, v17, v18);
  }
  else
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBWidgetMetricsServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v6, v14);

    objc_msgSend(v6, "invalidate");
  }

}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E8EA1060;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "configureConnection:", v6);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: adding connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAB098], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAB098], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v10 = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v7);
  objc_msgSend(*(id *)(a1 + 32), "queue", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: received connection invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v3);

  }
}

- (id)_defaultMetricsProviderForWidget:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "family");
  if (v4 <= 0xC && ((1 << v4) & 0x1C20) != 0)
  {
    -[SBWidgetMetricsServer lockScreenMetricsProvider](self, "lockScreenMetricsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBWidgetMetricsServer systemMetricsProvider](self, "systemMetricsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_metricsProviderForHostingEnvironment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DABA98]))
  {
    -[SBWidgetMetricsServer lockScreenMetricsProvider](self, "lockScreenMetricsProvider");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DABA88]))
      -[SBWidgetMetricsServer ambientMetricsProvider](self, "ambientMetricsProvider");
    else
      -[SBWidgetMetricsServer systemMetricsProvider](self, "systemMetricsProvider");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)systemMetricsForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBWidgetMetricsServer _defaultMetricsProviderForWidget:](self, "_defaultMetricsProviderForWidget:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemMetricsForWidget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[SBWidgetMetricsServer systemMetricsProvider](self, "systemMetricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMetricsSpecificationForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWidgetMetricsServer lockScreenMetricsProvider](self, "lockScreenMetricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMetricsSpecificationForBundleIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D100D0]);
  objc_msgSend(v6, "metricsForFamily:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v10, 1);

  objc_msgSend(v6, "metricsForFamily:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v11, 2);

  objc_msgSend(v6, "metricsForFamily:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v12, 3);

  objc_msgSend(v6, "metricsForFamily:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v13, 4);

  objc_msgSend(v8, "metricsForFamily:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v14, 5);

  objc_msgSend(v8, "metricsForFamily:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v15, 10);

  objc_msgSend(v8, "metricsForFamily:", 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v16, 11);

  objc_msgSend(v8, "metricsForFamily:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetrics:forFamily:", v17, 12);

  return v9;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBWidgetMetricsServer systemMetricsProvider](self, "systemMetricsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWidgetMetricsServer lockScreenMetricsProvider](self, "lockScreenMetricsProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0D100D0]);
  objc_msgSend(v12, "metricsForFamily:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v16, 1);

  objc_msgSend(v12, "metricsForFamily:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v17, 2);

  objc_msgSend(v12, "metricsForFamily:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v18, 3);

  objc_msgSend(v12, "metricsForFamily:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v19, 4);

  objc_msgSend(v14, "metricsForFamily:", 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v20, 5);

  objc_msgSend(v14, "metricsForFamily:", 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v21, 10);

  objc_msgSend(v14, "metricsForFamily:", 11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v22, 11);

  objc_msgSend(v14, "metricsForFamily:", 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetrics:forFamily:", v23, 12);

  return v15;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemMetricsForWidget:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DABA90];
  v5 = a3;
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMetricsSpecificationForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0DABA98];
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", *MEMORY[0x1E0DABA98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewMetricsSpecificationForBundleIdentifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DABA88];
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", *MEMORY[0x1E0DABA88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewMetricsSpecificationForBundleIdentifier:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v4;
  v16[1] = v8;
  v17[0] = v7;
  v17[1] = v10;
  v16[2] = v11;
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DABA90];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v11, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0DABA98];
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", *MEMORY[0x1E0DABA98]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v11, v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x1E0DABA88];
  -[SBWidgetMetricsServer _metricsProviderForHostingEnvironment:](self, "_metricsProviderForHostingEnvironment:", *MEMORY[0x1E0DABA88]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v11, v10, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v8;
  v22[1] = v14;
  v23[0] = v13;
  v23[1] = v16;
  v22[2] = v17;
  v23[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (FBServiceClientAuthenticator)authenticator
{
  return self->_authenticator;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SBSWidgetMetricsProviding)systemMetricsProvider
{
  return (SBSWidgetMetricsProviding *)objc_loadWeakRetained((id *)&self->_systemMetricsProvider);
}

- (SBSWidgetMetricsProviding)lockScreenMetricsProvider
{
  return (SBSWidgetMetricsProviding *)objc_loadWeakRetained((id *)&self->_lockScreenMetricsProvider);
}

- (SBSWidgetMetricsProviding)ambientMetricsProvider
{
  return (SBSWidgetMetricsProviding *)objc_loadWeakRetained((id *)&self->_ambientMetricsProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientMetricsProvider);
  objc_destroyWeak((id *)&self->_lockScreenMetricsProvider);
  objc_destroyWeak((id *)&self->_systemMetricsProvider);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "SBWidgetMetricsServer: connection did not pass entitlement validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
