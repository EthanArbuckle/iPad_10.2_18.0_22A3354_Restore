@implementation WPClient

- (int64_t)state
{
  return self->_state;
}

- (id)connection
{
  WPClient *v2;
  void *v3;
  void *v4;
  WPClient *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  WPClient *v14;

  v2 = self;
  objc_sync_enter(v2);
  -[WPClient xpcConnection](v2, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.wirelessproxd"), 4096);
    -[WPClient allowlistConnectionMethods:](v2, "allowlistConnectionMethods:", v4);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__0;
    v13[4] = __Block_byref_object_dispose__0;
    v14 = 0;
    v5 = v2;
    v14 = v5;
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __22__WPClient_connection__block_invoke;
    v12[3] = &unk_24C2883A0;
    v12[4] = v5;
    v12[5] = v13;
    objc_msgSend(v4, "setInterruptionHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __22__WPClient_connection__block_invoke_119;
    v11[3] = &unk_24C2883A0;
    v11[4] = v5;
    v11[5] = v13;
    objc_msgSend(v4, "setInvalidationHandler:", v11);
    -[WPClient clientQueue](v5, "clientQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WPClient clientQueue](v5, "clientQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setQueue:", v8);

    }
    -[WPClient setXpcConnection:](v5, "setXpcConnection:", v4);
    -[WPClient xpcConnection](v5, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

    _Block_object_dispose(v13, 8);
  }
  if (-[WPClient needsToRegister](v2, "needsToRegister") && !-[WPClient registering](v2, "registering"))
    -[WPClient establishConnection](v2, "establishConnection");
  objc_sync_exit(v2);

  -[WPClient xpcConnection](v2, "xpcConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

void __25__WPClient_stopScanning___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __25__WPClient_stopScanning___block_invoke_2;
    v9 = &unk_24C288520;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopScanning:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9, v10);

  }
}

- (void)stopScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to stop scanning for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__WPClient_stopScanning___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)startScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to start scanning for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__WPClient_startScanning___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)daemonDeliveryQueue
{
  return self->_daemonDeliveryQueue;
}

void __26__WPClient_startScanning___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __26__WPClient_startScanning___block_invoke_2;
    v9 = &unk_24C288520;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startScanning:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9, v10);

  }
}

- (BOOL)needsToRegister
{
  return self->_needsToRegister;
}

+ (BOOL)isHomePod
{
  return _MergedGlobals;
}

+ (BOOL)isAppleTV
{
  return byte_253D1E5E9;
}

+ (BOOL)isHomePodOrIOS
{
  return 1;
}

+ (BOOL)supportsRanging
{
  if (supportsRanging_onceToken != -1)
    dispatch_once(&supportsRanging_onceToken, &__block_literal_global_14);
  return supportsRanging_supportsRanging;
}

uint64_t __27__WPClient_supportsRanging__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportsRanging_supportsRanging = result;
  return result;
}

+ (void)initialize
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109376;
  v1[1] = _MergedGlobals;
  v2 = 1024;
  v3 = byte_253D1E5E9;
  _os_log_debug_impl(&dword_209E41000, log, OS_LOG_TYPE_DEBUG, "WPClient _isHomePod: %d _isAppleTV: %d", (uint8_t *)v1, 0xEu);
  OUTLINED_FUNCTION_1();
}

+ (int64_t)holdVouchers
{
  return 0;
}

- (WPClient)initWithQueue:(id)a3 machName:(id)a4
{
  id v7;
  id v8;
  WPClient *v9;
  WPClient *v10;
  NSObject **p_clientQueue;
  void *v12;
  NSObject *v13;
  dispatch_qos_class_t qos_class;
  NSObject *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *daemonDeliveryQueue;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  dispatch_semaphore_t v35;
  OS_dispatch_semaphore *daemonRegisteredSemaphore;
  OS_dispatch_queue *v37;
  WPClient *v38;
  NSObject *v39;
  dispatch_qos_class_t v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  const char *v48;
  id v50;
  objc_super v51;
  int relative_priority_ptr;
  uint8_t buf[4];
  WPClient *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  dispatch_qos_class_t v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v51.receiver = self;
  v51.super_class = (Class)WPClient;
  v9 = -[WPClient init](&v51, sel_init);
  v10 = v9;
  if (v9)
  {
    p_clientQueue = (NSObject **)&v9->_clientQueue;
    v9->_state = 0;
    v9->_advertiserState = 0;
    v9->_scannerState = 0;
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.wiproxd.daemonMessageQueue.%lu"), -[WPClient hash](v10, "hash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "holdVouchers") && (v13 = *p_clientQueue) != 0)
    {
      relative_priority_ptr = 0;
      qos_class = dispatch_queue_get_qos_class(v13, &relative_priority_ptr);
      dispatch_queue_attr_make_with_qos_class(0, qos_class, relative_priority_ptr);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_retainAutorelease(v12);
      v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), v15);
      daemonDeliveryQueue = v10->_daemonDeliveryQueue;
      v10->_daemonDeliveryQueue = (OS_dispatch_queue *)v17;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_102);
      v19 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        -[WPClient clientAsString](v10, "clientAsString");
        v21 = v8;
        v22 = a4;
        v23 = v12;
        v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = qos2string(qos_class);
        *(_DWORD *)buf = 134219010;
        v54 = v10;
        v55 = 2112;
        v56 = v25;
        v57 = 2112;
        v58 = v16;
        v59 = 2080;
        v60 = v26;
        v61 = 1024;
        v62 = qos_class;
        _os_log_impl(&dword_209E41000, v20, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) created queue %@ with client QOS class %s (%d)", buf, 0x30u);

        v7 = v24;
        v12 = v23;
        a4 = v22;
        v8 = v21;

      }
    }
    else
    {
      v27 = objc_retainAutorelease(v12);
      v28 = (const char *)objc_msgSend(v27, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = dispatch_queue_create(v28, v29);
      v31 = v10->_daemonDeliveryQueue;
      v10->_daemonDeliveryQueue = (OS_dispatch_queue *)v30;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_104_1);
      v32 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        -[WPClient clientAsString](v10, "clientAsString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v54 = v10;
        v55 = 2112;
        v56 = v34;
        v57 = 2112;
        v58 = v27;
        _os_log_impl(&dword_209E41000, v33, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) created queue %@ (default)", buf, 0x20u);

      }
    }
    v35 = dispatch_semaphore_create(0);
    daemonRegisteredSemaphore = v10->_daemonRegisteredSemaphore;
    v10->_daemonRegisteredSemaphore = (OS_dispatch_semaphore *)v35;

    v37 = v10->_daemonDeliveryQueue;
    v38 = v10;
    v39 = v37;
    relative_priority_ptr = 0;
    v40 = dispatch_queue_get_qos_class(v39, &relative_priority_ptr);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_652);
    v41 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      -[WPClient clientAsString](v38, "clientAsString");
      v50 = v8;
      v43 = a4;
      v44 = v12;
      v45 = v7;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject description](v39, "description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = qos2string(v40);
      *(_DWORD *)buf = 134219266;
      v54 = v38;
      v55 = 2112;
      v56 = v46;
      v57 = 2112;
      v58 = v47;
      v59 = 2080;
      v60 = v48;
      v61 = 1024;
      v62 = v40;
      v63 = 1024;
      v64 = relative_priority_ptr;
      _os_log_impl(&dword_209E41000, v42, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) queue %@ with QOS class %s (%d) rel priority %d", buf, 0x36u);

      v7 = v45;
      v12 = v44;
      a4 = v43;
      v8 = v50;

    }
    *(_DWORD *)&v38->_isTestClient = 0x10000;
    v38->_registering = 0;
    if (v8)
    {
      objc_storeStrong((id *)&v38->_machName, a4);
      -[WPClient setupMachXPCService](v38, "setupMachXPCService");
    }
    -[WPClient establishConnection](v38, "establishConnection");
    v38->_servicesAdded = 0;
    v38->_connectionUseCase = 0;
    v38->_maxAllowedConnectionDelayMs = 0;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  WPClient *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_105_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WPClient clientAsString](self, "clientAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "WPClient deallocing (%p - %{public}@)", buf, 0x16u);

  }
  -[WPClient destroyConnection](self, "destroyConnection");
  -[WPClient daemonRegisteredSemaphore](self, "daemonRegisteredSemaphore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[WPClient setDaemonRegisteredSemaphore:](self, "setDaemonRegisteredSemaphore:", 0);
  -[WPClient xpcListener](self, "xpcListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WPClient xpcListener](self, "xpcListener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

    -[WPClient xpcListener](self, "xpcListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[WPClient setXpcListener:](self, "setXpcListener:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)WPClient;
  -[WPClient dealloc](&v10, sel_dealloc);
}

- (void)setupMachXPCService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  WPClient *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WPClient machName](self, "machName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v3);
  -[WPClient setXpcListener:](self, "setXpcListener:", v4);

  -[WPClient xpcListener](self, "xpcListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[WPClient xpcListener](self, "xpcListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_109_1);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    -[WPClient clientAsString](self, "clientAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v3;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_INFO, "WPClient started listening for mach service %@ for client (%p - %@)", (uint8_t *)&v10, 0x20u);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_110);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)MEMORY[0x24BDD1760];
    v9 = v7;
    objc_msgSend(v8, "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_209E41000, v9, OS_LOG_TYPE_INFO, "WPClient Process %@ was woken up from mach port tickle", (uint8_t *)&v13, 0xCu);

  }
  return 0;
}

- (void)establishConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WPClient_establishConnection__block_invoke;
  block[3] = &unk_24C288358;
  block[4] = self;
  dispatch_async(v3, block);

}

void __31__WPClient_establishConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setRegistering:", 1);
  objc_msgSend(*(id *)(a1 + 32), "clientAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_112);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v16 = 134218498;
    v17 = v6;
    v18 = 2112;
    v19 = v2;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %@) establishing new XPC Connection for process %@", (uint8_t *)&v16, 0x20u);
  }
  v7 = objc_msgSend((id)objc_opt_class(), "holdVouchers");
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "machName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerWithDaemon:forProcess:machName:holdVouchers:", v2, v4, v10, v7);

  objc_msgSend(*(id *)(a1 + 32), "daemonRegisteredSemaphore");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 5000000000);
  v13 = dispatch_semaphore_wait(v11, v12);

  if (v13)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_114);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 134218498;
      v17 = v15;
      v18 = 2112;
      v19 = v2;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_209E41000, v14, OS_LOG_TYPE_ERROR, "WPClient (%p - %@) registering with daemon timed out for client %@", (uint8_t *)&v16, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setRegistering:", 0);
  }

}

uint64_t __22__WPClient_connection__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_118);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(v1 + 32);
      v4 = v2;
      objc_msgSend(v3, "clientAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218242;
      v7 = v3;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %{public}@) XPC Connection interrupted", (uint8_t *)&v6, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "stateDidChange:", 1);
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "establishConnection");
  }
  return result;
}

void __22__WPClient_connection__block_invoke_119(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_121_0);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "clientAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v9 = v3;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "WPClient (%p - %{public}@) XPC Connection invalidated", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stateDidChange:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "daemonDeliveryQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __22__WPClient_connection__block_invoke_122;
    block[3] = &unk_24C2883E8;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

uint64_t __22__WPClient_connection__block_invoke_122(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNeedsToRegister:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setXpcConnection:", 0);
}

- (void)allowlistConnectionMethods:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[5];
  _QWORD v32[7];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1990];
  v27 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_2545B5D90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  v35[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_deviceDiscovered_, 0, 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_failedToRegisterZones_withError_, 0, 0);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_discoveredCharacteristicsAndServices_forPeripheral_, 0, 0);
  v11 = (void *)MEMORY[0x24BDBCF20];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  v32[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_fetchedCurrentlyTrackedZones_, 0, 0);
  v13 = (void *)MEMORY[0x24BDBCF20];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  v31[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_anyDiscoveredDevice_, 0, 0);
  v16 = (void *)MEMORY[0x24BDBCF20];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  v30[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_devicesDiscovered_, 0, 0);
  v19 = (void *)MEMORY[0x24BDBCF20];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  v29[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_receivedTestResponse_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B6238);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setExportedInterface:", v4);
  objc_msgSend(v27, "setExportedObject:", self);
  objc_msgSend(v27, "setRemoteObjectInterface:", v22);

}

- (void)destroyConnection
{
  id v2;

  -[WPClient xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)registeredWithDaemonAndContinuingSession:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  WPClient *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
    -[WPClient setServicesAdded:](self, "setServicesAdded:", 1);
  -[WPClient setNeedsToRegister:](self, "setNeedsToRegister:", 0);
  -[WPClient setRegistering:](self, "setRegistering:", 0);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_322);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    -[WPClient clientAsString](self, "clientAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_INFO, "WPClient (%p - %@) registered with daemon, continuing any messages", (uint8_t *)&v8, 0x16u);

  }
  -[WPClient daemonRegisteredSemaphore](self, "daemonRegisteredSemaphore");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v7);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WPClient stateAsString:](WPClient, "stateAsString:", -[WPClient state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p state = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)clientAsString
{
  return CFSTR("WPClient-Superclass");
}

+ (id)stateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_24C289140[a3 - 1];
}

- (void)populateClientGATT:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)addServices
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __23__WPClient_addServices__block_invoke;
  v2[3] = &unk_24C2884D8;
  v2[4] = self;
  -[WPClient populateClientGATT:](self, "populateClientGATT:", v2);
}

void __23__WPClient_addServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_335);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "clientAsString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Adding services for %{public}@", buf, 0xCu);

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "daemonDeliveryQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__WPClient_addServices__block_invoke_336;
    block[3] = &unk_24C2884B0;
    objc_copyWeak(&v16, (id *)buf);
    v14 = v5;
    v15 = v7;
    dispatch_async(v12, block);

    objc_msgSend(*(id *)(a1 + 32), "setServicesAdded:", 1);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __23__WPClient_addServices__block_invoke_336(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_339);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharacteristic:forService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __23__WPClient_addServices__block_invoke_2_337(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_340);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __23__WPClient_addServices__block_invoke_2_337_cold_1(v3);

}

- (void)dispatchAdvertisement:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WPClient_dispatchAdvertisement___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__WPClient_dispatchAdvertisement___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __34__WPClient_dispatchAdvertisement___block_invoke_2;
    v9 = &unk_24C288520;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAdvertising:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9, v10);

  }
}

void __34__WPClient_dispatchAdvertisement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("WPClient can't reach bluetoothd to start advertising. ERROR: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_344);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  v6 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "advertisingFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

- (void)startAdvertising:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to start advertising for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  objc_msgSend(v4, "advertisingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[WPClient clientAsString](self, "clientAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("WPClient %@ advertising data is nil"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_353);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
    v11 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = v10;
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = (void **)v23;
    v14 = &v22;
    goto LABEL_38;
  }
  v6 = objc_msgSend(v4, "advertisingRate") == 32
    || objc_msgSend(v4, "advertisingRate") == 48
    || objc_msgSend(v4, "advertisingRate") == 192
    || objc_msgSend(v4, "advertisingRate") == 96
    || objc_msgSend(v4, "advertisingRate") == 290
    || objc_msgSend(v4, "advertisingRate") == 432
    || objc_msgSend(v4, "advertisingRate") == 996
    || objc_msgSend(v4, "advertisingRate") == 1636
    || objc_msgSend(v4, "advertisingRate") == 3200
    || objc_msgSend(v4, "advertisingRate") == 0x4000;
  v7 = objc_msgSend(v4, "clientType");
  if (v7 > 0x1A)
    goto LABEL_29;
  if (((1 << v7) & 0x56C0000) == 0)
  {
    if (v7 == 2)
    {
      if (+[WPClient isHomePodOrIOS](WPClient, "isHomePodOrIOS"))
        v15 = objc_msgSend(v4, "advertisingRate") == 160;
      else
        v15 = 0;
      if (v15 || v6)
        goto LABEL_17;
LABEL_33:
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[WPClient clientAsString](self, "clientAsString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("WPClient %@ advertising rate 0x%lx is not valid"), v17, objc_msgSend(v4, "advertisingRate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_357);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
      v11 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FC8];
      v21 = v10;
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v21;
      v14 = &v20;
LABEL_38:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 13, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPClient advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v19, objc_msgSend(v4, "clientType"));
      goto LABEL_39;
    }
    if (v7 == 8)
    {
      if (((v6 | +[WPClient isHomePodOrIOS](WPClient, "isHomePodOrIOS")) & 1) != 0)
        goto LABEL_17;
      goto LABEL_33;
    }
LABEL_29:
    if (v6)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_17:
  -[WPClient dispatchAdvertisement:](self, "dispatchAdvertisement:", v4);
LABEL_39:

}

- (void)stopAdvertising:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to stop advertising for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__WPClient_stopAdvertising___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__WPClient_stopAdvertising___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_360);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAdvertising:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __28__WPClient_stopAdvertising___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_361);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __28__WPClient_stopAdvertising___block_invoke_2_cold_1(v3);

}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_362);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPClient updateAdvertisingRequest:withUpdate:].cold.2(v7);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_364);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPClient updateAdvertisingRequest:withUpdate:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)registerForAnyScanResults:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WPClient_registerForAnyScanResults___block_invoke;
  block[3] = &unk_24C288670;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__WPClient_registerForAnyScanResults___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_365);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForAnyScanResults:", *(unsigned __int8 *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __38__WPClient_registerForAnyScanResults___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("WPClint can't reach bluetoothd to register for any scan results. ERROR: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_368);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();

}

void __26__WPClient_startScanning___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("WPClient can't reach bluetoothd to start scanning. ERROR: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_373);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  v6 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scanningFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

void __25__WPClient_stopScanning___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("WPClient can't reach bluetoothd to stop scanning. ERROR: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_378);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();
  v6 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scanningFailedToStart:ofType:", v8, objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to clear duplicate filter cache for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WPClient_clearDuplicateFilterCache___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__WPClient_clearDuplicateFilterCache___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_381);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearDuplicateFilterCache:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __38__WPClient_clearDuplicateFilterCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("WPClient can't reach bluetoothd to removeDupFilterPerType. ERROR: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_384);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();

}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_385);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPClient updateScanningRequest:withUpdate:].cold.2(v7);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_387);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPClient updateScanningRequest:withUpdate:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)startScanning:(id)a3 andAdvertising:(id)a4
{
  id v6;

  v6 = a3;
  -[WPClient startAdvertising:](self, "startAdvertising:", a4);
  -[WPClient startScanning:](self, "startScanning:", v6);

}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  id location;

  v8 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke;
  v11[3] = &unk_24C288798;
  objc_copyWeak(&v13, &location);
  v12 = v8;
  v14 = a4;
  v15 = a5;
  v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_388);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerEndpoint:requireAck:requireEncryption:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

    WeakRetained = v5;
  }

}

void __58__WPClient_registerEndpoint_requireAck_requireEncryption___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("WPClient can't reach bluetoothd to register endpoint. ERROR: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_391);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();

}

- (void)unregisterEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WPClient_unregisterEndpoint___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __31__WPClient_unregisterEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_392);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterEndpoint:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __31__WPClient_unregisterEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("WPClint can't reach bluetoothd to unregister endpoint. ERROR: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_395);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1();

}

- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__WPClient_sendDatatoLePipe_forPeer___block_invoke;
  v11[3] = &unk_24C2884B0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendDatatoLePipe:forPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_396);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(a1, v4);

}

- (void)startTrackingPeerWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = CFSTR("Peer tracking is unsupported as the platform is not OS X");
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPClient failedToStartTrackingPeer:error:](self, "failedToStartTrackingPeer:error:", v6, v8);
}

- (void)stopTrackingPeerWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "peerUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "clientType");

  -[WPClient stoppedTrackingPeer:ofType:](self, "stoppedTrackingPeer:ofType:", v6, v5);
}

- (void)peerTrackingFull
{
  -[WPClient setPeerTrackingSlotsAvailable:](self, "setPeerTrackingSlotsAvailable:", 0);
}

- (void)peerTrackingAvailable
{
  -[WPClient setPeerTrackingSlotsAvailable:](self, "setPeerTrackingSlotsAvailable:", 1);
}

- (void)connectToPeer:(id)a3
{
  -[WPClient connectToPeer:withOptions:](self, "connectToPeer:withOptions:", a3, 0);
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id location;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  v9 = *MEMORY[0x24BDBB128];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBB128]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_399);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPClient connectToPeer:withOptions:].cold.1();
  if (v12 && (-[WPClient isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    location = 0;
    objc_initWeak(&location, self);
    -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_401;
    block[3] = &unk_24C288548;
    objc_copyWeak(&v34, &location);
    v33 = v6;
    v27 = v6;
    dispatch_async(v26, block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_9:
    v13 = (void *)MEMORY[0x20BD1B9E4]();
    v36[0] = *MEMORY[0x24BDBB120];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WPClient connectionUseCase](self, "connectionUseCase"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v14;
    v36[1] = *MEMORY[0x24BDBB138];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WPClient maxAllowedConnectionDelayMs](self, "maxAllowedConnectionDelayMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WPNearbyKeyUseCaseList"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        v19 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v18, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayWithArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("kCBOptionUseCaseList"));

      }
      objc_msgSend(v17, "addEntriesFromDictionary:", v8);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v17);
      v22 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v22;
    }
    objc_autoreleasePoolPop(v13);
    location = 0;
    objc_initWeak(&location, self);
    -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_408;
    v28[3] = &unk_24C2884B0;
    objc_copyWeak(&v31, &location);
    v29 = v6;
    v30 = v16;
    v24 = v6;
    v25 = v16;
    dispatch_async(v23, v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

}

void __38__WPClient_connectToPeer_withOptions___block_invoke_401(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_404);
    v3 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __38__WPClient_connectToPeer_withOptions___block_invoke_401_cold_1(v3, v4, v5);
    v6 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = CFSTR("Connection option not allowed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 29, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "connectedDevice:withError:shouldDiscover:", *(_QWORD *)(a1 + 32), v8, 0);
  }

}

void __38__WPClient_connectToPeer_withOptions___block_invoke_408(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__WPClient_connectToPeer_withOptions___block_invoke_2_409;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectToPeer:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_2_409(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_410);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __38__WPClient_connectToPeer_withOptions___block_invoke_2_409_cold_1(a1, v4);

}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WPClient_disconnectFromPeer___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __31__WPClient_disconnectFromPeer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __31__WPClient_disconnectFromPeer___block_invoke_2;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disconnectFromPeer:", *(_QWORD *)(a1 + 32));

  }
}

void __31__WPClient_disconnectFromPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_411);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __31__WPClient_disconnectFromPeer___block_invoke_2_cold_1(a1, v4);

}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke;
  v11[3] = &unk_24C2884B0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discoverCharacteristicsAndServices:forPeripheral:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_412);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2_cold_1(a1, v4);

}

- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke;
  v17[3] = &unk_24C288908;
  objc_copyWeak(&v21, &location);
  v22 = a3;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shouldSubscribe:toPeer:withCharacteristic:inService:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_413);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2_cold_1(a1, v4);

}

- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _BYTE buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_414);
  v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_INFO, "Sending data to %@", buf, 0xCu);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_415;
  v16[3] = &unk_24C288970;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v10;
  v18 = v8;
  v19 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_415(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_2;
    v6[3] = &unk_24C288820;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendDataToCharacteristic:inService:forPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

void __55__WPClient_sendDataToCharacteristic_inService_forPeer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_416);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(a1, v4);

}

- (void)startTrackingZone:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "clientType") || objc_msgSend(v4, "clientType") >= 0x1B)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unknown client type"), CFSTR("Trying to start tracking a zone for an unknown client type %ld"), objc_msgSend(v4, "clientType"));
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WPClient_startTrackingZone___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__WPClient_startTrackingZone___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_419);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __30__WPClient_startTrackingZone___block_invoke_cold_1(v3);
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_421);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTrackingZone:", *(_QWORD *)(a1 + 32));

  }
}

void __30__WPClient_startTrackingZone___block_invoke_420(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_423);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __30__WPClient_startTrackingZone___block_invoke_420_cold_1(v3);

}

- (void)stopTrackingZones:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WPClient_stopTrackingZones___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__WPClient_stopTrackingZones___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_424);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __30__WPClient_stopTrackingZones___block_invoke_cold_1(a1, v3);
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_426);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopTrackingZones:", *(_QWORD *)(a1 + 32));

  }
}

void __30__WPClient_stopTrackingZones___block_invoke_425(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_428);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __30__WPClient_stopTrackingZones___block_invoke_425_cold_1(v3);

}

- (void)stopTrackingAllZones
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__WPClient_stopTrackingAllZones__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPClient_stopTrackingAllZones__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_429);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __32__WPClient_stopTrackingAllZones__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_431);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopTrackingAllZones");

  }
}

void __32__WPClient_stopTrackingAllZones__block_invoke_430(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_433);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __32__WPClient_stopTrackingAllZones__block_invoke_430_cold_1(v3);

}

- (void)getAllTrackedZones
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__WPClient_getAllTrackedZones__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__WPClient_getAllTrackedZones__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_434);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __30__WPClient_getAllTrackedZones__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_436);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAllTrackedZones");

  }
}

void __30__WPClient_getAllTrackedZones__block_invoke_435(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_438);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __30__WPClient_getAllTrackedZones__block_invoke_435_cold_1(v3);

}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__WPClient_enableRanging_reply___block_invoke;
  v9[3] = &unk_24C288B80;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __32__WPClient_enableRanging_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_439);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableRanging:reply:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __32__WPClient_enableRanging_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_440);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __32__WPClient_enableRanging_reply___block_invoke_2_cold_1(v3);

}

- (void)isRangingEnabledReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WPClient_isRangingEnabledReply___block_invoke;
  block[3] = &unk_24C288BE8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__WPClient_isRangingEnabledReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_441);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isRangingEnabledReply:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __34__WPClient_isRangingEnabledReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_442);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __34__WPClient_isRangingEnabledReply___block_invoke_2_cold_1(v3);

}

- (void)listenToBandwidthNotifications
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__WPClient_listenToBandwidthNotifications__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_443);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __42__WPClient_listenToBandwidthNotifications__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_445);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listenToBandwidthNotifications");

  }
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_444(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_447);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __42__WPClient_listenToBandwidthNotifications__block_invoke_444_cold_1(v3);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  int v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_448);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v15 = 134218240;
    v16 = a3;
    v17 = 2048;
    v18 = -[WPClient state](self, "state");
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "State changed to %ld from %ld", (uint8_t *)&v15, 0x16u);

  }
  if (-[WPClient state](self, "state") != a3)
  {
    -[WPClient setState:](self, "setState:", a3);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_450);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = -[WPClient advertiserState](self, "advertiserState");
      v15 = 134218240;
      v16 = a3;
      v17 = 2048;
      v18 = v9;
      _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "Advertiser state changed to %ld from %ld", (uint8_t *)&v15, 0x16u);

    }
    if (-[WPClient advertiserState](self, "advertiserState") != a3)
    {
      -[WPClient setAdvertiserState:](self, "setAdvertiserState:", a3);
      if (-[WPClient advertiserState](self, "advertiserState") == 1)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_452);
        v10 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "State is resetting, need to re-add services when asked to re-advertise", (uint8_t *)&v15, 2u);
        }
        -[WPClient setServicesAdded:](self, "setServicesAdded:", 0);
      }
      if (-[WPClient advertiserState](self, "advertiserState") == 3)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_454);
        v11 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "State is on, adding services if necessary", (uint8_t *)&v15, 2u);
        }
        if (!-[WPClient servicesAdded](self, "servicesAdded"))
          -[WPClient addServices](self, "addServices");
      }
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_456);
    v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = -[WPClient scannerState](self, "scannerState");
      v15 = 134218240;
      v16 = a3;
      v17 = 2048;
      v18 = v14;
      _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "Scanner state changed to %ld from %ld", (uint8_t *)&v15, 0x16u);

    }
    -[WPClient setScannerState:](self, "setScannerState:", a3);
  }
}

- (void)receivedTestResponse:(id)a3
{
  id v3;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_457);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPClient receivedTestResponse:].cold.1();

}

- (void)checkAllowDuplicates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__WPClient_checkAllowDuplicates___block_invoke;
  block[3] = &unk_24C288BE8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__WPClient_checkAllowDuplicates___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_458);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __33__WPClient_checkAllowDuplicates___block_invoke_cold_1(v3);
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_460);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __33__WPClient_checkAllowDuplicates___block_invoke_463;
    v6[3] = &unk_24C288D90;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "checkAllowDuplicates:", v6);

  }
}

void __33__WPClient_checkAllowDuplicates___block_invoke_459(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_462);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __33__WPClient_checkAllowDuplicates___block_invoke_459_cold_1(v3);

}

uint64_t __33__WPClient_checkAllowDuplicates___block_invoke_463(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableTestMode
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[WPClient setIsTestClient:](self, "setIsTestClient:", 1);
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__WPClient_enableTestMode__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __26__WPClient_enableTestMode__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_465);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __26__WPClient_enableTestMode__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_467);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableTestMode");

  }
}

void __26__WPClient_enableTestMode__block_invoke_466(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_469);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __26__WPClient_enableTestMode__block_invoke_466_cold_1(v3);

}

- (void)enableBubbleTestMode
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[WPClient setIsTestClient:](self, "setIsTestClient:", 1);
  -[WPClient setIsBubbleTestClient:](self, "setIsBubbleTestClient:", 1);
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__WPClient_enableBubbleTestMode__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPClient_enableBubbleTestMode__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_470);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __32__WPClient_enableBubbleTestMode__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_472);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableTestMode");

  }
}

void __32__WPClient_enableBubbleTestMode__block_invoke_471(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_474);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __32__WPClient_enableBubbleTestMode__block_invoke_471_cold_1(v3);

}

- (void)overrideScanTimeout:(double)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__WPClient_overrideScanTimeout___block_invoke;
  block[3] = &unk_24C288ED8;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __32__WPClient_overrideScanTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_475);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "Setting scan timeout for class %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(WeakRetained, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_477);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideScanTimeout:", *(double *)(a1 + 40));

  }
}

void __32__WPClient_overrideScanTimeout___block_invoke_476(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_479);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __32__WPClient_overrideScanTimeout___block_invoke_476_cold_1(v3);

}

- (void)overrideAdvTimeout:(double)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WPClient_overrideAdvTimeout___block_invoke;
  block[3] = &unk_24C288ED8;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __31__WPClient_overrideAdvTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_480);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "Setting adv timeout for class %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(WeakRetained, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_482);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideAdvTimeout:", *(double *)(a1 + 40));

  }
}

void __31__WPClient_overrideAdvTimeout___block_invoke_481(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_484);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __31__WPClient_overrideAdvTimeout___block_invoke_481_cold_1(v3);

}

- (void)getPowerLogStats:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__WPClient_getPowerLogStats___block_invoke;
  block[3] = &unk_24C288BE8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __29__WPClient_getPowerLogStats___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_485);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __29__WPClient_getPowerLogStats___block_invoke_cold_1(v3);
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_487);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __29__WPClient_getPowerLogStats___block_invoke_490;
    v6[3] = &unk_24C288FC0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getPowerLogStats:", v6);

  }
}

void __29__WPClient_getPowerLogStats___block_invoke_486(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_489);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __29__WPClient_getPowerLogStats___block_invoke_486_cold_1(v3);

}

uint64_t __29__WPClient_getPowerLogStats___block_invoke_490(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dumpDaemonState
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__WPClient_dumpDaemonState__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__WPClient_dumpDaemonState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_492);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __27__WPClient_dumpDaemonState__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_494);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dumpDaemonState");

  }
}

void __27__WPClient_dumpDaemonState__block_invoke_493(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_496);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __27__WPClient_dumpDaemonState__block_invoke_493_cold_1(v3);

}

- (void)disableScanning
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__WPClient_disableScanning__block_invoke;
  v4[3] = &unk_24C288AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__WPClient_disableScanning__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_497);
    v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __27__WPClient_disableScanning__block_invoke_cold_1(v2);
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_499);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableScanning");

  }
}

void __27__WPClient_disableScanning__block_invoke_498(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_501);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __27__WPClient_disableScanning__block_invoke_498_cold_1(v3);

}

- (void)sendTestRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[WPClient setIsTestClient:](self, "setIsTestClient:", 1);
  location = 0;
  objc_initWeak(&location, self);
  -[WPClient daemonDeliveryQueue](self, "daemonDeliveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__WPClient_sendTestRequest___block_invoke;
  block[3] = &unk_24C288548;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__WPClient_sendTestRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_502);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __28__WPClient_sendTestRequest___block_invoke_cold_1(a1, v3);
    objc_msgSend(WeakRetained, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_504);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendTestRequest:", *(_QWORD *)(a1 + 32));

  }
}

void __28__WPClient_sendTestRequest___block_invoke_503(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_506);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    __28__WPClient_sendTestRequest___block_invoke_503_cold_1(v3);

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)notifyNotApprovedUseCase:(id)a3
{
  id v3;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_507);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_FAULT))
    -[WPClient notifyNotApprovedUseCase:].cold.1();

}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int64_t)a3
{
  self->_advertiserState = a3;
}

- (int64_t)scannerState
{
  return self->_scannerState;
}

- (void)setScannerState:(int64_t)a3
{
  self->_scannerState = a3;
}

- (int64_t)pipeState
{
  return self->_pipeState;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (BOOL)isTestClient
{
  return self->_isTestClient;
}

- (void)setIsTestClient:(BOOL)a3
{
  self->_isTestClient = a3;
}

- (BOOL)isBubbleTestClient
{
  return self->_isBubbleTestClient;
}

- (void)setIsBubbleTestClient:(BOOL)a3
{
  self->_isBubbleTestClient = a3;
}

- (int64_t)connectionUseCase
{
  return self->_connectionUseCase;
}

- (void)setConnectionUseCase:(int64_t)a3
{
  self->_connectionUseCase = a3;
}

- (int64_t)maxAllowedConnectionDelayMs
{
  return self->_maxAllowedConnectionDelayMs;
}

- (void)setMaxAllowedConnectionDelayMs:(int64_t)a3
{
  self->_maxAllowedConnectionDelayMs = a3;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void)setDaemonDeliveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_daemonDeliveryQueue, a3);
}

- (OS_dispatch_semaphore)daemonRegisteredSemaphore
{
  return self->_daemonRegisteredSemaphore;
}

- (void)setDaemonRegisteredSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_daemonRegisteredSemaphore, a3);
}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
  objc_storeStrong((id *)&self->_machName, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)peerTrackingSlotsAvailable
{
  return self->_peerTrackingSlotsAvailable;
}

- (void)setPeerTrackingSlotsAvailable:(BOOL)a3
{
  self->_peerTrackingSlotsAvailable = a3;
}

- (void)setNeedsToRegister:(BOOL)a3
{
  self->_needsToRegister = a3;
}

- (BOOL)registering
{
  return self->_registering;
}

- (void)setRegistering:(BOOL)a3
{
  self->_registering = a3;
}

- (BOOL)servicesAdded
{
  return self->_servicesAdded;
}

- (void)setServicesAdded:(BOOL)a3
{
  self->_servicesAdded = a3;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 104, 1);
}

- (void)setXpcListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_daemonRegisteredSemaphore, 0);
  objc_storeStrong((id *)&self->_daemonDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __23__WPClient_addServices__block_invoke_2_337_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to add services. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __34__WPClient_dispatchAdvertisement___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_209E41000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1();
}

void __28__WPClient_stopAdvertising___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to stop advertising. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)updateAdvertisingRequest:(uint64_t)a3 withUpdate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Client type (none) calling [super updateAdvertisingRequest:withUpdate:]", a5, a6, a7, a8, 0);
}

- (void)updateAdvertisingRequest:(void *)a1 withUpdate:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11_1(a1);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v2, v3, "Client type (%ld) calling [super updateAdvertisingRequest:withUpdate:]", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_7_0();
}

- (void)updateScanningRequest:(uint64_t)a3 withUpdate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Client type (none) calling [super updateScanningRequest:withUpdate:]", a5, a6, a7, a8, 0);
}

- (void)updateScanningRequest:(void *)a1 withUpdate:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11_1(a1);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v2, v3, "Client type (%ld) calling [super updateScanningRequest:withUpdate:]", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_7_0();
}

void __37__WPClient_sendDatatoLePipe_forPeer___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_12_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_14_1(), "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_3(&dword_209E41000, v5, v6, "WPClient can't reach bluetoothd to send data to peer %@. ERROR: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

- (void)connectToPeer:withOptions:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_209E41000, v1, OS_LOG_TYPE_DEBUG, "Client connecting to peer %@ with option CBConnectPeripheralOptionDoNotDisconnectOnEncryptionFailure:%d", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_401_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("Connection option not allowed.");
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a1, a3, "%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __38__WPClient_connectToPeer_withOptions___block_invoke_2_409_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_12_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_14_1(), "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_3(&dword_209E41000, v5, v6, "WPClient can't reach bluetoothd to connect peer with options %@. ERROR: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __31__WPClient_disconnectFromPeer___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_12_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_14_1(), "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_3(&dword_209E41000, v5, v6, "WPClient can't reach bluetoothd to disconnect peer %@. ERROR: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __61__WPClient_discoverCharacteristicsAndServices_forPeripheral___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_12_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_14_1(), "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_3(&dword_209E41000, v5, v6, "WPClient can't reach bluetoothd to discover services and charactertistcs for peer %@. ERROR: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __64__WPClient_shouldSubscribe_toPeer_withCharacteristic_inService___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_12_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_14_1(), "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_3(&dword_209E41000, v5, v6, "WPClient can't reach bluetoothd to subscribe charactertistc for peer %@. ERROR: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __30__WPClient_startTrackingZone___block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Trying to start zone tracking for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __30__WPClient_startTrackingZone___block_invoke_420_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to start tracking zone. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __30__WPClient_stopTrackingZones___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_18_1(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_16(&dword_209E41000, v2, v5, "Trying to stop zone tracking for zones %@ in class %@", v6);

  OUTLINED_FUNCTION_0_1();
}

void __30__WPClient_stopTrackingZones___block_invoke_425_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to stop tracking zone. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_stopTrackingAllZones__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Trying to stop zone tracking for all zones %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_stopTrackingAllZones__block_invoke_430_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to stop tracking all zones. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __30__WPClient_getAllTrackedZones__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Trying to get all zones for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __30__WPClient_getAllTrackedZones__block_invoke_435_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to get all tracked zones. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_enableRanging_reply___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to enable/disable ranging. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __34__WPClient_isRangingEnabledReply___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to get ranging status. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Subscribing to bandwidth state updates for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __42__WPClient_listenToBandwidthNotifications__block_invoke_444_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to listen to bandwidth notifications. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)receivedTestResponse:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_16(&dword_209E41000, v1, (uint64_t)v1, "FIXME: Client %@ received testResponse %@", v2);
  OUTLINED_FUNCTION_1();
}

void __33__WPClient_checkAllowDuplicates___block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Trying to check if duplicates are allowed for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __33__WPClient_checkAllowDuplicates___block_invoke_459_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to check duplicate support. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __26__WPClient_enableTestMode__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Enabling test mode for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __26__WPClient_enableTestMode__block_invoke_466_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to enable test mode. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_enableBubbleTestMode__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Enabling bubble test mode for class %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_enableBubbleTestMode__block_invoke_471_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to enable bubble test mode. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __32__WPClient_overrideScanTimeout___block_invoke_476_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to set scan timeout. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __31__WPClient_overrideAdvTimeout___block_invoke_481_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to set advertising timeout. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __29__WPClient_getPowerLogStats___block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Getting power stats for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __29__WPClient_getPowerLogStats___block_invoke_486_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to get power stats. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __27__WPClient_dumpDaemonState__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Dumping WirelessProximity state requested by %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __27__WPClient_dumpDaemonState__block_invoke_493_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to dump WirelessProximity state. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __27__WPClient_disableScanning__block_invoke_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11_1(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_209E41000, v4, v5, "Disabling scan for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

void __27__WPClient_disableScanning__block_invoke_498_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to disable scanning. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

void __28__WPClient_sendTestRequest___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_18_1(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_16(&dword_209E41000, v2, v5, "Sending testRequest %@ for %@", v6);

  OUTLINED_FUNCTION_0_1();
}

void __28__WPClient_sendTestRequest___block_invoke_503_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "WPClient can't reach bluetoothd to send test request. ERROR: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)notifyNotApprovedUseCase:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_209E41000, v0, OS_LOG_TYPE_FAULT, "Not approved use case: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
