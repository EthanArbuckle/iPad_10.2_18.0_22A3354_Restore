@implementation SPCBLeechScanner

- (SPCBLeechScanner)init
{
  SPCBLeechScanner *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  uint64_t v6;
  FMQueueSynchronizer *queueSynchronizer;
  NSObject *v8;
  uint64_t v9;
  SPCBLeechScanner *v10;
  uint32_t v11;
  int v12;
  NSObject *v13;
  SPCBLeechScanner *v14;
  void *v15;
  SPCBLeechScanner *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  FMXPCServiceDescription *serviceDescription;
  uint64_t v22;
  CBCentralManager *centralManager;
  _QWORD v25[4];
  SPCBLeechScanner *v26;
  _QWORD aBlock[4];
  SPCBLeechScanner *v28;
  _QWORD handler[4];
  SPCBLeechScanner *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SPCBLeechScanner;
  v2 = -[SPCBLeechScanner init](&v31, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SPOwner.SPCBLeechScanner", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20208]), "initWithQueue:", v2->_serialQueue);
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v6;

    v8 = v2->_serialQueue;
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __24__SPCBLeechScanner_init__block_invoke;
    handler[3] = &unk_1E5E17350;
    v10 = v2;
    v30 = v10;
    v11 = notify_register_dispatch("com.apple.SPOwner.SPCBLeechScanner", &v2->_notifyToken, v8, handler);
    if (v11)
    {
      v12 = v11;
      LogCategory_CBPeripheralManagement();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SPCBLeechScanner init].cold.1(v12, v13);

    }
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __24__SPCBLeechScanner_init__block_invoke_2;
    aBlock[3] = &unk_1E5E167C8;
    v14 = v10;
    v28 = v14;
    v15 = _Block_copy(aBlock);
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __24__SPCBLeechScanner_init__block_invoke_2;
    v25[3] = &unk_1E5E167C8;
    v16 = v14;
    v26 = v16;
    v17 = _Block_copy(v25);
    v18 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPCBLeechScanner remoteInterface](SPCBLeechScanner, "remoteInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.searchparty.managedperipheral"), 0, v19, v15, v17);
    serviceDescription = v16->_serviceDescription;
    v16->_serviceDescription = (FMXPCServiceDescription *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97728]), "initWithDelegate:queue:", v16, v2->_serialQueue);
    centralManager = v16->_centralManager;
    v16->_centralManager = (CBCentralManager *)v22;

  }
  return v2;
}

uint64_t __24__SPCBLeechScanner_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "handleStateChange:", state64);
}

uint64_t __24__SPCBLeechScanner_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "interruptionHandler:", a2);
}

{
  return objc_msgSend(*(id *)(a1 + 32), "invalidationHandler:", a2);
}

- (void)handleStateChange:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  int v14;
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  LogCategory_CBPeripheralManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    *(_QWORD *)v15 = a3;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: handleStateChange: %llu", (uint8_t *)&v14, 0xCu);
  }

  -[SPCBLeechScanner centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  -[SPCBLeechScanner setEnabled:](self, "setEnabled:", a3 != 0);
  LogCategory_CBPeripheralManagement();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[SPCBLeechScanner enabled](self, "enabled");
    v10 = -[SPCBLeechScanner isScanning](self, "isScanning");
    v14 = 67109376;
    v15[0] = v9;
    LOWORD(v15[1]) = 1024;
    *(_DWORD *)((char *)&v15[1] + 2) = v10;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: enabled: %u isScanning: %u", (uint8_t *)&v14, 0xEu);
  }

  if (!-[SPCBLeechScanner enabled](self, "enabled") && !-[SPCBLeechScanner isScanning](self, "isScanning") && v7 != 5)
  {
    LogCategory_CBPeripheralManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (000)";
LABEL_39:
      _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 2u);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (!-[SPCBLeechScanner enabled](self, "enabled") && !-[SPCBLeechScanner isScanning](self, "isScanning") && v7 == 5)
  {
    LogCategory_CBPeripheralManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (001)";
      goto LABEL_39;
    }
LABEL_40:

    return;
  }
  if (!-[SPCBLeechScanner enabled](self, "enabled") && -[SPCBLeechScanner isScanning](self, "isScanning") && v7 != 5
    || !-[SPCBLeechScanner enabled](self, "enabled") && -[SPCBLeechScanner isScanning](self, "isScanning") && v7 == 5)
  {
    goto LABEL_33;
  }
  if (-[SPCBLeechScanner enabled](self, "enabled") && !-[SPCBLeechScanner isScanning](self, "isScanning") && v7 != 5)
  {
    LogCategory_CBPeripheralManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (100)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  if (-[SPCBLeechScanner enabled](self, "enabled") && !-[SPCBLeechScanner isScanning](self, "isScanning") && v7 == 5)
  {
    -[SPCBLeechScanner startScanning](self, "startScanning");
    return;
  }
  if (-[SPCBLeechScanner enabled](self, "enabled") && -[SPCBLeechScanner isScanning](self, "isScanning") && v7 != 5)
  {
LABEL_33:
    -[SPCBLeechScanner stopScanning](self, "stopScanning");
    return;
  }
  if (-[SPCBLeechScanner enabled](self, "enabled") && -[SPCBLeechScanner isScanning](self, "isScanning") && v7 == 5)
  {
    LogCategory_CBPeripheralManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already running (111)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  LogCategory_CBPeripheralManagement();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[SPCBLeechScanner handleStateChange:].cold.1(self);

}

- (void)startScanning
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SPCBLeechScanner serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: startScanning", v7, 2u);
  }

  v8 = *MEMORY[0x1E0C97670];
  v9[0] = &unk_1E5E35E00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBLeechScanner centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scanForPeripheralsWithServices:options:completion:", 0, v5, &__block_literal_global_7);

  -[SPCBLeechScanner setIsScanning:](self, "setIsScanning:", 1);
}

void __33__SPCBLeechScanner_startScanning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    LogCategory_CBPeripheralManagement();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __33__SPCBLeechScanner_startScanning__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)stopScanning
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[SPCBLeechScanner serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: stopScanning", v6, 2u);
  }

  -[SPCBLeechScanner centralManager](self, "centralManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopScan");

  -[SPCBLeechScanner setIsScanning:](self, "setIsScanning:", 0);
}

- (void)interruptionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: interruptionHandler %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)invalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_CBPeripheralManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: invalidationHandler %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SPCBLeechScanner setSession:](self, "setSession:", 0);
}

- (SPCBPeripheralManagementXPCProtocol)proxy
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[SPCBLeechScanner queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__SPCBLeechScanner_proxy__block_invoke;
  v6[3] = &unk_1E5E17398;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionalSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPCBPeripheralManagementXPCProtocol *)v4;
}

void __25__SPCBLeechScanner_proxy__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D20240]);
    objc_msgSend(*(id *)(a1 + 32), "serviceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithServiceDescription:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setSession:", v5);

    LogCategory_CBPeripheralManagement();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "machService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: Establishing XPC connection to %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "proxy");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_4 != -1)
    dispatch_once(&remoteInterface_onceToken_4, &__block_literal_global_13_0);
  return (id)remoteInterface_interface_3;
}

void __35__SPCBLeechScanner_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27A38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_3;
  remoteInterface_interface_3 = v0;

}

- (void)centralManagerDidUpdateState:(id)a3
{
  objc_msgSend(a3, "state");
  -[SPCBLeechScanner handleStateChange:](self, "handleStateChange:", -[SPCBLeechScanner enabled](self, "enabled"));
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  -[SPCBLeechScanner serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  LogCategory_CBPeripheralManagement();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: didDiscoverPeripheral: %{public}@  RSSI: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  -[SPCBLeechScanner fixupDictionary:](self, "fixupDictionary:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SPCBLeechScanner containsOnlyNSSecureCodable:](self, "containsOnlyNSSecureCodable:", v12))
  {
    -[SPCBLeechScanner proxy](self, "proxy");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject leechScannerDiscoveredAdvertisementData:rssi:completion:](v13, "leechScannerDiscoveredAdvertisementData:rssi:completion:", v12, objc_msgSend(v9, "intValue"), &__block_literal_global_69);
  }
  else
  {
    LogCategory_CBPeripheralManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SPCBLeechScanner centralManager:didDiscoverPeripheral:advertisementData:RSSI:].cold.1(v13);
  }

}

void __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    LogCategory_CBPeripheralManagement();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (id)fixupDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = *MEMORY[0x1E0C97620];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97620]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v4 = v17;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, v5);

  }
  return v4;
}

- (BOOL)containsOnlyNSSecureCodable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSObject allKeys](v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EEE16870) & 1) == 0)
          {
            LogCategory_CBPeripheralManagement();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[SPCBLeechScanner containsOnlyNSSecureCodable:].cold.1();

LABEL_38:
            v14 = 0;
            goto LABEL_39;
          }
          -[NSObject objectForKey:](v5, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SPCBLeechScanner containsOnlyNSSecureCodable:](self, "containsOnlyNSSecureCodable:", v12);

          if (!v13)
            goto LABEL_38;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v14 = 1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v14 = 1;
    }
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = v4;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
LABEL_15:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v5);
        if (!-[SPCBLeechScanner containsOnlyNSSecureCodable:](self, "containsOnlyNSSecureCodable:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18)))break;
        if (v16 == ++v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v16)
            goto LABEL_15;
          goto LABEL_31;
        }
      }
LABEL_32:
      v14 = 0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = v4;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
LABEL_25:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v5);
        if (!-[SPCBLeechScanner containsOnlyNSSecureCodable:](self, "containsOnlyNSSecureCodable:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22), (_QWORD)v25))goto LABEL_32;
        if (v20 == ++v22)
        {
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v20)
            goto LABEL_25;
          break;
        }
      }
    }
LABEL_31:
    v14 = 1;
LABEL_33:

    goto LABEL_40;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEE16870) & 1) != 0)
  {
    v14 = 1;
    goto LABEL_41;
  }
  LogCategory_CBPeripheralManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SPCBLeechScanner containsOnlyNSSecureCodable:].cold.2();
  v14 = 0;
LABEL_40:

LABEL_41:
  return v14;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_queueSynchronizer, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)init
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: notify_register_dispatch error: %u", (uint8_t *)v2, 8u);
}

- (void)handleStateChange:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "centralManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "state");
  OUTLINED_FUNCTION_0_2(&dword_1AEA79000, v2, v3, "SPCBLeechScanner: Unexpected state: enabled: %llu centralState: %lu", v4, v5, v6, v7, 0);

}

void __33__SPCBLeechScanner_startScanning__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "SPCBLeechScanner: scan error: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)centralManager:(os_log_t)log didDiscoverPeripheral:advertisementData:RSSI:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AEA79000, log, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: advertisementData is not NSSecureCodable!", v1, 2u);
}

void __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "SPCBLeechScanner: leechScannerDiscoveredAdvertisementData error: %@", a5, a6, a7, a8, 2u);
}

- (void)containsOnlyNSSecureCodable:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_0_2(&dword_1AEA79000, v2, v3, "SPCBLeechScanner: NSDictionary key not NSSecureCodable: %@: %@!", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)containsOnlyNSSecureCodable:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_0_2(&dword_1AEA79000, v2, v3, "SPCBLeechScanner: not NSSecureCodable: %@: %@!", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
