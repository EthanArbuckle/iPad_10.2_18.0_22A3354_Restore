@implementation WPDaemonServer

void __35__WPDaemonServer_isClientTestMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "testClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)testClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)cbState
{
  return self->_cbState;
}

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (WPDStatsManager)statsManager
{
  return self->_statsManager;
}

- (id)getClientForUUID:(id)a3
{
  id v4;
  NSObject *v5;
  const char *label;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  -[WPDaemonServer serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  label = dispatch_queue_get_label(v5);

  v7 = dispatch_queue_get_label(0);
  if (!strcmp(label, v7))
  {
    -[WPDaemonServer clients](self, "clients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v19[5];
    v19[5] = v11;

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_152);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = v7;
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_INFO, "WPDaemonServer:getClientForUUID called on %s", buf, 0xCu);
    }
    -[WPDaemonServer serverQueue](self, "serverQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__WPDaemonServer_getClientForUUID___block_invoke_153;
    block[3] = &unk_24D7C24E8;
    v17 = &v18;
    block[4] = self;
    v16 = v4;
    dispatch_sync(v9, block);

  }
  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (OS_dispatch_queue)serverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)systemLocked
{
  return self->_systemLocked;
}

- (BOOL)scanWithRetainDuplicates
{
  void *v2;
  char v3;

  -[WPDaemonServer scanManager](self, "scanManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "retainDuplicates");

  return v3;
}

- (WPDScanManager)scanManager
{
  return (WPDScanManager *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isClientTestMode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[WPDaemonServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WPDaemonServer_isClientTestMode___block_invoke;
  block[3] = &unk_24D7C24E8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

+ (BOOL)isHomePod
{
  return _MergedGlobals;
}

+ (BOOL)isAppleTV
{
  return byte_253E5F419;
}

+ (BOOL)supportsRanging
{
  if (supportsRanging_onceToken != -1)
    dispatch_once(&supportsRanging_onceToken, &__block_literal_global_4);
  return supportsRanging_supportsRanging;
}

uint64_t __33__WPDaemonServer_supportsRanging__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportsRanging_supportsRanging = result;
  return result;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_100_0);
  return isInternalBuild__isInternalBuild;
}

uint64_t __33__WPDaemonServer_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  isInternalBuild__isInternalBuild = result;
  return result;
}

+ (void)initialize
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = _MergedGlobals;
  v4 = 1024;
  v5 = byte_253E5F419;
  OUTLINED_FUNCTION_8_0(&dword_2175D1000, a1, a3, "WPDaemonServer _isHomePod: %d _isAppleTV: %d", (uint8_t *)v3);
}

- (BOOL)isRangingEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[WPDaemonServer persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WPDaemonServer persistence](self, "persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRangingEnabled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)SetupSignalHandler
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __36__WPDaemonServer_SetupSignalHandler__block_invoke;
  v8 = &unk_24D7C2360;
  objc_copyWeak(&v9, &location);
  v3 = (void *)MEMORY[0x219A0F018](&v5);
  -[WPDaemonServer serverQueue](self, "serverQueue", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_state_add_handler();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __36__WPDaemonServer_SetupSignalHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_105);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_DWORD *)(a2 + 16) == 3)
        v5 = "OS_STATE_API_REQUEST";
      else
        v5 = "OS_STATE_API_FAULT";
      v10 = 136315138;
      v11 = v5;
      _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "WIPROX received %s, triggering statedump.", (uint8_t *)&v10, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "dumpDaemonState");
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_109);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WIPROX completed statedump.", (uint8_t *)&v10, 2u);
    }

  }
  return 0;
}

- (WPDaemonServer)init
{
  WPDaemonServer *v2;
  WPDaemonServer *v3;
  uint64_t v4;
  NSMutableDictionary *clients;
  uint64_t v6;
  NSMutableSet *testClients;
  uint64_t v8;
  NSMutableSet *privilegedClients;
  uint64_t v10;
  NSMapTable *clientsWithMach;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  dispatch_queue_t v15;
  OS_dispatch_queue *serverQueue;
  uint32_t v17;
  NSObject *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WPDaemonServer;
  v2 = -[WPDaemonServer init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cbState = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    clients = v3->_clients;
    v3->_clients = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    testClients = v3->_testClients;
    v3->_testClients = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    privilegedClients = v3->_privilegedClients;
    v3->_privilegedClients = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    clientsWithMach = v3->_clientsWithMach;
    v3->_clientsWithMach = (NSMapTable *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.wiproxd.clientQueue", v12);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.wiproxd.serverQueue", v12);
    serverQueue = v3->_serverQueue;
    v3->_serverQueue = (OS_dispatch_queue *)v15;

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_116);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDaemonServer init].cold.3();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_120);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDaemonServer init].cold.2();
    *(_WORD *)&v3->_screenOff = 0;
    v3->_isMirroring = 0;
    *(_QWORD *)&v3->_lockStatusChangedToken = -1;
    v3->_firstUnlockStatusChangedToken = -1;
    -[WPDaemonServer registerForSpringboardNotifications](v3, "registerForSpringboardNotifications");
    v3->_isTesting = 0;
    if (init_onceDToken != -1)
      dispatch_once(&init_onceDToken, &__block_literal_global_124);
    -[WPDaemonServer SetupSignalHandler](v3, "SetupSignalHandler");
    v17 = notify_post("com.apple.wirelessproximity.launch");
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_130);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDaemonServer init].cold.1(v17, v18);

  }
  return v3;
}

void __22__WPDaemonServer_init__block_invoke_123()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  WPLoggingInit();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_125);
  v0 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v0, OS_LOG_TYPE_DEFAULT, "STARTED WIPROX DAEMON", buf, 2u);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_127);
  v1 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2175D1000, v1, OS_LOG_TYPE_DEFAULT, "WPDaemon iOS 18.0 (22A3352) (WirelessProximity-180.62.1.8) (Release) built on 2024-09-03 19:39:23", v2, 2u);
  }
}

- (void)initManagers
{
  WPDState *v3;
  void *v4;
  WPDState *v5;
  void *v6;
  WPDScanManager *v7;
  WPDAdvertisingManager *v8;
  WPDZoneManager *v9;
  WPDPipeManager *v10;
  WPDStatsManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  WPDObjectDiscoveryManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  _QWORD v28[5];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v3 = [WPDState alloc];
  -[WPDaemonServer serverQueue](self, "serverQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WPDState initWithQueue:](v3, "initWithQueue:", v4);
  -[WPDaemonServer setWpdState:](self, "setWpdState:", v5);

  -[WPDaemonServer wpdState](self, "wpdState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDaemonServer setCbState:](self, "setCbState:", objc_msgSend(v6, "state"));

  v7 = -[WPDScanManager initWithServer:]([WPDScanManager alloc], "initWithServer:", self);
  -[WPDaemonServer setScanManager:](self, "setScanManager:", v7);

  v8 = -[WPDAdvertisingManager initWithServer:]([WPDAdvertisingManager alloc], "initWithServer:", self);
  -[WPDaemonServer setAdvertisingManager:](self, "setAdvertisingManager:", v8);

  v9 = -[WPDZoneManager initWithServer:]([WPDZoneManager alloc], "initWithServer:", self);
  -[WPDaemonServer setZoneManager:](self, "setZoneManager:", v9);

  v10 = -[WPDPipeManager initWithServer:]([WPDPipeManager alloc], "initWithServer:", self);
  -[WPDaemonServer setPipeManager:](self, "setPipeManager:", v10);

  v11 = -[WPDStatsManager initWithServer:]([WPDStatsManager alloc], "initWithServer:", self);
  -[WPDaemonServer setStatsManager:](self, "setStatsManager:", v11);

  if (_MergedGlobals)
  {
    -[WPDaemonServer scanManager](self, "scanManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    -[WPDaemonServer advertisingManager](self, "advertisingManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v13;
    -[WPDaemonServer pipeManager](self, "pipeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v14;
    -[WPDaemonServer zoneManager](self, "zoneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDaemonServer setManagers:](self, "setManagers:", v16);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_138_0);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "initManagers - ObjectDiscovery is disabled on this platform", v27, 2u);
    }
  }
  else
  {
    v18 = -[WPDObjectDiscoveryManager initWithServer:]([WPDObjectDiscoveryManager alloc], "initWithServer:", self);
    -[WPDaemonServer setObjectDiscoveryManager:](self, "setObjectDiscoveryManager:", v18);

    -[WPDaemonServer scanManager](self, "scanManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    -[WPDaemonServer advertisingManager](self, "advertisingManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    -[WPDaemonServer pipeManager](self, "pipeManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v21;
    -[WPDaemonServer zoneManager](self, "zoneManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v22;
    -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDaemonServer setManagers:](self, "setManagers:", v24);

  }
  if (+[WPDaemonServer supportsRanging](WPDaemonServer, "supportsRanging"))
  {
    -[WPDaemonServer scanManager](self, "scanManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "enableRanging:", -[WPDaemonServer isRangingEnabled](self, "isRangingEnabled"));

  }
  -[WPDaemonServer wpdState](self, "wpdState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateWithCompletion:", &__block_literal_global_141);

}

void __30__WPDaemonServer_initManagers__block_invoke_140()
{
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_142_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __30__WPDaemonServer_initManagers__block_invoke_140_cold_1();
}

- (void)initClients
{
  NSObject *v2;
  WPDObjectDiscoveryClient *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  WPDClient *spObjectDiscoveryClient;
  uint8_t v9[16];
  uint8_t buf[16];

  if (_MergedGlobals)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_143);
    v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "initClients - ObjectDiscovery is disabled on this platform", buf, 2u);
    }
  }
  else
  {
    v4 = -[WPDObjectDiscoveryClient initWithXPCConnection:server:]([WPDObjectDiscoveryClient alloc], "initWithXPCConnection:server:", 0, self);
    -[WPDaemonServer addClient:](self, "addClient:", v4);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDObjectDiscoveryClient registerWithDaemon:forProcess:machName:holdVouchers:](v4, "registerWithDaemon:forProcess:machName:holdVouchers:", CFSTR("WPObjectDiscovery"), v6, 0, 0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_149);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Created WPDObjectDiscoveryClient instance and registered with the server", v9, 2u);
    }
    spObjectDiscoveryClient = self->_spObjectDiscoveryClient;
    self->_spObjectDiscoveryClient = &v4->super;

  }
}

- (void)dealloc
{
  void *v3;
  WPDClient *spObjectDiscoveryClient;
  objc_super v5;

  -[WPDaemonServer spObjectDiscoveryClient](self, "spObjectDiscoveryClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDClient destroy](self->_spObjectDiscoveryClient, "destroy");
    spObjectDiscoveryClient = self->_spObjectDiscoveryClient;
    self->_spObjectDiscoveryClient = 0;

  }
  if (-[WPDaemonServer screenStateToken](self, "screenStateToken") != -1)
    notify_cancel(-[WPDaemonServer screenStateToken](self, "screenStateToken"));
  if (-[WPDaemonServer lockStatusChangedToken](self, "lockStatusChangedToken") != -1)
    notify_cancel(-[WPDaemonServer lockStatusChangedToken](self, "lockStatusChangedToken"));
  if (-[WPDaemonServer firstUnlockStatusChangedToken](self, "firstUnlockStatusChangedToken") != -1)
    notify_cancel(-[WPDaemonServer firstUnlockStatusChangedToken](self, "firstUnlockStatusChangedToken"));
  v5.receiver = self;
  v5.super_class = (Class)WPDaemonServer;
  -[WPDaemonServer dealloc](&v5, sel_dealloc);
}

void __35__WPDaemonServer_getClientForUUID___block_invoke_153(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getAllClients
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  -[WPDaemonServer clients](self, "clients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCbState:(int64_t)a3
{
  if (self->_cbState != a3)
    self->_cbState = a3;
  -[WPDaemonServer notifyClientsOfStateChange](self, "notifyClientsOfStateChange");
}

- (void)cbManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__WPDaemonServer_cbManagerDidUpdateState___block_invoke;
  v7[3] = &unk_24D7C2530;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x219A0F018](v7);
  -[WPDaemonServer wpdState](self, "wpdState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithManager:Completion:", v4, v5);

}

uint64_t __42__WPDaemonServer_cbManagerDidUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateState");
}

- (void)updateState
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDaemonServer serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__WPDaemonServer_updateState__block_invoke;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__WPDaemonServer_updateState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "wpdState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if (v5 == 3)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_154);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Daemon Peripheral is now powered on", buf, 2u);
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_156);
      v7 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Daemon Central is now powered on", v11, 2u);
      }
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158_0);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __29__WPDaemonServer_updateState__block_invoke_cold_1(v8, v3, v5);
    objc_msgSend(v3, "notifyManagersOfStateChange");
    objc_msgSend(v3, "setCbState:", v5);
    if (v5 != 3)
    {
      objc_msgSend(v3, "statsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reportPLStats");

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("WPDaemonServerStateChanged"), *(_QWORD *)(a1 + 32));

  }
}

- (void)notifyManagersOfStateChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WPDaemonServer wpdState](self, "wpdState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  -[WPDaemonServer wpdState](self, "wpdState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "restricted");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WPDaemonServer managers](self, "managers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "updateState:Restricted:", v4, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)addClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  WPDaemonServer *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "conn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.wirelessproxd-util-test"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_162);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v4, "clientUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WiProx test client has connected (UUID: %{public}@)", buf, 0xCu);

    }
    -[WPDaemonServer queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __28__WPDaemonServer_addClient___block_invoke_163;
    v25 = &unk_24D7C2600;
    v26 = self;
    v12 = v4;
    v27 = v12;
    dispatch_sync(v11, &v22);

    objc_msgSend(v12, "setIsTestModeClient:", 1, v22, v23, v24, v25, v26);
  }
  objc_msgSend(v4, "conn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForEntitlement:", CFSTR("com.apple.wirelessproxd-disable-scans"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
    objc_msgSend(v4, "setCanDisableScans:", 1);
  objc_msgSend(v4, "conn");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "conn");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resume");

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_164_0);
  v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDaemonServer addClient:].cold.2(v18, v4);
  -[WPDaemonServer clients](self, "clients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v4, v20);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_166);
  v21 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDaemonServer addClient:].cold.1(v21, self);

}

void __28__WPDaemonServer_addClient___block_invoke_163(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "testClients");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clientUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v2);

}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t v27[16];
  _QWORD block[5];
  id v29;

  v4 = a3;
  objc_msgSend(v4, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_167);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDaemonServer removeClient:].cold.3((uint64_t)v5, v6, v4);
    -[WPDaemonServer clients](self, "clients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v5);

    -[WPDaemonServer queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__WPDaemonServer_removeClient___block_invoke_168;
    block[3] = &unk_24D7C2600;
    block[4] = self;
    v9 = v5;
    v29 = v9;
    dispatch_sync(v8, block);

    -[WPDaemonServer privilegedClients](self, "privilegedClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if (v11)
    {
      -[WPDaemonServer privilegedClients](self, "privilegedClients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v9);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_169);
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDaemonServer removeClient:].cold.2(v13, v4);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_171);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDaemonServer addClient:].cold.1(v14, self);
  if (-[WPDaemonServer isTesting](self, "isTesting"))
  {
    -[WPDaemonServer testClients](self, "testClients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_173);
      v17 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "No more test clients available, exiting test mode", v27, 2u);
      }
      -[WPDaemonServer enableTestMode:](self, "enableTestMode:", 0);
    }
  }
  -[WPDaemonServer scanManager](self, "scanManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "scanningDisabled"))
  {
    -[WPDaemonServer privilegedClients](self, "privilegedClients");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
      goto LABEL_32;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_175);
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "No more clients that can disable scans, re-enabling", v27, 2u);
    }
    -[WPDaemonServer scanManager](self, "scanManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setScanningDisabled:", 0);

    -[WPDaemonServer scanManager](self, "scanManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateScanner");
  }

LABEL_32:
  -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "scanningDisabled"))
  {
LABEL_35:

    goto LABEL_36;
  }
  -[WPDaemonServer privilegedClients](self, "privilegedClients");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setScanningDisabled:", 0);

    -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateScanner");
    goto LABEL_35;
  }
LABEL_36:

}

void __31__WPDaemonServer_removeClient___block_invoke_168(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "testClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "testClients");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)registerClient:(id)a3 withMachName:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  WPDaemonServer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WPDaemonServer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__WPDaemonServer_registerClient_withMachName_withCompletion___block_invoke;
  block[3] = &unk_24D7C2728;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __61__WPDaemonServer_registerClient_withMachName_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_176);
  v2 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "processID");
    objc_msgSend(*(id *)(a1 + 32), "clientUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v5;
    v17 = 1024;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "Daemon registering process %{public}@ (%d) with WPDClient UUID %{public}@", (uint8_t *)&v15, 0x1Cu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "clientsWithMach");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "scanManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "advertisingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "zoneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "pipeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectDiscoveryManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v9 + 16))(v9, v10, v11, v12, v13, v14);

}

- (id)clientForMachName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WPDaemonServer clientsWithMach](self, "clientsWithMach");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)notifyClientsOfStateChange
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[6];
  char v9;

  -[WPDaemonServer wpdState](self, "wpdState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "restricted");

  -[WPDaemonServer wpdState](self, "wpdState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  -[WPDaemonServer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke;
  block[3] = &unk_24D7C2790;
  block[4] = self;
  block[5] = v6;
  v9 = v4;
  dispatch_sync(v7, block);

}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2;
  v3[3] = &__block_descriptor_41_e34_v32__0__NSUUID_8__WPDClient_16_B24l;
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_177_0);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2_cold_1(a1, v7, v6);
  objc_msgSend(v6, "notifyClientStateChange:Restricted:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)enableRanging:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (+[WPDaemonServer supportsRanging](WPDaemonServer, "supportsRanging"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_179_0);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDaemonServer enableRanging:].cold.1(v5, self, v3);
    -[WPDaemonServer persistence](self, "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsRangingEnabled:", v3);

    -[WPDaemonServer scanManager](self, "scanManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WPDaemonServer scanManager](self, "scanManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enableRanging:", v3);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDaemonServer enableRanging:].cold.2();
  }
}

- (void)startListening
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDaemonServer serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__WPDaemonServer_startListening__block_invoke;
  v4[3] = &unk_24D7C1C00;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__WPDaemonServer_startListening__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "initManagers");
    objc_msgSend(v2, "initClients");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.wirelessproxd"));
    objc_msgSend(v2, "setListener:", v3);

    objc_msgSend(v2, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

    objc_msgSend(v2, "listener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_185);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = CFSTR("com.apple.wirelessproxd");
      _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_INFO, "Daemon started listening for mach service %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  WPDClient *v6;
  NSObject *v7;
  WPDClient *v8;
  _QWORD v10[5];
  WPDClient *v11;

  v5 = a4;
  v6 = -[WPDClient initWithXPCConnection:server:]([WPDClient alloc], "initWithXPCConnection:server:", v5, self);

  -[WPDaemonServer serverQueue](self, "serverQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__WPDaemonServer_listener_shouldAcceptNewConnection___block_invoke;
  v10[3] = &unk_24D7C2600;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_sync(v7, v10);

  return 1;
}

uint64_t __53__WPDaemonServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addClient:", *(_QWORD *)(a1 + 40));
}

- (void)registerForSpringboardNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Daemon couldn't register for screen on/off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t state64;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    if (notify_get_state(a2, &state64))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_187_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_cold_1();
    }
    else
    {
      v4 = state64;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_189_0);
      v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = "On";
        if (v4)
          v6 = "Off";
        *(_DWORD *)buf = 136315138;
        v9 = v6;
        _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "Screen state - %s", buf, 0xCu);
      }
      if ((v4 != 0) != objc_msgSend(WeakRetained, "screenOff"))
      {
        objc_msgSend(WeakRetained, "setScreenOff:", v4 != 0);
        objc_msgSend(WeakRetained, "screenStateUpdate");
      }
    }
  }

}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_197(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_199_0);
  v10 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v8)
      v11 = "Yes";
    *(_DWORD *)buf = 136315138;
    v17 = v11;
    _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Mirroring state - %s", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "serverQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_202;
  v13[3] = &unk_24D7C28C0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v15 = v8 != 0;
  dispatch_async(v12, v13);

  objc_destroyWeak(&v14);
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_202(uint64_t a1)
{
  id WeakRetained;
  int v3;
  int v4;
  BOOL v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isMirroring");
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = v4 == v3;
    WeakRetained = v6;
    if (!v5)
    {
      objc_msgSend(v6, "setIsMirroring:", v4 != 0);
      objc_msgSend(v6, "mirroringStateUpdate");
      WeakRetained = v6;
    }
  }

}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_2_205(uint64_t a1)
{
  id WeakRetained;
  int v2;
  unsigned int v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = MKBGetDeviceLockState();
    v3 = objc_msgSend(WeakRetained, "systemLocked");
    v4 = v2 == 1;
    if (v2 == 2)
      v4 = v3;
    if ((unint64_t)v2 <= 3)
      v5 = v4;
    else
      v5 = v3;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_206);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v7 = "Unlocked";
      if ((_DWORD)v5)
        v7 = "Locked";
      v8 = 136315138;
      v9 = v7;
      _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_INFO, "Lock state - %s", (uint8_t *)&v8, 0xCu);
    }
    if ((_DWORD)v5 != objc_msgSend(WeakRetained, "systemLocked"))
    {
      objc_msgSend(WeakRetained, "setSystemLocked:", v5);
      objc_msgSend(WeakRetained, "lockStateUpdate");
    }
  }

}

uint64_t __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_212(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "lockStatusChangedToken"));
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "screenStateToken"));
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_216(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == -1)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_218_0);
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_INFO, "Already first unlocked", buf, 2u);
      }
      objc_msgSend(WeakRetained, "persistence");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0;
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_220);
      v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "Received first unlocked notification", v10, 2u);
      }
      objc_msgSend(WeakRetained, "persistence");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 1;
    }
    objc_msgSend(v5, "firstUnlockedWithEvent:", v7);

    objc_msgSend(WeakRetained, "persistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "enableRanging:", objc_msgSend(v9, "isRangingEnabled"));

  }
}

- (void)screenStateUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WPDaemonServer scanManager](self, "scanManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateScanner");

  -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateScanner");

  -[WPDaemonServer advertisingManager](self, "advertisingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAdvertiser");

  -[WPDaemonServer statsManager](self, "statsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPLStats");

}

- (void)mirroringStateUpdate
{
  void *v3;
  id v4;

  -[WPDaemonServer scanManager](self, "scanManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateScanner");

  -[WPDaemonServer statsManager](self, "statsManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportPLStats");

}

- (void)lockStateUpdate
{
  void *v3;
  void *v4;
  id v5;

  -[WPDaemonServer scanManager](self, "scanManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateScanner");

  -[WPDaemonServer objectDiscoveryManager](self, "objectDiscoveryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateScanner");

  -[WPDaemonServer statsManager](self, "statsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportPLStats");

}

- (void)enableTestMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WPDaemonServer isTesting](self, "isTesting") != a3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_224);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "Disabling";
      if (v3)
        v6 = "Enabling";
      *(_DWORD *)buf = 136315138;
      v18 = v6;
      _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "%s test mode", buf, 0xCu);
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[WPDaemonServer managers](self, "managers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setTestMode:", v3);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[WPDaemonServer setIsTesting:](self, "setIsTesting:", v3);
  }
}

- (void)enableTestMode
{
  -[WPDaemonServer enableTestMode:](self, "enableTestMode:", 1);
}

- (void)disableScanningForClient:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WPDaemonServer scanManager](self, "scanManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScanningDisabled:", 1);

  -[WPDaemonServer privilegedClients](self, "privilegedClients");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)generateStateDump
{
  dispatch_once_t *v2;
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_t v32;
  NSObject *v33;
  os_log_t *v34;
  dispatch_once_t *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = &WPLogInitOnce;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_227);
  v3 = (os_log_t *)&WiProxLog;
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = (uint64_t)"WPDaemon iOS 18.0 (22A3352) (WirelessProximity-180.62.1.8) (Release) built on 2024-09-03 19:39:23";
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %s", buf, 0xCu);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_230);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = 1840200;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: WP_API_VERSION: %ld", buf, 0xCu);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_232);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[WPDaemonServer wpdState](self, "wpdState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = (uint64_t)v8;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: wpdState: %@", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_234);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    +[WPDManager wpStateAsString:](WPDManager, "wpStateAsString:", -[WPDaemonServer cbState](self, "cbState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WPDaemonServer cbState](self, "cbState");
    *(_DWORD *)buf = 138412546;
    v45 = (uint64_t)v11;
    v46 = 1024;
    v47 = v12;
    _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: cbState: %@ (%d)", buf, 0x12u);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_237);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    if (-[WPDaemonServer isTesting](self, "isTesting"))
      v15 = "yes";
    else
      v15 = "no";
    *(_DWORD *)buf = 136315138;
    v45 = (uint64_t)v15;
    _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: isTesting: %s", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_241);
  v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    if (-[WPDaemonServer isRangingEnabled](self, "isRangingEnabled"))
      v18 = "yes";
    else
      v18 = "no";
    *(_DWORD *)buf = 136315138;
    v45 = (uint64_t)v18;
    _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: isRangingEnabled: %s", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_243);
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    if (-[WPDaemonServer systemLocked](self, "systemLocked"))
      v21 = "yes";
    else
      v21 = "no";
    *(_DWORD *)buf = 136315138;
    v45 = (uint64_t)v21;
    _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: systemLocked: %s", buf, 0xCu);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_245);
  v22 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    -[WPDaemonServer clients](self, "clients");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v25;
    _os_log_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: clients (%ld):", buf, 0xCu);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[WPDaemonServer clients](self, "clients");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v30);
        if (*v2 != -1)
          dispatch_once(v2, &__block_literal_global_247);
        v32 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          -[WPDaemonServer clients](self, "clients");
          v34 = v3;
          v35 = v2;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v31);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = (uint64_t)v37;
          _os_log_impl(&dword_2175D1000, v33, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);

          v2 = v35;
          v3 = v34;
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v28);
  }

  +[WPDClient generateStateDump](WPDClient, "generateStateDump");
}

- (void)dumpDaemonState
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id location[2];

  if (+[WPDaemonServer isInternalBuild](WPDaemonServer, "isInternalBuild"))
  {
    location[0] = 0;
    objc_initWeak(location, self);
    -[WPDaemonServer serverQueue](self, "serverQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__WPDaemonServer_dumpDaemonState__block_invoke;
    block[3] = &unk_24D7C1C00;
    objc_copyWeak(&v6, location);
    dispatch_async(v3, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_248);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Statedump disabled on non-internal builds.", (uint8_t *)location, 2u);
    }
  }
}

void __33__WPDaemonServer_dumpDaemonState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dumpDaemonStateAsync");
    WeakRetained = v2;
  }

}

- (void)dumpDaemonStateAsync
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_249);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: BEGIN", buf, 2u);
  }
  v4 = (void *)MEMORY[0x219A0EE8C](-[WPDaemonServer generateStateDump](self, "generateStateDump"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WPDaemonServer managers](self, "managers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "generateStateDump");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  -[WPDaemonServer statsManager](self, "statsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateStateDump");

  objc_autoreleasePoolPop(v4);
  -[WPDaemonServer spObjectDiscoveryClient](self, "spObjectDiscoveryClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WPDaemonServer spObjectDiscoveryClient](self, "spObjectDiscoveryClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateStateDump");

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_251);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: END", buf, 2u);
  }
}

- (WPDAdvertisingManager)advertisingManager
{
  return (WPDAdvertisingManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdvertisingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setStatsManager:(id)a3
{
  objc_storeStrong((id *)&self->_statsManager, a3);
}

- (WPDState)wpdState
{
  return self->_wpdState;
}

- (void)setWpdState:(id)a3
{
  objc_storeStrong((id *)&self->_wpdState, a3);
}

- (unsigned)coreBluetoothState
{
  return self->_coreBluetoothState;
}

- (void)setCoreBluetoothState:(unsigned __int8)a3
{
  self->_coreBluetoothState = a3;
}

- (void)setServerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setScanManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (WPDZoneManager)zoneManager
{
  return (WPDZoneManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setZoneManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (WPDPipeManager)pipeManager
{
  return (WPDPipeManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPipeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  return (WPDObjectDiscoveryManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObjectDiscoveryManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (WPDClient)spObjectDiscoveryClient
{
  return (WPDClient *)objc_getProperty(self, a2, 104, 1);
}

- (WPDPersistence)persistence
{
  return (WPDPersistence *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersistence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
  objc_storeStrong((id *)&self->_managers, a3);
}

- (void)setClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setTestClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableSet)privilegedClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPrivilegedClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMapTable)clientsWithMach
{
  return (NSMapTable *)objc_getProperty(self, a2, 152, 1);
}

- (void)setClientsWithMach:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 168, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (int)lockStatusChangedToken
{
  return self->_lockStatusChangedToken;
}

- (void)setLockStatusChangedToken:(int)a3
{
  self->_lockStatusChangedToken = a3;
}

- (int)screenStateToken
{
  return self->_screenStateToken;
}

- (void)setScreenStateToken:(int)a3
{
  self->_screenStateToken = a3;
}

- (int)firstUnlockStatusChangedToken
{
  return self->_firstUnlockStatusChangedToken;
}

- (void)setFirstUnlockStatusChangedToken:(int)a3
{
  self->_firstUnlockStatusChangedToken = a3;
}

- (FBSDisplayLayoutMonitor)mirroringMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMirroringMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setScreenOff:(BOOL)a3
{
  self->_screenOff = a3;
}

- (void)setSystemLocked:(BOOL)a3
{
  self->_systemLocked = a3;
}

- (BOOL)isMirroring
{
  return self->_isMirroring;
}

- (void)setIsMirroring:(BOOL)a3
{
  self->_isMirroring = a3;
}

- (BOOL)isTesting
{
  return self->_isTesting;
}

- (void)setIsTesting:(BOOL)a3
{
  self->_isTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientsWithMach, 0);
  objc_storeStrong((id *)&self->_privilegedClients, 0);
  objc_storeStrong((id *)&self->_testClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_spObjectDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_wpdState, 0);
  objc_storeStrong((id *)&self->_statsManager, 0);
  objc_storeStrong((id *)&self->_advertisingManager, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11(&dword_2175D1000, v0, v1, "Created queue %@ with QOS class %s (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __30__WPDaemonServer_initManagers__block_invoke_140_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_2175D1000, v0, OS_LOG_TYPE_DEBUG, "Registered all CBManagers with wpdState, updates accepted now.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

void __29__WPDaemonServer_updateState__block_invoke_cold_1(void *a1, void *a2, int a3)
{
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  v7[0] = 67109376;
  v7[1] = objc_msgSend(a2, "cbState");
  v8 = 1024;
  v9 = a3;
  OUTLINED_FUNCTION_8_0(&dword_2175D1000, v5, v6, "Daemon has updated state %d -> %d", (uint8_t *)v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)addClient:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(a2, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218242;
  v10 = v5;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v3, v8, "Current clients (%lu): %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_6();
}

- (void)addClient:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEBUG, "Added WPDClient %{public}@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_10();
}

- (void)removeClient:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_2175D1000, v3, OS_LOG_TYPE_ERROR, "Client for process %@ doesn't have a client UUID", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_10();
}

- (void)removeClient:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v5, v7, "Remove client WPDClient %{public}@ for process %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

void __44__WPDaemonServer_notifyClientsOfStateChange__block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "clientUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 67109890;
  v9[1] = v4;
  v10 = 1024;
  v11 = v5;
  v12 = 2114;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  _os_log_debug_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEBUG, "notifyClientsOfStateChange: %d restricted: %d to WPDClient %{public}@ name %@", (uint8_t *)v9, 0x22u);

}

- (void)enableRanging:(char)a3 .cold.1(void *a1, void *a2, char a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109376;
  v8[1] = objc_msgSend(v6, "isRangingEnabled");
  v9 = 1024;
  v10 = a3 & 1;
  OUTLINED_FUNCTION_8_0(&dword_2175D1000, v5, v7, "Enable ranging: %d -> %d", (uint8_t *)v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)enableRanging:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Ranging is not supported on this platform.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__WPDaemonServer_registerForSpringboardNotifications__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "notify_get_state() not returning NOTIFY_STATUS_OK", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
