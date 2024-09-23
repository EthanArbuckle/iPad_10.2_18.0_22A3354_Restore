@implementation PPSMetricMonitorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_service;
}

void __41__PPSMetricMonitorService_sharedInstance__block_invoke()
{
  PPSMetricMonitorService *v0;
  void *v1;

  v0 = objc_alloc_init(PPSMetricMonitorService);
  v1 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v0;

}

- (PPSMetricMonitorService)init
{
  PPSMetricMonitorService *v2;
  uint64_t v3;
  NSMutableDictionary *clients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSMetricMonitorService;
  v2 = -[PPSMetricMonitorService init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)startXPCListener
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithMetricCollection:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  PPSMetricMonitorLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService updateWithMetricCollection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[PPSMetricMonitorService clients](self, "clients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  -[PPSMetricMonitorService clients](self, "clients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__PPSMetricMonitorService_updateWithMetricCollection___block_invoke;
  v16[3] = &unk_251419C98;
  v15 = v4;
  v17 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v16);

  objc_sync_exit(v13);
}

void __54__PPSMetricMonitorService_updateWithMetricCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "updateDelegate");

  if (v5)
  {
    objc_msgSend(v7, "remoteProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithMetricCollection:", *(_QWORD *)(a1 + 32));

  }
}

- (void)endWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  PPSMetricMonitorLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService endWithError:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[PPSMetricMonitorService clients](self, "clients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  -[PPSMetricMonitorService clients](self, "clients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40__PPSMetricMonitorService_endWithError___block_invoke;
  v16[3] = &unk_251419C98;
  v15 = v4;
  v17 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v16);

  objc_sync_exit(v13);
}

void __40__PPSMetricMonitorService_endWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "remoteProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endWithError:", *(_QWORD *)(a1 + 32));

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PPSClient *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  PPSMetricMonitorService *v27;
  id v28;
  int v29;
  _QWORD v30[5];
  id v31;
  int v32;
  id buf;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  PPSMetricMonitorLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_243986000, v9, OS_LOG_TYPE_DEFAULT, "New client connection from PID %d", (uint8_t *)&buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572DC690);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v10);

  objc_msgSend(v7, "remoteObjectInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_updateWithMetricCollection_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572DCEA8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v13);

  objc_msgSend(v7, "exportedInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_setUpWithConfiguration_completion_, 0, 0);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_82);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitorService clients](self, "clients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  v18 = -[PPSClient initWithConnection:remoteProxy:]([PPSClient alloc], "initWithConnection:remoteProxy:", v7, v16);
  -[PPSMetricMonitorService clients](self, "clients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  objc_sync_exit(v17);
  objc_initWeak(&buf, self);
  v21 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_85;
  v30[3] = &unk_251419CE0;
  v32 = v8;
  objc_copyWeak(&v31, &buf);
  v30[4] = self;
  objc_msgSend(v7, "setInterruptionHandler:", v30);
  v23 = v21;
  v24 = 3221225472;
  v25 = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_86;
  v26 = &unk_251419CE0;
  v29 = v8;
  objc_copyWeak(&v28, &buf);
  v27 = self;
  objc_msgSend(v7, "setInvalidationHandler:", &v23);
  objc_msgSend(v7, "resume", v23, v24, v25, v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&buf);

  return 1;
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  PPSMetricMonitorLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_85(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_243986000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection from PID: %d interrupted", (uint8_t *)v10, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v5);
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "clients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "_handleConnectionEndedWithClient:", v9);

  objc_sync_exit(v5);
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_86(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v16[0] = 67109120;
    v16[1] = v3;
    _os_log_impl(&dword_243986000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection from PID %d invalidated", (uint8_t *)v16, 8u);
  }

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v6);
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "_handleConnectionEndedWithClient:", v10);
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_243986000, v13, OS_LOG_TYPE_DEFAULT, "All clients disconnected", (uint8_t *)v16, 2u);
    }

    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allClientsDidDisconnect");

  }
  objc_sync_exit(v6);

}

- (void)setUpWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService setUpWithConfiguration:completion:].cold.1();

  -[PPSMetricMonitorService clients](self, "clients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[PPSMetricMonitorService clients](self, "clients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v14, "setConfig:", v6);
  objc_sync_exit(v11);

  -[PPSMetricMonitorService delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v15, "isMonitoringMetrics");

  if ((v14 & 1) == 0)
  {
    -[PPSMetricMonitorService delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUpForMonitoring");

  }
  v7[2](v7);

}

- (void)startMonitoringSystemMetricsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService startMonitoringSystemMetricsWithCompletion:].cold.1();

  -[PPSMetricMonitorService clients](self, "clients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[PPSMetricMonitorService clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v12))
  {
    -[PPSMetricMonitorService delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isMonitoringMetrics");

    if ((v14 & 1) == 0)
    {
      -[PPSMetricMonitorService delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mode");
      objc_msgSend(v12, "config");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateInterval");
      objc_msgSend(v15, "startMonitoringWithConfigurationMode:updateInterval:", v17);

    }
    v4[2](v4, 0);
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("Service is busy");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 2, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v21);

  }
}

- (void)startMonitoringProcessWithPID:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:](self, "startMonitoringProcessesWithPID:completion:", v9, v7, v10, v11);
}

- (void)startMonitoringProcessesWithPID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:].cold.3();

  -[PPSMetricMonitorService clients](self, "clients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[PPSMetricMonitorService clients](self, "clients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "processIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v10);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v15))
  {
    v16 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v15, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "includeBackBoardUsage");

    if (v18)
    {
      PPSMetricMonitorLogHandleForCategory(2);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:].cold.2();

      v20 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricMonitorService delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "pidForProcessName:", CFSTR("backboardd")));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v22);

    }
    PPSMetricMonitorLogHandleForCategory(2);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:].cold.1();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = v16;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v42;
      while (2)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v27);
          -[PPSMetricMonitorService delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "intValue");
          v40 = 0;
          objc_msgSend(v29, "addMonitoredProcessWithPID:error:", v30, &v40);
          v31 = v40;

          if (v31)
          {
            v7[2](v7, v31);

            goto LABEL_23;
          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v25)
          continue;
        break;
      }
    }

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v24);
    objc_msgSend(v15, "setMonitoredPIDs:", v32);

    -[PPSMetricMonitorService delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isMonitoringMetrics");

    if ((v34 & 1) == 0)
    {
      -[PPSMetricMonitorService delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "config");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "mode");
      objc_msgSend(v15, "config");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "updateInterval");
      objc_msgSend(v35, "startMonitoringWithConfigurationMode:updateInterval:", v37);

    }
    v7[2](v7, 0);
    v31 = 0;
  }
  else
  {
    v39 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    v47[0] = CFSTR("Service is busy");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 2, v31);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v24);
  }
LABEL_23:

}

- (void)startMonitoringProcessWithName:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:](self, "startMonitoringProcessesWithName:completion:", v9, v7, v10, v11);
}

- (void)startMonitoringProcessesWithName:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:].cold.2();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x24BDD16E0];
        -[PPSMetricMonitorService delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "pidForProcessName:", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v19 = v24;
    -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:](self, "startMonitoringProcessesWithPID:completion:", v9, v24);
  }
  else
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:].cold.1();

    v21 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("Invalid process name");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v24 + 2))(v24, v23);

  }
}

- (void)startMonitoringProcessesWithNames:(id)a3 withPIDs:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  BOOL v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void (**v47)(id, id);
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  const __CFString *v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v46 = a4;
  v47 = (void (**)(id, id))a5;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v64 = "-[PPSMetricMonitorService startMonitoringProcessesWithNames:withPIDs:completion:]";
    v65 = 1024;
    v66 = v9;
    v67 = 2112;
    v68 = v45;
    v69 = 2112;
    v70 = v46;
    _os_log_debug_impl(&dword_243986000, v10, OS_LOG_TYPE_DEBUG, "%s called by client: %d process names: %@, PIDs: %@ ", buf, 0x26u);
  }

  -[PPSMetricMonitorService clients](self, "clients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[PPSMetricMonitorService clients](self, "clients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v48))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v14 = v46;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v56;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v56 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v17);
          -[PPSMetricMonitorService delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "intValue");
          v54 = 0;
          objc_msgSend(v19, "addMonitoredProcessWithPID:error:", v20, &v54);
          v21 = v54;

          if (v21)
          {
            v47[2](v47, v21);
            goto LABEL_32;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v15)
          continue;
        break;
      }
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v14);
    objc_msgSend(v48, "setMonitoredPIDs:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v45);
    objc_msgSend(v48, "setRequestedProcessNames:", v23);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v48, "requestedProcessNames");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v51;
      while (2)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v27);
          -[PPSMetricMonitorService delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "pidForProcessName:", v28);

          if ((int)v30 >= 1)
          {
            objc_msgSend(v48, "monitoredPIDs");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v32);

            -[PPSMetricMonitorService delegate](self, "delegate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 0;
            objc_msgSend(v33, "addMonitoredProcessWithPID:error:", v30, &v49);
            v21 = v49;

            if (v21)
            {
              v47[2](v47, v21);

              goto LABEL_32;
            }
            objc_msgSend(v14, "addObject:", v28);
          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v25)
          continue;
        break;
      }
    }

    objc_msgSend(v48, "requestedProcessNames");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "minusSet:", v14);

    PPSMetricMonitorLogHandleForCategory(2);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[PPSMetricMonitorService startMonitoringProcessesWithNames:withPIDs:completion:].cold.1((uint64_t)v14, v48);

    objc_msgSend(v48, "requestedProcessNames");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count") == 0;

    if (!v37)
      -[PPSMetricMonitorService _startProcessPollingTimer:](self, "_startProcessPollingTimer:", v48);
    -[PPSMetricMonitorService delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isMonitoringMetrics");

    if ((v39 & 1) == 0)
    {
      -[PPSMetricMonitorService delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "config");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "mode");
      objc_msgSend(v48, "config");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "updateInterval");
      objc_msgSend(v40, "startMonitoringWithConfigurationMode:updateInterval:", v42);

    }
    v47[2](v47, 0);
    v21 = 0;
  }
  else
  {
    v44 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD0FC8];
    v62 = CFSTR("Service is busy");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 2, v21);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v47[2](v47, v14);
  }
LABEL_32:

}

- (void)finishMonitoringAndSendMetrics
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_243986000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectMetricsOnDemand:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *))a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService collectMetricsOnDemand:].cold.2();

  -[PPSMetricMonitorService clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[PPSMetricMonitorService clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PID %d does not have a valid connection"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 0, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PPSMetricMonitorLogHandleForCategory(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitorService collectMetricsOnDemand:].cold.1();

  }
  -[PPSMetricMonitorService delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectMetricsOnDemand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v18, v12);

}

- (void)collectMetricsOnSnapshotWithError:(id *)a3 completion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:].cold.4();

  -[PPSMetricMonitorService clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  -[PPSMetricMonitorService clients](self, "clients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  PPSMetricMonitorLogHandleForCategory(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:].cold.3((uint64_t)v12, v7, v13);

  if (v12)
  {
    -[PPSMetricMonitorService delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend((id)v14, "collectMetricsOnSnapshotWithError:", &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;

    -[PPSMetricMonitorService _updateMetricCollection:metricCollection:](self, "_updateMetricCollection:metricCollection:", v12, v15);
    objc_msgSend(v12, "requestedProcessNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v17, "count") == 0;

    if ((v14 & 1) == 0)
    {
      PPSMetricMonitorLogHandleForCategory(2);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:].cold.2(v12, v18);

    }
    objc_msgSend(v12, "metricCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v19, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PID %d does not have a valid connection"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 0, v21);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    PPSMetricMonitorLogHandleForCategory(2);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitorService collectMetricsOnDemand:].cold.1();

    ((void (**)(id, void *, id))v5)[2](v5, 0, v16);
  }

}

- (void)setUpdateInterval:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processIdentifier");

  PPSMetricMonitorLogHandleForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService setUpdateInterval:completion:].cold.1();

  -[PPSMetricMonitorService clients](self, "clients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[PPSMetricMonitorService clients](self, "clients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_sync_exit(v10);
  if (v12 == 1)
  {
    -[PPSMetricMonitorService delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v13, "changeUpdateInterval:");

    v7[2](v7, 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("Unable to change update interval while multiple clients are connected");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v16);

  }
}

- (BOOL)_canStartMonitoringForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  void *v27;
  int v28;
  void *v29;
  const char *v30;
  int v31;
  int v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[PPSMetricMonitorService _canStartMonitoringForClient:].cold.1(v4, v20);
    goto LABEL_12;
  }
  -[PPSMetricMonitorService delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMonitoringMetrics");

  if (!v7)
  {
LABEL_13:
    v25 = 1;
    goto LABEL_14;
  }
  -[PPSMetricMonitorService delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentUpdateMode");

  -[PPSMetricMonitorService delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentUpdateInterval");
  v12 = v11;

  objc_msgSend(v4, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mode");

  if (v9 != v14)
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "connection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "processIdentifier");
      objc_msgSend(v4, "config");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 67109632;
      v32 = v28;
      v33 = 2048;
      v34 = *(double *)&v9;
      v35 = 2048;
      v36 = objc_msgSend(v29, "mode");
      _os_log_impl(&dword_243986000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting client %d due to incompatible mode (current: %ld; requested: %ld)",
        (uint8_t *)&v31,
        0x1Cu);

    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "mode");

  if (v16 == 3)
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    objc_msgSend(v4, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 67109120;
    v32 = objc_msgSend(v21, "processIdentifier");
    v30 = "Rejecting client %d with mode updateOnSnapshot; already running";
LABEL_21:
    _os_log_impl(&dword_243986000, v20, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 8u);
    goto LABEL_22;
  }
  if (v16 == 1)
  {
    PPSMetricMonitorLogHandleForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    objc_msgSend(v4, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 67109120;
    v32 = objc_msgSend(v21, "processIdentifier");
    v30 = "Rejecting client %d with mode updateOnStop; already running";
    goto LABEL_21;
  }
  if (v16)
    goto LABEL_13;
  objc_msgSend(v4, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateInterval");
  v19 = vabdd_f64(v12, v18);

  if (v19 <= 0.001)
    goto LABEL_13;
  PPSMetricMonitorLogHandleForCategory(2);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "processIdentifier");
    objc_msgSend(v4, "config");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateInterval");
    v31 = 67109632;
    v32 = v22;
    v33 = 2048;
    v34 = v12;
    v35 = 2048;
    v36 = v24;
    _os_log_impl(&dword_243986000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting client %d due to incompatible update interval (current: %f; requested: %f)",
      (uint8_t *)&v31,
      0x1Cu);

LABEL_22:
  }
LABEL_12:

  v25 = 0;
LABEL_14:

  return v25;
}

- (void)_handleConnectionEndedWithClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PPSMetricMonitorService *v15;

  v12 = a3;
  -[PPSMetricMonitorService clients](self, "clients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[PPSMetricMonitorService clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v8);

  objc_msgSend(v12, "monitoredPIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PPSMetricMonitorService clients](self, "clients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__PPSMetricMonitorService__handleConnectionEndedWithClient___block_invoke;
    v13[3] = &unk_251419D08;
    v14 = v12;
    v15 = self;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  objc_msgSend(v12, "metricCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v12, "setMetricCollection:", 0);
  objc_sync_exit(v4);

}

void __60__PPSMetricMonitorService__handleConnectionEndedWithClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "monitoredPIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v4, "monitoredPIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeMonitoredProcessWithPID:", objc_msgSend(v10, "intValue"));

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_startProcessPollingTimer:(id)a3
{
  id v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  -[PPSMetricMonitorService setProcessPollingRepeatingTimer:](self, "setProcessPollingRepeatingTimer:", v5);

  -[PPSMetricMonitorService processPollingRepeatingTimer](self, "processPollingRepeatingTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 0);
  dispatch_source_set_timer(v6, v7, 0xBEBC200uLL, 0x989680uLL);

  objc_initWeak(&location, self);
  -[PPSMetricMonitorService processPollingRepeatingTimer](self, "processPollingRepeatingTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __53__PPSMetricMonitorService__startProcessPollingTimer___block_invoke;
  handler[3] = &unk_251419D30;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  dispatch_source_set_event_handler(v8, handler);

  -[PPSMetricMonitorService processPollingRepeatingTimer](self, "processPollingRepeatingTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

  PPSMetricMonitorLogHandleForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService _startProcessPollingTimer:].cold.1();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __53__PPSMetricMonitorService__startProcessPollingTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pollForProcessNames:", *(_QWORD *)(a1 + 32));

}

- (void)_cancelProcessPollingTimer
{
  void *v3;
  NSObject *v4;

  -[PPSMetricMonitorService processPollingRepeatingTimer](self, "processPollingRepeatingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PPSMetricMonitorService processPollingRepeatingTimer](self, "processPollingRepeatingTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[PPSMetricMonitorService setProcessPollingRepeatingTimer:](self, "setProcessPollingRepeatingTimer:", 0);
  }
}

- (void)_pollForProcessNames:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  size_t v9;
  int *v10;
  int *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __int128 v28;
  int *v29;
  uint64_t v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "requestedProcessNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[PPSMetricMonitorService _cancelProcessPollingTimer](self, "_cancelProcessPollingTimer");
    PPSMetricMonitorLogHandleForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PPSMetricMonitorService _pollForProcessNames:].cold.1();
    goto LABEL_12;
  }
  v7 = proc_listpids(1u, 0, 0, 0);
  if ((v7 & 0x80000000) == 0)
  {
    v8 = v7;
    v9 = v7;
    v10 = (int *)malloc_type_malloc(v7, 0xE0E1D127uLL);
    if (v10)
    {
      v11 = v10;
      memset(v10, 255, v9);
      v29 = v11;
      v12 = proc_listpids(1u, 0, v11, v8);
      v13 = objc_opt_new();
      PPSMetricMonitorLogHandleForCategory(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PPSMetricMonitorService _pollForProcessNames:].cold.2();

      if (v12 >= 4)
      {
        if ((unint64_t)v12 >> 2 <= 1)
          v19 = 1;
        else
          v19 = (unint64_t)v12 >> 2;
        *(_QWORD *)&v15 = 67109378;
        v28 = v15;
        do
        {
          v21 = *v11++;
          v20 = v21;
          if (v21 >= 1)
          {
            -[PPSMetricMonitorService fullProcessNameForPid:](self, "fullProcessNameForPid:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "requestedProcessNames");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "containsObject:", v22);

            if (v24)
            {
              PPSMetricMonitorLogHandleForCategory(2);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v28;
                v32 = v20;
                v33 = 2112;
                v34 = v22;
                _os_log_debug_impl(&dword_243986000, v25, OS_LOG_TYPE_DEBUG, "Found PID (%d) for %@. Adding to monitor.", buf, 0x12u);
              }

              objc_msgSend(v4, "requestedProcessNames");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "removeObject:", v22);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v13, "addObject:", v27);

            }
          }
          --v19;
        }
        while (v19);
      }
      if (-[NSObject count](v13, "count", v28))
      {
        -[PPSMetricMonitorService delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(v16, "addMonitoredProcessesWithPIDs:error:", v13, &v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPSMetricMonitorService _updateMetricCollection:metricCollection:](self, "_updateMetricCollection:metricCollection:", v4, v17);
        objc_msgSend(v4, "monitoredPIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v13);

      }
      free(v29);
LABEL_12:

    }
  }

}

- (void)_updateMetricCollection:(id)a3 metricCollection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[16];
  _BYTE v38[16];
  _BYTE v39[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  PPSMetricMonitorLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.6(v5);

  objc_msgSend(v5, "metricCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PPSMetricMonitorLogHandleForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.5();

    objc_msgSend(v5, "metricCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "combineWithMetricCollection:", v6);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v5, "monitoredPIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v12)
    {
      v13 = v12;
      v32 = *(_QWORD *)v34;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
          objc_msgSend(v5, "metricCollection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "processMetrics");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v15);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v6, "processMetrics");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              PPSMetricMonitorLogHandleForCategory(2);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.4((uint64_t)v39, v15);

              objc_msgSend(v5, "metricCollection");
              v23 = objc_claimAutoreleasedReturnValue();
              -[NSObject processMetrics](v23, "processMetrics");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v15);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "processMetrics");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v15);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "combineWithProcessMetricCollection:", v27);

LABEL_21:
              goto LABEL_24;
            }
          }
          else
          {

          }
          objc_msgSend(v6, "processMetrics");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          PPSMetricMonitorLogHandleForCategory(2);
          v23 = objc_claimAutoreleasedReturnValue();
          v30 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
          if (v29)
          {
            if (v30)
              -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.3((uint64_t)v38, v15);

            objc_msgSend(v5, "metricCollection");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "processMetrics");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v15);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject updateMetrics:forPid:](v23, "updateMetrics:forPid:", v25, v15);
            goto LABEL_21;
          }
          if (v30)
            -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.2((uint64_t)v37, v15);
LABEL_24:

          ++v14;
        }
        while (v13 != v14);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v13);
    }

  }
  else
  {
    if (v10)
      -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.1();

    objc_msgSend(v5, "setMetricCollection:", v6);
  }

}

- (id)fullProcessNameForPid:(int)a3
{
  void *v4;
  char buffer[4096];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a3 < 1 || (bzero(buffer, 0x1000uLL), proc_pidpath(a3, buffer, 0x1000u) < 1))
  {
    v4 = 0;
  }
  else
  {
    buffer[4095] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", basename(buffer));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (PPSMetricMonitorServiceDelegate)delegate
{
  return (PPSMetricMonitorServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_source)processPollingRepeatingTimer
{
  return self->_processPollingRepeatingTimer;
}

- (void)setProcessPollingRepeatingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_processPollingRepeatingTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPollingRepeatingTimer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateWithMetricCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)endWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_243986000, v0, v1, "Remote object proxy error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setUpWithConfiguration:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_243986000, v0, v1, "%s called by client: %d config: %@", v2);
  OUTLINED_FUNCTION_11_0();
}

- (void)startMonitoringSystemMetricsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_243986000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithPID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_243986000, v0, v1, "monitoring : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithPID:completion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_243986000, v0, OS_LOG_TYPE_ERROR, "include bbd usage", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)startMonitoringProcessesWithPID:completion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_243986000, v0, v1, "%s called by client: %d PID: %@", v2);
  OUTLINED_FUNCTION_11_0();
}

- (void)startMonitoringProcessesWithName:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_243986000, v0, v1, "Invalid process name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithName:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_243986000, v0, v1, "%s called by client: %d processName: %@ ", v2);
  OUTLINED_FUNCTION_11_0();
}

- (void)startMonitoringProcessesWithNames:(uint64_t)a1 withPIDs:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "requestedProcessNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12(&dword_243986000, v2, v3, "Found procs :%@, pending:%@", v4, v5, v6, v7, 2u);

}

- (void)collectMetricsOnDemand:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2(&dword_243986000, v0, v1, "collectMetricsOnSnapshot error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)collectMetricsOnDemand:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_243986000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectMetricsOnSnapshotWithError:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "requestedProcessNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(&dword_243986000, a2, OS_LOG_TYPE_ERROR, "Failed to find matching PID for process name(s): %@", v4, 0xCu);

  OUTLINED_FUNCTION_11_0();
}

- (void)collectMetricsOnSnapshotWithError:(os_log_t)log completion:.cold.3(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_243986000, log, OS_LOG_TYPE_DEBUG, "Found client for pid %d -> %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)collectMetricsOnSnapshotWithError:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_243986000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setUpdateInterval:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_243986000, v0, v1, "%s called by client: %d interval: %@", v2);
  OUTLINED_FUNCTION_11_0();
}

- (void)_canStartMonitoringForClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "processIdentifier");
  _os_log_fault_impl(&dword_243986000, a2, OS_LOG_TYPE_FAULT, "Client %d config is nil", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_1();
}

- (void)_startProcessPollingTimer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_243986000, v0, v1, "Repeating timer for polling process launch armed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_pollForProcessNames:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_243986000, v0, v1, "Stopping polling because we found all requested process names.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_pollForProcessNames:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_243986000, v0, v1, "Polling for matches to requested process names.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateMetricCollection:metricCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_243986000, v0, v1, "Copying client metric collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *v3 = 67109120;
  *v2 = v4;
  OUTLINED_FUNCTION_6_0(&dword_243986000, v5, v6, "No process metrics found for PID (%d).");
  OUTLINED_FUNCTION_14();
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *v3 = 67109120;
  *v2 = v4;
  OUTLINED_FUNCTION_6_0(&dword_243986000, v5, v6, "Copying process metrics for monitored PID (%d)");
  OUTLINED_FUNCTION_14();
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *v3 = 67109120;
  *v2 = v4;
  OUTLINED_FUNCTION_6_0(&dword_243986000, v5, v6, "Combining process metrics for monitored PID (%d)");
  OUTLINED_FUNCTION_14();
}

- (void)_updateMetricCollection:metricCollection:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_243986000, v0, v1, "Combining client metric collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateMetricCollection:(void *)a1 metricCollection:.cold.6(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "monitoredPIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12(&dword_243986000, v1, v2, "%s called by client (monitored pids): %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_11_0();
}

@end
