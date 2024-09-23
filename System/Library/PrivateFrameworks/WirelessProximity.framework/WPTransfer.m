@implementation WPTransfer

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  WPTransfer *v13;
  WPTransfer *v14;
  uint64_t v15;
  NSMutableSet *ignoredDevices;
  uint64_t v17;
  NSMutableData *notificationData;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  WPTransfer *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WPTransfer;
  v13 = -[WPClient initWithQueue:machName:](&v25, sel_initWithQueue_machName_, a4, v11);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_advertising = 0;
    v14->_scanning = 0;
    v14->_connectedToPeripheral = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    ignoredDevices = v14->_ignoredDevices;
    v14->_ignoredDevices = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v17 = objc_claimAutoreleasedReturnValue();
    notificationData = v14->_notificationData;
    v14->_notificationData = (NSMutableData *)v17;

    v14->_sentEOM = 0;
    v14->_sendingTransferComplete = 0;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WPTimeAfterUnlock"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v19 = (void *)objc_msgSend(v19, "integerValue");
    v14->_lockScanTimer = (int64_t)v19;

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_10);
  v21 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    -[WPTransfer delegate](v14, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v27 = v14;
    v28 = 2114;
    v29 = v11;
    v30 = 2048;
    v31 = v23;
    _os_log_impl(&dword_209E41000, v22, OS_LOG_TYPE_DEFAULT, "ATVSetup initWithDelegate self: %p with machName: %{public}@, delegate: %p", buf, 0x20u);

  }
  return v14;
}

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  return -[WPTransfer initWithDelegate:queue:machName:options:](self, "initWithDelegate:queue:machName:options:", a3, a4, a5, 0);
}

- (WPTransfer)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[WPTransfer initWithDelegate:queue:machName:options:](self, "initWithDelegate:queue:machName:options:", a3, a4, 0, 0);
}

- (id)clientAsString
{
  return CFSTR("WPATVSetup");
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_93);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup invalidate", buf, 2u);
  }
  -[WPTransfer setDelegate:](self, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WPTransfer;
  -[WPClient invalidate](&v4, sel_invalidate);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_96_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup dealloc", buf, 2u);
  }
  -[WPTransfer invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)WPTransfer;
  -[WPClient dealloc](&v4, sel_dealloc);
}

- (void)startScan
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_209E41000, v0, v1, "Using custom ATVSetup RSSI cutoff value of %@ dBm", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)stopScan
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_116_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup stop scanning for ATV Setup", buf, 2u);
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setClientType:", 4);
  v5.receiver = self;
  v5.super_class = (Class)WPTransfer;
  -[WPClient stopScanning:](&v5, sel_stopScanning_, v4);
  -[WPTransfer setScanning:](self, "setScanning:", 0);

}

- (void)populateClientGATT:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)startAdvertising
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("ATVSetup advertising is not supported on this platform");
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a1, a3, "%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)stopAdvertising
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_119_1);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "ATVSetup stop advertising for ATV Setup", buf, 2u);
  }
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)WPTransfer;
  -[WPClient stopAdvertising:](&v5, sel_stopAdvertising_, v4);
  -[WPTransfer setAdvertising:](self, "setAdvertising:", 0);

}

- (void)ignoreDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPTransfer ignoredDevices](self, "ignoredDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_123);
    v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "ATVSetup Ignoring device %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_124_1);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTransfer advertisingFailedToStart:ofType:].cold.1(v6);
  -[WPTransfer setAdvertising:](self, "setAdvertising:", 0);
  -[WPTransfer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPTransfer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transferDidFailToStartAdvertising:", v5);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_127);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTransfer scanningFailedToStart:ofType:].cold.1(v6);
  -[WPTransfer setScanning:](self, "setScanning:", 0);
  -[WPTransfer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPTransfer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transferDidFailToStartScanning:", v5);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id obj;
  id obja;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentDomainForName:", CFSTR("com.apple.MobileBluetooth.debug"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WIPROX"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ATVCutoff"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_130);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPTransfer startScan].cold.2();
  }
  else
  {
    v13 = &unk_24C290D10;
  }
  v14 = objc_msgSend(v4, "integerValue");
  if (v14 >= objc_msgSend(v13, "integerValue") && objc_msgSend(v4, "integerValue") <= 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_132_0);
    v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      v24 = v15;
      -[WPTransfer clientAsString](self, "clientAsString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v25;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v7;
      _os_log_debug_impl(&dword_209E41000, v24, OS_LOG_TYPE_DEBUG, "ATVSetup %@ evaluating %@ (data: %@)", buf, 0x20u);

    }
    if (objc_msgSend(v7, "length"))
    {
      v16 = objc_retainAutorelease(v7);
      if (*(_BYTE *)(objc_msgSend(v16, "bytes") + 4))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_134);
        v17 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v6;
          v33 = 2112;
          v34 = v4;
          v35 = 2112;
          v36 = v16;
          _os_log_debug_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEBUG, "ATVSetup Discovered %@ (%@), but advertising packet (%@) indicates it will use nearby info. Discontinuing legacy setup.", buf, 0x20u);
        }
        goto LABEL_9;
      }
    }
    -[WPTransfer ignoredDevices](self, "ignoredDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", v5);

    if (v19)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_136_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTransfer deviceDiscovered:].cold.1();
      goto LABEL_9;
    }
    -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", v5);

      if (!v23)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_142);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPTransfer deviceDiscovered:].cold.3();
        -[WPTransfer setCurrentPeripheralUUID:](self, "setCurrentPeripheralUUID:", v5, obj);
        objc_sync_exit(obja);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_144);
        v26 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v32 = v6;
          v33 = 2114;
          v34 = v4;
          _os_log_impl(&dword_209E41000, v26, OS_LOG_TYPE_DEFAULT, "ATVSetup trying to connect to %{public}@ (%{public}@)", buf, 0x16u);
        }
        v30.receiver = self;
        v30.super_class = (Class)WPTransfer;
        -[WPClient connectToPeer:](&v30, sel_connectToPeer_, v5);
        goto LABEL_9;
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_140_1);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPTransfer deviceDiscovered:].cold.2();
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_138_1);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTransfer deviceDiscovered:].cold.4();
    }
    objc_sync_exit(obj);

  }
LABEL_9:

}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v5 = a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    if (v5)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_149_0);
      v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v8;
        _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup connected to device: %{public}@", buf, 0xCu);
      }
      v23 = CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07");
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18.receiver = self;
      v18.super_class = (Class)WPTransfer;
      -[WPClient discoverCharacteristicsAndServices:forPeripheral:](&v18, sel_discoverCharacteristicsAndServices_forPeripheral_, v14, v8);

    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_154_0);
      v15 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        objc_msgSend(v9, "localizedDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v8;
        v21 = 2114;
        v22 = v17;
        _os_log_impl(&dword_209E41000, v16, OS_LOG_TYPE_DEFAULT, "ATVSetup connected to device: %{public}@ with error %{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_147);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTransfer connectedDevice:withError:shouldDiscover:].cold.1();
  }

}

- (void)disconnectedDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_155);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_209E41000, v9, OS_LOG_TYPE_DEFAULT, "ATVSetup disconnected from device: %{public}@ with error: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  if (v7)
  {
    -[WPTransfer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[WPTransfer delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transferDidFailWithError:", v7);

    }
  }
  -[WPTransfer setCurrentPeripheralUUID:](self, "setCurrentPeripheralUUID:", 0);
  -[WPTransfer setConnectedToPeripheral:](self, "setConnectedToPeripheral:", 0);
  -[WPTransfer notificationData](self, "notificationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLength:", 0);

}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  uint8_t v16[8];
  _QWORD v17[5];
  objc_super v18;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[WPTransfer setConnectedToPeripheral:](self, "setConnectedToPeripheral:", 1);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_164_0);
      v11 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "ATVSetup discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v20 = 0;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __65__WPTransfer_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_165;
      v17[3] = &unk_24C286AD8;
      v17[4] = buf;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_169_0);
        v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup subscribing to ATV setup characteristic", v16, 2u);
        }
        v15.receiver = self;
        v15.super_class = (Class)WPTransfer;
        -[WPClient shouldSubscribe:toPeer:withCharacteristic:inService:](&v15, sel_shouldSubscribe_toPeer_withCharacteristic_inService_, 1, v7, CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"), CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"));
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_173_0);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:].cold.2();
        v14.receiver = self;
        v14.super_class = (Class)WPTransfer;
        -[WPClient disconnectFromPeer:](&v14, sel_disconnectFromPeer_, v7);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_160);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:].cold.1();
      v18.receiver = self;
      v18.super_class = (Class)WPTransfer;
      -[WPClient disconnectFromPeer:](&v18, sel_disconnectFromPeer_, v7);
    }

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158_2);
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTransfer discoveredCharacteristicsAndServices:forPeripheral:].cold.3(v13, v7, self);
  }

}

void __65__WPTransfer_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_165(uint64_t a1, void *a2, _BYTE *a3)
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_166_0);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "ATVSetup found our characteristic, subsribe to it.", v6, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", v16) & 1) != 0)
  {

  }
  else
  {
    v17 = -[WPTransfer scanning](self, "scanning");

    if (v17)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_174_0);
      v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:].cold.3((uint64_t)v13, v18, self);
      goto LABEL_46;
    }
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9")) & 1) != 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07")) & 1) != 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_181_1);
      v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        -[WPTransfer notificationData](self, "notificationData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v10;
        v41 = 2114;
        v42 = v13;
        v43 = 2114;
        v44 = v22;
        _os_log_impl(&dword_209E41000, v21, OS_LOG_TYPE_DEFAULT, "ATVSetup received data: %{public}@ from device: %{public}@, existing data: %{public}@", buf, 0x20u);

      }
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("EOM")))
      {
        -[WPTransfer notificationData](self, "notificationData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24)
        {
          -[WPTransfer notificationData](self, "notificationData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPTransfer receivedData:](self, "receivedData:", v25);

        }
        -[WPTransfer notificationData](self, "notificationData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setLength:", 0);

      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("COMPLETE")))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_183_0);
        v27 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209E41000, v27, OS_LOG_TYPE_DEFAULT, "ATVSetup COMPLETE", buf, 2u);
        }
        -[WPTransfer notificationData](self, "notificationData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setLength:", 0);

        if (-[WPTransfer scanning](self, "scanning"))
        {
          v36.receiver = self;
          v36.super_class = (Class)WPTransfer;
          -[WPClient disconnectFromPeer:](&v36, sel_disconnectFromPeer_, v13);
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_185_0);
          v32 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209E41000, v32, OS_LOG_TYPE_DEFAULT, "ATVSetup - We are peripheral, wait for central to get disconnected", buf, 2u);
          }
          -[WPTransfer setUnsubscribeComing:](self, "setUnsubscribeComing:", 1);
        }
      }
      else
      {
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("FAIL")))
        {
          v37 = *MEMORY[0x24BDD0FC8];
          v38 = CFSTR("Received transfer fail message from the other side");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 23, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPTransfer transferFailed:](self, "transferFailed:", v30);
          -[WPTransfer notificationData](self, "notificationData");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLength:", 0);

        }
        else
        {
          -[WPTransfer notificationData](self, "notificationData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "appendData:", v10);

          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_189);
          v34 = (void *)WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_45;
          v29 = v34;
          -[WPTransfer notificationData](self, "notificationData");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v10;
          v41 = 2114;
          v42 = v35;
          _os_log_impl(&dword_209E41000, v29, OS_LOG_TYPE_DEFAULT, "ATVSetup got new data %{public}@, data is now %{public}@", buf, 0x16u);

        }
      }
LABEL_45:

      goto LABEL_46;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:].cold.1();
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:].cold.2();
  }
LABEL_46:

}

- (void)receivedData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  objc_super v37;
  objc_super v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPTransfer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPTransfer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transferDidReceiveData:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((unint64_t)objc_msgSend(v8, "length") < 0xEA61)
      {
        if (!objc_msgSend(v8, "length"))
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_196);
          v33 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPTransfer receivedData:].cold.5(v33);
          v12 = (void *)MEMORY[0x24BDD1540];
          v42 = *MEMORY[0x24BDD0FC8];
          v43 = CFSTR("Data too short to send");
          v13 = (void *)MEMORY[0x24BDBCE70];
          v14 = &v43;
          v15 = &v42;
          goto LABEL_50;
        }
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_192_0);
        v9 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPTransfer receivedData:].cold.4(v9);
        -[WPTransfer delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          v12 = (void *)MEMORY[0x24BDD1540];
          v44 = *MEMORY[0x24BDD0FC8];
          v45[0] = CFSTR("Data too long to send");
          v13 = (void *)MEMORY[0x24BDBCE70];
          v14 = (const __CFString **)v45;
          v15 = &v44;
LABEL_50:
          objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 23, v34);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[WPTransfer delegate](self, "delegate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "transferDidFailWithError:", v17);

          goto LABEL_51;
        }
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_200_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTransfer receivedData:].cold.3();
      -[WPTransfer setSentEOM:](self, "setSentEOM:", 0);
      v17 = (void *)objc_opt_new();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"));
      objc_msgSend(v17, "setUuid:", v25);

      objc_msgSend(v17, "setData:", v8);
      -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPClient sendDataToCharacteristic:inService:forPeer:](&v39, sel_sendDataToCharacteristic_inService_forPeer_, v17, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, v36.receiver, v36.super_class, v37.receiver, v37.super_class, v38.receiver, v38.super_class, self, WPTransfer);
      }
      else
      {
        -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPClient sendDataToCharacteristic:inService:forPeer:](&v38, sel_sendDataToCharacteristic_inService_forPeer_, v17, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, v36.receiver, v36.super_class, v37.receiver, v37.super_class, self, WPTransfer, v39.receiver, v39.super_class);
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_206);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPTransfer receivedData:].cold.2();
      v17 = (void *)objc_opt_new();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"));
      objc_msgSend(v17, "setUuid:", v18);

      objc_msgSend(CFSTR("COMPLETE"), "dataUsingEncoding:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setData:", v19);

      if (-[WPTransfer advertiserConnected](self, "advertiserConnected")
        && (-[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v20))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_208_0);
        v21 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v23;
          _os_log_impl(&dword_209E41000, v22, OS_LOG_TYPE_DEFAULT, "ATVSetup Peripheral sending transfer complete to Central: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v17, "setProperties:", 1);
        -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPClient sendDataToCharacteristic:inService:forPeer:](&v37, sel_sendDataToCharacteristic_inService_forPeer_, v17, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, v36.receiver, v36.super_class, self, WPTransfer, v38.receiver, v38.super_class, v39.receiver, v39.super_class);
      }
      else
      {
        if (!-[WPTransfer connectedToPeripheral](self, "connectedToPeripheral")
          || (-[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v27,
              !v27))
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_212_0);
          v32 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPTransfer receivedData:].cold.1(v32, self);
          goto LABEL_51;
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_210_0);
        v28 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "UUIDString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v31;
          _os_log_impl(&dword_209E41000, v29, OS_LOG_TYPE_DEFAULT, "ATVSetup Central sending transfer complete to Peripheral: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v17, "setProperties:", 0);
        -[WPTransfer setSendingTransferComplete:](self, "setSendingTransferComplete:", 1);
        -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPClient sendDataToCharacteristic:inService:forPeer:](&v36, sel_sendDataToCharacteristic_inService_forPeer_, v17, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, self, WPTransfer, v37.receiver, v37.super_class, v38.receiver, v38.super_class, v39.receiver, v39.super_class);
      }
    }

LABEL_51:
    goto LABEL_52;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_214_1);
  v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTransfer receivedData:].cold.6(v16, (uint64_t)self);
LABEL_52:

}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  WPTransfer *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9")) & 1) != 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07")) & 1) != 0)
    {
      if (-[WPTransfer sendingTransferComplete](self, "sendingTransferComplete"))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_219_0);
        v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "ATVSetup transfer is completed, disconnect", buf, 2u);
        }
        -[WPTransfer setSendingTransferComplete:](self, "setSendingTransferComplete:", 0);
        v28.receiver = self;
        v28.super_class = (Class)WPTransfer;
        -[WPClient shouldSubscribe:toPeer:withCharacteristic:inService:](&v28, sel_shouldSubscribe_toPeer_withCharacteristic_inService_, 0, v11, CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"), CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"));
        v27.receiver = self;
        v27.super_class = (Class)WPTransfer;
        -[WPClient disconnectFromPeer:](&v27, sel_disconnectFromPeer_, v11);
      }
      else if (-[WPTransfer sentEOM](self, "sentEOM"))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_221_1);
        v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "ATVSetup already sent EOM, return", buf, 2u);
        }
      }
      else
      {
        -[WPTransfer setSentEOM:](self, "setSentEOM:", 1);
        v14 = (void *)objc_opt_new();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6C251515-F290-4F91-808C-5123A0CD02E9"));
        objc_msgSend(v14, "setUuid:", v15);

        objc_msgSend(CFSTR("EOM"), "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setData:", v16);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_223_0);
        v17 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          objc_msgSend(v14, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v30 = v19;
          v31 = 2114;
          v32 = v21;
          v33 = 2114;
          v34 = v22;
          v35 = 2048;
          v36 = self;
          _os_log_impl(&dword_209E41000, v18, OS_LOG_TYPE_DEFAULT, "ATVSetup send data: %{public}@, peripheral: %{public}@, central: %{public}@, self: %p", buf, 0x2Au);

        }
        -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[WPTransfer currentPeripheralUUID](self, "currentPeripheralUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPClient sendDataToCharacteristic:inService:forPeer:](&v26, sel_sendDataToCharacteristic_inService_forPeer_, v14, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, v25.receiver, v25.super_class, self, WPTransfer);
        }
        else
        {
          -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPClient sendDataToCharacteristic:inService:forPeer:](&v25, sel_sendDataToCharacteristic_inService_forPeer_, v14, CFSTR("2AE5F669-81BB-435F-961C-EADD8A30AF07"), v24, self, WPTransfer, v26.receiver, v26.super_class);
        }

      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_217_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:].cold.1();
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_215);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTransfer receivedData:forCharacteristic:inService:forPeripheral:].cold.2();
  }

}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v8 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_224);
    v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "ATVSetup subscribed to characteristic %{public}@ for service %{public}@", (uint8_t *)&v14, 0x16u);
    }
    -[WPTransfer receivedData:](self, "receivedData:", 0);
  }

}

- (void)transferFailed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_225_1);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTransfer transferFailed:].cold.1(v5);
  -[WPTransfer delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[WPTransfer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WPTransfer delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transferDidFailWithError:", v4);

    }
  }

}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  WPCharacteristic *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  WPTransfer *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v8 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v8)
  {
    -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 == v10)
    {

    }
    else
    {
      v14 = (void *)v13;
      -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_226_0);
        v16 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v10;
          v44 = 2114;
          v45 = v18;
          _os_log_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEFAULT, "ATVSetup central %{public}@ has subscribed, but %{public}@ is already subscribed.  Sending back invalid connection message", buf, 0x16u);

        }
        v19 = objc_alloc_init(WPCharacteristic);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
        -[WPCharacteristic setUuid:](v19, "setUuid:", v20);

        objc_msgSend(CFSTR("INV_CONNECTION"), "dataUsingEncoding:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPCharacteristic setData:](v19, "setData:", v21);

        -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPClient sendDataToCharacteristic:inService:forPeer:](self, "sendDataToCharacteristic:inService:forPeer:", v19, v12, v22);

        goto LABEL_45;
      }
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_228_1);
    v32 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v10;
      _os_log_impl(&dword_209E41000, v32, OS_LOG_TYPE_DEFAULT, "ATVSetup Central %{public}@ subscribed to ATVSetup characteristic", buf, 0xCu);
    }
    -[WPTransfer setCurrentlySubscribedCentral:](self, "setCurrentlySubscribedCentral:", v10);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_230);
    v33 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v33, OS_LOG_TYPE_DEFAULT, "ATVSetup Client subscribed - transfer beginning", buf, 2u);
    }
    v34 = self;
    v35 = 1;
LABEL_44:
    -[WPTransfer setAdvertiserConnected:](v34, "setAdvertiserConnected:", v35);
    goto LABEL_45;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_232_1);
  v23 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v10;
    _os_log_impl(&dword_209E41000, v23, OS_LOG_TYPE_DEFAULT, "ATVSetup Central %{public}@ unsubscribed from ATVSetup characteristic", buf, 0xCu);
  }
  -[WPTransfer currentlySubscribedCentral](self, "currentlySubscribedCentral");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", v10);

  if ((v25 & 1) != 0)
  {
    -[WPTransfer setCurrentlySubscribedCentral:](self, "setCurrentlySubscribedCentral:", 0);
    -[WPTransfer notificationData](self, "notificationData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLength:", 0);

    if (-[WPTransfer advertising](self, "advertising"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_236_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTransfer central:subscribed:toCharacteristic:inService:].cold.1();
      -[WPTransfer startAdvertising](self, "startAdvertising");
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_238_0);
    v27 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v27, OS_LOG_TYPE_DEFAULT, "ATVSetup client unsubscribed - we're done with this transaction", buf, 2u);
    }
    if (-[WPTransfer unsubscribeComing](self, "unsubscribeComing"))
    {
      -[WPTransfer delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_opt_respondsToSelector();

      if ((v29 & 1) != 0)
      {
        -[WPTransfer delegate](self, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "transferComplete");

      }
      -[WPTransfer setUnsubscribeComing:](self, "setUnsubscribeComing:", 0);
    }
    else
    {
      v36 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = CFSTR("Client unsubscribed before the transfer was complete");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 23, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPTransfer delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "transferDidFailWithError:", v38);

    }
    v34 = self;
    v35 = 0;
    goto LABEL_44;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_234);
  v31 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPTransfer central:subscribed:toCharacteristic:inService:].cold.2((uint64_t)v10, v31, self);
LABEL_45:

}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v5 = -[WPClient state](self, "state");
  v12.receiver = self;
  v12.super_class = (Class)WPTransfer;
  -[WPClient stateDidChange:](&v12, sel_stateDidChange_, a3);
  if (v5 != a3)
  {
    -[WPTransfer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPTransfer delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transferDidUpdateAdvertiserState:", self);

    }
    -[WPTransfer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[WPTransfer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transferDidUpdateScannerState:", self);

    }
  }
}

- (WPTransferDelegate)delegate
{
  return (WPTransferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)advertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (BOOL)connectedToPeripheral
{
  return self->_connectedToPeripheral;
}

- (void)setConnectedToPeripheral:(BOOL)a3
{
  self->_connectedToPeripheral = a3;
}

- (BOOL)unsubscribeComing
{
  return self->_unsubscribeComing;
}

- (void)setUnsubscribeComing:(BOOL)a3
{
  self->_unsubscribeComing = a3;
}

- (BOOL)advertiserConnected
{
  return self->_advertiserConnected;
}

- (void)setAdvertiserConnected:(BOOL)a3
{
  self->_advertiserConnected = a3;
}

- (BOOL)sentEOM
{
  return self->_sentEOM;
}

- (void)setSentEOM:(BOOL)a3
{
  self->_sentEOM = a3;
}

- (NSUUID)currentPeripheralUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentPeripheralUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableSet)ignoredDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIgnoredDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableData)notificationData
{
  return (NSMutableData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSUUID)currentlySubscribedCentral
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrentlySubscribedCentral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (int64_t)lockScanTimer
{
  return self->_lockScanTimer;
}

- (void)setLockScanTimer:(int64_t)a3
{
  self->_lockScanTimer = a3;
}

- (BOOL)sendingTransferComplete
{
  return self->_sendingTransferComplete;
}

- (void)setSendingTransferComplete:(BOOL)a3
{
  self->_sendingTransferComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySubscribedCentral, 0);
  objc_storeStrong((id *)&self->_notificationData, 0);
  objc_storeStrong((id *)&self->_ignoredDevices, 0);
  objc_storeStrong((id *)&self->_currentPeripheralUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)advertisingFailedToStart:(void *)a1 ofType:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "ATVSetup failed to start ATV Setup advertising with error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)scanningFailedToStart:(void *)a1 ofType:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "ATVSetup failed to start ATV Setup scanning with error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)deviceDiscovered:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_16(&dword_209E41000, v0, (uint64_t)v0, "ATVSetup Discovered %@ (%@) but it's in the list of ignored devices", v1);
  OUTLINED_FUNCTION_1();
}

- (void)deviceDiscovered:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v0, (uint64_t)v0, "ATVSetup redundant code hit. Discovered %@ (%@) but already trying to connect to it", v1);
  OUTLINED_FUNCTION_1();
}

- (void)deviceDiscovered:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_209E41000, v0, v1, "ATVSetup Setting current peripheral to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deviceDiscovered:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_209E41000, v0, v1, "ATVSetup We've already sent a connection request, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)connectedDevice:withError:shouldDiscover:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup Being told we've connected to a device that we didn't request to connect to, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup can't find the ATV Setup service. Disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup characteristic wasn't found, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)discoveredCharacteristicsAndServices:(void *)a3 forPeripheral:.cold.3(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];

  v5 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "currentPeripheralUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v5, v9, "ATVSetup being told we've connected to a device %@ that we didn't request to connect to, ignoring - current peripheral %@", v10);

  OUTLINED_FUNCTION_0_1();
}

- (void)receivedData:forCharacteristic:inService:forPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup data updated for a service we're not interested in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)receivedData:forCharacteristic:inService:forPeripheral:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup data updated for a characteristic we're not interested in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)receivedData:(void *)a3 forCharacteristic:inService:forPeripheral:.cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "currentPeripheralUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v4, v6, "ATVSetup data updated for a peripheral %@ we're not interested in %@", v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)receivedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "currentlySubscribedCentral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "currentPeripheralUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138413058;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 1024;
  v11 = objc_msgSend(a2, "connectedToPeripheral");
  v12 = 1024;
  v13 = objc_msgSend(a2, "advertiserConnected");
  _os_log_error_impl(&dword_209E41000, v3, OS_LOG_TYPE_ERROR, "ATVSetup Error: Trying to close a transfer on a WPTransfer object that is neither advertising:%@ or scanning:%@ or connected:%d, advconnected: %d", (uint8_t *)&v6, 0x22u);

}

- (void)receivedData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "ATVSetup got a nil response from app, sending complete message and tearing down connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)receivedData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_209E41000, v0, v1, "ATVSetup data received from app: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)receivedData:(void *)a1 .cold.4(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_11_1(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15();
  v4 = 60000;
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v1, v2, "ATVSetup data length is too long %lu (Max: %ld", v3);

  OUTLINED_FUNCTION_7_0();
}

- (void)receivedData:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11_1(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v2, v3, "ATVSetup data length is too short %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_0();
}

- (void)receivedData:(void *)a1 .cold.6(void *a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17(), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  v7 = a2;
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v2, v5, "ATVSetup delegate: %p doesn't exist, self: %p", v6);

  OUTLINED_FUNCTION_0_1();
}

- (void)transferFailed:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_2(&dword_209E41000, v3, v4, "ATVSetup transfer failed with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_209E41000, v0, v1, "ATVSetup restart ATV advertisement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)central:(void *)a3 subscribed:toCharacteristic:inService:.cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "currentlySubscribedCentral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_16(&dword_209E41000, v4, v6, "ATVSetup Warning: Central %@ did unsubscribe.  currentlySubscribedCentral is %@", v7);

  OUTLINED_FUNCTION_0_1();
}

@end
