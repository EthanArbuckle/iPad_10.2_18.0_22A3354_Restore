@implementation TVRCSiriRemoteConnectionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstance_0;
}

void __49__TVRCSiriRemoteConnectionManager_sharedInstance__block_invoke()
{
  TVRCSiriRemoteConnectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(TVRCSiriRemoteConnectionManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (TVRCSiriRemoteConnectionManager)init
{
  TVRCSiriRemoteConnectionManager *v2;
  uint64_t v3;
  NSMutableDictionary *connectedSiriRemotes;
  id v5;
  void *v6;
  uint64_t v7;
  CBCentralManager *centralManager;
  uint64_t v9;
  NSMutableSet *remoteInfoSet;
  uint64_t v11;
  NSMutableDictionary *didConnectHandlerBlockMap;
  uint64_t v13;
  NSMutableSet *discoveredPeripherals;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)TVRCSiriRemoteConnectionManager;
  v2 = -[TVRCSiriRemoteConnectionManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    connectedSiriRemotes = v2->_connectedSiriRemotes;
    v2->_connectedSiriRemotes = (NSMutableDictionary *)v3;

    v5 = objc_alloc(MEMORY[0x24BDBB220]);
    v17 = *MEMORY[0x24BDBB198];
    v18[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithDelegate:queue:options:", v2, 0, v6);
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    remoteInfoSet = v2->_remoteInfoSet;
    v2->_remoteInfoSet = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    didConnectHandlerBlockMap = v2->_didConnectHandlerBlockMap;
    v2->_didConnectHandlerBlockMap = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    discoveredPeripherals = v2->_discoveredPeripherals;
    v2->_discoveredPeripherals = (NSMutableSet *)v13;

  }
  return v2;
}

- (void)enableFastFindMy:(BOOL)a3 forRemoteWithInfo:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCBLEDiscoveryLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("Disable");
    if (v4)
      v8 = CFSTR("Enable");
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "%@ fast finding for remote with info: %@", buf, 0x16u);
  }

  if (v4)
  {
    -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _TVRCBLEDiscoveryLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Valid BLE connection found. Skip starting BLE discovery.", buf, 2u);
      }

      -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:](self, "_sendEnableMessage:forRemote:", 1, v11);
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __70__TVRCSiriRemoteConnectionManager_enableFastFindMy_forRemoteWithInfo___block_invoke;
      v13[3] = &unk_24DCD7BC8;
      v13[4] = self;
      -[TVRCSiriRemoteConnectionManager _startDiscoveryForRemoteWithInfo:didConnectHandler:](self, "_startDiscoveryForRemoteWithInfo:didConnectHandler:", v6, v13);
    }

  }
  else
  {
    -[TVRCSiriRemoteConnectionManager _stopDiscoveryForRemoteWithInfo:](self, "_stopDiscoveryForRemoteWithInfo:", v6);
  }

}

uint64_t __70__TVRCSiriRemoteConnectionManager_enableFastFindMy_forRemoteWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = a2;
  _TVRCBLEDiscoveryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "didConnectHandler called", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateFindingSessionState:", 4);
  objc_msgSend(*(id *)(a1 + 32), "_sendEnableMessage:forRemote:", 1, v3);

  return objc_msgSend(*(id *)(a1 + 32), "_stopScanning");
}

- (void)_updateFindingSessionState:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  if (self->_state != a3)
  {
    self->_state = a3;
    -[TVRCSiriRemoteConnectionManager findingSessionStateChangedHandler](self, "findingSessionStateChangedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVRCSiriRemoteConnectionManager findingSessionStateChangedHandler](self, "findingSessionStateChangedHandler");
      v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
      v6[2](v6, a3);

    }
  }
}

- (void)_startDiscoveryForRemoteWithInfo:(id)a3 didConnectHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  CBDiscovery *v10;
  CBDiscovery *cbDiscovery;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCBLEDiscoveryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Start scanning for remote with info: %@", buf, 0xCu);
  }

  -[TVRCSiriRemoteConnectionManager remoteInfoSet](self, "remoteInfoSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  -[TVRCSiriRemoteConnectionManager _startCBScanIfNeeded](self, "_startCBScanIfNeeded");
  if (!self->_cbDiscovery)
  {
    objc_initWeak((id *)buf, self);
    v10 = (CBDiscovery *)objc_alloc_init(MEMORY[0x24BDBB250]);
    cbDiscovery = self->_cbDiscovery;
    self->_cbDiscovery = v10;

    -[CBDiscovery setUseCase:](self->_cbDiscovery, "setUseCase:", 589824);
    -[CBDiscovery setDiscoveryFlags:](self->_cbDiscovery, "setDiscoveryFlags:", 0x200000000);
    -[CBDiscovery addDiscoveryType:](self->_cbDiscovery, "addDiscoveryType:", 14);
    v12 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke;
    v28[3] = &unk_24DCD7BF0;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v7;
    -[CBDiscovery setDeviceFoundHandler:](self->_cbDiscovery, "setDeviceFoundHandler:", v28);
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_33;
    v26[3] = &unk_24DCD7C18;
    objc_copyWeak(&v27, (id *)buf);
    -[CBDiscovery setDeviceLostHandler:](self->_cbDiscovery, "setDeviceLostHandler:", v26);
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_34;
    v24[3] = &unk_24DCD71B8;
    objc_copyWeak(&v25, (id *)buf);
    -[CBDiscovery setInvalidationHandler:](self->_cbDiscovery, "setInvalidationHandler:", v24);
    -[CBDiscovery setInterruptionHandler:](self->_cbDiscovery, "setInterruptionHandler:", &__block_literal_global_36);
    -[CBDiscovery activateWithCompletion:](self->_cbDiscovery, "activateWithCompletion:", &__block_literal_global_39);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TVRCSiriRemoteConnectionManager remoteInfoSet](self, "remoteInfoSet", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "cbKeyInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v15);
  }

  -[TVRCSiriRemoteConnectionManager cbDiscovery](self, "cbDiscovery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOobKeys:", v13);

}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id obj;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  uint8_t buf[4];
  NSObject *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _TVRCBLEDiscoveryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v2;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Device found: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(WeakRetained, "remoteInfoSet");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (!v42)
      goto LABEL_36;
    v6 = *(_QWORD *)v51;
    v44 = *MEMORY[0x24BDBB120];
    v38 = *(_QWORD *)v51;
    v39 = v2;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v51 != v6)
          objc_enumerationMutation(obj);
        v43 = v7;
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v7);
        -[NSObject btAddressData](v2, "btAddressData", v38, v39);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "btAddressData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToData:", v10);

        _TVRCBLEDiscoveryLog();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (!v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412546;
            v59 = v2;
            v60 = 2112;
            v61 = v8;
            _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Device not matched: %@ to info: %@", buf, 0x16u);
          }
LABEL_33:
          v37 = v43;
          goto LABEL_34;
        }
        if (v13)
        {
          *(_DWORD *)buf = 138412546;
          v59 = v2;
          v60 = 2112;
          v61 = v8;
          _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Matched device: %@ to info: %@", buf, 0x16u);
        }

        v14 = objc_alloc(MEMORY[0x24BDD1880]);
        -[NSObject identifier](v2, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithUUIDString:", v15);

        v12 = v16;
        if (!v16)
          goto LABEL_33;
        objc_msgSend(v5, "centralManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v16;
        v57 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "retrievePeripheralsWithIdentifiers:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v19, "count"))
        {
          _TVRCBLEDiscoveryLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v41;
            _os_log_error_impl(&dword_21A51B000, v20, OS_LOG_TYPE_ERROR, "Failed to find any peripherals with UUID: %@", buf, 0xCu);
          }

        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v47 != v24)
                objc_enumerationMutation(v21);
              v26 = *(NSObject **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(v5, "discoveredPeripherals");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "containsObject:", v26);

              if (v28)
              {
                _TVRCBLEDiscoveryLog();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v26;
                  _os_log_impl(&dword_21A51B000, v29, OS_LOG_TYPE_DEFAULT, "Skipping since we previously discovered this peripheral: %@", buf, 0xCu);
                }
              }
              else
              {
                objc_msgSend(v5, "discoveredPeripherals");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v26);

                _TVRCBLEDiscoveryLog();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v26;
                  _os_log_impl(&dword_21A51B000, v31, OS_LOG_TYPE_DEFAULT, "Attemping to connect to :%@", buf, 0xCu);
                }

                v54 = v44;
                v55 = &unk_24DCF90C8;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
                v29 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "centralManager");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "connectPeripheral:options:", v26, v29);

                -[NSObject setDelegate:](v26, "setDelegate:", v5);
                v33 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
                v34 = (void *)MEMORY[0x220746068]();
                objc_msgSend(v5, "didConnectHandlerBlockMap");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject identifier](v26, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v36);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          }
          while (v23);
        }

        v6 = v38;
        v2 = v39;
        v37 = v43;
        v12 = v41;
LABEL_34:

        v7 = v37 + 1;
      }
      while (v7 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (!v42)
      {
LABEL_36:

        break;
      }
    }
  }

}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCBLEDiscoveryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Device lost: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    if (v8)
    {
      objc_msgSend(WeakRetained, "centralManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retrievePeripheralsWithIdentifiers:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v17, "state", (_QWORD)v19) == 1 || objc_msgSend(v17, "state") == 2)
            {
              objc_msgSend(WeakRetained, "centralManager");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "cancelPeripheralConnection:", v17);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }

    }
  }

}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _TVRCBLEDiscoveryLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "CBDiscovery invalidated", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "centralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopScan");

}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_35()
{
  NSObject *v0;
  uint8_t v1[16];

  _TVRCBLEDiscoveryLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21A51B000, v0, OS_LOG_TYPE_DEFAULT, "CBDiscovery interrupted", v1, 2u);
  }

}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_37(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  if (v2)
  {
    _TVRCBLEDiscoveryLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_37_cold_1();

  }
  _TVRCBLEDiscoveryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Activated CBDiscovery", v5, 2u);
  }

}

- (void)_stopDiscoveryForRemoteWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCBLEDiscoveryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Stop scanning for remote with info :%@", buf, 0xCu);
  }

  -[TVRCSiriRemoteConnectionManager remoteInfoSet](self, "remoteInfoSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:](self, "_sendEnableMessage:forRemote:", 0, v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__TVRCSiriRemoteConnectionManager__stopDiscoveryForRemoteWithInfo___block_invoke;
  block[3] = &unk_24DCD70C8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__TVRCSiriRemoteConnectionManager__stopDiscoveryForRemoteWithInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardown");
}

- (void)_stopScanning
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _TVRCBLEDiscoveryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stop Discovery", v6, 2u);
  }

  -[TVRCSiriRemoteConnectionManager centralManager](self, "centralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopScan");

  -[TVRCSiriRemoteConnectionManager cbDiscovery](self, "cbDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[TVRCSiriRemoteConnectionManager setCbDiscovery:](self, "setCbDiscovery:", 0);
}

- (void)teardown
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _TVRCBLEDiscoveryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down ConnectionManager", buf, 2u);
  }

  -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", 2);
  -[TVRCSiriRemoteConnectionManager remoteInfoSet](self, "remoteInfoSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[TVRCSiriRemoteConnectionManager centralManager](self, "centralManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "peripheral");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cancelPeripheralConnection:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[TVRCSiriRemoteConnectionManager discoveredPeripherals](self, "discoveredPeripherals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  -[TVRCSiriRemoteConnectionManager didConnectHandlerBlockMap](self, "didConnectHandlerBlockMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

- (void)_sendEnableMessage:(BOOL)a3 forRemote:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  CCRNGStatus Bytes;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCBLEDiscoveryLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v13 = CFSTR("enable");
      else
        v13 = CFSTR("disable");
      objc_msgSend(v6, "peripheral");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Sending message to %@ fast finding for remote: %@", (uint8_t *)&v22, 0x16u);

    }
    if (v4)
      v15 = &enableFastFindMy;
    else
      v15 = &disableFastFindMy;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v15, 6);
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = malloc_type_malloc(0xAuLL, 0x723C75EFuLL);
    Bytes = CCRandomGenerateBytes(v16, 0xAuLL);
    if (Bytes)
    {
      v18 = Bytes;
      _TVRCBLEDiscoveryLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:].cold.2(v18, v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v16, 10);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v16);
      -[NSObject appendData:](v12, "appendData:", v19);
      objc_msgSend(v6, "peripheral");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "findMyCharacteristic");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "writeValue:forCharacteristic:type:", v12, v21, 1);

      if (v4)
        -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", 1);
    }

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:].cold.1(v6, v12);
  }

}

- (void)_removePeripheral:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCBLEDiscoveryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Remove peripheral: %@", (uint8_t *)&v12, 0xCu);
  }

  -[TVRCSiriRemoteConnectionManager discoveredPeripherals](self, "discoveredPeripherals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    _TVRCBLEDiscoveryLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Removing tracked peripheral: %@", (uint8_t *)&v12, 0xCu);
    }

    -[TVRCSiriRemoteConnectionManager discoveredPeripherals](self, "discoveredPeripherals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v4);

    -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRCBLEDiscoveryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "state");
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "centralManagerDidUpdateState :%ld", (uint8_t *)&v5, 0xCu);
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCBLEDiscoveryLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Did discover peripheral: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_startCBScanIfNeeded
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRCSiriRemoteConnectionManager centralManager](self, "centralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScanning");

  if ((v4 & 1) == 0)
  {
    _TVRCBLEDiscoveryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Started Scanning for Siri Remotes...", v7, 2u);
    }

    -[TVRCSiriRemoteConnectionManager centralManager](self, "centralManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scanForPeripheralsWithServices:options:", 0, 0);

  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  _TVRCBLEDiscoveryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Successfully connected to Remote: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("F5873412-D314-B885-A5AA-EFA546123981"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoverServices:", v7);

  _TVRCBLEDiscoveryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Discovering find my service for peripheral: %@", buf, 0xCu);
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    _TVRCBLEDiscoveryLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected peripheral: %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_10;
  }
  v12 = objc_msgSend(v10, "code");
  _TVRCBLEDiscoveryLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 != 7)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteConnectionManager centralManager:didDisconnectPeripheral:error:].cold.1();
LABEL_10:
    v15 = 5;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Remote button was pressed: %@", (uint8_t *)&v16, 0xCu);
  }
  v15 = 6;
LABEL_11:

  -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", v15);
  -[TVRCSiriRemoteConnectionManager _removePeripheral:](self, "_removePeripheral:", v9);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCBLEDiscoveryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Discovered services %@", buf, 0xCu);

  }
  if (v7)
  {
    _TVRCBLEDiscoveryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverServices:].cold.2();
LABEL_6:

    -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", 3);
    goto LABEL_16;
  }
  objc_msgSend(v6, "services");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    _TVRCBLEDiscoveryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverServices:].cold.1();
    goto LABEL_6;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v6;
  objc_msgSend(v6, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("F5873413-D314-B885-A5AA-EFA546123982"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "discoverCharacteristics:forService:", v20, v18);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

  v6 = v13;
LABEL_16:

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  TVRCSiriRemote *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  void *v28;
  NSObject *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    _TVRCBLEDiscoveryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverCharacteristicsForService:error:].cold.2();

    -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", 3);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(a4, "characteristics");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v15, "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("F5873413-D314-B885-A5AA-EFA546123982"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {
            _TVRCBLEDiscoveryLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v8;
              _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Found Siri Remote with find my characteristic: %@", buf, 0xCu);
            }

            objc_msgSend(v8, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              _TVRCBLEDiscoveryLog();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverCharacteristicsForService:error:].cold.1(v29);

              -[TVRCSiriRemoteConnectionManager _updateFindingSessionState:](self, "_updateFindingSessionState:", 3);
              goto LABEL_23;
            }
            v21 = objc_alloc_init(TVRCSiriRemote);
            -[TVRCSiriRemote setPeripheral:](v21, "setPeripheral:", v8);
            -[TVRCSiriRemote setFindMyCharacteristic:](v21, "setFindMyCharacteristic:", v15);
            -[TVRCSiriRemoteConnectionManager connectedSiriRemotes](self, "connectedSiriRemotes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

            -[TVRCSiriRemoteConnectionManager didConnectHandlerBlockMap](self, "didConnectHandlerBlockMap");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v25);
            v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              ((void (**)(_QWORD, TVRCSiriRemote *))v26)[2](v26, v21);
              -[TVRCSiriRemoteConnectionManager didConnectHandlerBlockMap](self, "didConnectHandlerBlockMap");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v28);

            }
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_23:

    v9 = 0;
  }

}

- (id)findingSessionStateChangedHandler
{
  return self->_findingSessionStateChangedHandler;
}

- (void)setFindingSessionStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableSet)remoteInfoSet
{
  return self->_remoteInfoSet;
}

- (void)setRemoteInfoSet:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInfoSet, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (CBDiscovery)cbDiscovery
{
  return self->_cbDiscovery;
}

- (void)setCbDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_cbDiscovery, a3);
}

- (NSMutableSet)discoveredPeripherals
{
  return self->_discoveredPeripherals;
}

- (void)setDiscoveredPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredPeripherals, a3);
}

- (NSMutableDictionary)connectedSiriRemotes
{
  return self->_connectedSiriRemotes;
}

- (void)setConnectedSiriRemotes:(id)a3
{
  objc_storeStrong((id *)&self->_connectedSiriRemotes, a3);
}

- (NSMutableDictionary)didConnectHandlerBlockMap
{
  return self->_didConnectHandlerBlockMap;
}

- (void)setDidConnectHandlerBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_didConnectHandlerBlockMap, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didConnectHandlerBlockMap, 0);
  objc_storeStrong((id *)&self->_connectedSiriRemotes, 0);
  objc_storeStrong((id *)&self->_discoveredPeripherals, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_remoteInfoSet, 0);
  objc_storeStrong(&self->_findingSessionStateChangedHandler, 0);
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "CBDiscovery failed to activate: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendEnableMessage:(void *)a1 forRemote:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Attemping to send message to remote that is not connected: %@", v4, 0xCu);

}

- (void)_sendEnableMessage:(int)a1 forRemote:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Failed to generate random bytes Error: %d", (uint8_t *)v2, 8u);
}

- (void)centralManager:didDisconnectPeripheral:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "didDisconnectPeripheral:error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)peripheral:didDiscoverServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "No services available for peripheral: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)peripheral:didDiscoverServices:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "didDiscoverServices: error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)peripheral:(os_log_t)log didDiscoverCharacteristicsForService:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A51B000, log, OS_LOG_TYPE_FAULT, "Peripheral name is nil!", v1, 2u);
}

- (void)peripheral:didDiscoverCharacteristicsForService:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "didDiscoverCharacteristicsForService:error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
