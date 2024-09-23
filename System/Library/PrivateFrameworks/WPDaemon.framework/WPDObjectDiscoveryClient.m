@implementation WPDObjectDiscoveryClient

- (WPDObjectDiscoveryClient)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  WPDObjectDiscoveryClient *v8;
  WPDObjectDiscoveryClient *v9;
  uint64_t v10;
  WPDObjectDiscoveryData *keyAddressAndPayload;
  WPDSearchPartyAgent *spAgent;
  NSNumber *testBeaconingInterval;
  WPDSearchPartyAgent *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  WPDSearchPartyAgent *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location[2];
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)WPDObjectDiscoveryClient;
  v8 = -[WPDClient initWithXPCConnection:server:](&v26, sel_initWithXPCConnection_server_, 0, v7);
  v9 = v8;
  if (v8)
  {
    v8->_pendingSent = 0;
    v10 = objc_opt_new();
    keyAddressAndPayload = v9->_keyAddressAndPayload;
    v9->_keyAddressAndPayload = (WPDObjectDiscoveryData *)v10;

    spAgent = v9->_spAgent;
    v9->_spAgent = 0;

    testBeaconingInterval = v9->_testBeaconingInterval;
    v9->_testBeaconingInterval = 0;

    if (objc_opt_class())
    {
      location[0] = 0;
      objc_initWeak(location, v9);
      v14 = [WPDSearchPartyAgent alloc];
      -[WPDClient serverQueue](v9, "serverQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x24BDAC760];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke;
      v23[3] = &unk_24D7C5248;
      objc_copyWeak(&v24, location);
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_101;
      v21[3] = &unk_24D7C5248;
      objc_copyWeak(&v22, location);
      v17 = -[WPDSearchPartyAgent initWithQueue:beaconChange:tokensChange:](v14, "initWithQueue:beaconChange:tokensChange:", v15, v23, v21);
      v18 = v9->_spAgent;
      v9->_spAgent = (WPDSearchPartyAgent *)v17;

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak(location);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_105_0);
      v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_INFO, "WPDObjectDiscoveryClient SPOwner framework not found, beaconing is disabled", (uint8_t *)location, 2u);
      }
    }
  }

  return v9;
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_11);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_cold_1();
      if (!a2)
        goto LABEL_7;
    }
    else if (!a2)
    {
LABEL_7:
      objc_msgSend(WeakRetained, "updateSPBeaconing");
      goto LABEL_8;
    }
    objc_msgSend(WeakRetained, "setKeyRequestID:", a2);
    goto LABEL_7;
  }
LABEL_8:

}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_101(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_103);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_101_cold_1();
      if (!a2)
        goto LABEL_7;
    }
    else if (!a2)
    {
LABEL_7:
      objc_msgSend(WeakRetained, "updateSPNearbyTokens");
      goto LABEL_8;
    }
    objc_msgSend(WeakRetained, "setTokenRequestID:", a2);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_106);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[WPDClient clientUUID](self, "clientUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "Deallocing WPDObjectDiscoveryClient %@", buf, 0xCu);

  }
  -[WPDObjectDiscoveryClient setSpAgent:](self, "setSpAgent:", 0);
  v6.receiver = self;
  v6.super_class = (Class)WPDObjectDiscoveryClient;
  -[WPDClient dealloc](&v6, sel_dealloc);
}

- (void)generateStateDump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_109_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WPDClient clientTypeString](self, "clientTypeString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: ========= %@ %@ =========", (uint8_t *)&v11, 0x16u);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_111);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WPDObjectDiscoveryClient keyAddressAndPayload](self, "keyAddressAndPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: beacon buffer %@", (uint8_t *)&v11, 0xCu);

  }
  -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateStateDump");

}

- (void)endTestMode
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_112);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[WPDClient clientUUID](self, "clientUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "Ending test mode WPDObjectDiscoveryClient %@", buf, 0xCu);

  }
  -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTest");

  }
  v8.receiver = self;
  v8.super_class = (Class)WPDObjectDiscoveryClient;
  -[WPDClient endTestMode](&v8, sel_endTestMode);
}

- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WPDObjectDiscoveryClient;
  -[WPDClient registerWithDaemon:forProcess:machName:holdVouchers:](&v21, sel_registerWithDaemon_forProcess_machName_holdVouchers_, v10, v11, v12, a6);
  location = 0;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __80__WPDObjectDiscoveryClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke;
  v18 = &unk_24D7C2DC0;
  objc_copyWeak(&v19, &location);
  v13 = (void *)MEMORY[0x219A0F018](&v15);
  -[WPDClient server](self, "server", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClient:withMachName:withCompletion:", self, v12, v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __80__WPDObjectDiscoveryClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setRegistered:", 1);
    objc_msgSend(v8, "setObjectDiscoveryManager:", v9);
    objc_msgSend(v8, "sendRegisteredWithDaemonAndContinuingSession:", 0);
  }

}

- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[WPDClient server](self, "server", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wpdState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  -[WPDClient server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wpdState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "restricted");

  -[WPDObjectDiscoveryClient notifyClientStateChange:Restricted:](self, "notifyClientStateChange:Restricted:", v6, v9);
}

- (void)destroy
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_118_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WPDClient clientUUID](self, "clientUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient processName](self, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    v15 = 1024;
    v16 = -[WPDClient processID](self, "processID");
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Removing WPDObjectDiscoveryClient %{public}@ of process %{public}@ (%d)", (uint8_t *)&v11, 0x1Cu);

  }
  if (-[WPDClient registered](self, "registered"))
  {
    -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDClient clientUUID](self, "clientUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAdvertisingRequestsForClient:", v8);

    -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateNearbyTokens:", 0);

  }
  -[WPDClient server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeClient:", self);

}

- (void)updateSPNearbyTokens
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery update nearby tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)completeSPNearbyTockensWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_128_0);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryClient completeSPNearbyTockensWithSuccess:].cold.1(v5, self);
  -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[WPDObjectDiscoveryClient tokenRequestID](self, "tokenRequestID");
    -[WPDObjectDiscoveryClient setTokenRequestID:](self, "setTokenRequestID:", 0);
    -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completedTokenRequestID:success:", v7, v3);

  }
}

- (void)updateSPBeaconing
{
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "spAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "beaconState"))
    v5 = "ON";
  else
    v5 = "OFF";
  objc_msgSend(a2, "objectDiscoveryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[WPDObjectDiscoveryClient updateSPBeaconing]";
  if (objc_msgSend(v6, "state") == 3)
    v8 = "ON";
  else
    v8 = "OFF";
  v11 = 2080;
  v12 = v5;
  v13 = 2080;
  v14 = v8;
  OUTLINED_FUNCTION_19_0(&dword_2175D1000, v3, v7, "%s spAgent.beaconState: %s objectDiscoveryManager.state: %s", (uint8_t *)&v9);

}

- (void)startSPBeaconing
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[WPDObjectDiscoveryClient startSPBeaconing]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14(&dword_2175D1000, v0, v1, "%s bad advertisement %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)stopSPBeaconing
{
  void *v3;
  id v4;

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 18);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryClient stopAdvertising:](self, "stopAdvertising:", v4);
  -[WPDObjectDiscoveryClient keyAddressAndPayload](self, "keyAddressAndPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wipeout");

}

- (void)completeSPBeaconingWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_140_2);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryClient completeSPBeaconingWithSuccess:].cold.1(v5, self);
  -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[WPDObjectDiscoveryClient keyRequestID](self, "keyRequestID");
    -[WPDObjectDiscoveryClient setKeyRequestID:](self, "setKeyRequestID:", 0);
    -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completedKeyRequestID:success:", v7, v3);

  }
}

- (void)startAdvertising:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  double v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_141_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryClient startAdvertising:].cold.5();
  v5 = objc_msgSend(v4, "clientType");
  if (!-[WPDClient registered](self, "registered"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_143_1);
    v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryClient startAdvertising:].cold.4(v15, self);
    v16 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35[0] = CFSTR("The client is currently not registered with the daemon");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = 2;
    goto LABEL_27;
  }
  -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_148_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryClient updateSPNearbyTokens].cold.1();
    v20 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = CFSTR("WPDObjectDiscovery manager is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v19 = 26;
LABEL_27:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), v19, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v14 = 1;
      goto LABEL_29;
    }
    v21 = 0;
LABEL_37:
    -[WPDObjectDiscoveryClient completeSPBeaconingWithSuccess:](self, "completeSPBeaconingWithSuccess:", v21);
    goto LABEL_38;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_152_1);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WPDClient processName](self, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544386;
    v23 = v9;
    v24 = 1024;
    v25 = -[WPDClient processID](self, "processID");
    v26 = 2048;
    v27 = v5;
    v28 = 2048;
    v29 = objc_msgSend(v4, "advertisingRate");
    v30 = 2048;
    v31 = (double)objc_msgSend(v4, "advertisingRate") * 0.625;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Start advertising for process %{public}@ (%d) of type %ld with advertising interval %ld (%.2f ms)", (uint8_t *)&v22, 0x30u);

  }
  -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAdvertisingRequest:forClient:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v21 = 1;
    goto LABEL_37;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_154_1);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDObjectDiscoveryClient startAdvertising:].cold.3(v13, v12);
  v14 = 0;
LABEL_29:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_156_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDObjectDiscoveryClient startAdvertising:].cold.1();
  -[WPDClient advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v12, v5);
  -[WPDObjectDiscoveryClient setPendingSent:](self, "setPendingSent:", 0);
  v21 = 0;
  if (v14)
    goto LABEL_37;
LABEL_38:

}

- (void)stopAdvertising:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_157_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryClient stopAdvertising:].cold.4();
  if (!-[WPDClient registered](self, "registered"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159_0);
    v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryClient stopAdvertising:].cold.3(v14, self);
    v15 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32[0] = CFSTR("The client is currently not registered with the daemon");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = 2;
    goto LABEL_26;
  }
  -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_161_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryClient updateSPNearbyTokens].cold.1();
    v19 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("ObjectDiscovery manager is nil ");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    v18 = 26;
LABEL_26:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), v18, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
LABEL_27:
    -[WPDObjectDiscoveryClient completeSPBeaconingWithSuccess:](self, "completeSPBeaconingWithSuccess:", v20);
    goto LABEL_28;
  }
  v6 = objc_msgSend(v4, "clientType");
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_165);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WPDClient processName](self, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v9;
    v25 = 1024;
    v26 = -[WPDClient processID](self, "processID");
    v27 = 2048;
    v28 = v6;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Stop advertising for process %{public}@ (%d) of type %ld", (uint8_t *)&v23, 0x1Cu);

  }
  -[WPDObjectDiscoveryClient objectDiscoveryManager](self, "objectDiscoveryManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDClient clientUUID](self, "clientUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAdvertisingRequest:forClient:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[WPDClient conn](self, "conn");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "remoteObjectProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "advertisingStoppedOfType:withError:", objc_msgSend(v4, "clientType"), 0);

    -[WPDObjectDiscoveryClient setPendingSent:](self, "setPendingSent:", 0);
    v12 = 0;
    v20 = 1;
    goto LABEL_27;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_167_1);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDObjectDiscoveryClient startAdvertising:].cold.3(v13, v12);
LABEL_28:

}

- (void)notifyClientObjectDiscoveryStateChange:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (notifyClientObjectDiscoveryStateChange__state != a3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_168_0);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDObjectDiscoveryClient notifyClientObjectDiscoveryStateChange:].cold.1(a3, v5, v6);
    notifyClientObjectDiscoveryStateChange__state = a3;
    location = 0;
    objc_initWeak(&location, self);
    -[WPDClient serverQueue](self, "serverQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__WPDObjectDiscoveryClient_notifyClientObjectDiscoveryStateChange___block_invoke_169;
    v8[3] = &unk_24D7C1C00;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __67__WPDObjectDiscoveryClient_notifyClientObjectDiscoveryStateChange___block_invoke_169(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateSPBeaconing");
    objc_msgSend(v2, "updateSPNearbyTokens");
    WeakRetained = v2;
  }

}

- (void)sendTestRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_170_0);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryClient sendTestRequest:].cold.3((uint64_t)v4, v5, self);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestRequestKeyID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    switch(v8)
    {
      case 1:
        -[WPDClient setIsTestModeClient:](self, "setIsTestModeClient:", 1);
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startTest");

        break;
      case 2:
        -[WPDClient setIsTestModeClient:](self, "setIsTestModeClient:", 0);
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stopTest");

        -[WPDObjectDiscoveryClient setTestBeaconingInterval:](self, "setTestBeaconingInterval:", 0);
        break;
      case 3:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestBeaconKeysKey"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = (void *)v13;
        else
          v14 = (void *)MEMORY[0x24BDBD1A8];
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTestBeaconKeys:", v14);
        goto LABEL_29;
      case 4:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestNearOwnerTokensKey"));
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
          v14 = (void *)v16;
        else
          v14 = (void *)MEMORY[0x24BDBD1A8];
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTestNearOwnerTokens:", v14);
        goto LABEL_29;
      case 5:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestBeaconStatusKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTestBeaconStatus:", v14);
        goto LABEL_29;
      case 6:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestBeaconExtendedKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTestBeaconExtended:", v14);
        goto LABEL_29;
      case 7:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestBeaconStateKey"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
          v14 = (void *)v17;
        else
          v14 = (void *)MEMORY[0x24BDBD1C0];
        -[WPDObjectDiscoveryClient spAgent](self, "spAgent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTestBeaconState:", v14);
LABEL_29:

        break;
      case 8:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPTestBeaconIntervalKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDObjectDiscoveryClient setTestBeaconingInterval:](self, "setTestBeaconingInterval:", v18);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_172_1);
        v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPDObjectDiscoveryClient sendTestRequest:].cold.2(v19, self);
        break;
      default:
        v10 = v8;
        goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
LABEL_9:
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_174_1);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryClient sendTestRequest:].cold.1(v11, self, v10);
  }

}

- (BOOL)pendingSent
{
  return self->_pendingSent;
}

- (void)setPendingSent:(BOOL)a3
{
  self->_pendingSent = a3;
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  return (WPDObjectDiscoveryManager *)objc_loadWeakRetained((id *)&self->_objectDiscoveryManager);
}

- (void)setObjectDiscoveryManager:(id)a3
{
  objc_storeWeak((id *)&self->_objectDiscoveryManager, a3);
}

- (WPDObjectDiscoveryData)keyAddressAndPayload
{
  return (WPDObjectDiscoveryData *)objc_getProperty(self, a2, 280, 1);
}

- (unint64_t)keyRequestID
{
  return self->_keyRequestID;
}

- (void)setKeyRequestID:(unint64_t)a3
{
  self->_keyRequestID = a3;
}

- (unint64_t)tokenRequestID
{
  return self->_tokenRequestID;
}

- (void)setTokenRequestID:(unint64_t)a3
{
  self->_tokenRequestID = a3;
}

- (WPDSearchPartyAgent)spAgent
{
  return (WPDSearchPartyAgent *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSpAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSNumber)testBeaconingInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTestBeaconingInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testBeaconingInterval, 0);
  objc_storeStrong((id *)&self->_spAgent, 0);
  objc_storeStrong((id *)&self->_keyAddressAndPayload, 0);
  objc_destroyWeak((id *)&self->_objectDiscoveryManager);
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDObjectDiscoveryClient SP beacon changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__WPDObjectDiscoveryClient_initWithXPCConnection_server___block_invoke_101_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "WPDObjectDiscoveryClient SP tokens changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)completeSPNearbyTockensWithSuccess:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "tokenRequestID");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_13_0(&dword_2175D1000, v4, v5, "ObjectDiscovery complete SPNearbyTockens ID:%lu success:%d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)completeSPBeaconingWithSuccess:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "keyRequestID");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_13_0(&dword_2175D1000, v4, v5, "ObjectDiscovery complete SPBeaconing ID:%lu success:%d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)startAdvertising:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "ObjectDiscovery Advertising failed to start with error: %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)startAdvertising:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v3, v5, "%@", v6);

  OUTLINED_FUNCTION_8();
}

- (void)startAdvertising:(void *)a1 .cold.4(void *a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_2175D1000, v5, v6, "ObjectDiscovery Trying to start advertising when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)startAdvertising:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery Start advertising with request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)stopAdvertising:(void *)a1 .cold.3(void *a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend(a2, "clientUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_2175D1000, v5, v6, "ObjectDiscovery Trying to stop advertising when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)stopAdvertising:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery Stop advertising with request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)notifyClientObjectDiscoveryStateChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = "-[WPDObjectDiscoveryClient notifyClientObjectDiscoveryStateChange:]";
  if (notifyClientObjectDiscoveryStateChange__state == 3)
    v3 = "ON";
  else
    v3 = "OFF";
  v5 = 136315650;
  v7 = 2080;
  v8 = v3;
  if (a1 == 3)
    v4 = "ON";
  else
    v4 = "OFF";
  v9 = 2080;
  v10 = v4;
  OUTLINED_FUNCTION_19_0(&dword_2175D1000, a2, a3, "%s advertiser state changed from %s to %s", (uint8_t *)&v5);
}

- (void)sendTestRequest:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "clientUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = a3;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14(&dword_2175D1000, v5, v7, "Bad send test request %ld for client %@, dropping on the floor", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)sendTestRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "testBeaconingInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v3, v6, "Requested custom beaconing interval %@ ms for test client %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)sendTestRequest:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "clientUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v5, v7, "Send test request %@ for WPDObjectDiscoveryClient %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

@end
