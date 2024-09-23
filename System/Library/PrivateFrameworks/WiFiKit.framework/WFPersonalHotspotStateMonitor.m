@implementation WFPersonalHotspotStateMonitor

- (WFPersonalHotspotStateMonitor)init
{
  WFPersonalHotspotStateMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  NSObject *v5;
  WFPersonalHotspotStateMonitor *v6;
  NSObject *v7;
  os_log_type_t v8;
  _QWORD block[4];
  WFPersonalHotspotStateMonitor *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)WFPersonalHotspotStateMonitor;
  v2 = -[WFPersonalHotspotStateMonitor init](&v12, sel_init);
  v3 = dispatch_queue_create("com.apple.wifikit.personal-hotspot", 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v3;

  v5 = v2->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFPersonalHotspotStateMonitor_init__block_invoke;
  block[3] = &unk_24DC348F8;
  v6 = v2;
  v11 = v6;
  dispatch_async(v5, block);
  WFLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[WFPersonalHotspotStateMonitor init]";
    _os_log_impl(&dword_219FC8000, v7, v8, "%s", buf, 0xCu);
  }

  return v6;
}

void __37__WFPersonalHotspotStateMonitor_init__block_invoke(uint64_t a1)
{
  WFClient *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_spawnManagerCallbackThread");
  v2 = [WFClient alloc];
  objc_msgSend(*(id *)(a1 + 32), "callbackRunLoop");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WFClient initWithCallbackRunLoop:](v2, "initWithCallbackRunLoop:", v6);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFPersonalHotspotStateMonitor callbackThread](self, "callbackThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFPersonalHotspotStateMonitor;
  -[WFPersonalHotspotStateMonitor dealloc](&v4, sel_dealloc);
}

- (int64_t)clientConnections
{
  int64_t result;
  int64_t v3;
  int v4;
  unsigned int v5;

  result = (int64_t)_NETRBClientCreate(MEMORY[0x24BDAC9B8], &__block_literal_global_8, 0);
  v5 = 0;
  if (result)
  {
    v3 = result;
    v4 = 0;
    _NETRBClientGetHostCount(result, &v4, &v5);
    _NETRBClientDestroy(v3);
    return v5;
  }
  return result;
}

uint64_t __50__WFPersonalHotspotStateMonitor_clientConnections__block_invoke()
{
  return 0;
}

- (void)_spawnManagerCallbackThread
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel__runManagerCallbackThread, 0);
  objc_msgSend(v3, "start");
  WFLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFPersonalHotspotStateMonitor _spawnManagerCallbackThread]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: thread %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFPersonalHotspotStateMonitor setCallbackThread:](self, "setCallbackThread:", v3);
  -[WFPersonalHotspotStateMonitor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_class, v3, 0, 1);

}

- (void)_runManagerCallbackThread
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSRunLoop *callbackRunLoop;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  NSRunLoop *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220738720](self, a2);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("WFPersonalHotspotStateMonitor callback thread"));

  self->_callbackRunLoop = (NSRunLoop *)(id)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(MEMORY[0x24BDBCEA8], "port");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleInRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

  objc_autoreleasePoolPop(v3);
  WFLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    callbackRunLoop = self->_callbackRunLoop;
    v11 = 136315394;
    v12 = "-[WFPersonalHotspotStateMonitor _runManagerCallbackThread]";
    v13 = 2112;
    v14 = callbackRunLoop;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: runLoop %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "run");

}

- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *internalQueue;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[WFPersonalHotspotStateMonitor setMISDiscoveryState:immediateDisable:]";
    v16 = 1024;
    v17 = v5;
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: state %d immediateDisable: %d", buf, 0x18u);
  }

  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__WFPersonalHotspotStateMonitor_setMISDiscoveryState_immediateDisable___block_invoke;
  v10[3] = &unk_24DC35E30;
  objc_copyWeak(&v11, (id *)buf);
  v12 = v5;
  v13 = v4;
  dispatch_async(internalQueue, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __71__WFPersonalHotspotStateMonitor_setMISDiscoveryState_immediateDisable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMISDiscoveryState:immediateDisable:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE169B0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadControlsForExtension:kind:reason:", CFSTR("com.apple.WiFiKit.PersonalHotspotControl"), CFSTR("PersonalHotspotControl"), CFSTR("Connectivity module triggered MIS state change"));

  }
}

- (void)asyncMISDiscoveryState:(id)a3
{
  id v4;
  NSObject *internalQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke;
    block[3] = &unk_24DC359B8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(internalQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke_2;
  v4[3] = &unk_24DC35E58;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "asyncMISDiscoveryState:", v4);

}

uint64_t __56__WFPersonalHotspotStateMonitor_asyncMISDiscoveryState___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFPersonalHotspotStateMonitor asyncMISDiscoveryState:]_block_invoke_2";
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: MIS discovery state: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSRunLoop)callbackRunLoop
{
  return self->_callbackRunLoop;
}

- (void)setCallbackRunLoop:(id)a3
{
  self->_callbackRunLoop = (NSRunLoop *)a3;
}

- (NSThread)callbackThread
{
  return self->_callbackThread;
}

- (void)setCallbackThread:(id)a3
{
  objc_storeStrong((id *)&self->_callbackThread, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
