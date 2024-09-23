@implementation SPOfflineAdvertisingKeysDelegate

- (SPOfflineAdvertisingKeysDelegate)initWithBeaconManager:(id)a3
{
  id v5;
  SPOfflineAdvertisingKeysDelegate *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  id v11;
  void *v12;
  uint64_t v13;
  FMXPCServiceDescription *serviceDescription;
  id v15;
  OS_dispatch_queue *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CBPeripheralManager *peripheralManager;
  uint8_t v22[8];
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SPOfflineAdvertisingKeysDelegate;
  v6 = -[SPOfflineAdvertisingKeysDelegate init](&v23, sel_init);
  if (v6)
  {
    LogCategory_OfflineAdvertising();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: SPOfflineAdvertisingKeysDelegate created.", v22, 2u);
    }

    objc_storeStrong((id *)&v6->_beaconManager, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("SPOfflineAdvertisingKeysDelegate", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D20238]);
    -[SPOfflineAdvertisingKeysDelegate remoteInterface](v6, "remoteInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager"), 0, v12, 0, 0);
    serviceDescription = v6->_serviceDescription;
    v6->_serviceDescription = (FMXPCServiceDescription *)v13;

    v15 = objc_alloc(MEMORY[0x1E0C97768]);
    v16 = v6->_queue;
    v17 = *MEMORY[0x1E0C976B0];
    v24[0] = *MEMORY[0x1E0C97698];
    v24[1] = v17;
    v25[0] = MEMORY[0x1E0C9AAB0];
    v25[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "initWithDelegate:queue:options:", v6, v16, v18);
    peripheralManager = v6->_peripheralManager;
    v6->_peripheralManager = (CBPeripheralManager *)v19;

  }
  return v6;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27978);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4, v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_offlineAdvertisingKeysForReason_completion_, 0, 1);

  return v2;
}

- (id)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPOfflineAdvertisingKeysDelegate queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPOfflineAdvertisingKeysDelegate session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPOfflineAdvertisingKeysDelegate serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPOfflineAdvertisingKeysDelegate setSession:](self, "setSession:", v7);

    LogCategory_OfflineAdvertising();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPOfflineAdvertisingKeysDelegate serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPOfflineAdvertisingKeysDelegate session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPOfflineAdvertisingKeysDelegate session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)syncProxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPOfflineAdvertisingKeysDelegate queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPOfflineAdvertisingKeysDelegate session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPOfflineAdvertisingKeysDelegate serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPOfflineAdvertisingKeysDelegate setSession:](self, "setSession:", v7);

    LogCategory_OfflineAdvertising();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPOfflineAdvertisingKeysDelegate serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPOfflineAdvertisingKeysDelegate session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPOfflineAdvertisingKeysDelegate session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "syncProxyWithErrorHandler:", &__block_literal_global_168);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke(uint64_t a1, void *a2)
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
  LogCategory_OfflineAdvertising();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[SPOfflineAdvertisingKeysDelegate inLowPowerMode](self, "inLowPowerMode"))
  {
    LogCategory_OfflineAdvertising();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateLowPowerMode)", buf, 2u);
    }

    -[SPOfflineAdvertisingKeysDelegate userAgentSyncProxy](self, "userAgentSyncProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 2;
LABEL_13:
    objc_msgSend(v6, "bluetoothPowerStateUpdated:", v8);

    goto LABEL_14;
  }
  v9 = objc_msgSend(v4, "state");
  if (v9 == 5)
  {
    LogCategory_OfflineAdvertising();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateOn)", v12, 2u);
    }

    -[SPOfflineAdvertisingKeysDelegate userAgentSyncProxy](self, "userAgentSyncProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
    goto LABEL_13;
  }
  if (v9 == 4)
  {
    LogCategory_OfflineAdvertising();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateOff)", v13, 2u);
    }

    -[SPOfflineAdvertisingKeysDelegate userAgentSyncProxy](self, "userAgentSyncProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    goto LABEL_13;
  }
LABEL_14:

}

- (void)enterLowPowerMode
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  LogCategory_OfflineAdvertising();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Entering low power mode", buf, 2u);
  }

  -[SPOfflineAdvertisingKeysDelegate setInLowPowerMode:](self, "setInLowPowerMode:", 1);
  LogCategory_OfflineAdvertising();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateLowPowerMode)", v6, 2u);
  }

  -[SPOfflineAdvertisingKeysDelegate userAgentSyncProxy](self, "userAgentSyncProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bluetoothPowerStateUpdated:", 2);

}

- (int64_t)transformReason:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if ((unint64_t)a3 >= 3)
  {
    LogCategory_OfflineAdvertising();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SPOfflineAdvertisingKeysDelegate transformReason:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    return 0;
  }
  return v3;
}

- (void)processKeyResponse:(id)a3
{
  id v4;
  int has_internal_content;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  SPOfflineAdvertisingKeysDelegate *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has_internal_content = os_variant_has_internal_content();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("__qa__log_offline_keys"));

  LogCategory_OfflineAdvertising();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: processKeyResponse: %@", buf, 0xCu);
  }

  if ((has_internal_content & v7) == 1)
  {
    v29 = self;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          LogCategory_OfflineAdvertising();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "fm_hexString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v17;
            _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "OFFLINE_KEYS: First : %@", buf, 0xCu);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v12);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          LogCategory_OfflineAdvertising();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "fm_hexString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v26;
            _os_log_impl(&dword_1AEA79000, v25, OS_LOG_TYPE_DEFAULT, "OFFLINE_KEYS: Second: %@", buf, 0xCu);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v21);
    }

    self = v29;
  }
  objc_msgSend(v4, "fm_map:", &__block_literal_global_174_0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOfflineAdvertisingKeysDelegate peripheralManager](self, "peripheralManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setOfflineAdvertisingParamsAndData:", v27);

}

uint64_t __55__SPOfflineAdvertisingKeysDelegate_processKeyResponse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)peripheralManager:(id)a3 offlineAdvPayloadRequestedWithReason:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__SPOfflineAdvertisingKeysDelegate_peripheralManager_offlineAdvPayloadRequestedWithReason___block_invoke;
  v4[3] = &unk_1E5E16CB8;
  v4[4] = self;
  v4[5] = a4;
  _os_activity_initiate(&dword_1AEA79000, "offlineAdvertisingKeysForReason", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

void __91__SPOfflineAdvertisingKeysDelegate_peripheralManager_offlineAdvPayloadRequestedWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_OfflineAdvertising();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: offlineAdvPayloadRequestedWithReason: %ld", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "enterLowPowerMode");
  objc_msgSend(*(id *)(a1 + 32), "beaconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "transformReason:", *(_QWORD *)(a1 + 40));
  v6 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "generateOfflineAdvertisingKeysForReason:now:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "processKeyResponse:", v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SPLocalBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralManager, a3);
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

- (BOOL)inLowPowerMode
{
  return self->_inLowPowerMode;
}

- (void)setInLowPowerMode:(BOOL)a3
{
  self->_inLowPowerMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "sync proxy error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)transformReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "SPOfflineAdvertisingKeysDelegate: Unexpected CBPeripheralManagerShutdownReason value: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
