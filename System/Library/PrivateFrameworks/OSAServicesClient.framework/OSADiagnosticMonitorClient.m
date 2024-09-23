@implementation OSADiagnosticMonitorClient

+ (OSADiagnosticMonitorClient)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  return (OSADiagnosticMonitorClient *)(id)sharedClient__sharedInstance;
}

void __42__OSADiagnosticMonitorClient_sharedClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedClient__sharedInstance;
  sharedClient__sharedInstance = v0;

}

- (OSADiagnosticMonitorClient)init
{
  OSADiagnosticMonitorClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableArray *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSADiagnosticMonitorClient;
  v2 = -[OSADiagnosticMonitorClient init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.osanalytics.diagnosticsmonitorclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)addObserver:(id)a3 forTypes:(id)a4
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
  block[2] = __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke;
  block[3] = &unk_1E6161030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "q_shimWrappingObserver:creatingIfAbsent:removingIfPresent:", *(_QWORD *)(a1 + 40), 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[OSADiagnosticMonitor sharedMonitor](OSADiagnosticMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEventObserver:forTypes:", v4, *(_QWORD *)(a1 + 48));

  +[OSADiagnosticMonitor sharedMonitor](OSADiagnosticMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addWriteObserver:forTypes:", v4, *(_QWORD *)(a1 + 48));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__OSADiagnosticMonitorClient_removeObserver___block_invoke;
  block[3] = &unk_1E6160FE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __45__OSADiagnosticMonitorClient_removeObserver___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "q_shimWrappingObserver:creatingIfAbsent:removingIfPresent:", *(_QWORD *)(a1 + 40), 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[OSADiagnosticMonitor sharedMonitor](OSADiagnosticMonitor, "sharedMonitor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeEventObserver:", v3);

    +[OSADiagnosticMonitor sharedMonitor](OSADiagnosticMonitor, "sharedMonitor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeWriteObserver:", v3);

  }
}

- (id)q_shimWrappingObserver:(id)a3 creatingIfAbsent:(BOOL)a4 removingIfPresent:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSMutableArray *observers;
  id v10;
  uint64_t v11;
  ObserverShim *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  observers = self->_observers;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke;
  v15[3] = &unk_1E6161138;
  v10 = v8;
  v16 = v10;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](observers, "indexOfObjectPassingTest:", v15);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      v12 = -[ObserverShim initWithObserver:]([ObserverShim alloc], "initWithObserver:", v10);
      -[NSMutableArray addObject:](self->_observers, "addObject:", v12);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v13 = v11;
    -[NSMutableArray objectAtIndexedSubscript:](self->_observers, "objectAtIndexedSubscript:", v11);
    v12 = (ObserverShim *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMutableArray removeObjectAtIndex:](self->_observers, "removeObjectAtIndex:", v13);
  }

  return v12;
}

uint64_t __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matches:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
