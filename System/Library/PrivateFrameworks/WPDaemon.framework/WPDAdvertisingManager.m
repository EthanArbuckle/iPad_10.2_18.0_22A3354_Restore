@implementation WPDAdvertisingManager

- (WPDAdvertisingManager)initWithServer:(id)a3
{
  id v4;
  WPDAdvertisingManager *v5;
  WPAdvertisingRequestsQueue *v6;
  WPAdvertisingRequestsQueue *advertisingRequests;
  uint64_t v8;
  NSMutableDictionary *clientAdvertisingRequests;
  uint64_t v10;
  NSMutableIndexSet *currentAdvertisers;
  uint64_t v12;
  NSMutableSet *clientsToNotifyOnAddressChange;
  uint64_t v14;
  NSMutableDictionary *publishedServices;
  uint64_t v16;
  NSMutableDictionary *preallocatedServices;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CBPeripheralManager *connectablePeripheralManager;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CBPeripheralManager *nonConnectablePeripheralManager;
  void *v30;
  uint64_t v31;
  NSIndexSet *rangingTypes;
  NSMutableSet *v33;
  NSMutableSet *rangingClients;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  AdvMetrics *v46;
  AdvMetrics *advMetrics;
  xpc_object_t v48;
  _QWORD v50[4];
  WPDAdvertisingManager *v51;
  objc_super v52;
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)WPDAdvertisingManager;
  v5 = -[WPDManager initWithServer:Name:](&v52, sel_initWithServer_Name_, v4, CFSTR("Peripheral"));
  if (v5)
  {
    v6 = objc_alloc_init(WPAdvertisingRequestsQueue);
    advertisingRequests = v5->_advertisingRequests;
    v5->_advertisingRequests = v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    clientAdvertisingRequests = v5->_clientAdvertisingRequests;
    v5->_clientAdvertisingRequests = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v10 = objc_claimAutoreleasedReturnValue();
    currentAdvertisers = v5->_currentAdvertisers;
    v5->_currentAdvertisers = (NSMutableIndexSet *)v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    clientsToNotifyOnAddressChange = v5->_clientsToNotifyOnAddressChange;
    v5->_clientsToNotifyOnAddressChange = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    publishedServices = v5->_publishedServices;
    v5->_publishedServices = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    preallocatedServices = v5->_preallocatedServices;
    v5->_preallocatedServices = (NSMutableDictionary *)v16;

    v18 = objc_alloc(MEMORY[0x24BDBB280]);
    objc_msgSend(v4, "serverQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *MEMORY[0x24BDBB198];
    v20 = v56;
    v21 = MEMORY[0x24BDBD1C8];
    v57[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "initWithDelegate:queue:options:", v5, v19, v22);
    connectablePeripheralManager = v5->_connectablePeripheralManager;
    v5->_connectablePeripheralManager = (CBPeripheralManager *)v23;

    v25 = objc_alloc(MEMORY[0x24BDBB280]);
    objc_msgSend(v4, "serverQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v20;
    v55 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "initWithDelegate:queue:options:", v5, v26, v27);
    nonConnectablePeripheralManager = v5->_nonConnectablePeripheralManager;
    v5->_nonConnectablePeripheralManager = (CBPeripheralManager *)v28;

    v5->_allowCompoundAdvertisements = 1;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addIndex:", 15);
    if (+[WPDaemonServer supportsRanging](WPDaemonServer, "supportsRanging"))
      objc_msgSend(v30, "addIndex:", 19);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexSet:", v30);
    rangingTypes = v5->_rangingTypes;
    v5->_rangingTypes = (NSIndexSet *)v31;

    v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    rangingClients = v5->_rangingClients;
    v5->_rangingClients = v33;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "persistentDomainForName:", CFSTR("com.apple.MobileBluetooth.debug"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("WIPROX"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AllowCompoundAdvertisements"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v5->_allowCompoundAdvertisements = objc_msgSend(v38, "BOOLValue");
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_14);
      v40 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDAdvertisingManager initWithServer:].cold.1((unsigned __int8 *)&v5->_allowCompoundAdvertisements, v40);
    }
    v41 = (void *)MEMORY[0x24BDBCF20];
    v53[0] = v5->_connectablePeripheralManager;
    v53[1] = v5->_nonConnectablePeripheralManager;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setWithArray:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDManager setCbManagers:](v5, "setCbManagers:", v43);

    objc_msgSend(v4, "wpdState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "registerManager:", v5->_connectablePeripheralManager);

    objc_msgSend(v4, "wpdState");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "registerManager:", v5->_nonConnectablePeripheralManager);

    v46 = objc_alloc_init(AdvMetrics);
    advMetrics = v5->_advMetrics;
    v5->_advMetrics = v46;

    v48 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v48, (const char *)*MEMORY[0x24BDAC6B8], 1);
    xpc_dictionary_set_int64(v48, (const char *)*MEMORY[0x24BDAC5B8], *MEMORY[0x24BDAC600]);
    xpc_dictionary_set_int64(v48, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC610]);
    xpc_dictionary_set_string(v48, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __40__WPDAdvertisingManager_initWithServer___block_invoke_139;
    v50[3] = &unk_24D7C6F30;
    v51 = v5;
    xpc_activity_register("com.apple.Bluetoooth.WPDAdvertisingManager", v48, v50);

  }
  return v5;
}

uint64_t __40__WPDAdvertisingManager_initWithServer___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "statsExportTimerFired");
}

- (id)generateStateDumpStrings
{
  WPDAdvertisingManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  uint64_t v63;
  WPDAdvertisingManager *v64;
  uint64_t v65;
  id obj;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v80.receiver = self;
  v80.super_class = (Class)WPDAdvertisingManager;
  -[WPDManager generateStateDumpStrings](&v80, sel_generateStateDumpStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WPDManager isInternalBuild](v2, "isInternalBuild"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[WPDManager advAllowlist](v2, "advAllowlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WPDManager advAllowlist](v2, "advAllowlist");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("all");
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR("allowlisted adv types: %@\n"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    if (v7)
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = -[WPDAdvertisingManager isRanging](v2, "isRanging");
  -[WPDAdvertisingManager rangingClients](v2, "rangingClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ranging %d for clients: %@\n"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = -[WPDAdvertisingManager allowCompoundAdvertisements](v2, "allowCompoundAdvertisements");
  v16 = "no";
  if (v15)
    v16 = "yes";
  objc_msgSend(v14, "stringWithFormat:", CFSTR("allowCompoundAdvertisements: %s\n"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v5;
  objc_msgSend(v5, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[WPDAdvertisingManager clientAdvertisingRequests](v2, "clientAdvertisingRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v20;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v77;
    v63 = *(_QWORD *)v77;
    v64 = v2;
    do
    {
      v24 = 0;
      v65 = v22;
      do
      {
        if (*(_QWORD *)v77 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v24);
        -[WPDAdvertisingManager clientAdvertisingRequests](v2, "clientAdvertisingRequests");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 && objc_msgSend(v27, "count"))
        {
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v67 = v27;
          v28 = v27;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v73;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v73 != v31)
                  objc_enumerationMutation(v28);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@: %@\n"), v25, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v33);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
            }
            while (v30);
          }

          v23 = v63;
          v2 = v64;
          v22 = v65;
          v27 = v67;
        }

        ++v24;
      }
      while (v24 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("all advertising requests (%ld):\n"), objc_msgSend(v18, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v34);

  objc_msgSend(v62, "addObjectsFromArray:", v18);
  v35 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager advertisingRequests](v2, "advertisingRequests");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("currently active requests (%ld):\n"), objc_msgSend(v36, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v37);

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[WPDAdvertisingManager advertisingRequests](v2, "advertisingRequests");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allRequests");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v69 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    }
    while (v41);
  }

  objc_msgSend(v62, "addObject:", CFSTR("currently advertising:\n"));
  v45 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager currentConnectableAdvertisingData](v2, "currentConnectableAdvertisingData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringWithFormat:", CFSTR("    connectable: %@\n"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v47);

  v48 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager currentNonConnectableAdvertisingData](v2, "currentNonConnectableAdvertisingData");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("    non-connectable: %@\n"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v50);

  v51 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager getCurrentAdvertisers](v2, "getCurrentAdvertisers");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringWithFormat:", CFSTR("    types: %@\n"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v53);

  v54 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager preallocatedServices](v2, "preallocatedServices");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringWithFormat:", CFSTR("preallocated services: %@\n"), v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v56);

  v57 = (void *)MEMORY[0x24BDD17C8];
  -[WPDAdvertisingManager publishedServices](v2, "publishedServices");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringWithFormat:", CFSTR("published services: %@\n"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v59);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (void)addCharacteristic:(id)a3 Properties:(unint64_t)a4 Permissions:(unint64_t)a5 Service:(id)a6 Name:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v32 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
  -[WPDAdvertisingManager preallocatedServices](self, "preallocatedServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_2);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v13;
      _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Service with UUID %@ was already pre-allocated", buf, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178_2);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v35 = v32;
      v36 = 2114;
      v37 = (uint64_t)v13;
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ pre-populate GATT database for service: %{public}@, characteristic: %{public}@", buf, 0x20u);
    }
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v12);
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithNSUUID:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB260]), "initWithType:properties:value:permissions:", v30, a4, 0, a5);
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithNSUUID:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB268]), "initWithType:primary:", v20, 1);
    v33 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCharacteristics:", v22);

    -[WPDAdvertisingManager preallocatedServices](self, "preallocatedServices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v14);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_183_2);
    v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend(v21, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "state");
      *(_DWORD *)buf = 138543618;
      v35 = v26;
      v36 = 2048;
      v37 = v28;
      _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "Adding service with UUID %{public}@ with peripheral manager state %ld", buf, 0x16u);

    }
    -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addService:", v21);

  }
}

- (void)preallocateServices
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a1, a3, "Service with UUID %{public}@ is not supported on this product", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)addCharacteristic:(id)a3 forService:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithNSUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBB2A8];
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDWithNSUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDAdvertisingManager publishedServices](self, "publishedServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && (v17 = v11,
        objc_msgSend(v16, "UUID"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqual:", v17),
        v17,
        v18,
        v19))
  {
    if (verifyCharacteristicUUIDforService(v14, v16))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_185_1);
      v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v8, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v9;
        v60 = 2114;
        v61 = (uint64_t)v22;
        v62 = 2114;
        v63 = v10;
        _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "Already published service %{public}@ with characteristic %{public}@ for client %{public}@", buf, 0x20u);

      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_187_3);
      v49 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDAdvertisingManager addCharacteristic:forService:forClient:].cold.2((uint64_t)v9, v49, v8);
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("WPServiceWithoutCharacteristic"), CFSTR("Published service does not have the characteristic"));
    }
  }
  else
  {
    v54 = v16;
    v23 = v8;
    v24 = v11;
    -[WPDAdvertisingManager preallocatedServices](self, "preallocatedServices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_16;
    v27 = v11;
    objc_msgSend(v26, "UUID");
    v28 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqual:", v27);

    v26 = v28;
    if (v30)
    {
      v11 = v24;
      if (verifyCharacteristicUUIDforService(v14, v28))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_194_2);
        v31 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          objc_msgSend(v23, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v9;
          v60 = 2114;
          v61 = (uint64_t)v33;
          v62 = 2114;
          v63 = v10;
          _os_log_impl(&dword_2175D1000, v32, OS_LOG_TYPE_DEFAULT, "Using pre-allocated service %{public}@ with characteristic %{public}@ for client %{public}@", buf, 0x20u);

          v26 = v28;
        }
        -[WPDAdvertisingManager publishedServices](self, "publishedServices");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v26, v10);

        v8 = v23;
        v16 = v54;
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_196_1);
        v8 = v23;
        v50 = (void *)WiProxLog;
        v16 = v54;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDAdvertisingManager addCharacteristic:forService:forClient:].cold.1((uint64_t)v9, v50, v8);
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("WPServiceWithoutCharacteristic"), CFSTR("Pre-allocated service does not have the characteristic"));
      }
    }
    else
    {
LABEL_16:
      v56 = v10;
      v55 = v14;
      v51 = v26;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_200_1);
      v8 = v23;
      v35 = (void *)WiProxLog;
      v16 = v54;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        objc_msgSend(v8, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v9;
        v60 = 2114;
        v61 = (uint64_t)v37;
        v62 = 2114;
        v63 = v10;
        _os_log_impl(&dword_2175D1000, v36, OS_LOG_TYPE_DEFAULT, "Publishing service %{public}@ with characteritic %{public}@ for client %{public}@", buf, 0x20u);

      }
      v53 = v9;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB260]), "initWithType:properties:value:permissions:", v14, objc_msgSend(v8, "properties"), 0, objc_msgSend(v8, "permissions"));
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB268]), "initWithType:primary:", v24, 1);
      v57 = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCharacteristics:", v40);

      -[WPDAdvertisingManager publishedServices](self, "publishedServices");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v39, v10);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_202_0);
      v42 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        objc_msgSend(v39, "UUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "UUIDString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "state");
        *(_DWORD *)buf = 138412546;
        v59 = v45;
        v60 = 2048;
        v61 = v47;
        _os_log_impl(&dword_2175D1000, v43, OS_LOG_TYPE_DEFAULT, "Adding service with UUID %@ with peripheral manager state %ld", buf, 0x16u);

      }
      -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager", v51);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addService:", v39);

      v26 = v52;
      v9 = v53;
      v14 = v55;
      v10 = v56;
      v11 = v24;
    }

  }
}

- (void)removeServiceForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPDAdvertisingManager publishedServices](self, "publishedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_203_1);
    v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v6, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Removing service %{public}@ for client %{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(v6, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDAdvertisingManager NSUUIDfromCBUUID:](self, "NSUUIDfromCBUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDAdvertisingManager preallocatedServices](self, "preallocatedServices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_205_2);
      v14 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v11;
        _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "Unpublishing service %{public}@, since it was not pre-allocated", (uint8_t *)&v17, 0xCu);
      }
      -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeService:", v6);

    }
    -[WPDAdvertisingManager publishedServices](self, "publishedServices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v4);

  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_206_0);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDAdvertisingManager peripheralManager:didAddService:error:].cold.1(v11, v9, v10);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_208);
    v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v9, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "characteristics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "Added service with UUID %{public}@ and characteristics %{public}@", (uint8_t *)&v16, 0x16u);

    }
    -[WPDAdvertisingManager updateAdvertiser](self, "updateAdvertiser");
  }

}

- (BOOL)isRanging
{
  return -[NSMutableSet count](self->_rangingClients, "count") != 0;
}

- (void)enableRanging:(BOOL)a3 forClient:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_209);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPAdvertisingManager enable ranging:%d for client: %@", (uint8_t *)v11, 0x12u);
  }
  -[WPDAdvertisingManager rangingClients](self, "rangingClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "addObject:", v6);
  else
    objc_msgSend(v8, "removeObject:", v6);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_211_1);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDAdvertisingManager enableRanging:forClient:].cold.1(v4, v10, self);
  if (-[WPDManager state](self, "state") == 3)
    -[WPDAdvertisingManager updateAdvertiser](self, "updateAdvertiser");

}

- (id)addAdvertisingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "clientType");
  objc_msgSend(v6, "advertisingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 < 0x17)
  {
    if (-[WPDManager state](self, "state") == 3)
    {
      v17 = objc_msgSend(v6, "clientType");
      -[WPDManager server](self, "server");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "statsManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startActivity:forType:", 1, v17);

      -[WPDManager server](self, "server");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "statsManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "resetActivity:forType:", 1, v17);

      -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isAdvertisingForClientType:", v8);

      if (v23)
        v24 = -[WPDAdvertisingManager removeAdvertisingRequest:forClient:shouldUpdate:](self, "removeAdvertisingRequest:forClient:shouldUpdate:", v6, v7, 0);
      -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "add:", v6);

      -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v7);

      }
      -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v6);

      -[WPDAdvertisingManager updateAdvertiser](self, "updateAdvertiser");
      v13 = 0;
    }
    else
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FC8];
      v37 = CFSTR("CoreBluetooth is currently powered off");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_219);
      v34 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDAdvertisingManager addAdvertisingRequest:forClient:].cold.2(v34, v6, self);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("The payload size is too large");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 12, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_215_0);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDAdvertisingManager addAdvertisingRequest:forClient:].cold.1(v14, v15, v16);
  }

  return v13;
}

- (void)addAdvertisingRequest:(id)a3 forDaemon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WPDAdvertisingManager_addAdvertisingRequest_forDaemon___block_invoke;
  block[3] = &unk_24D7C7198;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __57__WPDAdvertisingManager_addAdvertisingRequest_forDaemon___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "addAdvertisingRequest:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "isRanging");
    v2 = 0;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "enableRanging:forClient:", 1, *(_QWORD *)(a1 + 48));
      v2 = 0;
    }
  }

}

- (id)removeAdvertisingRequestsForClient:(id)a3
{
  return -[WPDAdvertisingManager removeAdvertisingRequest:forClient:](self, "removeAdvertisingRequest:forClient:", 0, a3);
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4
{
  return -[WPDAdvertisingManager removeAdvertisingRequest:forClient:shouldUpdate:](self, "removeAdvertisingRequest:forClient:shouldUpdate:", a3, a4, 1);
}

- (void)removeAdvertisingRequest:(id)a3 forDaemon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WPDAdvertisingManager_removeAdvertisingRequest_forDaemon___block_invoke;
  block[3] = &unk_24D7C7198;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __60__WPDAdvertisingManager_removeAdvertisingRequest_forDaemon___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "removeAdvertisingRequest:forClient:shouldUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(a1 + 32), "rangingClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "enableRanging:forClient:", 0, *(_QWORD *)(a1 + 48));
}

- (id)removeAdvertisingRequest:(id)a3 forClient:(id)a4 shouldUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  WPDAdvertisingManager *v26;
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v5 = a5;
  v36[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    v34 = 0;
    v12 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CoreBluetooth isn't advertising for client type %d"), objc_msgSend(v8, "clientType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 11, v14);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __73__WPDAdvertisingManager_removeAdvertisingRequest_forClient_shouldUpdate___block_invoke_223;
    v24[3] = &unk_24D7C7200;
    v18 = v8;
    v25 = v18;
    v26 = self;
    v28 = buf;
    v19 = v17;
    v27 = v19;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v24);
    -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v9);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v9);
    }

    if (v5)
      -[WPDAdvertisingManager updateAdvertiser](self, "updateAdvertiser");
    v22 = *((id *)v30 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_220_2);
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "Trying to remove an advertising request when there are no advert requests", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

void __73__WPDAdvertisingManager_removeAdvertisingRequest_forClient_shouldUpdate___block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  unsigned int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _DWORD v23[2];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    && (v5 = objc_msgSend(v3, "clientType"), v5 != objc_msgSend(*(id *)(a1 + 32), "clientType")))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }
  else
  {
    v6 = objc_msgSend(v4, "clientType");
    objc_msgSend(*(id *)(a1 + 40), "currentAdvertisers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsIndex:", v6);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "currentAdvertisers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeIndex:", v6);

      objc_msgSend(*(id *)(a1 + 40), "clientsToNotifyOnAddressChange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v11);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_225_0);
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 40);
        v14 = v12;
        objc_msgSend(v13, "clientsToNotifyOnAddressChange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = 67109378;
        v23[1] = v6;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "[Privacy] removeAdvertisingRequest: %d, %@", (uint8_t *)v23, 0x12u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setCurrentConnectableAdvertisingData:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setCurrentNonConnectableAdvertisingData:", 0);
    }
    objc_msgSend(*(id *)(a1 + 40), "advertisingRequests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remove:", v4);

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 40), "server");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "statsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stopActivity:forType:", 1, v6);

    objc_msgSend(*(id *)(a1 + 40), "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "statsManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resetActivity:forType:", 1, v6);

  }
}

- (id)getCurrentAdvertisers
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WPDAdvertisingManager_getCurrentAdvertisers__block_invoke;
  v7[3] = &unk_24D7C5F90;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);

  return v5;
}

uint64_t __46__WPDAdvertisingManager_getCurrentAdvertisers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lu "), a2);
}

- (void)updateAdvertiser
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEBUG, "Advertising data did not change.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

void __41__WPDAdvertisingManager_updateAdvertiser__block_invoke_238(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = *MEMORY[0x24BDBAFB0];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v7, "connectablePeripheralManager");
  else
    objc_msgSend(v7, "nonConnectablePeripheralManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startAdvertising:", v4);

}

- (id)addXPCDelayTiming:(id)a3 IsMetricOnly:(BOOL)a4 UseCase:(unint64_t)a5 timeStamp:(unint64_t)a6
{
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCED8];
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!a6)
    a6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a6);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("kCBMsgArgTimeXpcWiProxUpdateAdv"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", a5);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDBB1A0]);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v8);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("kCBMsgArgTimeXpcMetricsOnlyFlag"));

  return v9;
}

- (id)requestFromAdvertisingDataConnectable:(BOOL)a3 AddressChangeNotificationNeeded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *context;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v4 = a4;
  v5 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  if (a3)
    -[WPDAdvertisingManager currentConnectableAdvertisingData](self, "currentConnectableAdvertisingData");
  else
    -[WPDAdvertisingManager currentNonConnectableAdvertisingData](self, "currentNonConnectableAdvertisingData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v6, "getData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_29:
    v15 = 0;
    goto LABEL_30;
  }
  context = (void *)MEMORY[0x219A0EE8C]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDBAF90]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB188]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "advertRate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBB1A8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBAFB0]);

  v12 = objc_msgSend(v7, "isRanging");
  if (v12)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBAF80]);
  if (v4)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBAF88]);
  v13 = objc_msgSend(v7, "assertPower");
  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB1B0]);
  v14 = "";
  if (objc_msgSend(v7, "enableEPAForAdvertisement"))
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB008]);
    v14 = "[enableEPA]";
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 | v4 | v13) == 1)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_240_0);
    v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "[Privacy] ";
      *(_DWORD *)buf = 136316418;
      v18 = "[Ranging] ";
      if (!v12)
        v18 = "";
      v19 = "[AssertPower] ";
      if (!v13)
        v19 = "";
      if (!v4)
        v17 = "";
      v24 = v17;
      v25 = 2080;
      v26 = v18;
      v27 = 2080;
      v28 = v19;
      v29 = 2080;
      v20 = "AddrChangeNotificationNeeded ";
      if (!v4)
        v20 = "";
      v30 = v20;
      v31 = 2080;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "%s%s%sAdvertisingRulesiOS: %sadv packet: %s %@ ", buf, 0x3Eu);
    }
  }

  objc_autoreleasePoolPop(context);
LABEL_30:

  return v15;
}

- (id)advertisingRules
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  unsigned int v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  unsigned int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  char v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  void *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  int v122;
  _BOOL4 v123;
  uint64_t v124;
  _BOOL4 v125;
  int v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  _QWORD v132[5];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  unint64_t v148;
  __int16 v149;
  unint64_t v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "count");

  if (!v4)
    return v4;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllIndexes");

  v123 = -[WPDAdvertisingManager isAdvertiserTestMode](self, "isAdvertiserTestMode");
  v125 = -[WPDAdvertisingManager heySiriAdvertActive:](self, "heySiriAdvertActive:");
  -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= 2)
  {
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
  v117 = v5;
  v119 = v13;
  v120 = v6;
  if (!v14)
  {
    v121 = 0;
    goto LABEL_102;
  }
  v15 = v14;
  v121 = 0;
  v128 = *(_QWORD *)v142;
  do
  {
    v16 = 0;
    v124 = v15;
    do
    {
      if (*(_QWORD *)v142 != v128)
        objc_enumerationMutation(v13);
      v17 = *(id *)(*((_QWORD *)&v141 + 1) + 8 * v16);
      if (-[WPDManager isAdvertisingAllowlistedForType:](self, "isAdvertisingAllowlistedForType:", objc_msgSend(v17, "clientType")))
      {
        if (v125 && objc_msgSend(v17, "clientType") != 8)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_252_0);
          v38 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
          {
            v30 = v38;
            v39 = objc_msgSend(v17, "clientType");
            *(_DWORD *)buf = 134217984;
            v148 = v39;
            v32 = v30;
            v33 = OS_LOG_TYPE_INFO;
            v34 = "Not advertising for client type (%ld) when HeySiri is active";
            goto LABEL_25;
          }
        }
        else
        {
          -[WPDAdvertisingManager clientForAdvRequest:](self, "clientForAdvRequest:", v17);
          v18 = objc_claimAutoreleasedReturnValue();
          v130 = (void *)v18;
          if (!v123
            || v18
            && (-[WPDManager server](self, "server"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "isClientTestMode:", v130),
                v19,
                (v20 & 1) != 0))
          {
            objc_msgSend(v17, "advertisementRequestedAt");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v17, "advertisementRequestedAt");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v22, "longLongValue");

            }
            -[WPDManager server](self, "server");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "getClientForUUID:", v130);
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            v126 = objc_msgSend(v17, "connectable");
            v24 = &OBJC_IVAR___WPDAdvertisingManager__nonConnectableAdvTotalCount;
            if (v126)
              v24 = &OBJC_IVAR___WPDAdvertisingManager__connectableAdvTotalCount;
            ++*(Class *)((char *)&self->super.super.isa + *v24);
            v25 = objc_msgSend(v5, "isValidWithAdditionalRequest:", v17);
            if ((objc_msgSend(v6, "isValidWithAdditionalRequest:", v17) & 1) != 0)
            {
              v26 = v6;
              v27 = v5;
              v28 = 1;
              goto LABEL_44;
            }
            if (objc_msgSend(v17, "clientType") == 10)
            {
              v40 = (id)objc_msgSend(v17, "copy");
              v41 = v6;
              v42 = v6;
              v43 = v41;
              v44 = 0;
              buf[0] = 0;
              if (!v42
                || !v40
                || (objc_msgSend(v40, "advertisingData"),
                    v45 = (void *)objc_claimAutoreleasedReturnValue(),
                    (v44 = v45) == 0)
                || (objc_msgSend(v45, "getBytes:range:", buf, 0, 1), (buf[0] & 0x10) == 0))
              {

                v46 = 0;
                v47 = v40;
                goto LABEL_41;
              }
              buf[0] &= ~0x10u;
              v70 = (void *)MEMORY[0x24BDBCEC8];
              objc_msgSend(v44, "subdataWithRange:", 0, objc_msgSend(v44, "length") - 3);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "dataWithData:", v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v72, "replaceBytesInRange:withBytes:", 0, 1, buf);
              objc_msgSend(v40, "setAdvertisingData:", v72);
              LODWORD(v71) = objc_msgSend(v43, "isValidWithAdditionalRequest:", v40);

              if ((_DWORD)v71)
              {
                v73 = v40;
                v47 = v17;
                v46 = 1;
                v17 = v73;
LABEL_41:
                v13 = v119;
                v26 = v120;
                v27 = v5;

              }
              else
              {
                v27 = v5;
                v46 = 0;
                v13 = v119;
                v26 = v120;
              }

              v28 = v46;
            }
            else
            {
              v26 = v6;
              v27 = v5;
              v28 = 0;
            }
LABEL_44:
            -[AdvMetrics incrementTotalAdvCountforType:](self->_advMetrics, "incrementTotalAdvCountforType:", objc_msgSend(v17, "clientType"));
            if (((v126 | v28 & -[WPDAdvertisingManager platformSupportsMultipleAdvertising](self, "platformSupportsMultipleAdvertising") ^ 1) & 1) == 0)
            {
              v48 = v26;
              objc_msgSend(v127, "bundleID");
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52)
              {
                objc_msgSend(v127, "bundleID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "addObject:", v50);
                v51 = v130;
                v5 = v27;
                v6 = v26;
LABEL_51:

              }
              else
              {
                v51 = v130;
                v5 = v27;
                v6 = v26;
              }
              goto LABEL_70;
            }
            v122 = v28;
            if (v25)
            {
              v5 = v27;
              if (objc_msgSend(v17, "isValidOnConnectableInstance"))
              {
                v48 = v27;
                objc_msgSend(v127, "bundleID");
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                v6 = v26;
                if (v49)
                {
                  objc_msgSend(v127, "bundleID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v116, "addObject:", v50);
                  v51 = v130;
                  goto LABEL_51;
                }
                v51 = v130;
LABEL_70:
                objc_msgSend(v48, "addAdvertisingRequest:", v17);
                if (-[WPDAdvertisingManager isRanging](self, "isRanging"))
                {
                  -[WPDAdvertisingManager rangingTypes](self, "rangingTypes");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = objc_msgSend(v62, "containsIndex:", objc_msgSend(v17, "clientType"));

                  if (v63)
                  {
                    if (objc_msgSend(v17, "clientType") == 2)
                    {
                      objc_msgSend(v17, "advertisingData");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = objc_msgSend(v64, "length");
                      v66 = objc_msgSend(v48, "isRanging");
                      if (v65 == 22)
                        v67 = 1;
                      else
                        v67 = v66;
                      objc_msgSend(v48, "setIsRanging:", v67);

                    }
                    else
                    {
                      objc_msgSend(v48, "setIsRanging:", 1);
                    }
                  }
                }
                objc_msgSend(v48, "setAssertPower:", objc_msgSend(v17, "holdVoucher") | objc_msgSend(v48, "assertPower"));
                if (objc_msgSend(v17, "stopOnAdvertisingAddressChange"))
                {
                  -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v17, "clientType"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "addObject:", v69);

                }
                if (!-[WPDAdvertisingManager allowCompoundAdvertisements](self, "allowCompoundAdvertisements"))
                {

                  goto LABEL_102;
                }
LABEL_92:

                v15 = v124;
                goto LABEL_93;
              }
              -[WPDAdvertisingManager informClientsAdvertisingPending:](self, "informClientsAdvertisingPending:", v17);
              v6 = v26;
              if (((v126 | v122) & 1) != 0)
              {
                v48 = 0;
                v51 = v130;
                goto LABEL_92;
              }
              if ((objc_msgSend(v17, "isValidOnConnectableInstance") & 1) != 0)
              {
LABEL_80:
                v48 = 0;
LABEL_91:
                v51 = v130;
                goto LABEL_92;
              }
LABEL_61:
              ++self->_nonConnectableAdvDropCount;
              -[AdvMetrics incrementTotalDroppedAdvCountforType:](self->_advMetrics, "incrementTotalDroppedAdvCountforType:", objc_msgSend(v17, "clientType"));
              v135 = 0u;
              v136 = 0u;
              v133 = 0u;
              v134 = 0u;
              objc_msgSend(v6, "types");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
              if (v58)
              {
                v59 = v58;
                v60 = *(_QWORD *)v134;
                do
                {
                  for (i = 0; i != v59; ++i)
                  {
                    if (*(_QWORD *)v134 != v60)
                      objc_enumerationMutation(v53);
                    -[AdvMetrics incrementDroppedAdvCountforType:by:](self->_advMetrics, "incrementDroppedAdvCountforType:by:", objc_msgSend(v17, "clientType"), objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * i), "unsignedShortValue"));
                  }
                  v59 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
                }
                while (v59);
                v5 = v117;
                v13 = v119;
                v6 = v120;
              }
            }
            else
            {
              -[WPDAdvertisingManager informClientsAdvertisingPending:](self, "informClientsAdvertisingPending:", v17);
              v5 = v27;
              if (!v126)
              {
                v6 = v26;
                if ((v122 & 1) != 0)
                  goto LABEL_80;
                goto LABEL_61;
              }
              ++self->_connectableAdvDropCount;
              -[AdvMetrics incrementTotalDroppedAdvCountforType:](self->_advMetrics, "incrementTotalDroppedAdvCountforType:", objc_msgSend(v17, "clientType"));
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              objc_msgSend(v27, "types");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
              if (v54)
              {
                v55 = v54;
                v56 = *(_QWORD *)v138;
                do
                {
                  for (j = 0; j != v55; ++j)
                  {
                    if (*(_QWORD *)v138 != v56)
                      objc_enumerationMutation(v53);
                    -[AdvMetrics incrementDroppedAdvCountforType:by:](self->_advMetrics, "incrementDroppedAdvCountforType:by:", objc_msgSend(v17, "clientType"), objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * j), "unsignedShortValue"));
                  }
                  v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
                }
                while (v55);

                v5 = v117;
                v13 = v119;
                v6 = v120;
                if (((v126 | v122) & 1) != 0)
                  goto LABEL_80;
                goto LABEL_61;
              }
              v6 = v26;
            }

            v48 = 0;
            goto LABEL_91;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_254_0);
          v15 = v124;
          v35 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
          {
            v36 = v35;
            v37 = objc_msgSend(v17, "clientType");
            *(_DWORD *)buf = 138412546;
            v148 = (unint64_t)v130;
            v149 = 2048;
            v150 = v37;
            _os_log_impl(&dword_2175D1000, v36, OS_LOG_TYPE_INFO, "Not advertising for non-test client UUID: %@ type (%ld) when in test mode", buf, 0x16u);

          }
        }
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_250_0);
        v29 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = objc_msgSend(v17, "clientType");
          *(_DWORD *)buf = 134217984;
          v148 = v31;
          v32 = v30;
          v33 = OS_LOG_TYPE_DEFAULT;
          v34 = "Not advertising for client type (%ld) when denylisted or not allowlisted";
LABEL_25:
          _os_log_impl(&dword_2175D1000, v32, v33, v34, buf, 0xCu);

        }
      }
LABEL_93:

      ++v16;
    }
    while (v16 != v15);
    v74 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v141, v151, 16);
    v15 = v74;
  }
  while (v74);
LABEL_102:

  v75 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v5, "types");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setWithSet:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_256_1);
  v78 = (id)WiProxLog;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v148 = (unint64_t)v77;
    v149 = 2112;
    v150 = (unint64_t)v79;
    _os_log_impl(&dword_2175D1000, v78, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: current connectable advertisers: %@, current clients for address change notification: %@", buf, 0x16u);

  }
  -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minusSet:", v80);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_258_1);
  v81 = (id)WiProxLog;
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v148 = (unint64_t)v77;
    v149 = 2112;
    v150 = (unint64_t)v82;
    _os_log_impl(&dword_2175D1000, v81, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: remaining connectable advertisers: %@, notification clients: %@", buf, 0x16u);

  }
  v129 = objc_msgSend(v77, "count");
  v83 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "types");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setWithSet:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_260_1);
  v86 = (id)WiProxLog;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v148 = (unint64_t)v85;
    v149 = 2112;
    v150 = (unint64_t)v87;
    _os_log_impl(&dword_2175D1000, v86, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: current non-connectable advertisers: %@, current clients for address change notification: %@", buf, 0x16u);

    v5 = v117;
  }

  -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "minusSet:", v88);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_262_0);
  v131 = v77;
  v89 = (id)WiProxLog;
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v148 = (unint64_t)v85;
    v149 = 2112;
    v150 = (unint64_t)v90;
    _os_log_impl(&dword_2175D1000, v89, OS_LOG_TYPE_DEFAULT, "[Privacy] AdvertisingRulesiOS: remaining non-connectable advertisers: %@, notification clients: %@", buf, 0x16u);

    v5 = v117;
  }

  v91 = objc_msgSend(v85, "count");
  v92 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v5, "types");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setWithSet:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "types");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "unionSet:", v95);

  v132[0] = MEMORY[0x24BDAC760];
  v132[1] = 3221225472;
  v132[2] = __41__WPDAdvertisingManager_advertisingRules__block_invoke_263;
  v132[3] = &unk_24D7C73A8;
  v132[4] = self;
  objc_msgSend(v94, "enumerateObjectsUsingBlock:", v132);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_265);
  v96 = (id)WiProxLog;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    -[WPDAdvertisingManager getCurrentAdvertisers](self, "getCurrentAdvertisers");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v148 = (unint64_t)v97;
    _os_log_impl(&dword_2175D1000, v96, OS_LOG_TYPE_DEFAULT, "AdvertisingRulesiOS - current advertisers: %{public}@", buf, 0xCu);

  }
  -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "count");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingManager currentConnectableAdvertisingData](self, "currentConnectableAdvertisingData");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v117, "isEqualToData:", v101) & 1) != 0)
  {
    -[WPDAdvertisingManager currentNonConnectableAdvertisingData](self, "currentNonConnectableAdvertisingData");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v120, "isEqualToData:", v102);

    if ((v103 & 1) != 0)
      goto LABEL_137;
  }
  else
  {

  }
  -[WPDAdvertisingManager setCurrentConnectableAdvertisingData:](self, "setCurrentConnectableAdvertisingData:", v117);
  -[WPDAdvertisingManager setCurrentNonConnectableAdvertisingData:](self, "setCurrentNonConnectableAdvertisingData:", v120);
  -[WPDAdvertisingManager requestFromAdvertisingDataConnectable:AddressChangeNotificationNeeded:](self, "requestFromAdvertisingDataConnectable:AddressChangeNotificationNeeded:", 1, v129 == 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "count"))
    {
      objc_msgSend(v116, "allObjects");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v106, *MEMORY[0x24BDBB190]);

    }
    objc_msgSend(v100, "addObject:", v105);

  }
  -[WPDAdvertisingManager requestFromAdvertisingDataConnectable:AddressChangeNotificationNeeded:](self, "requestFromAdvertisingDataConnectable:AddressChangeNotificationNeeded:", 0, v91 == 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "count"))
    {
      objc_msgSend(v118, "allObjects");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setObject:forKeyedSubscript:", v109, *MEMORY[0x24BDBB190]);

    }
    if (v121)
    {
      v110 = (void *)MEMORY[0x24BDBCED8];
      -[WPDAdvertisingManager addXPCDelayTiming:IsMetricOnly:UseCase:timeStamp:](self, "addXPCDelayTiming:IsMetricOnly:UseCase:timeStamp:", v108, 1, 22);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "dictionaryWithDictionary:", v111);
      v112 = objc_claimAutoreleasedReturnValue();

      v108 = (void *)v112;
    }
    objc_msgSend(v100, "addObject:", v108);

  }
LABEL_137:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_267_0);
  v113 = (id)WiProxLog;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v148 = (unint64_t)v100;
    _os_log_impl(&dword_2175D1000, v113, OS_LOG_TYPE_DEFAULT, "AdvertisingRulesiOS - advertising packets: %{public}@", buf, 0xCu);
  }

  if (v99)
  {
    if (objc_msgSend(v100, "count"))
      v4 = v100;
    else
      v4 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[WPDAdvertisingManager setCurrentConnectableAdvertisingData:](self, "setCurrentConnectableAdvertisingData:", 0);
    -[WPDAdvertisingManager setCurrentNonConnectableAdvertisingData:](self, "setCurrentNonConnectableAdvertisingData:", 0);
    -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "removeAllIndexes");

    v4 = 0;
  }

  return v4;
}

void __41__WPDAdvertisingManager_advertisingRules__block_invoke_263(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentAdvertisers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  objc_msgSend(v5, "addIndex:", v4);
}

- (BOOL)isAdvertiserTestMode
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v13[6];
  uint64_t v14;
  _QWORD v15[2];
  char v16;

  v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x2020000000;
  v16 = 0;
  if (-[WPDManager testMode](self, "testMode"))
  {
    -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__WPDAdvertisingManager_isAdvertiserTestMode__block_invoke;
    v13[3] = &unk_24D7C59E0;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_269);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDAdvertisingManager isAdvertiserTestMode].cold.1((uint64_t)v15, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = *(_BYTE *)(v15[0] + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

void __45__WPDAdvertisingManager_isAdvertiserTestMode__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isClientTestMode:", v8);

  if ((_DWORD)v7)
  {
    v10 = objc_msgSend(v12, "count");

    v11 = v12;
    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

    v11 = v12;
  }

}

- (BOOL)heySiriAdvertActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[WPDManager isHomePod](self, "isHomePod"))
    return 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      if (objc_msgSend(v11, "clientType") == 8)
      {
        if (!v3)
          break;
        -[WPDAdvertisingManager clientForAdvRequest:](self, "clientForAdvRequest:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[WPDManager server](self, "server");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isClientTestMode:", v13);

          if ((v15 & 1) != 0)
            break;
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v8)
          goto LABEL_4;

        v16 = 0;
        v17 = 1;
        goto LABEL_23;
      }
    }

    if (-[WPDManager isAdvertisingAllowlistedForType:](self, "isAdvertisingAllowlistedForType:", 8))
    {
      v17 = 0;
      v16 = 1;
      goto LABEL_23;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_274_0);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri advertising is denylisted or not allowlisted", buf, 2u);
    }
  }
  else
  {

  }
  v16 = 0;
  v17 = 1;
LABEL_23:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_276_0);
  v19 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v20 = CFSTR("YES");
    if (v17)
      v20 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v27 = v20;
    _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_INFO, "heySiriAdvertActive: %@", buf, 0xCu);
  }
  return v16;
}

- (BOOL)heySiriAdvertActiveAllDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const __CFString *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "clientType") == 8)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (-[WPDManager isAdvertisingAllowlistedForType:](self, "isAdvertisingAllowlistedForType:", 8))
    {
      v9 = 1;
      goto LABEL_17;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_277_0);
    v10 = WiProxLog;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri advertising is denylisted or not allowlisted", buf, 2u);
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

LABEL_16:
    v9 = 0;
  }
LABEL_17:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_279_0);
  v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("NO");
    if (v9)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_INFO, "heySiriAdvertActive: %@", buf, 0xCu);
  }
  return v9;
}

- (id)clientForAdvRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__WPDAdvertisingManager_clientForAdvRequest___block_invoke;
  v9[3] = &unk_24D7C59E0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__WPDAdvertisingManager_clientForAdvRequest___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)informClientsAdvertisingPending:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke;
  v13[3] = &unk_24D7C68D0;
  v8 = v4;
  v14 = v8;
  v15 = v5;
  v10 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke_2;
  v11[3] = &unk_24D7C45D8;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "clientType");
        if (v11 == objc_msgSend(*(id *)(a1 + 32), "clientType"))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __57__WPDAdvertisingManager_informClientsAdvertisingPending___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "server");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getClientForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "advertisingPendingOfType:", objc_msgSend(*(id *)(a1 + 40), "clientType"));
}

- (void)resetAdvertisingManager
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WPDManager server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopActivity:", 1);

  -[WPDAdvertisingManager setCurrentConnectableAdvertisingData:](self, "setCurrentConnectableAdvertisingData:", 0);
  -[WPDAdvertisingManager setCurrentNonConnectableAdvertisingData:](self, "setCurrentNonConnectableAdvertisingData:", 0);
  -[WPDAdvertisingManager publishedServices](self, "publishedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[WPDAdvertisingManager preallocatedServices](self, "preallocatedServices");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (void)update
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];
  uint8_t v12[16];

  switch(-[WPDManager state](self, "state"))
  {
    case 0:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_287_0);
      v3 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "Peripheral manager is unknown state", v9, 2u);
      }
      break;
    case 1:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_283_1);
      v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Peripheral manager is resetting, clearing currently advertising manager data", buf, 2u);
      }
      -[WPDAdvertisingManager resetAdvertisingManager](self, "resetAdvertisingManager");
      break;
    case 2:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_281_0);
      v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "Peripheral manager is powered off, unauthorized or not supported", v12, 2u);
      }
      -[WPDManager server](self, "server");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "statsManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopActivity:", 1);

      break;
    case 3:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_285_0);
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Peripheral manager is powered on", v10, 2u);
      }
      -[WPDAdvertisingManager preallocateServices](self, "preallocateServices");
      -[WPDAdvertisingManager updateAdvertiser](self, "updateAdvertiser");
      break;
    default:
      return;
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDAdvertisingManager nonConnectablePeripheralManager](self, "nonConnectablePeripheralManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    -[WPDAdvertisingManager connectablePeripheralManager](self, "connectablePeripheralManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAdvertising");

    if ((v10 & 1) != 0)
      goto LABEL_20;
  }
  else
  {

  }
  -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_290);
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      -[WPDAdvertisingManager getCurrentAdvertisers](self, "getCurrentAdvertisers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_INFO, "Current advertisers %{public}@", buf, 0xCu);

    }
    if (v7)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_292_1);
      v16 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDAdvertisingManager peripheralManagerDidStartAdvertising:error:].cold.1(v16, v7);
    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDAdvertisingManager currentAdvertisers](self, "currentAdvertisers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_293;
    v24[3] = &unk_24D7C5F90;
    v25 = v17;
    v20 = v17;
    objc_msgSend(v18, "enumerateIndexesUsingBlock:", v24);

    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_295;
    v22[3] = &unk_24D7C75F8;
    v22[4] = self;
    v23 = v7;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_288);
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "Started advertising while client asked to stop advertising - stopping advertising", buf, 2u);
    }
    objc_msgSend(v6, "stopAdvertising");
  }
LABEL_20:

}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_293(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t buf[16];

  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_294_1);
    v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "Got NSNotFound as an advertising index", buf, 2u);
    }
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_295(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v3 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "clientAdvertisingRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_2_296;
  v6[3] = &unk_24D7C75D0;
  v8 = v3;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __68__WPDAdvertisingManager_peripheralManagerDidStartAdvertising_error___block_invoke_2_296(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  dispatch_once_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  dispatch_once_t *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v9 = v7;
    v10 = &WPLogInitOnce;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 67109378;
    v25 = v8;
    do
    {
      v12 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "clientType", v25) == *(unsigned __int8 *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "server");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "getClientForUUID:", v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (*v10 != -1)
            dispatch_once(v10, &__block_literal_global_297);
          v15 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v11;
            v17 = v6;
            v18 = v5;
            v19 = v10;
            v20 = *(unsigned __int8 *)(a1 + 48);
            v21 = *(void **)(a1 + 40);
            v22 = v15;
            objc_msgSend(v21, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v32 = v20;
            v10 = v19;
            v5 = v18;
            v6 = v17;
            v11 = v16;
            v33 = 2112;
            v34 = v23;
            _os_log_impl(&dword_2175D1000, v22, OS_LOG_TYPE_DEFAULT, "Started to advertise for type %d with error %@", buf, 0x12u);

            v9 = v26;
          }
          v24 = *(_QWORD *)(a1 + 40);
          if (v24)
            objc_msgSend(v14, "advertisingFailedToStart:ofType:", v24, *(unsigned __int8 *)(a1 + 48));
          else
            objc_msgSend(v14, "advertisingStartedOfType:", *(unsigned __int8 *)(a1 + 48));

        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v9);
  }

}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[6];
  BOOL v30;
  _QWORD v31[6];
  __int128 v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_298);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "[Privacy] Did stop advertising with error: %@", (uint8_t *)&buf, 0xCu);

  }
  if (objc_msgSend(v7, "code") == 8)
  {
    -[WPDAdvertisingManager clientsToNotifyOnAddressChange](self, "clientsToNotifyOnAddressChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 0;

    if (v12)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_300);
      v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDAdvertisingManager peripheralManager:didStopAdvertisingWithError:].cold.1(v25, v26, v27);
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__4;
      v44 = __Block_byref_object_dispose__4;
      v45 = 0;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      -[WPDAdvertisingManager advertisingRequests](self, "advertisingRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allRequests");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_301;
      v31[3] = &unk_24D7C7660;
      v31[4] = self;
      v31[5] = &buf;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v31);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_303_0);
      v16 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v37 = 138412546;
        *(_QWORD *)&v37[4] = v14;
        *(_WORD *)&v37[12] = 2112;
        *(_QWORD *)&v37[14] = v17;
        _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "[Privacy] current all adv requests: %@, advRequestsToRemove: %@", v37, 0x16u);
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_305_0);
      v18 = (id)WiProxLog;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[WPDAdvertisingManager clientAdvertisingRequests](self, "clientAdvertisingRequests");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v37 = 138412290;
        *(_QWORD *)&v37[4] = v19;
        _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "[Privacy] advertising clients: %@", v37, 0xCu);

      }
      -[WPDAdvertisingManager nonConnectablePeripheralManager](self, "nonConnectablePeripheralManager");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)v37 = 0;
      *(_QWORD *)&v37[8] = v37;
      *(_QWORD *)&v37[16] = 0x3032000000;
      v38 = __Block_byref_object_copy__4;
      v39 = __Block_byref_object_dispose__4;
      v40 = 0;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_306;
      v29[3] = &unk_24D7C76F0;
      v30 = v20 != v6;
      v29[4] = self;
      v29[5] = v37;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v29);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_308_1);
      v22 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(*(_QWORD *)&v37[8] + 40);
        LODWORD(v32) = 138412290;
        *(_QWORD *)((char *)&v32 + 4) = v23;
        _os_log_impl(&dword_2175D1000, v22, OS_LOG_TYPE_DEFAULT, "[Privacy] advClientRequestsToRemoveDict: %@", (uint8_t *)&v32, 0xCu);
      }
      *(_QWORD *)&v32 = 0;
      *((_QWORD *)&v32 + 1) = &v32;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__4;
      v35 = __Block_byref_object_dispose__4;
      v36 = 0;
      v24 = *(void **)(*(_QWORD *)&v37[8] + 40);
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_309;
      v28[3] = &unk_24D7C7738;
      v28[4] = self;
      v28[5] = &v32;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v28);
      _Block_object_dispose(&v32, 8);

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(&buf, 8);

    }
  }

}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_301(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientsToNotifyOnAddressChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v6, "clientType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_306(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientAdvertisingRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_2_307;
  v7[3] = &unk_24D7C76C8;
  v10 = *(_BYTE *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_2_307(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_5;
    if ((objc_msgSend(*(id *)(a1 + 32), "connectable") & 1) != 0)
    {
LABEL_6:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), v5);
      goto LABEL_7;
    }
    if (!*(_BYTE *)(a1 + 48))
    {
LABEL_5:
      if ((objc_msgSend(*(id *)(a1 + 32), "connectable") & 1) == 0)
        goto LABEL_6;
    }
  }
LABEL_7:

}

void __71__WPDAdvertisingManager_peripheralManager_didStopAdvertisingWithError___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getClientForUUID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "removeAdvertisingRequest:forClient:shouldUpdate:", v6, v5, 0);
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Local address changed, client %d restart advertisement"), objc_msgSend(v6, "clientType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 28, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(v8, "advertisingStoppedOfType:withError:", objc_msgSend(v6, "clientType"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WPDConnection *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  WPDConnection *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  WPDConnection *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  WPDConnection *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  WPDConnection *v40;
  WPDConnection *obj;
  uint8_t v42;
  char v43[15];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  WPDConnection *v50;
  __int16 v51;
  WPDConnection *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v38 = v7;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v40 = (WPDConnection *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v8;
  -[WPDAdvertisingManager getClientUUIDsForCharacteristic:](self, "getClientUUIDsForCharacteristic:", v8);
  v13 = (WPDConnection *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_313_0);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v38, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v13;
    v51 = 2114;
    v52 = v40;
    v53 = 2114;
    v54 = v17;
    _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "Clients %{public}@ subscribed for characteristic %{public}@ for central %{public}@", buf, 0x20u);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v13;
  v18 = -[WPDConnection countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(obj);
        v22 = *(WPDConnection **)(*((_QWORD *)&v44 + 1) + 8 * v21);
        -[WPDManager server](self, "server");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "getClientForUUID:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v24, "connectionForUUID:", v9);
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (WPDConnection *)v25;
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_315);
            v27 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v50 = v26;
              v51 = 2112;
              v52 = v22;
              _os_log_error_impl(&dword_2175D1000, v27, OS_LOG_TYPE_ERROR, "We already have a %@ for client %@", buf, 0x16u);
            }
            -[WPDConnection getCentral](v26, "getCentral");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {

              goto LABEL_28;
            }
            -[WPDConnection getPeripheral](v26, "getPeripheral");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
LABEL_28:
              if (!-[WPDConnection didConnectSent](v26, "didConnectSent")
                && (!-[WPDConnection fetchConnectionType](v26, "fetchConnectionType")
                 || -[WPDConnection fetchConnectionType](v26, "fetchConnectionType") == 2))
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_319);
                v35 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                  -[WPDAdvertisingManager peripheralManager:central:didSubscribeToCharacteristic:].cold.1(&v42, v43, v35);
                objc_msgSend(v24, "central:subscribed:toCharacteristic:inService:", v9, 1, v40, v39);
              }
              goto LABEL_36;
            }
            -[WPDAdvertisingManager getCharacteristicForClient:](self, "getCharacteristicForClient:", v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[WPDConnection updateWithCentral:characteristic:](v26, "updateWithCentral:characteristic:", v38, v30);
            objc_msgSend(v24, "createdConnection:", v26);
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_317_0);
            v31 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
LABEL_25:
              v32 = v31;
              -[WPDConnection UUIDString](v22, "UUIDString");
              v33 = (WPDConnection *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v50 = v26;
              v51 = 2114;
              v52 = v33;
              _os_log_impl(&dword_2175D1000, v32, OS_LOG_TYPE_DEFAULT, "Created central connection %{public}@ for client %{public}@ - send didSubscribe", buf, 0x16u);

            }
          }
          else
          {
            -[WPDAdvertisingManager getCharacteristicForClient:](self, "getCharacteristicForClient:", v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[WPDConnection initWithCentral:characteristic:]([WPDConnection alloc], "initWithCentral:characteristic:", v38, v30);
            -[WPDConnection setClient:](v26, "setClient:", v24);
            objc_msgSend(v24, "createdConnection:", v26);
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_322_0);
            v31 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
          }
          objc_msgSend(v24, "central:subscribed:toCharacteristic:inService:", v9, 1, v40, v39);

LABEL_36:
          goto LABEL_37;
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_324_0);
        v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v22;
          v51 = 2112;
          v52 = v40;
          _os_log_error_impl(&dword_2175D1000, v29, OS_LOG_TYPE_ERROR, "Couldn't find client %@ associated with this characteristic %@ (subscribing)", buf, 0x16u);
        }
LABEL_37:

        ++v21;
      }
      while (v19 != v21);
      v36 = -[WPDConnection countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v19 = v36;
    }
    while (v36);
  }

}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v7;
  id v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDAdvertisingManager getClientUUIDsForCharacteristic:](self, "getClientUUIDsForCharacteristic:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_325);
  v15 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v7, "identifier", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v14;
    v48 = 2114;
    v49 = v11;
    v50 = 2114;
    v51 = v18;
    _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "Clients %{public}@ unsubscribed for characteristic %{public}@ for central %{public}@", buf, 0x20u);

  }
  v38 = v7;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v14;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v22);
        -[WPDManager server](self, "server", v37, v38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "getClientForUUID:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "connectionForUUID:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 1;
        if (!v28)
        {
          if (!objc_msgSend(v26, "fetchConnectionType") || objc_msgSend(v27, "fetchConnectionType") == 2)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_327);
            v32 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              v33 = v32;
              objc_msgSend(v25, "clientUUID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v47 = v9;
              v48 = 2114;
              v49 = v11;
              v50 = 2114;
              v51 = v34;
              _os_log_impl(&dword_2175D1000, v33, OS_LOG_TYPE_DEFAULT, "Central %{public}@ unsubsribed from characteristic %{public}@ for client %{public}@ - send didUnSubsribe", buf, 0x20u);

            }
            objc_msgSend(v25, "central:subscribed:toCharacteristic:inService:", v9, 0, v11, v39);
            goto LABEL_37;
          }
LABEL_28:
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_333_0);
          v35 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v23;
            v48 = 2112;
            v49 = v11;
            v30 = v35;
            v31 = "Couldn't find client %@ associated with this characteristic %@ (unsubscribing)";
            goto LABEL_36;
          }
          goto LABEL_37;
        }
        if (!v25)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_329_0);
          v36 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v23;
            v48 = 2112;
            v49 = v11;
            v30 = v36;
            v31 = "client associated with client UUID %@ doesn't exist and characteristic %@ (unsubscribing)";
            goto LABEL_36;
          }
          goto LABEL_37;
        }
        if (v26)
          goto LABEL_28;
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_331_0);
        v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v47 = v23;
          v48 = 2112;
          v49 = v11;
          v30 = v29;
          v31 = "connection associated with client UUID %@ doesn't exist and characteristic %@ (unsubscribing)";
LABEL_36:
          _os_log_impl(&dword_2175D1000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);
        }
LABEL_37:

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v20);
  }

}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_334);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Read request received, ignoring", v8, 2u);
  }

}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  WPDAdvertisingManager *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = a4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v56;
    *(_QWORD *)&v7 = 138412290;
    v37 = v7;
    v44 = self;
    v43 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        objc_msgSend(v9, "characteristic", v37);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDAdvertisingManager getClientUUIDsForCharacteristic:](self, "getClientUUIDsForCharacteristic:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v41 = v10;
          v42 = v8;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v48 = v10;
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
          if (v50)
          {
            v11 = *(_QWORD *)v52;
            v45 = *(_QWORD *)v52;
            v46 = v9;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v52 != v11)
                  objc_enumerationMutation(v48);
                v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v12);
                -[WPDManager server](self, "server");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "getClientForUUID:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "central");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "connectionForUUID:", v17);
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = (void *)v18;
                if (v15)
                  v20 = v18 == 0;
                else
                  v20 = 1;
                if (v20)
                {
                  if (WPLogInitOnce != -1)
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_339_0);
                  v21 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                  {
                    v32 = v21;
                    objc_msgSend(v15, "clientUUID");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "processName");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v19, "fetchConnectionType");
                    *(_DWORD *)buf = 134219010;
                    v60 = v15;
                    v61 = 2112;
                    v62 = v33;
                    v63 = 2112;
                    v64 = v34;
                    v65 = 2048;
                    v66 = v19;
                    v67 = 2048;
                    v68 = v35;
                    _os_log_error_impl(&dword_2175D1000, v32, OS_LOG_TYPE_ERROR, "client %p, client UUID %@, client name %@, connection %p or connection type %ld is invalid, send RequestNotSupported", buf, 0x34u);

                    self = v44;
                  }
                  objc_msgSend(v6, "respondToRequest:withResult:", v9, 6);
                }
                else
                {
                  objc_msgSend(v9, "value");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "UUID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "UUIDString");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v47, "service");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "UUID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "UUIDString");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  if (WPLogInitOnce != -1)
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_337_0);
                  v27 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
                  {
                    v28 = v27;
                    objc_msgSend(v17, "UUIDString");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "clientUUID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "UUIDString");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v60 = v29;
                    v61 = 2112;
                    v62 = v23;
                    v63 = 2112;
                    v64 = v31;
                    _os_log_impl(&dword_2175D1000, v28, OS_LOG_TYPE_INFO, "Received Write Request from Central %@ for characteristic %@ for client %@", buf, 0x20u);

                    v6 = v43;
                    self = v44;

                  }
                  objc_msgSend(v15, "receivedData:fromCharacteristic:inService:forPeripheral:", v49, v23, v26, v17);
                  v9 = v46;
                  objc_msgSend(v6, "respondToRequest:withResult:", v46, 0);

                  v11 = v45;
                }

                ++v12;
              }
              while (v50 != v12);
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
            }
            while (v50);
          }

          v10 = v41;
          v8 = v42;
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_335);
          v36 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v37;
            v60 = v47;
            _os_log_error_impl(&dword_2175D1000, v36, OS_LOG_TYPE_ERROR, "Received Write Request for characteristic %@ for which no centrals have subscribed, send RequestNotSupported", buf, 0xCu);
          }
          objc_msgSend(v6, "respondToRequest:withResult:", v9, 6);
        }

        ++v8;
      }
      while (v8 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    }
    while (v40);
  }

}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_340);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_INFO, "Peripheral Manager is now ready to update subscribers", v8, 2u);
  }
  -[WPDManager server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAllClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_343_0);
}

uint64_t __69__WPDAdvertisingManager_peripheralManagerIsReadyToUpdateSubscribers___block_invoke_341(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "readyForDataTransfer");
}

- (id)NSUUIDfromCBUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  return v7;
}

- (BOOL)platformSupportsMultipleAdvertising
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WPDAdvertisingManager_platformSupportsMultipleAdvertising__block_invoke;
  block[3] = &unk_24D7C2530;
  block[4] = self;
  if (platformSupportsMultipleAdvertising_onceToken != -1)
    dispatch_once(&platformSupportsMultipleAdvertising_onceToken, block);
  return platformSupportsMultipleAdvertising_supported;
}

void __60__WPDAdvertisingManager_platformSupportsMultipleAdvertising__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connectablePeripheralManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  platformSupportsMultipleAdvertising_supported = objc_msgSend(v1, "supportsMultipleAdvertising");

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_344_0);
  v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    if (platformSupportsMultipleAdvertising_supported)
      v3 = "supports";
    else
      v3 = "doesn't support";
    v4 = 136446210;
    v5 = v3;
    _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "Platform %{public}s multiple advertising", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getClientUUIDsForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDAdvertisingManager publishedServices](self, "publishedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__WPDAdvertisingManager_getClientUUIDsForCharacteristic___block_invoke;
  v12[3] = &unk_24D7C79A0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __57__WPDAdvertisingManager_getClientUUIDsForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  getFirstCharacteristicForService(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

- (id)getCharacteristicForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WPDAdvertisingManager publishedServices](self, "publishedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getFirstCharacteristicForService(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)statsExportTimerFired
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[WPDManager server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke;
  block[3] = &unk_24D7C2530;
  block[4] = self;
  dispatch_async(v4, block);

}

void __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];

  v63[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "connectableAdvTotalCount"))
  {
    v62[1] = CFSTR("DroppedAdvertisementTypePercent");
    v63[0] = CFSTR("ConnectableAdvertisements");
    v62[0] = CFSTR("DroppedAdvertisementType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "connectableAdvDropCount")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "connectableAdvTotalCount")* 100.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.Bluetooth."), CFSTR("AdvTypesBufferDropInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v4;
    v6 = v4;
    AnalyticsSendEventLazy();

  }
  v7 = 0x24BDD1000uLL;
  if (objc_msgSend(*(id *)(a1 + 32), "nonConnectableAdvTotalCount"))
  {
    v60[1] = CFSTR("DroppedAdvertisementTypePercent");
    v61[0] = CFSTR("NonConnectableAdvertisements");
    v60[0] = CFSTR("DroppedAdvertisementType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "nonConnectableAdvDropCount")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "nonConnectableAdvTotalCount")* 100.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.Bluetooth."), CFSTR("AdvTypesBufferDropInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v10;
    v12 = v10;
    AnalyticsSendEventLazy();

  }
  v13 = 0;
  v14 = 1;
  v15 = 0x24BDBC000uLL;
  do
  {
    v16 = v7;
    v17 = objc_alloc_init(*(Class *)(v15 + 3800));
    v56 = objc_alloc_init(*(Class *)(v15 + 3800));
    objc_msgSend(*(id *)(a1 + 32), "advMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "totalAdvCountforType:", v14);

    objc_msgSend(*(id *)(a1 + 32), "advMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "totalDroppedAdvCountforType:", v14);

    if (v21)
      v22 = v19 == 0;
    else
      v22 = 1;
    if (v22)
    {
      v25 = 0;
      v7 = v16;
      v23 = v56;
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = (double)v19;
      v27 = v16;
      do
      {
        v28 = (v24 + 1);
        if (v13 != v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "advMetrics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "droppedAdvCountforType:by:", v14, v28);

          objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("Type%d"), v28);
          v31 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v30 / v26 * 100.0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, v31);

          v25 = (void *)v31;
          v27 = v16;
        }
        v24 = v28;
      }
      while ((_DWORD)v28 != 26);
      objc_msgSend(v17, "keysSortedByValueUsingComparator:", &__block_literal_global_359_0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v55, "count");
      objc_msgSend(*(id *)(v27 + 1992), "stringWithFormat:", CFSTR("Type%d"), v14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v34, CFSTR("DroppedAdvertisementType"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v21 / v26 * 100.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v35, CFSTR("DroppedAdvertisementTypePercent"));

      if (v33)
      {
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v38, CFSTR("HighestDropsByAdvertisementType"));

          objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v40, CFSTR("HighestDropsByAdvertisementTypePercent"));

        }
        if (v33 >= 2)
        {
          objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v43, CFSTR("SecondHighestDropsByAdvertisementType"));

            objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v45, CFSTR("SecondHighestDropsByAdvertisementTypePercent"));

          }
          if (v33 >= 3)
          {
            objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v48, CFSTR("ThirdHighestDropsByAdvertismentType"));

              objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v50, CFSTR("ThirdHighestDropsByAdvertisementTypePercent"));

            }
          }
        }
      }
      v23 = v56;
      v51 = v56;
      objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.Bluetooth."), CFSTR("AdvTypesBufferDropInfo"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v51;
      v53 = v51;
      AnalyticsSendEventLazy();

      v7 = v16;
      v15 = 0x24BDBC000;
    }

    v14 = (v14 + 1);
    ++v13;
  }
  while ((_DWORD)v14 != 27);
  objc_msgSend(*(id *)(a1 + 32), "advMetrics");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "resetAllCounters");

}

uint64_t __46__WPDAdvertisingManager_statsExportTimerFired__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (WPAdvertisingRequestsQueue)advertisingRequests
{
  return (WPAdvertisingRequestsQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdvertisingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)clientAdvertisingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientAdvertisingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableIndexSet)currentAdvertisers
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentAdvertisers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableSet)clientsToNotifyOnAddressChange
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClientsToNotifyOnAddressChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)publishedServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublishedServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CBPeripheralManager)connectablePeripheralManager
{
  return self->_connectablePeripheralManager;
}

- (void)setConnectablePeripheralManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectablePeripheralManager, a3);
}

- (CBPeripheralManager)nonConnectablePeripheralManager
{
  return self->_nonConnectablePeripheralManager;
}

- (void)setNonConnectablePeripheralManager:(id)a3
{
  objc_storeStrong((id *)&self->_nonConnectablePeripheralManager, a3);
}

- (WPDAdvertisingData)currentConnectableAdvertisingData
{
  return self->_currentConnectableAdvertisingData;
}

- (void)setCurrentConnectableAdvertisingData:(id)a3
{
  objc_storeStrong((id *)&self->_currentConnectableAdvertisingData, a3);
}

- (WPDAdvertisingData)currentNonConnectableAdvertisingData
{
  return self->_currentNonConnectableAdvertisingData;
}

- (void)setCurrentNonConnectableAdvertisingData:(id)a3
{
  objc_storeStrong((id *)&self->_currentNonConnectableAdvertisingData, a3);
}

- (BOOL)allowCompoundAdvertisements
{
  return self->_allowCompoundAdvertisements;
}

- (void)setAllowCompoundAdvertisements:(BOOL)a3
{
  self->_allowCompoundAdvertisements = a3;
}

- (NSMutableDictionary)preallocatedServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPreallocatedServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSIndexSet)rangingTypes
{
  return self->_rangingTypes;
}

- (NSMutableSet)rangingClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRangingClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unint64_t)nonConnectableAdvDropCount
{
  return self->_nonConnectableAdvDropCount;
}

- (void)setNonConnectableAdvDropCount:(unint64_t)a3
{
  self->_nonConnectableAdvDropCount = a3;
}

- (unint64_t)nonConnectableAdvTotalCount
{
  return self->_nonConnectableAdvTotalCount;
}

- (void)setNonConnectableAdvTotalCount:(unint64_t)a3
{
  self->_nonConnectableAdvTotalCount = a3;
}

- (unint64_t)connectableAdvDropCount
{
  return self->_connectableAdvDropCount;
}

- (void)setConnectableAdvDropCount:(unint64_t)a3
{
  self->_connectableAdvDropCount = a3;
}

- (unint64_t)connectableAdvTotalCount
{
  return self->_connectableAdvTotalCount;
}

- (void)setConnectableAdvTotalCount:(unint64_t)a3
{
  self->_connectableAdvTotalCount = a3;
}

- (AdvMetrics)advMetrics
{
  return (AdvMetrics *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAdvMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advMetrics, 0);
  objc_storeStrong((id *)&self->_rangingClients, 0);
  objc_storeStrong((id *)&self->_rangingTypes, 0);
  objc_storeStrong((id *)&self->_preallocatedServices, 0);
  objc_storeStrong((id *)&self->_currentNonConnectableAdvertisingData, 0);
  objc_storeStrong((id *)&self->_currentConnectableAdvertisingData, 0);
  objc_storeStrong((id *)&self->_nonConnectablePeripheralManager, 0);
  objc_storeStrong((id *)&self->_connectablePeripheralManager, 0);
  objc_storeStrong((id *)&self->_publishedServices, 0);
  objc_storeStrong((id *)&self->_clientsToNotifyOnAddressChange, 0);
  objc_storeStrong((id *)&self->_currentAdvertisers, 0);
  objc_storeStrong((id *)&self->_clientAdvertisingRequests, 0);
  objc_storeStrong((id *)&self->_advertisingRequests, 0);
}

- (void)initWithServer:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "Using allow compound advertisements: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)addCharacteristic:(uint64_t)a1 forService:(void *)a2 forClient:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v6, v7, "Pre-allocated service %{public}@ does not have the characteristic %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)addCharacteristic:(uint64_t)a1 forService:(void *)a2 forClient:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v6, v7, "Published service %{public}@ does not have the characteristic %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)peripheralManager:(void *)a1 didAddService:(void *)a2 error:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v8, v9, "Error adding service %{public}@, %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_1();
}

- (void)enableRanging:(void *)a3 forClient:.cold.1(char a1, void *a2, void *a3)
{
  int v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1 & 1;
  v5 = a2;
  objc_msgSend(a3, "rangingClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v4;
  v8 = 2112;
  v9 = v6;
  _os_log_debug_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEBUG, "WPAdvertisingManager ranging:%d for clients: %@", (uint8_t *)v7, 0x12u);

  OUTLINED_FUNCTION_1_1();
}

- (void)addAdvertisingRequest:(uint64_t)a3 forClient:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3_2(&dword_2175D1000, a1, a3, "Failed to start advertising because the advert is too big", v3);
  OUTLINED_FUNCTION_3();
}

- (void)addAdvertisingRequest:(void *)a3 forClient:.cold.2(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  v6[0] = 67109376;
  v6[1] = objc_msgSend(a2, "clientType");
  v7 = 1024;
  v8 = objc_msgSend(a3, "state");
  _os_log_error_impl(&dword_2175D1000, v5, OS_LOG_TYPE_ERROR, "Failed to start advertising for type %d - peripheral is not powered on %d", (uint8_t *)v6, 0xEu);

  OUTLINED_FUNCTION_1_1();
}

- (void)isAdvertiserTestMode
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "advertiserTestMode: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)peripheralManagerDidStartAdvertising:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v3, v5, "Error starting advertising - %@", (uint8_t *)&v6);

}

- (void)peripheralManager:(uint64_t)a3 didStopAdvertisingWithError:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3_2(&dword_2175D1000, a1, a3, "[Privacy] Received didStopAdvertisingWithError delegate call back but no clients need address change notification", v3);
  OUTLINED_FUNCTION_3();
}

- (void)peripheralManager:(uint8_t *)a1 central:(_BYTE *)a2 didSubscribeToCharacteristic:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_2(&dword_2175D1000, a3, (uint64_t)a3, "NOT Updating existing connection with a Central", a1);
}

@end
