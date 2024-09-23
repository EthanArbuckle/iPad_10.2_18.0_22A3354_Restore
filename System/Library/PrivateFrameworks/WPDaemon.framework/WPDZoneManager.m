@implementation WPDZoneManager

- (WPDZoneManager)initWithServer:(id)a3
{
  id v4;
  WPDZoneManager *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CBCentralManager *centralManager;
  uint64_t v11;
  NSMutableDictionary *trackedZones;
  uint64_t v13;
  NSMutableDictionary *trackRequests;
  NSNumber *zoneExitTimeout;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  OS_dispatch_source *exitTimer;
  void *v28;
  void *v29;
  objc_super v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WPDZoneManager;
  v5 = -[WPDManager initWithServer:Name:](&v31, sel_initWithServer_Name_, v4, CFSTR("Zone Central"));
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBB220]);
    objc_msgSend(v4, "serverQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BDBB198];
    v33[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithDelegate:queue:options:", v5, v7, v8);
    centralManager = v5->_centralManager;
    v5->_centralManager = (CBCentralManager *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    trackedZones = v5->_trackedZones;
    v5->_trackedZones = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    trackRequests = v5->_trackRequests;
    v5->_trackRequests = (NSMutableDictionary *)v13;

    zoneExitTimeout = v5->_zoneExitTimeout;
    v5->_zoneExitTimeout = (NSNumber *)&unk_24D7D7E90;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persistentDomainForName:", CFSTR("com.apple.MobileBluetooth.debug"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("WIPROX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ZoneTrackerTimeout"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_storeStrong((id *)&v5->_zoneExitTimeout, v19);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_10);
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDZoneManager initWithServer:].cold.1((uint64_t)&v5->_zoneExitTimeout, v20, v21, v22, v23, v24, v25, v26);
    }
    exitTimer = v5->_exitTimer;
    v5->_exitTimer = 0;

    v5->_scanAllowlisted = -[WPDManager isScanAllowlistedForType:](v5, "isScanAllowlistedForType:", 2);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5->_centralManager);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDManager setCbManagers:](v5, "setCbManagers:", v28);

    objc_msgSend(v4, "wpdState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerManager:", v5->_centralManager);

  }
  return v5;
}

- (void)cleanup
{
  objc_super v3;

  -[WPDZoneManager cancelExitTimer](self, "cancelExitTimer");
  -[WPDZoneManager unregisterAllZones](self, "unregisterAllZones");
  v3.receiver = self;
  v3.super_class = (Class)WPDZoneManager;
  -[WPDManager cleanup](&v3, sel_cleanup);
}

- (id)generateStateDumpStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v22.receiver = self;
  v22.super_class = (Class)WPDZoneManager;
  -[WPDManager generateStateDumpStrings](&v22, sel_generateStateDumpStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WPDManager isInternalBuild](self, "isInternalBuild"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = -[WPDZoneManager scanAllowlisted](self, "scanAllowlisted");
    v8 = "no";
    if (v7)
      v8 = "yes";
    objc_msgSend(v6, "stringWithFormat:", CFSTR("scan allowlisted: %s\n"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[WPDZoneManager trackRequests](self, "trackRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("trackRequests (%ld):\n"), objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[WPDZoneManager trackedZones](self, "trackedZones");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("trackedZones (%ld):\n"), objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  -[WPDZoneManager trackedZones](self, "trackedZones");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __42__WPDZoneManager_generateStateDumpStrings__block_invoke;
  v20[3] = &unk_24D7C4BE0;
  v21 = v5;
  v17 = v5;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v20);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __42__WPDZoneManager_generateStateDumpStrings__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("zone %@: %@\n"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)update
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  switch(-[WPDManager state](self, "state"))
  {
    case 0:
    case 2:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_113);
      v3 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        -[WPDZoneManager centralManager](self, "centralManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = 67109120;
        v8[1] = objc_msgSend(v5, "state");
        _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Zone Central manager is  unknown, powered off, unauthorized or not supported (%d)", (uint8_t *)v8, 8u);

      }
      break;
    case 1:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_115);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        v7 = "Zone Central manager is resetting";
        goto LABEL_14;
      }
      break;
    case 3:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_117_1);
      v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        v7 = "Zone Central manager is powered on";
LABEL_14:
        _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  WPDZoneManager *v29;
  uint64_t v30;
  _BYTE *v31;
  uint8_t buf[4];
  _BYTE v33[18];
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "length") > 3)
    {
      v15 = objc_retainAutorelease(v12);
      v16 = (_BYTE *)objc_msgSend(v15, "bytes");
      if (*v16 == 76 && !v16[1] && v16[2] == 2)
      {
        v17 = v16 + 4;
        v18 = objc_msgSend(v15, "length") - 4;
        if (objc_msgSend(v10, "integerValue") < -87 || objc_msgSend(v10, "integerValue") == 127)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_120_0);
          v19 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            v14 = v19;
            v20 = objc_msgSend(v10, "intValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v17, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = v20;
            *(_WORD *)&v33[4] = 2112;
            *(_QWORD *)&v33[6] = v21;
            _os_log_debug_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEBUG, "RSSI invalid for zone entry (%d dBm - %@)", buf, 0x12u);

            goto LABEL_7;
          }
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_123);
          v22 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            v24 = v22;
            objc_msgSend(v9, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v17, v18);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v33 = v25;
            *(_WORD *)&v33[8] = 2112;
            *(_QWORD *)&v33[10] = v26;
            v34 = 2048;
            v35 = v18;
            _os_log_debug_impl(&dword_2175D1000, v24, OS_LOG_TYPE_DEBUG, "Discovered a zone peripheral %@ with data (%@) of length (%lu)", buf, 0x20u);

          }
          -[WPDZoneManager trackedZones](self, "trackedZones");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124;
          v27[3] = &unk_24D7C4D28;
          v30 = v18;
          v31 = v17;
          v28 = v9;
          v29 = self;
          objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v27);

        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_118);
      v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v33 = objc_msgSend(v12, "length");
        *(_WORD *)&v33[8] = 2112;
        *(_QWORD *)&v33[10] = v12;
        _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_INFO, "Zones: Expected minimum advertisement data length: 4, received: %lu, with content: %@", buf, 0x16u);
LABEL_7:

      }
    }
  }

}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  const void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 >= objc_msgSend(v7, "length"))
  {
    v9 = *(const void **)(a1 + 56);
    v10 = objc_retainAutorelease(v7);
    if (!memcmp(v9, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length")))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_125_0);
      v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124_cold_2(a1, v11);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("kLastSeen"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kInZone"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPendingExit"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v16)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_130_0);
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124_cold_1();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("kPendingExit"));
        }
      }
      else
      {
        v27 = v7;
        v28 = v5;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kInZone"));
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v30 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 40), "server");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "getClientForUUID:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "enteredZone:manufacturerData:", v10, v17);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v20);
        }

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_128);
        v7 = v27;
        v5 = v28;
        v26 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v10;
          v35 = 2114;
          v36 = v17;
          _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "Entered zone: %{public}@, manufacturer data: %{public}@", buf, 0x16u);
        }

      }
    }
  }

}

- (void)centralManager:(id)a3 didLoseZone:(id)a4 mask:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  WPDZoneManager *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a4;
  v8 = objc_retainAutorelease(a5);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "bytes");
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_132_0);
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDZoneManager centralManager:didLoseZone:mask:].cold.1(v12, v10, (uint64_t)v8);
  -[WPDZoneManager trackedZones](self, "trackedZones");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133;
  v16[3] = &unk_24D7C4E10;
  v20 = v9;
  v21 = v11;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v14 = v10;
  v15 = v8;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

  -[WPDZoneManager printTrackedZones](self, "printTrackedZones");
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  unsigned __int8 *v6;
  id v7;
  unint64_t v8;
  char v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unsigned __int8 *)malloc_type_calloc(objc_msgSend(*(id *)(a1 + 32), "length"), 1uLL, 0x100004077774924uLL);
  v7 = objc_retainAutorelease(v5);
  memcpy(v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_134);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_4();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      if (objc_msgSend(v7, "length") < v8 && *(unsigned __int8 *)(*(_QWORD *)(a1 + 56) + v8) == 255
        || v6[v8] != *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + v8))
      {
        v9 = 0;
      }
      ++v8;
    }
    while (objc_msgSend(*(id *)(a1 + 32), "length") > v8);
    free(v6);
    if ((v9 & 1) == 0)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_142_2);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_3();
      goto LABEL_39;
    }
  }
  else
  {
    free(v6);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_136_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_2();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kInZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_138_1);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "Exited zone: %{public}@", buf, 0xCu);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("kInZone"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "server");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getClientForUUID:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "exitedZone:", v7);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_140_1);
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_1(a1, (uint64_t)v4, v21);
  }
LABEL_39:

}

- (void)printTrackedZones
{
  id v2;

  -[WPDZoneManager trackedZones](self, "trackedZones");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_143_0);

}

void __35__WPDZoneManager_printTrackedZones__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a2;
  v5 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_144_0);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    __35__WPDZoneManager_printTrackedZones__block_invoke_cold_1((uint64_t)v4, v6, v5);

}

- (BOOL)updateScanner
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  BOOL v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _QWORD v62[4];
  _QWORD v63[4];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (-[WPDManager state](self, "state") != 3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_149_1);
    v28 = (void *)WiProxLog;
    v26 = 0;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      return v26;
    v29 = v28;
    -[WPDZoneManager centralManager](self, "centralManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    LODWORD(v59) = objc_msgSend(v30, "state");
    _os_log_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEFAULT, "Zones: updateScanner - central is not powered on: %d", buf, 8u);

    return 0;
  }
  if (!-[WPDZoneManager scanAllowlisted](self, "scanAllowlisted"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_151_1);
    v31 = WiProxLog;
    v26 = 0;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      return v26;
    *(_DWORD *)buf = 134217984;
    v59 = 2;
    _os_log_impl(&dword_2175D1000, v31, OS_LOG_TYPE_DEFAULT, "Zones: not tracking for client type (%ld) when denylisted or not allowlisted", buf, 0xCu);
    return 0;
  }
  -[WPDZoneManager centralManager](self, "centralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopScan");

  -[WPDZoneManager trackedZones](self, "trackedZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[WPDZoneManager cancelExitTimer](self, "cancelExitTimer");
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_153);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDZoneManager updateScanner].cold.1();
    return 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDZoneManager trackedZones](self, "trackedZones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __31__WPDZoneManager_updateScanner__block_invoke_154;
  v56[3] = &unk_24D7C4BE0;
  v8 = v6;
  v57 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v56);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[WPDZoneManager trackRequests](self, "trackRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (!v42)
  {

    goto LABEL_49;
  }
  v39 = v8;
  obj = v10;
  v41 = *(_QWORD *)v53;
  v11 = 0xFFFFLL;
  v12 = 0xFFFFLL;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v53 != v41)
        objc_enumerationMutation(obj);
      v43 = v13;
      v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v13);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v14, "allValues", v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v49 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            -[WPDManager server](self, "server");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "screenOff"))
            {
              v22 = (uint64_t *)&v46;
              if (!v20)
                goto LABEL_22;
              objc_msgSend(v20, "scanningRates");
              v23 = v47;
            }
            else
            {
              v22 = &v45;
              if (!v20)
              {
LABEL_22:
                *v22 = 0;
                v22[1] = 0;
                v22[2] = 0;

                v24 = 0;
                v11 &= v11 >> 63;
                v44 = 0;
                goto LABEL_23;
              }
              objc_msgSend(v20, "scanningRates");
              v23 = v45;
            }

            if (v23 < v11)
              v11 = v23;
            objc_msgSend(v20, "scanningRates");
            v24 = v44;
LABEL_23:
            if (v24 < v12)
              v12 = v24;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
        }
        while (v17);
      }

      v13 = v43 + 1;
    }
    while (v43 + 1 != v42);
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  }
  while (v42);

  v8 = v39;
  if (v11 < 0xFFFF)
  {
    if (v12 < 0xFFFF)
    {
      -[WPDZoneManager centralManager](self, "centralManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x24BDBB188];
      v62[0] = *MEMORY[0x24BDBB0F8];
      v62[1] = v33;
      v63[0] = v39;
      v63[1] = MEMORY[0x24BDBD1C8];
      v62[2] = *MEMORY[0x24BDBB0E0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v34;
      v62[3] = *MEMORY[0x24BDBB0D0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v63[3] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scanForPeripheralsWithServices:options:", 0, v36);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_160_0);
      v37 = WiProxLog;
      v8 = v39;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v59 = v12;
        v60 = 2048;
        v61 = v11;
        _os_log_impl(&dword_2175D1000, v37, OS_LOG_TYPE_DEFAULT, "Started scan for zones %ld (Window) %ld (Interval)", buf, 0x16u);
      }
      -[WPDZoneManager startExitTimer](self, "startExitTimer");
      v26 = 1;
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_157);
      v25 = WiProxLog;
      v26 = 0;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v27 = "Scanning window is too high or not set - not scanning";
        goto LABEL_53;
      }
    }
    goto LABEL_59;
  }
LABEL_49:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_155);
  v25 = WiProxLog;
  v26 = 0;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "Scanning rate is too high or not set - not scanning";
LABEL_53:
    _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    v26 = 0;
  }
LABEL_59:

  return v26;
}

void __31__WPDZoneManager_updateScanner__block_invoke_154(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kData"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v4 = -1;
  do
    ++v4;
  while (objc_msgSend(v5, "length") > v4);

}

- (void)startExitTimer
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "lastTimeScannerStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2175D1000, v3, OS_LOG_TYPE_ERROR, "startExitTimer failed to start: (%@)", v5, 0xCu);

}

void __32__WPDZoneManager_startExitTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "exitTimerFired");
    objc_msgSend(v2, "setExitTimer:", 0);
    WeakRetained = v2;
  }

}

- (void)cancelExitTimer
{
  void *v3;
  NSObject *v4;
  intptr_t v5;
  NSObject *v6;

  -[WPDZoneManager exitTimer](self, "exitTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDZoneManager exitTimer](self, "exitTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_testcancel(v4);

    if (!v5)
    {
      -[WPDZoneManager exitTimer](self, "exitTimer");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v6);

    }
    -[WPDZoneManager setExitTimer:](self, "setExitTimer:", 0);
  }
}

- (void)exitTimerFired
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  objc_msgSend(a3, "lastTimeScannerStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v6);
  OUTLINED_FUNCTION_23(&dword_2175D1000, v7, v8, "exitTimerFired: (%@) - delta: %f", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __32__WPDZoneManager_exitTimerFired__block_invoke_165(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kInZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kLastSeen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastTimeScannerStarted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 < 0.0)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("kInZone"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "server");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "getClientForUUID:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "exitedZone:", v11);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v14);
      }

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_166_0);
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v7;
        v27 = 2114;
        v28 = v11;
        _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "Too long since last seen (%{public}@). Exiting zone: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    v7 = 0;
  }

}

- (void)addSingleZoneTrackingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[3];
  _QWORD v35[3];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "zones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_167_0);
  v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v10;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Adding zone %@", buf, 0xCu);
  }
  -[WPDZoneManager trackRequests](self, "trackRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDZoneManager trackRequests](self, "trackRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v7);

  }
  objc_msgSend(v13, "setObject:forKey:", v6, v10);
  -[WPDZoneManager trackedZones](self, "trackedZones");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v7);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_169_0);
    v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v7;
      v38 = 2114;
      v39 = v10;
      v40 = 2048;
      v41 = v21;
      v42 = 2114;
      v43 = v22;
      _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "Added client %@ to zone %{public}@. Currently tracking %ld zones %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v6, "zones", CFSTR("kData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v26;
    v35[1] = MEMORY[0x24BDBD1C0];
    v34[1] = CFSTR("kInZone");
    v34[2] = CFSTR("kWPClientUUIDs");
    v35[2] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryWithDictionary:", v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDZoneManager trackedZones](self, "trackedZones");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v16, v10);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_172_0);
    v29 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v10;
      v38 = 2112;
      v39 = v7;
      v40 = 2048;
      v41 = v32;
      v42 = 2114;
      v43 = v33;
      _os_log_impl(&dword_2175D1000, v30, OS_LOG_TYPE_DEFAULT, "Added zone %{public}@ for client %@. Currently tracking %ld zones %{public}@", buf, 0x2Au);

    }
  }

}

- (id)addZoneTrackingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v52;
  WPDZoneManager *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  const __CFString *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[WPDManager state](self, "state") == 3)
  {
    v53 = self;
    v8 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v6, "zones");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    objc_msgSend(v6, "zones");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v13 = v10;
    if (v12 == 1)
    {
      objc_msgSend(v10, "addObject:", v6);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_178);
      v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        objc_msgSend(v6, "zones");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v72 = objc_msgSend(v20, "count");
        _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "Multiple zones in one request, breaking down into %ld one-zone-per-request", buf, 0xCu);

      }
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(v6, "zones", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v67 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
            v27 = (void *)objc_opt_new();
            objc_msgSend(v27, "setClientType:", objc_msgSend(v6, "clientType"));
            if (v6)
            {
              objc_msgSend(v6, "scanningRates");
            }
            else
            {
              v64 = 0uLL;
              v65 = 0;
            }
            v62 = v64;
            v63 = v65;
            objc_msgSend(v27, "setScanningRates:", &v62);
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setZones:", v28);

            objc_msgSend(v10, "addObject:", v27);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        }
        while (v23);
      }

      v7 = v52;
    }
    -[WPDZoneManager trackedZones](v53, "trackedZones");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v6, "zones");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v35 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v59 != v35)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "description");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v34 += objc_msgSend(v30, "containsObject:", v37) ^ 1;

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
      }
      while (v33);
    }
    else
    {
      v34 = 0;
    }

    -[WPDZoneManager trackedZones](v53, "trackedZones");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 30 - objc_msgSend(v38, "count");

    if (v39 >= v34)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v42 = v13;
      v46 = v13;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v55;
        do
        {
          for (k = 0; k != v48; ++k)
          {
            if (*(_QWORD *)v55 != v49)
              objc_enumerationMutation(v46);
            -[WPDZoneManager addSingleZoneTrackingRequest:forClient:](v53, "addSingleZoneTrackingRequest:forClient:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k), v7);
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        }
        while (v48);
      }

      -[WPDZoneManager updateScanner](v53, "updateScanner");
      v16 = 0;
    }
    else
    {
      v40 = (void *)MEMORY[0x24BDD1540];
      v77 = *MEMORY[0x24BDD0FC8];
      v78 = CFSTR("Tracking the maximum number of zones available within the chips");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 4, v41);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v13;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_183_0);
      v43 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v43;
        objc_msgSend(v6, "zones");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = (uint64_t)v45;
        v73 = 2048;
        v74 = v34;
        v75 = 2048;
        v76 = v39;
        _os_log_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEFAULT, "Could not add zones (%{public}@): asked to add %ld, can only add %ld new zones", buf, 0x20u);

      }
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v81 = *MEMORY[0x24BDD0FC8];
    v82[0] = CFSTR("CoreBluetooth is currently powered off");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_0);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDZoneManager addZoneTrackingRequest:forClient:].cold.1(v17, self);
  }

  return v16;
}

- (void)unregisterZones:(id)a3 forClient:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_184_0);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v56 = (uint64_t)v6;
      v57 = 2112;
      v58 = (uint64_t)v45;
      _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering zones: %{public}@ for client %@", buf, 0x16u);
    }
    -[WPDZoneManager trackRequests](self, "trackRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v45);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v52 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "removeObjectForKey:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        }
        while (v12);
      }

      if (!objc_msgSend(v9, "count"))
      {
        -[WPDZoneManager trackRequests](self, "trackRequests");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", v45);

      }
    }
    v42 = v9;
    v43 = v6;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v6;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v17)
    {
      v18 = v17;
      v46 = *(_QWORD *)v48;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v48 != v46)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v19), "description", v42, v43);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDZoneManager trackedZones](self, "trackedZones");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (!v23)
              goto LABEL_29;
            objc_msgSend(v23, "removeObject:", v45);
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_186);
            v25 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              -[WPDZoneManager trackedZones](self, "trackedZones");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "count");
              -[WPDZoneManager trackedZones](self, "trackedZones");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v56 = (uint64_t)v45;
              v57 = 2114;
              v58 = (uint64_t)v20;
              v59 = 2048;
              v60 = v28;
              v61 = 2114;
              v62 = v29;
              _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "Removed client %@ from zone (%{public}@), currently tracking %ld zones %{public}@ ", buf, 0x2Au);

            }
            if (!objc_msgSend(v24, "count"))
            {
LABEL_29:
              -[WPDZoneManager trackedZones](self, "trackedZones");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "removeObjectForKey:", v20);

              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_188);
              v31 = (void *)WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
              {
                v32 = v31;
                -[WPDZoneManager trackedZones](self, "trackedZones");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "count");
                -[WPDZoneManager trackedZones](self, "trackedZones");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v56 = (uint64_t)v20;
                v57 = 2048;
                v58 = v34;
                v59 = 2114;
                v60 = (uint64_t)v35;
                _os_log_impl(&dword_2175D1000, v32, OS_LOG_TYPE_DEFAULT, "Removed zone (%{public}@), currently tracking %ld zones %{public}@ ", buf, 0x20u);

              }
            }

          }
          ++v19;
        }
        while (v18 != v19);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v18);
    }

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_190_0);
    v36 = v42;
    v6 = v43;
    v37 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v56 = v40;
      v57 = 2114;
      v58 = (uint64_t)v41;
      _os_log_impl(&dword_2175D1000, v38, OS_LOG_TYPE_DEFAULT, "Now tracking %ld zones: %{public}@", buf, 0x16u);

    }
    -[WPDZoneManager updateScanner](self, "updateScanner", v42, v43);

  }
}

- (void)unregisterZonesForClient:(id)a3
{
  -[WPDZoneManager unregisterZonesForClient:updateScanner:](self, "unregisterZonesForClient:updateScanner:", a3, 1);
}

- (void)unregisterZonesForClient:(id)a3 updateScanner:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v20 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_191_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDZoneManager unregisterZonesForClient:updateScanner:].cold.2();
  -[WPDZoneManager trackRequests](self, "trackRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  if (v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_193_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDZoneManager unregisterZonesForClient:updateScanner:].cold.1();
  }
  else
  {
    -[WPDZoneManager trackRequests](self, "trackRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v21);

    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    v34 = 0;
    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[WPDZoneManager trackedZones](self, "trackedZones");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __57__WPDZoneManager_unregisterZonesForClient_updateScanner___block_invoke_194;
    v26[3] = &unk_24D7C51A0;
    v27 = v21;
    v28 = &v29;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)v30[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
          -[WPDZoneManager trackedZones](self, "trackedZones");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v13);

          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_197_0);
          v15 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v13;
            _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "Removed zone (%{public}@)", buf, 0xCu);
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
      }
      while (v10);
    }

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_199_1);
    v16 = (id)WiProxLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      -[WPDZoneManager trackedZones](self, "trackedZones");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v36 = v18;
      v37 = 2114;
      v38 = v19;
      _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "Now tracking %ld zones: %{public}@", buf, 0x16u);

    }
    if (v20)
      -[WPDZoneManager updateScanner](self, "updateScanner");

    _Block_object_dispose(&v29, 8);
  }

}

void __57__WPDZoneManager_unregisterZonesForClient_updateScanner___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kWPClientUUIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_195_2);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Removed client %@ from zone %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (!objc_msgSend(v7, "count"))
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (id)getAllZones
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[WPDZoneManager trackedZones](self, "trackedZones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)unregisterAllZones
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Unregistering all requests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (NSMutableDictionary)trackRequests
{
  return self->_trackRequests;
}

- (void)setTrackRequests:(id)a3
{
  objc_storeStrong((id *)&self->_trackRequests, a3);
}

- (NSMutableDictionary)trackedZones
{
  return self->_trackedZones;
}

- (void)setTrackedZones:(id)a3
{
  objc_storeStrong((id *)&self->_trackedZones, a3);
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCentralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_source)exitTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExitTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)zoneExitTimeout
{
  return self->_zoneExitTimeout;
}

- (void)setZoneExitTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_zoneExitTimeout, a3);
}

- (NSDate)lastTimeScannerStarted
{
  return self->_lastTimeScannerStarted;
}

- (void)setLastTimeScannerStarted:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimeScannerStarted, a3);
}

- (BOOL)scanAllowlisted
{
  return self->_scanAllowlisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeScannerStarted, 0);
  objc_storeStrong((id *)&self->_zoneExitTimeout, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_trackedZones, 0);
  objc_storeStrong((id *)&self->_trackRequests, 0);
}

- (void)initWithServer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "Using custom zone exit timeout value of %@ secs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "Double entry for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __78__WPDZoneManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_124_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_23(&dword_2175D1000, v5, v6, "Discovered a tracked zone peripheral %@ (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)centralManager:(void *)a1 didLoseZone:(void *)a2 mask:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6[0] = 67109634;
  v6[1] = objc_msgSend(a2, "length");
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = a3;
  _os_log_debug_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEBUG, "Received zone lost: %d\n%@\n%@", (uint8_t *)v6, 0x1Cu);

}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "Exiting a zone we're not meant to be in:\n%@\n%@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "no match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__WPDZoneManager_centralManager_didLoseZone_mask___block_invoke_133_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "zoneData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __35__WPDZoneManager_printTrackedZones__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kInZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v7 = CFSTR("IN");
  else
    v7 = CFSTR("OUT");
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kLastSeen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEBUG, "\t%@: %@ last:%@", (uint8_t *)&v9, 0x20u);

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
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "No zones left to track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addZoneTrackingRequest:(void *)a1 forClient:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "state");
  _os_log_error_impl(&dword_2175D1000, v3, OS_LOG_TYPE_ERROR, "Failed to start tracking a zone - central is not powered on %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_0();
}

- (void)unregisterZonesForClient:updateScanner:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "No zones tracked for any client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterZonesForClient:updateScanner:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "Unregistering all zones for client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
