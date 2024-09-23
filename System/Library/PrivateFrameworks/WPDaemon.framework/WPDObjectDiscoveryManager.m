@implementation WPDObjectDiscoveryManager

- (WPDObjectDiscoveryManager)initWithServer:(id)a3
{
  id v4;
  WPDObjectDiscoveryManager *v5;
  void *v6;
  WPAdvertisingRequest *advertRequest;
  NSDictionary *advertOptions;
  uint64_t v9;
  NSMutableDictionary *scanRequests;
  NSDictionary *scanOptions;
  uint64_t v12;
  NSMutableSet *currentScanners;
  OS_dispatch_source *scanStopTimer;
  NSArray *nearbyTokensRequest;
  NSArray *matchActionRules;
  void *v17;
  id v18;
  id WeakRetained;
  uint64_t v20;
  CBPeripheralManager *peripheralManager;
  id v22;
  id v23;
  uint64_t v24;
  CBCentralManager *centralManager;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WPDObjectDiscoveryManager;
  v5 = -[WPDManager initWithServer:Name:](&v32, sel_initWithServer_Name_, v4, CFSTR("ObjectDiscovery"));
  if (v5)
  {
    objc_msgSend(v4, "serverQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_serverQueue, v6);

    v5->_advertising = 0;
    advertRequest = v5->_advertRequest;
    v5->_advertRequest = 0;

    objc_storeWeak((id *)&v5->_advertClientUUID, 0);
    advertOptions = v5->_advertOptions;
    v5->_advertOptions = 0;

    v5->_advAllowlisted = -[WPDManager isAdvertisingAllowlistedForType:](v5, "isAdvertisingAllowlistedForType:", 18);
    v5->_scanAllowlisted = -[WPDManager isScanAllowlistedForType:](v5, "isScanAllowlistedForType:", 18);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    scanRequests = v5->_scanRequests;
    v5->_scanRequests = (NSMutableDictionary *)v9;

    v5->_scanning = 0;
    scanOptions = v5->_scanOptions;
    v5->_scanOptions = 0;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    currentScanners = v5->_currentScanners;
    v5->_currentScanners = (NSMutableSet *)v12;

    scanStopTimer = v5->_scanStopTimer;
    v5->_scanStopTimer = 0;

    v5->_advBuffersToRead = 0;
    nearbyTokensRequest = v5->_nearbyTokensRequest;
    v5->_nearbyTokensRequest = 0;

    matchActionRules = v5->_matchActionRules;
    v5->_matchActionRules = 0;

    v34 = *MEMORY[0x24BDBB198];
    v35[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BDBB280]);
    WeakRetained = objc_loadWeakRetained((id *)&v5->_serverQueue);
    v20 = objc_msgSend(v18, "initWithDelegate:queue:options:", v5, WeakRetained, v17);
    peripheralManager = v5->_peripheralManager;
    v5->_peripheralManager = (CBPeripheralManager *)v20;

    v22 = objc_alloc(MEMORY[0x24BDBB220]);
    v23 = objc_loadWeakRetained((id *)&v5->_serverQueue);
    v24 = objc_msgSend(v22, "initWithDelegate:queue:options:", v5, v23, v17);
    centralManager = v5->_centralManager;
    v5->_centralManager = (CBCentralManager *)v24;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = v5->_peripheralManager;
    v33[1] = v5->_centralManager;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDManager setCbManagers:](v5, "setCbManagers:", v28);

    objc_msgSend(v4, "wpdState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerManager:", v5->_centralManager);

    objc_msgSend(v4, "wpdState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerManager:", v5->_peripheralManager);

  }
  return v5;
}

- (id)generateStateDumpStrings
{
  WPDObjectDiscoveryManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  WPDObjectDiscoveryManager *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v2 = self;
  v74 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v70.receiver = self;
  v70.super_class = (Class)WPDObjectDiscoveryManager;
  -[WPDManager generateStateDumpStrings](&v70, sel_generateStateDumpStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  if (-[WPDObjectDiscoveryManager advertising](v2, "advertising"))
    v7 = "yes";
  else
    v7 = "no";
  -[WPDObjectDiscoveryManager advertClientUUID](v2, "advertClientUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryManager advertRequest](v2, "advertRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("advertising: %s client:%@ request:%@\n"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  if (-[WPDManager isInternalBuild](v2, "isInternalBuild"))
  {
    if (v2->_advAllowlisted)
      v11 = "yes";
    else
      v11 = "no";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("advertising allowlisted: %s\n"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  if (-[WPDObjectDiscoveryManager scanning](v2, "scanning"))
    v14 = "yes";
  else
    v14 = "no";
  -[WPDObjectDiscoveryManager scanOptions](v2, "scanOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("scanning: %s options: %@\n"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);

  if (-[WPDManager isInternalBuild](v2, "isInternalBuild"))
  {
    if (v2->_scanAllowlisted)
      v17 = "yes";
    else
      v17 = "no";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scan allowlisted: %s\n"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  v56 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[WPDObjectDiscoveryManager scanRequests](v2, "scanRequests");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString allKeys](v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v67;
    v19 = CFSTR("    %@: %@\n");
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x24BDD17C8];
        -[WPDObjectDiscoveryManager scanRequests](v2, "scanRequests");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v25);
        v28 = v2;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("    %@: %@\n"), v25, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v30);

        v2 = v28;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scan requests: %d\n"), objc_msgSend(v57, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v31);

  objc_msgSend(v56, "addObjectsFromArray:", v57);
  v32 = (void *)MEMORY[0x24BDD17C8];
  -[WPDObjectDiscoveryManager nearbyTokensRequest](v2, "nearbyTokensRequest");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
  {
    -[WPDObjectDiscoveryManager nearbyTokensRequest](v2, "nearbyTokensRequest");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = -[__CFString count](v19, "count");
  }
  objc_msgSend(v32, "stringWithFormat:", CFSTR("near owner tokens (%d):\n"), v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v35);

  if (v34)
  -[WPDObjectDiscoveryManager nearbyTokensRequest](v2, "nearbyTokensRequest");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    -[WPDObjectDiscoveryManager nearbyTokensRequest](v2, "nearbyTokensRequest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v63;
      v19 = CFSTR("    %@\n");
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v63 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v39);
    }

  }
  v43 = (void *)MEMORY[0x24BDD17C8];
  -[WPDObjectDiscoveryManager matchActionRules](v2, "matchActionRules");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
  {
    -[WPDObjectDiscoveryManager matchActionRules](v2, "matchActionRules");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = -[__CFString count](v19, "count");
  }
  objc_msgSend(v43, "stringWithFormat:", CFSTR("match action rules (%d):\n"), v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v46);

  if (v45)
  -[WPDObjectDiscoveryManager matchActionRules](v2, "matchActionRules");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[WPDObjectDiscoveryManager matchActionRules](v2, "matchActionRules");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v59 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v50);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v56);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[WPDObjectDiscoveryManager advertClientUUID](self, "advertClientUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryManager removeAdvertisingRequestsForClient:](self, "removeAdvertisingRequestsForClient:", v3);

  -[WPDObjectDiscoveryManager peripheralManager](self, "peripheralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[WPDObjectDiscoveryManager setPeripheralManager:](self, "setPeripheralManager:", 0);
  -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[WPDObjectDiscoveryManager updateScanner](self, "updateScanner");
  -[WPDObjectDiscoveryManager updateNearbyTokens:](self, "updateNearbyTokens:", 0);
  -[WPDObjectDiscoveryManager centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[WPDObjectDiscoveryManager setCentralManager:](self, "setCentralManager:", 0);
  v7.receiver = self;
  v7.super_class = (Class)WPDObjectDiscoveryManager;
  -[WPDManager cleanup](&v7, sel_cleanup);
}

- (void)update
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  uint8_t v7[16];
  __int16 v8;
  __int16 v9;
  uint8_t buf[2];

  switch(-[WPDManager state](self, "state"))
  {
    case 0:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_117_0);
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v9 = 0;
      v4 = "ObjectDiscovery manager is unknown";
      v5 = (uint8_t *)&v9;
      break;
    case 1:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_119_0);
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v8 = 0;
      v4 = "ObjectDiscovery manager is resetting";
      v5 = (uint8_t *)&v8;
      break;
    case 2:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_9);
      v3 = WiProxLog;
      if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v4 = "ObjectDiscovery manager is powered off, unauthorized or not supported";
      v5 = buf;
      break;
    case 3:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_121);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery manager is powered on", v7, 2u);
      }
      return;
    default:
      return;
  }
  _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
LABEL_15:
  -[WPDObjectDiscoveryManager resetAdvertiser](self, "resetAdvertiser");
}

- (BOOL)advertOptionsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_122);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager advertOptionsChanged:].cold.1(v5, self, (uint64_t)v4);
    if (!v4)
      goto LABEL_9;
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 0;
      goto LABEL_14;
    }
  }
LABEL_9:
  -[WPDObjectDiscoveryManager setAdvertOptions:](self, "setAdvertOptions:", v4);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_124_1);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138477827;
    v17 = v12;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery updated advertising options: %{private}@", (uint8_t *)&v16, 0xCu);

  }
  v9 = 1;
LABEL_14:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_126_0);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    if (v9)
      v14 = "YES";
    v16 = 136315138;
    v17 = v14;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery advertising data has changed: %s", (uint8_t *)&v16, 0xCu);
  }

  return v9;
}

- (BOOL)updateAdvertisingOptionsWithError:(id *)a3
{
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
  void *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_129_0);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager updateAdvertisingOptionsWithError:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  -[WPDObjectDiscoveryManager advertRequest](self, "advertRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WPDObjectDiscoveryManager advertRequest](self, "advertRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "advertisingOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDBAF70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "clientType") == 18)
    {
      if (objc_msgSend(v16, "length") == 6)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to update advertising because the address is not 6 bytes (%@)"), v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to update advertising because wrong client type %d"), objc_msgSend(v14, "clientType"));
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      v18 = -[WPDObjectDiscoveryManager advertOptionsChanged:](self, "advertOptionsChanged:", 0);
LABEL_24:

      return v18;
    }
LABEL_19:
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_137);
    v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_msgSend(v14, "clientType");
      objc_msgSend(v14, "advertisingData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134284291;
      v32 = v23;
      v33 = 2113;
      v34 = v24;
      v35 = 2049;
      v36 = objc_msgSend(v14, "advertisingRate");
      v37 = 2113;
      v38 = v16;
      _os_log_impl(&dword_2175D1000, v22, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery adding data of type: %{private}ld, advData: %{private}@ advInterval: %{private}ld address: %{private}@", buf, 0x2Au);

    }
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "addAdvertisingRequest:", v14);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBAFB8]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBAF78]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDBB188]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "advertRate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("kCBAdvOptionUseFGInterval"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "advertRate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDBB1A8]);

    objc_msgSend(v20, "getData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDBAF90]);

    v18 = -[WPDObjectDiscoveryManager advertOptionsChanged:](self, "advertOptionsChanged:", v25);
    goto LABEL_24;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_131);
  v17 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Nothing left to advertise - Stopping Advertising", buf, 2u);
  }
  return -[WPDObjectDiscoveryManager advertOptionsChanged:](self, "advertOptionsChanged:", 0);
}

- (void)resetAdvertiser
{
  NSObject *v3;
  uint8_t v4[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_140_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will reset (stop) advertising", v4, 2u);
  }
  -[WPDObjectDiscoveryManager setAdvertOptions:](self, "setAdvertOptions:", 0);
  -[WPDObjectDiscoveryManager setAdvertising:](self, "setAdvertising:", 0);
}

- (void)stopAdvertiser
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_141_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will stop advertising", v5, 2u);
  }
  -[WPDObjectDiscoveryManager peripheralManager](self, "peripheralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAdvertising");

}

- (void)startAdvertiser
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_142_1);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138477827;
    v9 = v5;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery will start advertising with options %{private}@", (uint8_t *)&v8, 0xCu);

  }
  -[WPDObjectDiscoveryManager peripheralManager](self, "peripheralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAdvertising:", v7);

}

- (id)updateAdvertiser
{
  __CFString *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[WPDObjectDiscoveryManager advertRequest](self, "advertRequest");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WPDObjectDiscoveryManager advertOptionsChanged:](self, "advertOptionsChanged:", 0);
    -[WPDObjectDiscoveryManager stopAdvertiser](self, "stopAdvertiser");
LABEL_10:
    v6 = 0;
    goto LABEL_19;
  }
  if (!-[WPDObjectDiscoveryManager advAllowlisted](self, "advAllowlisted"))
  {
    v3 = CFSTR("ObjectDiscovery advertising is denylisted or not allowlisted");
LABEL_13:
    -[WPDObjectDiscoveryManager advertOptionsChanged:](self, "advertOptionsChanged:", 0);
    goto LABEL_14;
  }
  if (-[WPDManager state](self, "state") != 3)
  {
    v3 = CFSTR("Trying to update advertiser but peripheral manager isn't powered on");
    goto LABEL_13;
  }
  v12 = 0;
  v4 = -[WPDObjectDiscoveryManager updateAdvertisingOptionsWithError:](self, "updateAdvertisingOptionsWithError:", &v12);
  v3 = (__CFString *)v12;
  if (v4)
  {
    -[WPDObjectDiscoveryManager stopAdvertiser](self, "stopAdvertiser");
    -[WPDObjectDiscoveryManager advertOptions](self, "advertOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[WPDObjectDiscoveryManager startAdvertiser](self, "startAdvertiser");
  }
  if (!v3)
    goto LABEL_10;
LABEL_14:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_147);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDObjectDiscoveryManager updateAdvertiser].cold.1((uint64_t)v3, v7, v8);
  v9 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD0FC8];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 26, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v6;
}

- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_149_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager addAdvertisingRequest:forClient:].cold.1();
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startActivity:forType:", 1, 18);

  -[WPDManager server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetActivity:forType:", 1, 18);

  -[WPDObjectDiscoveryManager setAdvertRequest:](self, "setAdvertRequest:", v6);
  -[WPDObjectDiscoveryManager setAdvertClientUUID:](self, "setAdvertClientUUID:", v7);
  -[WPDObjectDiscoveryManager updateAdvertiser](self, "updateAdvertiser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_150_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager removeAdvertisingRequest:forClient:].cold.1();
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopActivity:forType:", 1, 18);

  -[WPDManager server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetActivity:forType:", 1, 18);

  -[WPDObjectDiscoveryManager setAdvertRequest:](self, "setAdvertRequest:", 0);
  -[WPDObjectDiscoveryManager setAdvertClientUUID:](self, "setAdvertClientUUID:", 0);
  -[WPDObjectDiscoveryManager updateAdvertiser](self, "updateAdvertiser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)removeAdvertisingRequestsForClient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_151_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager removeAdvertisingRequestsForClient:].cold.1();
  -[WPDObjectDiscoveryManager advertClientUUID](self, "advertClientUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
    goto LABEL_8;
  -[WPDObjectDiscoveryManager advertRequest](self, "advertRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WPDObjectDiscoveryManager advertRequest](self, "advertRequest");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[WPDObjectDiscoveryManager removeAdvertisingRequest:forClient:](self, "removeAdvertisingRequest:forClient:", v5, v4);
LABEL_8:

  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_152_0);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:].cold.3(v8, v7);
    -[WPDObjectDiscoveryManager setAdvertising:](self, "setAdvertising:", 0);
    -[WPDManager server](self, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spObjectDiscoveryClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WPDManager server](self, "server");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "spObjectDiscoveryClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "advertisingFailedToStart:ofType:", v7, 18);
LABEL_14:

      goto LABEL_23;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_154_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:].cold.2();
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_156_0);
    v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Did start advertising", v16, 2u);
    }
    -[WPDObjectDiscoveryManager setAdvertising:](self, "setAdvertising:", 1);
    -[WPDManager server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spObjectDiscoveryClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WPDManager server](self, "server");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "spObjectDiscoveryClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "advertisingStartedOfType:", 18);
      goto LABEL_14;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryManager peripheralManagerDidStartAdvertising:error:].cold.1();
  }
LABEL_23:

}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2048;
      v21 = objc_msgSend(v7, "code");
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Failed to stop advertising with error: %@ (%ld)", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    -[WPDObjectDiscoveryManager setAdvertising:](self, "setAdvertising:", 0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_161);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Did stop advertising", (uint8_t *)&v18, 2u);
    }
  }
  -[WPDManager server](self, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopActivity:forType:", 1, 18);

  -[WPDManager server](self, "server");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spObjectDiscoveryClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WPDManager server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "spObjectDiscoveryClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "advertisingStoppedOfType:withError:", 18, v7);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_163);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryManager peripheralManager:didStopAdvertisingWithError:].cold.1();
  }

}

- (void)updateReports:(id)a3 fromReport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementPeripheral"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRssi"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDObjectDiscoveryManager updateReports:Peripheral:AdvertisementData:RSSI:](self, "updateReports:Peripheral:AdvertisementData:RSSI:", v7, v10, v9, v8);
}

- (void)updateReports:(id)a3 Peripheral:(id)a4 AdvertisementData:(id)a5 RSSI:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  _BYTE *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unint64_t v22;
  unint64_t v23;
  unsigned __int8 *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFC8]);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (_BYTE *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  if (v15 < 2 || *v14 != 76 || v14[1])
    goto LABEL_27;
  v16 = v15;
  v32 = v10;
  v33 = v9;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 < 4)
    goto LABEL_26;
  v18 = &v14[v16];
  v19 = v14 + 2;
  *(_QWORD *)&v17 = 134218242;
  v31 = v17;
  while (1)
  {
    v20 = *v19;
    v21 = v19 + 2;
    v22 = v19[1] & 0x1F;
    v23 = v18 - (v19 + 2);
    if (v23 < v22)
      break;
    v24 = &v21[v22];
    if ((v20 - 27) <= 0xE5u)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_172);
      v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        v42 = v20;
        v43 = 2112;
        v44 = (unint64_t)v13;
        _os_log_error_impl(&dword_2175D1000, v25, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer unsupported payload type %ld, data %@", buf, 0x16u);
      }
      goto LABEL_20;
    }
    if ((_DWORD)v20 != 18)
      goto LABEL_15;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v14, 2, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendBytes:length:", v19, v22 + 2);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v28, v29);

LABEL_20:
    v19 = v24;
    if (v18 - v24 <= 1)
      goto LABEL_26;
  }
  if ((_DWORD)v20 == 4)
  {
    v22 = ((_BYTE)v18 - ((_BYTE)v19 + 2));
    v24 = &v21[v23];
LABEL_15:
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_174_0);
    v26 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v31;
      v42 = v20;
      v43 = 2112;
      v44 = (unint64_t)v13;
      _os_log_debug_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer unexpected payload type %ld, data %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_170);
  v30 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218499;
    v42 = v20;
    v43 = 2048;
    v44 = v22;
    v45 = 2113;
    v46 = v13;
    _os_log_error_impl(&dword_2175D1000, v30, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer bad payload type %ld length %zu, data %{private}@", buf, 0x20u);
  }
LABEL_26:
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __77__WPDObjectDiscoveryManager_updateReports_Peripheral_AdvertisementData_RSSI___block_invoke_177;
  v35[3] = &unk_24D7C44D0;
  v36 = v11;
  v37 = v12;
  v10 = v32;
  v38 = v32;
  v39 = v13;
  v9 = v33;
  v40 = v33;
  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v35);

LABEL_27:
}

void __77__WPDObjectDiscoveryManager_updateReports_Peripheral_AdvertisementData_RSSI___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v16[0] = CFSTR("kDeviceAdvertisingData");
  v16[1] = CFSTR("kDeviceAddress");
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v17[1] = v9;
  v17[2] = v11;
  v16[2] = CFSTR("kDeviceRSSI");
  v16[3] = CFSTR("kDevicePeripheralUUID");
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 56);
  v17[3] = v12;
  v17[4] = v13;
  v16[4] = CFSTR("kDeviceManufacturerData");
  v16[5] = CFSTR("kDeviceType");
  v17[5] = v5;
  v16[6] = CFSTR("kDeviceTime");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[6] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v7)
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v15);

}

- (void)updateClientsWithReports:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[4];
  id v17;
  _BYTE buf[12];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_179_1);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "count");
    -[WPDObjectDiscoveryManager currentScanners](self, "currentScanners");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer receiving %{public}lu reports for %{public}@ clients", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  -[WPDObjectDiscoveryManager serverQueue](self, "serverQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180;
  block[3] = &unk_24D7C1C00;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_async(v9, block);

  if (!objc_msgSend(v4, "count"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_185_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDObjectDiscoveryManager updateClientsWithReports:].cold.2();
  }
  -[WPDObjectDiscoveryManager currentScanners](self, "currentScanners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_187_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDObjectDiscoveryManager updateClientsWithReports:].cold.1();
  }
  else
  {
    -[WPDObjectDiscoveryManager currentScanners](self, "currentScanners");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_188;
    v14[3] = &unk_24D7C45D8;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scanStopTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "setAdvBuffersToRead:", objc_msgSend(v2, "advBuffersToRead") - 1);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_181_0);
      v4 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180_cold_2(v4);
      if ((int)objc_msgSend(v2, "advBuffersToRead") <= 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_183);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180_cold_1();
        objc_msgSend(v2, "cancelScanStopTimer");
        objc_msgSend(v2, "deactivateADVBuffer");
        objc_msgSend(v2, "scanOptions");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          objc_msgSend(v2, "activateADVBuffer");
      }
    }
  }

}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getClientForUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_190);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      v9 = 138543618;
      v10 = v3;
      v11 = 2050;
      v12 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer telling client %{public}@ about %{public}lu reports", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v5, "discoveredDevices:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_192);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_188_cold_1();
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_194_0);
  v14 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer UNEXPECTED didDiscoverPeripheral", v17, 2u);
  }
  v15 = (void *)MEMORY[0x219A0EE8C]();
  v16 = (void *)objc_opt_new();
  -[WPDObjectDiscoveryManager updateReports:Peripheral:AdvertisementData:RSSI:](self, "updateReports:Peripheral:AdvertisementData:RSSI:", v16, v11, v12, v13);
  -[WPDObjectDiscoveryManager updateClientsWithReports:](self, "updateClientsWithReports:", v16);

  objc_autoreleasePoolPop(v15);
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_195_1);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134349056;
    v23 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer didDiscoverMultiplePeripherals %{public}lu peripherals", buf, 0xCu);

  }
  v10 = (void *)MEMORY[0x219A0EE8C]();
  v11 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[WPDObjectDiscoveryManager updateReports:fromReport:](self, "updateReports:fromReport:", v11, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  -[WPDObjectDiscoveryManager updateClientsWithReports:](self, "updateClientsWithReports:", v11);
  objc_autoreleasePoolPop(v10);

}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_196);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer didFailToScanWithError %{public}@", buf, 0xCu);
  }
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == (void *)*MEMORY[0x24BDBB170])
    {
      v11 = objc_msgSend(v7, "code") == 13;

      if (v11)
      {
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        -[WPDObjectDiscoveryManager serverQueue](self, "serverQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __67__WPDObjectDiscoveryManager_centralManager_didFailToScanWithError___block_invoke_199;
        block[3] = &unk_24D7C1C00;
        objc_copyWeak(&v15, (id *)buf);
        dispatch_async(v12, block);

        objc_destroyWeak(&v15);
        objc_destroyWeak((id *)buf);
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_198_0);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer UNEXPECTED didFailToScanWithError %{public}@", buf, 0xCu);
  }
LABEL_14:

}

void __67__WPDObjectDiscoveryManager_centralManager_didFailToScanWithError___block_invoke_199(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scanStopTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_200);
      v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer force-read failed", buf, 2u);
      }
      objc_msgSend(v2, "cancelScanStopTimer");
      objc_msgSend(v2, "deactivateADVBuffer");
      objc_msgSend(v2, "scanOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_msgSend(v2, "activateADVBuffer");
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_202);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer scan failed to start", v7, 2u);
      }
      objc_msgSend(v2, "setScanning:", 0);
    }
  }

}

- (id)rulesFromTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v6 = 0;
      v7 = *MEMORY[0x24BDBB020];
      v8 = *MEMORY[0x24BDBB018];
      do
      {
        v14[0] = v7;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = v8;
        v15[0] = v9;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v6 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[1] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        v6 += 2;
      }
      while (objc_msgSend(v4, "count") > v6);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (void)updateNearbyTokens:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_203_0);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Updating nearby tokens", (uint8_t *)&v24, 2u);
  }
  if (v5
    || (-[WPDObjectDiscoveryManager nearbyTokensRequest](self, "nearbyTokensRequest"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WPDObjectDiscoveryManager nearbyTokensRequest](self, "nearbyTokensRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7) ^ 1;

    if (v5)
      goto LABEL_11;
  }
  else
  {
    v8 = 0;
  }

LABEL_11:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_205_0);
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager updateNearbyTokens:].cold.4(v8, v9, v10, v11, v12, v13, v14, v15);
    if ((v8 & 1) != 0)
      goto LABEL_15;
  }
  else if ((v8 & 1) != 0)
  {
LABEL_15:
    -[WPDObjectDiscoveryManager setNearbyTokensRequest:](self, "setNearbyTokensRequest:", v5);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_213);
    v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDObjectDiscoveryManager updateNearbyTokens:].cold.2(v16);
    -[WPDObjectDiscoveryManager rulesFromTokens:](self, "rulesFromTokens:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDObjectDiscoveryManager setMatchActionRules:](self, "setMatchActionRules:", v17);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_215);
    v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[WPDObjectDiscoveryManager matchActionRules](self, "matchActionRules");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v20;
      _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Nearby tokens setMatchActionRules with rules: %@", (uint8_t *)&v24, 0xCu);

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_217);
    v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDObjectDiscoveryManager updateNearbyTokens:].cold.1(v21);
    -[WPDObjectDiscoveryManager centralManager](self, "centralManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDObjectDiscoveryManager matchActionRules](self, "matchActionRules");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMatchActionRules:", v23);

    goto LABEL_33;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_211_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager updateNearbyTokens:].cold.3();
LABEL_33:

}

- (BOOL)changedScanOptions:(id)a3 Clients:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  -[WPDObjectDiscoveryManager scanOptions](self, "scanOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (v8)
    {
      -[WPDObjectDiscoveryManager scanOptions](self, "scanOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isEqualToDictionary:", v10) ^ 1;

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = v8 != 0;
  }

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_218_1);
  v12 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDObjectDiscoveryManager changedScanOptions:Clients:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    if (!(_DWORD)v11)
      goto LABEL_14;
  }
  else if (!(_DWORD)v11)
  {
    goto LABEL_14;
  }
  -[WPDObjectDiscoveryManager setScanOptions:](self, "setScanOptions:", v6);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_220_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager changedScanOptions:Clients:].cold.1();
LABEL_14:
  -[WPDObjectDiscoveryManager currentScanners](self, "currentScanners");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  if (v7)
  {
    -[WPDObjectDiscoveryManager currentScanners](self, "currentScanners");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v7);

  }
  return v11;
}

- (BOOL)updateScanRules
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  unsigned __int16 v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  unsigned __int16 v34;
  NSObject *v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  const char *v45;
  __int128 v47;
  int v48;
  id obj;
  uint64_t v50;
  unsigned __int16 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  _BYTE v63[14];
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint8_t v67[4];
  int v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(v6);
          v11 = *(const char **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (-[WPDManager testMode](self, "testMode")
            && (-[WPDManager server](self, "server"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "isClientTestMode:", v11),
                v12,
                (v13 & 1) == 0))
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_223_0);
            v17 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v11;
              _os_log_debug_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer Not adding for non-test client UUID: %@ when in test mode", buf, 0xCu);
            }
          }
          else
          {
            -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "clientType") == 18)
            {
              objc_msgSend(v5, "addObject:", v11);
            }
            else
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_225);
              v16 = (void *)WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                -[WPDObjectDiscoveryManager updateScanRules].cold.4(v67, v16, v15, &v68);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v8);
    }

    if (!objc_msgSend(v5, "count"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_227_0);
      v37 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v37, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer No valid clients to scan for - Stopping Scan", buf, 2u);
      }
      v36 = -[WPDObjectDiscoveryManager changedScanOptions:Clients:](self, "changedScanOptions:Clients:", 0, 0);
      goto LABEL_101;
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v5;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v18)
    {
      v20 = v18;
      v50 = 0;
      v21 = *(_QWORD *)v53;
      *(_QWORD *)&v19 = 138412290;
      v47 = v19;
      v48 = 0xFFFF;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(obj);
          v23 = *(const char **)(*((_QWORD *)&v52 + 1) + 8 * v22);
          -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests", v47);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v25, "scanningRates");
            v26 = v51;
          }
          else
          {
            v26 = 0;
            v51 = 0;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_229);
          v27 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v23;
            v62 = 2112;
            *(_QWORD *)v63 = v25;
            _os_log_debug_impl(&dword_2175D1000, v27, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer client %@ request %@", buf, 0x16u);
          }
          if ((objc_msgSend(v25, "advBuffer") & 4) != 0)
          {
            if ((objc_msgSend(v25, "advBuffer") & 3) != 0)
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_231);
              v29 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v47;
                v61 = v23;
                _os_log_debug_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer activating for client %@", buf, 0xCu);
              }
              v50 |= objc_msgSend(v25, "advBuffer");
              if (v26)
              {
                v30 = v48;
                v31 = (unsigned __int16)v48;
                if (v26 < (unsigned __int16)v48)
                  v31 = v26;
                if (v26 != 0xFFFF)
                  v30 = v31;
                v48 = v30;
              }
            }
            else
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_233);
              v32 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v47;
                v61 = v23;
                _os_log_error_impl(&dword_2175D1000, v32, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer no-buffer no-op for client %@", buf, 0xCu);
              }
            }
          }
          else
          {
            if (v26 != 0xFFFF)
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_237_0);
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                -[WPDObjectDiscoveryManager updateScanRules].cold.3();

              goto LABEL_78;
            }
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_235);
            v28 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v47;
              v61 = v23;
              _os_log_debug_impl(&dword_2175D1000, v28, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer no-op for client %@", buf, 0xCu);
            }
          }

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        if (v20)
          continue;
        break;
      }

      v33 = v50;
      v34 = v48;
      if (v50 == 4)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_239);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPDObjectDiscoveryManager updateScanRules].cold.2();
        goto LABEL_79;
      }
    }
    else
    {
LABEL_78:

LABEL_79:
      v33 = 0;
      v34 = -1;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_241_0);
    v38 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      -[WPDObjectDiscoveryManager updateScanRules].cold.1(v34, v33, v38);
      if ((v33 & 4) == 0)
        goto LABEL_84;
    }
    else if ((v33 & 4) == 0)
    {
LABEL_84:
      v39 = 0;
LABEL_94:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_245_0);
      v44 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v45 = "activate";
        *(_DWORD *)buf = 136446979;
        if (!v39)
          v45 = "deactivate";
        v61 = v45;
        v62 = 1025;
        *(_DWORD *)v63 = 18;
        *(_WORD *)&v63[4] = 2114;
        *(_QWORD *)&v63[6] = v39;
        v64 = 2113;
        v65 = obj;
        _os_log_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer about to %{public}s for type %{private}d with options %{public}@ for clients %{private}@", buf, 0x26u);
      }
      v36 = -[WPDObjectDiscoveryManager changedScanOptions:Clients:](self, "changedScanOptions:Clients:", v39, obj);

LABEL_101:
      return v36;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if ((v33 & 1) != 0)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB070]);
    if ((v33 & 2) != 0)
      objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB068]);
    v42 = *MEMORY[0x24BDBB0E0];
    if (v34 == 0xFFFF)
    {
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24D7D7E60, v42);
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24D7D7E60, *MEMORY[0x24BDBB0D0]);
    }
    else
    {
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24D7D7E78, v42);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, *MEMORY[0x24BDBB0D0]);

    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_94;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_221);
  v35 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v35, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer Nothing left to scan for - Stopping Scan", buf, 2u);
  }
  return -[WPDObjectDiscoveryManager changedScanOptions:Clients:](self, "changedScanOptions:Clients:", 0, 0);
}

- (void)updateScanner
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer request no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)forceReadADVBuffer:(id)a3
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
  -[WPDObjectDiscoveryManager serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WPDObjectDiscoveryManager_forceReadADVBuffer___block_invoke;
  block[3] = &unk_24D7C25B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WPDObjectDiscoveryManager_forceReadADVBuffer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    v4 = *MEMORY[0x24BDBB070];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBB070]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v8 = 0;
    }
    v9 = *MEMORY[0x24BDBB068];
    v10 = v3;
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(WeakRetained, "setAdvBuffersToRead:", (v13 + v8));
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_257);
    v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v17[0] = 67174913;
      v17[1] = 18;
      v18 = 1025;
      v19 = objc_msgSend(WeakRetained, "advBuffersToRead");
      _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer force-read for type %{private}d buffers %{private}d", (uint8_t *)v17, 0xEu);

    }
    objc_msgSend(WeakRetained, "addScanStopTimer");
    objc_msgSend(WeakRetained, "centralManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scanForPeripheralsWithServices:options:", 0, *(_QWORD *)(a1 + 32));

  }
}

- (void)activateADVBuffer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_258);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WPDObjectDiscoveryManager scanOptions](self, "scanOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67174915;
    v8[1] = 18;
    v9 = 2113;
    v10 = v5;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer activate for type %{private}d with options %{private}@", (uint8_t *)v8, 0x12u);

  }
  -[WPDObjectDiscoveryManager centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDObjectDiscoveryManager scanOptions](self, "scanOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scanForPeripheralsWithServices:options:", 0, v7);

  -[WPDObjectDiscoveryManager setScanning:](self, "setScanning:", 1);
}

- (void)deactivateADVBuffer
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_259);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67174657;
    v5[1] = 18;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery ADV Buffer deactivate for type %{private}d", (uint8_t *)v5, 8u);
  }
  -[WPDObjectDiscoveryManager centralManager](self, "centralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopScan");

  -[WPDObjectDiscoveryManager setScanning:](self, "setScanning:", 0);
}

- (id)addScanRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_260);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager addScanRequest:forClient:].cold.4();
  v8 = objc_msgSend(v6, "clientType");
  if (v8 == 18)
  {
    if (-[WPDManager state](self, "state") == 3)
    {
      -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_270);
        v11 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPDObjectDiscoveryManager addScanRequest:forClient:].cold.1((uint64_t)v7, v11, v6);
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_272);
      v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138543618;
        v24 = v6;
        v25 = 2114;
        v26 = v7;
        _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Adding scan request %{public}@ for client %{public}@", (uint8_t *)&v23, 0x16u);
      }
      -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v7);

      -[WPDObjectDiscoveryManager updateScanner](self, "updateScanner");
      v14 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28 = CFSTR("CoreBluetooth is currently powered off");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_268);
      v21 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDObjectDiscoveryManager addScanRequest:forClient:].cold.2(v21);
    }
  }
  else
  {
    v15 = v8;
    v16 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30[0] = CFSTR("ObjectDiscoveryManager is not scanning for this client type");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_264);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDObjectDiscoveryManager addScanRequest:forClient:].cold.3(v15, v18);
  }

  return v14;
}

- (id)getScanRequestsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeScanRequestsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_273);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDObjectDiscoveryManager removeScanRequestsForClient:].cold.1();
  -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_277);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery Removing all scan requests for client %{public}@", (uint8_t *)&v10, 0xCu);
    }
    -[WPDObjectDiscoveryManager scanRequests](self, "scanRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

    -[WPDObjectDiscoveryManager updateScanner](self, "updateScanner");
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_275);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_INFO, "ObjectDiscovery has no scan requests for client %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)cancelScanStopTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer cancelScanStopTimer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addScanStopTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer addScanStopTimer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__WPDObjectDiscoveryManager_addScanStopTimer__block_invoke_282(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "scanning"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_283);
      v3 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_INFO, "ObjectDiscovery ADV Buffer force-read timed-out", v4, 2u);
      }
      objc_msgSend(v2, "deactivateADVBuffer");
    }
    objc_msgSend(v2, "setScanStopTimer:", 0);
  }

}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)scanningDisabled
{
  return self->_scanningDisabled;
}

- (void)setScanningDisabled:(BOOL)a3
{
  self->_scanningDisabled = a3;
}

- (OS_dispatch_queue)serverQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_serverQueue);
}

- (CBPeripheralManager)peripheralManager
{
  return (CBPeripheralManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeripheralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)advertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (WPAdvertisingRequest)advertRequest
{
  return (WPAdvertisingRequest *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAdvertRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSUUID)advertClientUUID
{
  return (NSUUID *)objc_loadWeakRetained((id *)&self->_advertClientUUID);
}

- (void)setAdvertClientUUID:(id)a3
{
  objc_storeWeak((id *)&self->_advertClientUUID, a3);
}

- (NSDictionary)advertOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAdvertOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)advertHash
{
  return self->_advertHash;
}

- (void)setAdvertHash:(unint64_t)a3
{
  self->_advertHash = a3;
}

- (BOOL)advAllowlisted
{
  return self->_advAllowlisted;
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCentralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)scanRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setScanRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableSet)currentScanners
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentScanners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDictionary)scanOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setScanOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_dispatch_source)scanStopTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 144, 1);
}

- (void)setScanStopTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int)advBuffersToRead
{
  return self->_advBuffersToRead;
}

- (void)setAdvBuffersToRead:(int)a3
{
  self->_advBuffersToRead = a3;
}

- (NSArray)nearbyTokensRequest
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNearbyTokensRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)matchActionRules
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMatchActionRules:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)scanAllowlisted
{
  return self->_scanAllowlisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchActionRules, 0);
  objc_storeStrong((id *)&self->_nearbyTokensRequest, 0);
  objc_storeStrong((id *)&self->_scanStopTimer, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_currentScanners, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_advertOptions, 0);
  objc_destroyWeak((id *)&self->_advertClientUUID);
  objc_storeStrong((id *)&self->_advertRequest, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
}

- (void)advertOptionsChanged:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "advertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a3;
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v5, v7, "ObjectDiscovery advertising options old: %@ new: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateAdvertisingOptionsWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)updateAdvertiser
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[WPDObjectDiscoveryManager updateAdvertiser]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_14(&dword_2175D1000, a2, a3, "ObjectDiscovery %s updated with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)addAdvertisingRequest:forClient:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v0, (uint64_t)v0, "ObjectDiscovery Adding advertising request %@ for client: %@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)removeAdvertisingRequest:forClient:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v0, (uint64_t)v0, "ObjectDiscovery Removing advertising request %@ for client: %@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)removeAdvertisingRequestsForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery Remove advertising requests for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)peripheralManagerDidStartAdvertising:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "ObjectDiscovery started advertising, but no client advertising", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)peripheralManagerDidStartAdvertising:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "ObjectDiscovery failed to start advertising, but no client advertising", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)peripheralManagerDidStartAdvertising:(void *)a1 error:(void *)a2 .cold.3(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_14(&dword_2175D1000, v2, v5, "ObjectDiscovery Failed to start advertising with error: %@ (%ld)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)peripheralManager:didStopAdvertisingWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "ObjectDiscovery stopped advertising, but no client advertising", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateClientsWithReports:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer no current scanners found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateClientsWithReports:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer read event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery ADV Buffer forced-read completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_180_cold_2(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "advBuffersToRead");
  OUTLINED_FUNCTION_9_0(&dword_2175D1000, v3, v4, "ObjectDiscovery ADV Buffers force-read remaining buffers %{private}d", v5, v6, v7, v8, 1u);

  OUTLINED_FUNCTION_0();
}

void __54__WPDObjectDiscoveryManager_updateClientsWithReports___block_invoke_188_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2175D1000, v0, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer client with UUID %{public}@ doesn't exist, but we've still got a scan request for it", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)updateNearbyTokens:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "matchActionRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_9_0(&dword_2175D1000, v4, v5, "ObjectDiscovery calling Nearby tokens setMatchActionRules with %d rules", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_0();
}

- (void)updateNearbyTokens:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "nearbyTokensRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_2175D1000, v1, OS_LOG_TYPE_DEBUG, "ObjectDiscovery Nearby tokens updated to: %@ ", v3, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)updateNearbyTokens:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "ObjectDiscovery Nearby tokens request no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateNearbyTokens:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "ObjectDiscovery Nearby tokens request has changed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)changedScanOptions:Clients:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery manager status %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)changedScanOptions:(uint64_t)a3 Clients:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "ObjectDiscovery ADV Buffer scan options changed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)updateScanRules
{
  NSObject *v7;
  int v8;

  v7 = a2;
  v8 = objc_msgSend(a3, "clientType");
  *(_DWORD *)a1 = 67109120;
  *a4 = v8;
  _os_log_error_impl(&dword_2175D1000, v7, OS_LOG_TYPE_ERROR, "ObjectDiscovery ADV Buffer Request with unexpected client type %d", a1, 8u);

}

- (void)addScanRequest:(void *)a3 forClient:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = 138543618;
  v8 = a1;
  v9 = 2050;
  v10 = objc_msgSend(a3, "clientType");
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v5, v6, "ObjectDiscovery - %{public}@ is already scanning for type %{public}ld. Replacing scan request", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)addScanRequest:(void *)a1 forClient:.cold.2(void *a1)
{
  NSObject *v1;
  _DWORD v2[2];
  __int16 v3;
  int v4;

  OUTLINED_FUNCTION_2_1(a1);
  v2[0] = 67240448;
  v2[1] = 18;
  v3 = 1026;
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_21(), "state");
  _os_log_error_impl(&dword_2175D1000, v1, OS_LOG_TYPE_ERROR, "ObjectDiscovery Failed to start a scan for type %{public}d - central is not powered on %{public}d", (uint8_t *)v2, 0xEu);

  OUTLINED_FUNCTION_8();
}

- (void)addScanRequest:(int)a1 forClient:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_2175D1000, a2, OS_LOG_TYPE_ERROR, "ObjectDiscovery Failed to start a scan for type %{public}d - ObjectDiscoveryManager is not scanning for this type", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)addScanRequest:forClient:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery Adding scan request called for client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)removeScanRequestsForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "ObjectDiscovery Remove scan requests called for client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
