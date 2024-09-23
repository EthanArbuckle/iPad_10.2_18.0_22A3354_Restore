@implementation SYBacklinkMonitorServiceHandle

- (void)indicatorCoverageWithCompletion:(id)a3
{
  void (**v4)(id, id);
  int64_t v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = -[SYBacklinkMonitorServiceHandle _indicatorCoverage](self, "_indicatorCoverage");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
}

- (int64_t)_indicatorCoverage
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Synapse"));
  objc_msgSend(v2, "objectForKey:", CFSTR("indicatorCoverage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("indicatorCoverage"));
  else
    v4 = 1;

  return v4;
}

- (SYBacklinkMonitorServiceHandle)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  SYBacklinkMonitorServiceHandle *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SYBacklinkMonitorServiceHandle *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SYBacklinkMonitorServiceHandle;
  v9 = -[SYBacklinkMonitorServiceHandle init](&v21, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v7;
      _os_log_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Creating handle for connection: %p.", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_handleQueue, a4);
    objc_msgSend(v7, "_setQueue:", v9->_handleQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF496920);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v11);

    objc_msgSend(v7, "setExportedObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4965B0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v12);

    objc_initWeak((id *)buf, v9);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__SYBacklinkMonitorServiceHandle_initWithConnection_queue___block_invoke;
    v18 = &unk_1E757C3B0;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v9;
    v13 = (void *)MEMORY[0x1BCCFF08C](&v15);
    objc_msgSend(v7, "setInterruptionHandler:", v13, v15, v16, v17, v18);
    objc_msgSend(v7, "setInvalidationHandler:", v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

- (int)processIdentifier
{
  return -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)handleWithConnection:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnection:queue:", v7, v6);

  return v8;
}

- (void)activeUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = a4;
  v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 134217984;
    v14 = v8;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Received request to process activity change. Activity info: %p.", (uint8_t *)&v13, 0xCu);
  }

  -[SYBacklinkMonitorServiceHandle delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleOperationForHandle:withUserActivity:context:", self, v8, v10);

  if (v9)
    v9[2](v9);

}

- (SYBacklinkMonitorServiceHandleDelegate)delegate
{
  return (SYBacklinkMonitorServiceHandleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setFilterCache:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SYBacklinkMonitorServiceHandle connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "updateWithFilterCache:", v6);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

void __59__SYBacklinkMonitorServiceHandle_initWithConnection_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_killConnectionWithCallback");
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SYBacklinkMonitorServiceHandle;
  -[SYBacklinkMonitorServiceHandle dealloc](&v3, sel_dealloc);
}

- (void)_killConnectionWithCallback
{
  id v3;

  -[SYBacklinkMonitorServiceHandle delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleDidDisconnect:", self);

}

void __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)setIndicatorCoverage:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  int64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "integerValue");
  if (v4 <= 2)
  {
    v5 = v4;
    v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134218240;
      v9 = -[SYBacklinkMonitorServiceHandle _indicatorCoverage](self, "_indicatorCoverage");
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Change indicator coverage from: %ld to: %ld", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Synapse"));
    objc_msgSend(v7, "setInteger:forKey:", v5, CFSTR("indicatorCoverage"));

  }
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)handleQueue
{
  return self->_handleQueue;
}

- (void)setHandleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handleQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "BacklinkServiceHandle: Error creating remote service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end
