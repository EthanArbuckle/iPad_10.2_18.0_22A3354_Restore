@implementation OSADiagnosticMonitor

+ (OSADiagnosticMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global);
  return (OSADiagnosticMonitor *)(id)sharedMonitor__shared;
}

void __37__OSADiagnosticMonitor_sharedMonitor__block_invoke()
{
  OSADiagnosticMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(OSADiagnosticMonitor);
  v1 = (void *)sharedMonitor__shared;
  sharedMonitor__shared = (uint64_t)v0;

}

- (OSADiagnosticMonitor)init
{
  OSADiagnosticMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  uint64_t v7;
  NSMutableArray *eventObservers;
  uint64_t v9;
  NSMutableArray *writeObservers;
  uint64_t v11;
  NSMutableSet *observedEventTypes;
  uint64_t v13;
  NSMutableSet *observedWriteTypes;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)OSADiagnosticMonitor;
  v2 = -[OSADiagnosticMonitor init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.osanalytics.diagnosticsmonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.osanalytics.diagnosticmonitor.calloutqueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    eventObservers = v2->_eventObservers;
    v2->_eventObservers = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    writeObservers = v2->_writeObservers;
    v2->_writeObservers = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    observedEventTypes = v2->_observedEventTypes;
    v2->_observedEventTypes = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    observedWriteTypes = v2->_observedWriteTypes;
    v2->_observedWriteTypes = (NSMutableSet *)v13;

  }
  return v2;
}

- (void)addEventObserver:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__OSADiagnosticMonitor_addEventObserver_forTypes___block_invoke;
  block[3] = &unk_1E6161030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __50__OSADiagnosticMonitor_addEventObserver_forTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addEventObserver:forTypes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeEventObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__OSADiagnosticMonitor_removeEventObserver___block_invoke;
  v7[3] = &unk_1E6160FE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __44__OSADiagnosticMonitor_removeEventObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_removeEventObserver:andComputeObservedTypes:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "q_teardownServerConnectionIfNoMoreObservers");
}

- (void)addWriteObserver:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__OSADiagnosticMonitor_addWriteObserver_forTypes___block_invoke;
  block[3] = &unk_1E6161030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __50__OSADiagnosticMonitor_addWriteObserver_forTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addWriteObserver:forTypes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeWriteObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__OSADiagnosticMonitor_removeWriteObserver___block_invoke;
  v7[3] = &unk_1E6160FE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __44__OSADiagnosticMonitor_removeWriteObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_removeWriteObserver:andComputeObservedTypes:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "q_teardownServerConnectionIfNoMoreObservers");
}

- (void)q_addEventObserver:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *eventObservers;
  EventObserver *v9;

  v6 = a4;
  v7 = a3;
  -[OSADiagnosticMonitor q_removeEventObserver:andComputeObservedTypes:](self, "q_removeEventObserver:andComputeObservedTypes:", v7, 0);
  eventObservers = self->_eventObservers;
  v9 = -[EventObserver initWithObserver:bugTypes:]([EventObserver alloc], "initWithObserver:bugTypes:", v7, v6);

  -[NSMutableArray addObject:](eventObservers, "addObject:", v9);
  -[OSADiagnosticMonitor q_computeEventObserverTypes](self, "q_computeEventObserverTypes");
}

- (void)q_removeEventObserver:(id)a3 andComputeObservedTypes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *eventObservers;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  eventObservers = self->_eventObservers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__OSADiagnosticMonitor_q_removeEventObserver_andComputeObservedTypes___block_invoke;
  v10[3] = &unk_1E6161058;
  v9 = v6;
  v11 = v9;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](eventObservers, "indexOfObjectPassingTest:", v10);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_eventObservers, "removeObjectAtIndex:", v8);
    if (v4)
      -[OSADiagnosticMonitor q_computeEventObserverTypes](self, "q_computeEventObserverTypes");
  }

}

uint64_t __70__OSADiagnosticMonitor_q_removeEventObserver_andComputeObservedTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matches:", *(_QWORD *)(a1 + 32));
}

- (void)q_addWriteObserver:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *writeObservers;
  WriteObserver *v9;

  v6 = a4;
  v7 = a3;
  -[OSADiagnosticMonitor q_removeWriteObserver:andComputeObservedTypes:](self, "q_removeWriteObserver:andComputeObservedTypes:", v7, 0);
  writeObservers = self->_writeObservers;
  v9 = -[WriteObserver initWithObserver:bugTypes:]([WriteObserver alloc], "initWithObserver:bugTypes:", v7, v6);

  -[NSMutableArray addObject:](writeObservers, "addObject:", v9);
  -[OSADiagnosticMonitor q_computeWriteObserverTypes](self, "q_computeWriteObserverTypes");
}

- (void)q_removeWriteObserver:(id)a3 andComputeObservedTypes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *writeObservers;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  writeObservers = self->_writeObservers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__OSADiagnosticMonitor_q_removeWriteObserver_andComputeObservedTypes___block_invoke;
  v10[3] = &unk_1E6161080;
  v9 = v6;
  v11 = v9;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](writeObservers, "indexOfObjectPassingTest:", v10);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_writeObservers, "removeObjectAtIndex:", v8);
    if (v4)
      -[OSADiagnosticMonitor q_computeWriteObserverTypes](self, "q_computeWriteObserverTypes");
  }

}

uint64_t __70__OSADiagnosticMonitor_q_removeWriteObserver_andComputeObservedTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matches:", *(_QWORD *)(a1 + 32));
}

- (void)q_computeEventObserverTypes
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B075E000, v1, v2, "Client: with %ld event observers, observed event types = %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)q_computeWriteObserverTypes
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B075E000, v1, v2, "Client: with %ld write observers, observed write types = %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)q_registerForEventTypes
{
  void *v3;
  id v4;

  -[OSADiagnosticMonitor q_serverConnection](self, "q_serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerForEvents:replyHandler:", self->_observedEventTypes, &__block_literal_global_39);
}

void __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    DiagnosticMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke_cold_1(v2);

  }
}

- (void)q_registerForWriteTypes
{
  void *v3;
  id v4;

  -[OSADiagnosticMonitor q_serverConnection](self, "q_serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_40);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerForWrites:replyHandler:", self->_observedWriteTypes, &__block_literal_global_40);
}

void __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    DiagnosticMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke_cold_1(v2);

  }
}

- (void)receivedLogEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    DiagnosticMonitorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[OSADiagnosticMonitor receivedLogEvent:].cold.1(v4, v5);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_eventObservers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "deliverEvent:on:", v4, self->_calloutQueue, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)willWriteLog:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    DiagnosticMonitorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[OSADiagnosticMonitor willWriteLog:].cold.1(v4);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_writeObservers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "deliverWillWrite:on:", v4, self->_calloutQueue, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)didWriteLog:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    DiagnosticMonitorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[OSADiagnosticMonitor didWriteLog:].cold.1(v4, v5);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_writeObservers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "deliverDidWrite:on:", v4, self->_calloutQueue, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)q_serverConnection
{
  NSXPCConnection *serverConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  id buf[2];

  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    DiagnosticMonitorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B075E000, v4, OS_LOG_TYPE_DEFAULT, "Client: creating server connection.", (uint8_t *)buf, 2u);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.osanalytics.diagnosticmonitor"), 4096);
    v6 = self->_serverConnection;
    self->_serverConnection = v5;

    v7 = self->_serverConnection;
    OSADiagnosticMonitorServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    v9 = self->_serverConnection;
    OSADiagnosticMonitorClientInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:](self->_serverConnection, "_setQueue:", self->_queue);
    objc_initWeak(buf, self);
    v11 = self->_serverConnection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__OSADiagnosticMonitor_q_serverConnection__block_invoke;
    v13[3] = &unk_1E6161108;
    objc_copyWeak(&v14, buf);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v13);
    -[NSXPCConnection resume](self->_serverConnection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
    serverConnection = self->_serverConnection;
  }
  return serverConnection;
}

void __42__OSADiagnosticMonitor_q_serverConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  uint8_t v6[16];

  DiagnosticMonitorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B075E000, v2, OS_LOG_TYPE_DEFAULT, "Client: reconnecting to server after connection interruption.", v6, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "q_registerForEventTypes");

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "q_registerForWriteTypes");

}

- (void)q_teardownServerConnectionIfNoMoreObservers
{
  NSObject *v3;
  NSXPCConnection *serverConnection;
  uint8_t v5[16];

  if (!-[NSMutableArray count](self->_eventObservers, "count")
    && !-[NSMutableArray count](self->_writeObservers, "count"))
  {
    DiagnosticMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B075E000, v3, OS_LOG_TYPE_DEFAULT, "Client: tearing down server connection after removing last observer.", v5, 2u);
    }

    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
    serverConnection = self->_serverConnection;
    self->_serverConnection = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_observedWriteTypes, 0);
  objc_storeStrong((id *)&self->_observedEventTypes, 0);
  objc_storeStrong((id *)&self->_writeObservers, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__OSADiagnosticMonitor_q_registerForEventTypes__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1B075E000, v2, v3, "Error registering event types with the diagnostic monitor server: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __47__OSADiagnosticMonitor_q_registerForWriteTypes__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1B075E000, v2, v3, "Error registering write types with the diagnostic monitor server: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)receivedLogEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incidentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bugType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1B075E000, a2, OS_LOG_TYPE_DEBUG, "Received log event %{public}@ of type %{public}@", (uint8_t *)&v8, 0x16u);

}

- (void)willWriteLog:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "incidentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bugType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1B075E000, v3, v4, "Will write log %{public}@ of type %{public}@", v5, v6, v7, v8, 2u);

}

- (void)didWriteLog:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incidentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bugType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("succeeded");
  v10 = 138543874;
  v11 = v5;
  v12 = 2114;
  if (!v8)
    v9 = CFSTR("failed");
  v13 = v7;
  v14 = 2114;
  v15 = v9;
  _os_log_debug_impl(&dword_1B075E000, a2, OS_LOG_TYPE_DEBUG, "Did write log %{public}@ of type %{public}@ (result: %{public}@)", (uint8_t *)&v10, 0x20u);

}

@end
