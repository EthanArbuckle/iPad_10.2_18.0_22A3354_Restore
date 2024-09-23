@implementation WPDeviceScanner

- (WPDeviceScanner)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPDeviceScanner *v7;
  WPDeviceScanner *v8;
  uint64_t v9;
  NSMutableArray *liveDevices;
  uint64_t v11;
  NSMutableDictionary *activeScans;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WPDeviceScanner;
  v7 = -[WPClient initWithQueue:machName:](&v14, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    liveDevices = v8->_liveDevices;
    v8->_liveDevices = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    activeScans = v8->_activeScans;
    v8->_activeScans = (NSMutableDictionary *)v11;

    v8->_anyScanResultsRequested = 0;
  }

  return v8;
}

- (WPDeviceScanner)initWithDelegate:(id)a3
{
  return -[WPDeviceScanner initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)WPDeviceScanner;
  -[WPClient description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDeviceScanner liveDevices](self, "liveDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDeviceScanner activeScans](self, "activeScans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(". LiveDevices = %@, Scans = %@"), v6, v7);

  return v5;
}

- (id)clientAsString
{
  return CFSTR("WPDeviceScanner");
}

- (void)invalidate
{
  objc_super v3;

  -[WPDeviceScanner setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPDeviceScanner;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (void)registerForAnyScanResults:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 67109376;
    v9 = -[WPDeviceScanner anyScanResultsRequested](self, "anyScanResultsRequested");
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Device Scanner registering for spy scan results: current %d, new %d", buf, 0xEu);

  }
  if (-[WPDeviceScanner anyScanResultsRequested](self, "anyScanResultsRequested") != v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WPDeviceScanner;
    -[WPClient registerForAnyScanResults:](&v7, sel_registerForAnyScanResults_, v3);
  }
}

- (void)registerForDevicesMatching:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 *v33;
  void *v34;
  int64x2_t v35;
  int64x2_t v36;
  id obj;
  objc_super v38;
  __int128 v39;
  uint64_t v40;
  int64x2_t v41;
  uint64_t v42;
  int64x2_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kPuckTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("kScanDuration"));

  v34 = v6;
  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kScanDuration"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF40];
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerFinished_, 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDeviceScanner activeScans](self, "activeScans");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = CFSTR("kPuckTypes");
    v55[1] = CFSTR("kFoundDevices");
    v56[0] = v7;
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v56[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v16, v17);

  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v10 = v7;
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v10);
          v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[WPDeviceScanner liveDevices](self, "liveDevices");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "containsObject:", v10);

          if ((v24 & 1) == 0)
          {
            -[WPDeviceScanner liveDevices](self, "liveDevices");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v22);

          }
        }
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v19);
    }
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    v35 = vdupq_n_s64(0x12CuLL);
    v36 = vdupq_n_s64(0x17uLL);
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v31 = (void *)objc_opt_new();
        if (objc_msgSend(v30, "isEqualToString:", CFSTR("WPPuckCompany")))
        {
          objc_msgSend(v31, "setActiveScanning:", 1);
          v43 = v36;
          v44 = 23;
          v32 = 2;
          v33 = (__int128 *)&v43;
        }
        else if (objc_msgSend(v30, "isEqualToString:", CFSTR("WPPuckBeaconNoRanging")))
        {
          v41 = v35;
          v42 = 30;
          v32 = 2;
          v33 = (__int128 *)&v41;
        }
        else
        {
          if (!objc_msgSend(v30, "isEqualToString:", CFSTR("WPPuckAirPrint")))
          {

            goto LABEL_27;
          }
          v39 = xmmword_209E73C10;
          v40 = 30;
          v32 = 3;
          v33 = &v39;
        }
        objc_msgSend(v31, "setScanningRates:", v33);
        objc_msgSend(v31, "setAllowDuplicates:", 1);
        objc_msgSend(v31, "setClientType:", v32);
        v38.receiver = self;
        v38.super_class = (Class)WPDeviceScanner;
        -[WPClient startScanning:](&v38, sel_startScanning_, v31);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_27:

}

- (void)unregisterForDevices:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("kPuckTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("WPPuckCompany")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("WPPuckBeaconNoRanging")))
        {
          v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "setClientType:", 2);
          -[WPClient stopScanning:](&v14, sel_stopScanning_, v10, v13.receiver, v13.super_class, self, WPDeviceScanner);
LABEL_9:

          goto LABEL_10;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("WPPuckAirPrint")))
        {
          v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "setClientType:", 3);
          -[WPClient stopScanning:](&v13, sel_stopScanning_, v10, self, WPDeviceScanner, v14.receiver, v14.super_class);
          goto LABEL_9;
        }
LABEL_10:
        ++v8;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = v11;
    }
    while (v11);
  }
  -[WPDeviceScanner liveDevices](self, "liveDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectsInArray:", v4);

}

- (void)unregisterAllDeviceChanges
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("kPuckTypes");
  -[WPDeviceScanner liveDevices](self, "liveDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDeviceScanner unregisterForDevices:](self, "unregisterForDevices:", v4);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPDeviceScanner;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPDeviceScanner delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPDeviceScanner delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceScannerDidUpdateState:", self);

  }
}

- (void)anyDiscoveredDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  WPDeviceScanner *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingPacket"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBB000]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((unint64_t)objc_msgSend(v7, "length") > 3)
    {
      v31 = self;
      v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v32 = objc_retainAutorelease(v7);
      v23 = *(unsigned __int8 *)(objc_msgSend(v32, "bytes") + 2);
      v33 = v5;
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, CFSTR("kPuckRSSI"));
      v34 = v6;
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v6, CFSTR("kPuckID"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, CFSTR("kPuckSaturated"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, CFSTR("kPuckWlanOn"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("kPuckAdvertisingChannel"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("kPuckTypes"));

      v26 = (void *)MEMORY[0x24BDBCE50];
      v27 = objc_retainAutorelease(v32);
      objc_msgSend(v26, "dataWithBytes:length:", objc_msgSend(v27, "bytes") + 4, (int)(objc_msgSend(v27, "length") - 4));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("kPuckAdvertisingData"));

      objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("kPuckDeviceTime"));
      -[WPDeviceScanner delegate](v31, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = objc_opt_respondsToSelector();

      if ((v27 & 1) != 0)
      {
        -[WPDeviceScanner delegate](v31, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "scanner:foundAnyDevice:withData:", v31, v34, v22);

      }
      v5 = v33;
      v6 = v34;
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_115);
      v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDeviceScanner anyDiscoveredDevice:].cold.2(v13);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_113_0);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDeviceScanner anyDiscoveredDevice:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  id v53;
  WPDeviceScanner *v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
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
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingPacket"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBB000]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_135_0);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDeviceScanner anyDiscoveredDevice:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_40;
  }
  if ((unint64_t)objc_msgSend(v7, "length") <= 3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_137_2);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDeviceScanner anyDiscoveredDevice:].cold.2(v11);
    goto LABEL_40;
  }
  v49 = v9;
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = objc_retainAutorelease(v7);
  v22 = objc_msgSend(v21, "bytes");
  v57 = *(unsigned __int8 *)(v22 + 2);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v5, CFSTR("kPuckRSSI"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, CFSTR("kPuckID"));
  v48 = v10;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, CFSTR("kPuckSaturated"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v51, CFSTR("kPuckWlanOn"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, CFSTR("kPuckAdvertisingChannel"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v50, CFSTR("kPuckDeviceTime"));
  if (!-[WPDeviceScanner parseType:atOffset:withSize:intoDictionary:](self, "parseType:atOffset:withSize:intoDictionary:", v57, v22 + 4, objc_msgSend(v21, "length") - 4, v20))goto LABEL_39;
  v44 = v7;
  v45 = v6;
  v46 = v5;
  v47 = v4;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kPuckTypes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[WPDeviceScanner activeScans](self, "activeScans");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v24;
  v58 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (!v58)
    goto LABEL_29;
  v54 = self;
  v55 = *(_QWORD *)v68;
  v53 = v20;
  do
  {
    for (i = 0; i != v58; ++i)
    {
      if (*(_QWORD *)v68 != v55)
        objc_enumerationMutation(obj);
      v26 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
      -[WPDeviceScanner activeScans](self, "activeScans");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v29 = v56;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (!v30)
        goto LABEL_26;
      v31 = v30;
      v32 = 0;
      v33 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v64 != v33)
            objc_enumerationMutation(v29);
          v35 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("kPuckTypes"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v35) = objc_msgSend(v36, "containsObject:", v35);

          v32 |= v35;
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v31);

      v20 = v53;
      self = v54;
      if ((v32 & 1) != 0)
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("kFoundDevices"));
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v53);
LABEL_26:

      }
    }
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  }
  while (v58);
LABEL_29:

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v37 = v56;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  v7 = v44;
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v60 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
        -[WPDeviceScanner liveDevices](self, "liveDevices");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = objc_msgSend(v43, "containsObject:", v42);

        if ((_DWORD)v42)
          -[WPDeviceScanner postDevice:](self, "postDevice:", v20);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v39);
  }

  v5 = v46;
  v4 = v47;
  v6 = v45;
LABEL_39:

  v10 = v48;
  v9 = v49;
LABEL_40:

}

- (BOOL)parseType:(unsigned __int8)a3 atOffset:(char *)a4 withSize:(int)a5 intoDictionary:(id)a6
{
  uint64_t v6;
  int v8;
  id v10;
  BOOL v11;

  v6 = *(_QWORD *)&a5;
  v8 = a3;
  v10 = a6;
  if (v8 == 3)
  {
    -[WPDeviceScanner parseAirPrint:forSize:intoDictionary:](self, "parseAirPrint:forSize:intoDictionary:", a4, v6, v10);
  }
  else
  {
    if (v8 != 2)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[WPDeviceScanner parseCompanyData:forSize:intoDictionary:](self, "parseCompanyData:forSize:intoDictionary:", a4, v6, v10);
  }
  v11 = 1;
LABEL_7:

  return v11;
}

- (void)parseCompanyData:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5
{
  id v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v20 = 0uLL;
  if (a4 < 16 || (v20 = *(_OWORD *)a3, a4 < 0x12))
  {
    v11 = 0;
    v9 = 0;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v9 = __rev16(*((unsigned __int16 *)a3 + 8));
  if (a4 < 0x14)
  {
    v11 = 0;
    goto LABEL_7;
  }
  v10 = __rev16(*((unsigned __int16 *)a3 + 9));
  if (a4 == 20)
  {
    v11 = 0;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = a3[20];
  if (a4 < 0x16)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3[21]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v20);
  if (v13)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("kPuckCompanyUUID"));
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_141);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_DEFAULT, "Company UUID was nil", buf, 2u);
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("kPuckTx"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("kPuckCompanyMajor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("kPuckCompanyMinor"));

  if (v12)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("kPuckConfig"));
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_151_0);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDeviceScanner parseCompanyData:forSize:intoDictionary:].cold.1(v12, v18);
  }
  -[WPDeviceScanner addPuckType:toDictionary:](self, "addPuckType:toDictionary:", CFSTR("WPPuckBeaconNoRanging"), v8);
  -[WPDeviceScanner addPuckType:toDictionary:](self, "addPuckType:toDictionary:", CFSTR("WPPuckCompany"), v8);

}

- (void)parseAirPrint:(char *)a3 forSize:(int)a4 intoDictionary:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a3)
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDBCE50];
      v8 = a4;
      v10 = a5;
      objc_msgSend(v7, "dataWithBytes:length:", a3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("kPuckAirPrintData"));

      -[WPDeviceScanner addPuckType:toDictionary:](self, "addPuckType:toDictionary:", CFSTR("WPPuckAirPrint"), v10);
    }
  }
}

- (void)addPuckType:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("kPuckTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPuckTypes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v6);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCEB8];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("kPuckTypes"));
  }

}

- (void)postDevice:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPDeviceScanner delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPDeviceScanner delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPuckID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scanner:foundDevice:withData:", self, v7, v8);

  }
}

- (void)postDevices:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WPDeviceScanner delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPDeviceScanner delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scanner:foundRequestedDevices:", self, v7);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPDeviceScanner delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPDeviceScanner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanner:didFailToRegisterDevices:withError:", self, 0, v8);

  }
}

- (void)timerFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WPDeviceScanner activeScans](self, "activeScans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kFoundDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDeviceScanner postDevices:](self, "postDevices:", v7);

  -[WPDeviceScanner activeScans](self, "activeScans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObjectForKey:", v9);
}

- (WPDeviceScannerDelegate)delegate
{
  return (WPDeviceScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)liveDevices
{
  return self->_liveDevices;
}

- (void)setLiveDevices:(id)a3
{
  objc_storeStrong((id *)&self->_liveDevices, a3);
}

- (NSMutableDictionary)activeScans
{
  return self->_activeScans;
}

- (void)setActiveScans:(id)a3
{
  objc_storeStrong((id *)&self->_activeScans, a3);
}

- (BOOL)anyScanResultsRequested
{
  return self->_anyScanResultsRequested;
}

- (void)setAnyScanResultsRequested:(BOOL)a3
{
  self->_anyScanResultsRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScans, 0);
  objc_storeStrong((id *)&self->_liveDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)anyDiscoveredDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Discovered a puck with no MFR data, ignoring", a5, a6, a7, a8, 0);
}

- (void)anyDiscoveredDevice:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "Device Scanner: Minimum advertisement data length expected: 4, received: %lu", v5, v6, v7, v8, 0);

  OUTLINED_FUNCTION_7_0();
}

- (void)parseCompanyData:(unsigned __int8)a1 forSize:(NSObject *)a2 intoDictionary:.cold.1(unsigned __int8 a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("kPuckConfig");
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "%@: %02x", (uint8_t *)&v2, 0x12u);
}

@end
