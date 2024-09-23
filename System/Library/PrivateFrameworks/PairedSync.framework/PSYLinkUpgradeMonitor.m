@implementation PSYLinkUpgradeMonitor

- (PSYLinkUpgradeMonitor)initWithRegistryDevice:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  PSYLinkUpgradeMonitor *v9;
  PSYLinkUpgradeMonitor *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *processingQueue;
  void *v15;
  uint64_t v16;
  NRDeviceMonitor *networkRelayDeviceMonitor;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSYLinkUpgradeMonitor;
  v9 = -[PSYLinkUpgradeMonitor init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create_with_target_V2("com.apple.PairedSync.linkMonitorQueue", v11, v12);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_pdrRegistryDevice, a3);
    v10->_networkRelayDevicePreferencesLock._os_unfair_lock_opaque = 0;
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addDelegate:", v10);

    -[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor](v10, "createNetworkRelayDeviceMonitor");
    v16 = objc_claimAutoreleasedReturnValue();
    networkRelayDeviceMonitor = v10->_networkRelayDeviceMonitor;
    v10->_networkRelayDeviceMonitor = (NRDeviceMonitor *)v16;

  }
  return v10;
}

- (id)createNetworkRelayDeviceMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PSYLinkUpgradeMonitor pdrRegistryDevice](self, "pdrRegistryDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYLinkUpgradeMonitor setMonitoringBluetoothIdPairingId:](self, "setMonitoringBluetoothIdPairingId:", v4);

  -[PSYLinkUpgradeMonitor pdrRegistryDevice](self, "pdrRegistryDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6E640]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  psylink_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    psylink_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor]";
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_20CFE4000, v9, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", (uint8_t *)&v17, 0x16u);
    }

  }
  if (v6)
  {
    -[PSYLinkUpgradeMonitor setMonitoringBluetoothIdPairingId:](self, "setMonitoringBluetoothIdPairingId:", 0);
    v10 = objc_msgSend(MEMORY[0x24BE6B6B0], "newDeviceIdentifierWithBluetoothUUID:", v6);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6D0]), "initWithDeviceIdentifier:delegate:queue:", v10, self, self->_processingQueue);
    v12 = v11;
    if (v11)
    {
      self->_currentLinkSubType = objc_msgSend(v11, "linkSubtype");
      v13 = -[PSYLinkUpgradeMonitor localLinkTypeFromNRLinkType:linkSubtype:](self, "localLinkTypeFromNRLinkType:linkSubtype:", objc_msgSend(v12, "linkType"), objc_msgSend(v12, "linkSubtype"));
      if (self->_currentLinkType != v13)
      {
        self->_currentLinkType = v13;
        -[PSYLinkUpgradeMonitor _informDelegateAboutLinkChangedTo:](self, "_informDelegateAboutLinkChangedTo:", v13);
      }
    }
  }
  else
  {
    psylink_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15)
    {
      v12 = 0;
      goto LABEL_14;
    }
    psylink_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor].cold.1(v10);
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (void)_informDelegateAboutLinkChangedTo:(int64_t)a3
{
  NSObject *delegateQueue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__PSYLinkUpgradeMonitor__informDelegateAboutLinkChangedTo___block_invoke;
  block[3] = &unk_24C5E5510;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __59__PSYLinkUpgradeMonitor__informDelegateAboutLinkChangedTo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "linkChangedToLinkType:", *(_QWORD *)(a1 + 40));

      WeakRetained = v6;
    }
  }

}

- (void)requestLinkUpgrade
{
  NSObject *processingQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__PSYLinkUpgradeMonitor_requestLinkUpgrade__block_invoke;
  v4[3] = &unk_24C5E5130;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__PSYLinkUpgradeMonitor_requestLinkUpgrade__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_requestLinkUpgrade");
    WeakRetained = v2;
  }

}

- (void)_onQueue_requestLinkUpgrade
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CFE4000, log, OS_LOG_TYPE_ERROR, "link already on AWDL but btDeviceID is missing", v1, 2u);
}

- (void)_enteredCompatibilityStateOnDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *processingQueue;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(v4, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYLinkUpgradeMonitor pdrRegistryDevice](self, "pdrRegistryDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__PSYLinkUpgradeMonitor__enteredCompatibilityStateOnDevice___block_invoke;
    block[3] = &unk_24C5E5220;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_async(processingQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __60__PSYLinkUpgradeMonitor__enteredCompatibilityStateOnDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6E648]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    psylink_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      psylink_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315394;
        v9 = "-[PSYLinkUpgradeMonitor _enteredCompatibilityStateOnDevice:]_block_invoke";
        v10 = 1024;
        v11 = v4;
        _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "%s: Entered Compatibility State: %d", (uint8_t *)&v8, 0x12u);
      }

    }
    if (v4 >= 3)
    {
      objc_msgSend(WeakRetained, "setMonitoringCompatibilityState:", 0);
      objc_msgSend(WeakRetained, "_onInitialPropertyExchangeComplete");
    }
  }

}

- (void)_onInitialPropertyExchangeComplete
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  psylink_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    psylink_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PSYLinkUpgradeMonitor _onInitialPropertyExchangeComplete]";
      _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "%s: Initial property exchange complete.", buf, 0xCu);
    }

  }
  self->_initialPropertyExchangeComplete = 1;
  objc_initWeak((id *)buf, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke;
  block[3] = &unk_24C5E5130;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke_2;
      v7[3] = &unk_24C5E5538;
      objc_copyWeak(&v8, v1);
      objc_msgSend(v6, "sendWirelessCredentialsToWatchWithCompletion:", v7);

      objc_destroyWeak(&v8);
    }
    else
    {
      objc_msgSend(v3, "wirelessCredentialUpdateRequestCompletedWithResult:", 1);
    }
  }

}

void __59__PSYLinkUpgradeMonitor__onInitialPropertyExchangeComplete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "wirelessCredentialUpdateRequestCompletedWithResult:", a2);
    WeakRetained = v4;
  }

}

- (void)resetCompanionLinkPreference
{
  NSObject *processingQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__PSYLinkUpgradeMonitor_resetCompanionLinkPreference__block_invoke;
  v4[3] = &unk_24C5E5130;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__PSYLinkUpgradeMonitor_resetCompanionLinkPreference__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_resetCompanionLinkPreference");
    WeakRetained = v2;
  }

}

- (void)_onQueue_resetCompanionLinkPreference
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_networkRelayDevicePreferences)
  {
    psylink_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      psylink_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[PSYLinkUpgradeMonitor _onQueue_resetCompanionLinkPreference]";
        _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "%s: reset companion link preference", (uint8_t *)&v6, 0xCu);
      }

    }
    -[NRDevicePreferences setCompanionLinkPreferences:](self->_networkRelayDevicePreferences, "setCompanionLinkPreferences:", 0);
  }
  -[PSYLinkUpgradeMonitor setMonitoringBluetoothIdPairingId:](self, "setMonitoringBluetoothIdPairingId:", 0);
  -[PSYLinkUpgradeMonitor setMonitoringCompatibilityState:](self, "setMonitoringCompatibilityState:", 0);
}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *processingQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  PSYLinkUpgradeMonitor *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__PSYLinkUpgradeMonitor_registry_changed_properties___block_invoke;
  v15[3] = &unk_24C5E5560;
  objc_copyWeak(&v20, &location);
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(processingQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __53__PSYLinkUpgradeMonitor_registry_changed_properties___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "monitoringBluetoothIdPairingId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      v7 = *MEMORY[0x24BE6E640];
      if (objc_msgSend(a1[5], "containsObject:", *MEMORY[0x24BE6E640]))
      {
        objc_msgSend(a1[4], "valueForProperty:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        psylink_log();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          psylink_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136315394;
            v15 = "-[PSYLinkUpgradeMonitor registry:changed:properties:]_block_invoke";
            v16 = 2114;
            v17 = v8;
            _os_log_impl(&dword_20CFE4000, v11, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", (uint8_t *)&v14, 0x16u);
          }

        }
        if (v8)
        {
          objc_msgSend(a1[6], "removeDelegate:", a1[7]);
          objc_msgSend(v3, "setMonitoringBluetoothIdPairingId:", 0);
          objc_msgSend(v3, "networkRelayDeviceMonitor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(v3, "createNetworkRelayDeviceMonitor");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setNetworkRelayDeviceMonitor:", v13);

          }
          if (objc_msgSend(v3, "pendingAWDLUpgradeRequest"))
          {
            objc_msgSend(v3, "setPendingAWDLUpgradeRequest:", 0);
            objc_msgSend(v3, "_updateCompanionLinkPreferenceToAWDLforBTUUID:", v8);
          }
        }

      }
    }
    if (objc_msgSend(v3, "monitoringCompatibilityState")
      && objc_msgSend(a1[5], "containsObject:", *MEMORY[0x24BE6E648]))
    {
      objc_msgSend(a1[7], "_enteredCompatibilityStateOnDevice:", a1[4]);
    }
  }

}

- (void)_updateCompanionLinkPreferenceToAWDLforBTUUID:(id)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NRDeviceMonitor *v13;
  NRDeviceMonitor *networkRelayDeviceMonitor;
  NRDevicePreferences *v15;
  NRDevicePreferences *networkRelayDevicePreferences;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *awdlUpgradeTimeoutTimer;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BE6B6B0], "newDeviceIdentifierWithBluetoothUUID:", a3);
  psylink_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    psylink_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "nrDeviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
      v35 = 2114;
      v36 = v8;
      _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, "%s: NetworkRelayDeviceIdentifier: %{public}@", buf, 0x16u);

    }
  }
  -[NRDeviceMonitor deviceIdentifier](self->_networkRelayDeviceMonitor, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nrDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nrDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    -[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor](self, "createNetworkRelayDeviceMonitor");
    v13 = (NRDeviceMonitor *)objc_claimAutoreleasedReturnValue();
    networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
    self->_networkRelayDeviceMonitor = v13;

  }
  if (-[NRDeviceMonitor isConnected](self->_networkRelayDeviceMonitor, "isConnected"))
  {
    self->_pendingAWDLUpgradeRequest = 0;
    self->_currentLinkSubType = -[NRDeviceMonitor linkSubtype](self->_networkRelayDeviceMonitor, "linkSubtype");
    os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
    v15 = (NRDevicePreferences *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6E8]), "initWithDeviceIdentifier:", v4);
    networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
    self->_networkRelayDevicePreferences = v15;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6A8]), "initForHighThroughputWithServiceClass:includeP2P:", 5, 1);
    -[NRDevicePreferences setCompanionLinkPreferences:](self->_networkRelayDevicePreferences, "setCompanionLinkPreferences:", v17);
    os_unfair_lock_unlock(&self->_networkRelayDevicePreferencesLock);
    if (self->_currentLinkSubType == 102)
    {
      psylink_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        psylink_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CFE4000, v20, OS_LOG_TYPE_DEFAULT, "link already on AWDL. Took assertion again.", buf, 2u);
        }

      }
    }
    else
    {
      self->_waitingForAWDLupgradeTimeout = 1;
      v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_processingQueue);
      awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
      self->_awdlUpgradeTimeoutTimer = v24;

      v26 = self->_awdlUpgradeTimeoutTimer;
      v27 = dispatch_time(0, 60000000000);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
      v28 = self->_awdlUpgradeTimeoutTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __71__PSYLinkUpgradeMonitor__updateCompanionLinkPreferenceToAWDLforBTUUID___block_invoke;
      handler[3] = &unk_24C5E4FC8;
      handler[4] = self;
      dispatch_source_set_event_handler(v28, handler);
      dispatch_activate((dispatch_object_t)self->_awdlUpgradeTimeoutTimer);
    }
    psylink_log();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      psylink_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
        _os_log_impl(&dword_20CFE4000, v31, OS_LOG_TYPE_DEFAULT, "%s: Marked for using AWDL", buf, 0xCu);
      }

    }
  }
  else
  {
    psylink_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      psylink_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[PSYLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
        _os_log_impl(&dword_20CFE4000, v23, OS_LOG_TYPE_DEFAULT, "%s: Peer not connected yet. Waiting for connectivity", buf, 0xCu);
      }

    }
    self->_pendingAWDLUpgradeRequest = 1;
  }

}

uint64_t __71__PSYLinkUpgradeMonitor__updateCompanionLinkPreferenceToAWDLforBTUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_awdlUpgradeTimedout");
}

- (void)_awdlUpgradeTimedout
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  psylink_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    psylink_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[PSYLinkUpgradeMonitor _awdlUpgradeTimedout]";
      _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "%s: AWDL upgrade request timedout", (uint8_t *)&v6, 0xCu);
    }

  }
  self->_waitingForAWDLupgradeTimeout = 0;
  if (self->_wirelessCredentialsExchangeStepComplete && !self->_currentLinkSubType && !self->_everConnectedOnAWDL)
    -[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi](self, "_performLinkUpgradeToInfraWiFi");
}

- (void)_cancelAWDLUgpradeTimeoutTimer
{
  NSObject *awdlUpgradeTimeoutTimer;
  OS_dispatch_source *v4;

  self->_waitingForAWDLupgradeTimeout = 0;
  awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
  if (awdlUpgradeTimeoutTimer)
  {
    dispatch_source_cancel(awdlUpgradeTimeoutTimer);
    v4 = self->_awdlUpgradeTimeoutTimer;
    self->_awdlUpgradeTimeoutTimer = 0;

  }
}

- (void)_performLinkUpgradeToInfraWiFi
{
  PDRDevice *pdrRegistryDevice;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NRDeviceMonitor *v21;
  NRDeviceMonitor *networkRelayDeviceMonitor;
  NRDevicePreferences *v23;
  NRDevicePreferences *networkRelayDevicePreferences;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  int v29;
  const char *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  pdrRegistryDevice = self->_pdrRegistryDevice;
  if (pdrRegistryDevice)
  {
    -[PDRDevice valueForProperty:](pdrRegistryDevice, "valueForProperty:", *MEMORY[0x24BE6E640]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (!self->_pendingAWDLUpgradeRequest)
      {
        v7 = objc_msgSend(MEMORY[0x24BE6B6B0], "newDeviceIdentifierWithBluetoothUUID:", v4);
        psylink_log();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          psylink_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject nrDeviceIdentifier](v7, "nrDeviceIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 136315650;
            v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
            v31 = 2114;
            v32 = v4;
            v33 = 2114;
            v34 = v16;
            _os_log_impl(&dword_20CFE4000, v15, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@ networkRelayDeviceIdentifier: %{public}@", (uint8_t *)&v29, 0x20u);

          }
        }
        -[NRDeviceMonitor deviceIdentifier](self->_networkRelayDeviceMonitor, "deviceIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "nrDeviceIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject nrDeviceIdentifier](v7, "nrDeviceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) == 0)
        {
          -[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor](self, "createNetworkRelayDeviceMonitor");
          v21 = (NRDeviceMonitor *)objc_claimAutoreleasedReturnValue();
          networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
          self->_networkRelayDeviceMonitor = v21;

        }
        self->_currentLinkSubType = -[NRDeviceMonitor linkSubtype](self->_networkRelayDeviceMonitor, "linkSubtype");
        os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
        v23 = (NRDevicePreferences *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6E8]), "initWithDeviceIdentifier:", v7);
        networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
        self->_networkRelayDevicePreferences = v23;

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6A8]), "initForHighThroughputWithServiceClass:includeP2P:", 5, 0);
        -[NRDevicePreferences setCompanionLinkPreferences:](self->_networkRelayDevicePreferences, "setCompanionLinkPreferences:", v25);
        os_unfair_lock_unlock(&self->_networkRelayDevicePreferencesLock);
        psylink_log();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          psylink_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = 136315138;
            v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
            _os_log_impl(&dword_20CFE4000, v28, OS_LOG_TYPE_DEFAULT, "%s: Marked for using Infra Wi-Fi", (uint8_t *)&v29, 0xCu);
          }

        }
        goto LABEL_25;
      }
      psylink_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        psylink_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315138;
          v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
          v8 = "%s: waiting for AWDL upgrade request to complete.";
LABEL_13:
          _os_log_impl(&dword_20CFE4000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v29, 0xCu);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else
    {
      psylink_log();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        psylink_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315138;
          v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
          v8 = "%s: btDeviceID not yet available, will attempt once available.";
          goto LABEL_13;
        }
LABEL_25:

      }
    }
  }
  else
  {
    psylink_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (!v10)
      return;
    psylink_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315138;
      v30 = "-[PSYLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
      _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "%s: no active device to upgrade link to Infra Wi-Fi", (uint8_t *)&v29, 0xCu);
    }
  }

}

- (void)wirelessCredentialUpdateRequestCompletedWithResult:(BOOL)a3
{
  NSObject *processingQueue;
  _QWORD v6[5];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__PSYLinkUpgradeMonitor_wirelessCredentialUpdateRequestCompletedWithResult___block_invoke;
  v6[3] = &unk_24C5E5588;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async(processingQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__PSYLinkUpgradeMonitor_wirelessCredentialUpdateRequestCompletedWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    psylink_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      psylink_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 48);
        v9 = 136315394;
        v10 = "-[PSYLinkUpgradeMonitor wirelessCredentialUpdateRequestCompletedWithResult:]_block_invoke";
        v11 = 1024;
        v12 = v6;
        _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "%s: wireless credentials exchange complete: %d", (uint8_t *)&v9, 0x12u);
      }

    }
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "setWirelessCredentialsExchangeStepComplete:", 1);
      if (!objc_msgSend(WeakRetained, "currentLinkSubType")
        && (objc_msgSend(WeakRetained, "waitingForAWDLupgradeTimeout") & 1) == 0
        && (objc_msgSend(WeakRetained, "pendingAWDLUpgradeRequest") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "networkRelayDeviceMonitor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isConnected") & 1) != 0)
        {
          v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 13);

          if (!v8)
            objc_msgSend(WeakRetained, "_performLinkUpgradeToInfraWiFi");
        }
        else
        {

        }
      }
    }
  }

}

- (void)resetMonitor
{
  NSObject *processingQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__PSYLinkUpgradeMonitor_resetMonitor__block_invoke;
  v4[3] = &unk_24C5E5130;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PSYLinkUpgradeMonitor_resetMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    psylink_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      psylink_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[PSYLinkUpgradeMonitor resetMonitor]_block_invoke";
        _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
      }

    }
    objc_msgSend(WeakRetained, "_onQueue_resetCompanionLinkPreference");
    objc_msgSend(WeakRetained, "setPendingAWDLUpgradeRequest:", 0);
    objc_msgSend(WeakRetained, "setWirelessCredentialsExchangeStepComplete:", 0);
    objc_msgSend(WeakRetained, "setInitialPropertyExchangeComplete:", 0);
    objc_msgSend(WeakRetained, "setCurrentLinkSubType:", 0);
    objc_msgSend(WeakRetained, "_cancelAWDLUgpradeTimeoutTimer");
    objc_msgSend(WeakRetained, "setEverConnectedOnAWDL:", 0);
  }

}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  psylink_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    psylink_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[PSYLinkUpgradeMonitor deviceIsConnectedDidChange:isConnected:]";
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_20CFE4000, v8, OS_LOG_TYPE_DEFAULT, "%s: connected %{BOOL}d", (uint8_t *)&v9, 0x12u);
    }

  }
  if (v4 && self->_pendingAWDLUpgradeRequest)
    -[PSYLinkUpgradeMonitor _onQueue_requestLinkUpgrade](self, "_onQueue_requestLinkUpgrade");
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *StringFromNRLinkSubtype;
  void *StringFromNRLinkType;
  void *v13;
  int64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  psylink_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    psylink_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      v13 = (void *)createStringFromNRLinkSubtype();
      v15 = 136315906;
      v16 = "-[PSYLinkUpgradeMonitor deviceLinkTypeDidChange:linkType:linkSubtype:]";
      v17 = 2112;
      v18 = StringFromNRLinkSubtype;
      v19 = 2112;
      v20 = StringFromNRLinkType;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_20CFE4000, v10, OS_LOG_TYPE_DEFAULT, "%s: link changed. current linkSubType: %@ new linkType: %@, new linkSubType: %@", (uint8_t *)&v15, 0x2Au);

    }
  }
  self->_currentLinkSubType = v5;
  if ((_DWORD)v5 == 102)
  {
    self->_everConnectedOnAWDL = 1;
    -[PSYLinkUpgradeMonitor _cancelAWDLUgpradeTimeoutTimer](self, "_cancelAWDLUgpradeTimeoutTimer");
  }
  v14 = -[PSYLinkUpgradeMonitor localLinkTypeFromNRLinkType:linkSubtype:](self, "localLinkTypeFromNRLinkType:linkSubtype:", v6, v5);
  if (v14 != self->_currentLinkType)
  {
    self->_currentLinkType = v14;
    -[PSYLinkUpgradeMonitor _informDelegateAboutLinkChangedTo:](self, "_informDelegateAboutLinkChangedTo:", v14);
  }
}

- (int64_t)localLinkTypeFromNRLinkType:(unsigned __int8)a3 linkSubtype:(unsigned __int8)a4
{
  int64_t v4;

  v4 = 3;
  if (!a4)
    v4 = 0;
  if (a4 == 102)
    v4 = 2;
  if (a3 != 2)
    v4 = 0;
  if (a3 == 1)
    return 1;
  else
    return v4;
}

- (BOOL)holdingAnyCompanionLinkPreference
{
  PSYLinkUpgradeMonitor *v2;
  os_unfair_lock_s *p_networkRelayDevicePreferencesLock;
  void *v4;

  v2 = self;
  p_networkRelayDevicePreferencesLock = &self->_networkRelayDevicePreferencesLock;
  os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
  -[NRDevicePreferences companionLinkPreferences](v2->_networkRelayDevicePreferences, "companionLinkPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_networkRelayDevicePreferencesLock);
  return (char)v2;
}

- (BOOL)_holdingAWDLCompanionLinkPreference
{
  PSYLinkUpgradeMonitor *v2;
  os_unfair_lock_s *p_networkRelayDevicePreferencesLock;
  void *v4;

  v2 = self;
  p_networkRelayDevicePreferencesLock = &self->_networkRelayDevicePreferencesLock;
  os_unfair_lock_lock(&self->_networkRelayDevicePreferencesLock);
  -[NRDevicePreferences companionLinkPreferences](v2->_networkRelayDevicePreferences, "companionLinkPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_networkRelayDevicePreferencesLock);
  return (char)v2;
}

- (PSYLinkUpgradeMonitorDelegate)delegate
{
  return (PSYLinkUpgradeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentLinkType
{
  return self->_currentLinkType;
}

- (void)setCurrentLinkType:(int64_t)a3
{
  self->_currentLinkType = a3;
}

- (BOOL)wirelessCredentialsExchangeStepComplete
{
  return self->_wirelessCredentialsExchangeStepComplete;
}

- (void)setWirelessCredentialsExchangeStepComplete:(BOOL)a3
{
  self->_wirelessCredentialsExchangeStepComplete = a3;
}

- (BOOL)initialPropertyExchangeComplete
{
  return self->_initialPropertyExchangeComplete;
}

- (void)setInitialPropertyExchangeComplete:(BOOL)a3
{
  self->_initialPropertyExchangeComplete = a3;
}

- (NRDevicePreferences)networkRelayDevicePreferences
{
  return self->_networkRelayDevicePreferences;
}

- (void)setNetworkRelayDevicePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_networkRelayDevicePreferences, a3);
}

- (os_unfair_lock_s)networkRelayDevicePreferencesLock
{
  return self->_networkRelayDevicePreferencesLock;
}

- (void)setNetworkRelayDevicePreferencesLock:(os_unfair_lock_s)a3
{
  self->_networkRelayDevicePreferencesLock = a3;
}

- (NRDeviceMonitor)networkRelayDeviceMonitor
{
  return self->_networkRelayDeviceMonitor;
}

- (void)setNetworkRelayDeviceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkRelayDeviceMonitor, a3);
}

- (unsigned)currentLinkSubType
{
  return self->_currentLinkSubType;
}

- (void)setCurrentLinkSubType:(unsigned __int8)a3
{
  self->_currentLinkSubType = a3;
}

- (OS_dispatch_source)awdlUpgradeTimeoutTimer
{
  return self->_awdlUpgradeTimeoutTimer;
}

- (void)setAwdlUpgradeTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_awdlUpgradeTimeoutTimer, a3);
}

- (BOOL)waitingForAWDLupgradeTimeout
{
  return self->_waitingForAWDLupgradeTimeout;
}

- (void)setWaitingForAWDLupgradeTimeout:(BOOL)a3
{
  self->_waitingForAWDLupgradeTimeout = a3;
}

- (BOOL)pendingAWDLUpgradeRequest
{
  return self->_pendingAWDLUpgradeRequest;
}

- (void)setPendingAWDLUpgradeRequest:(BOOL)a3
{
  self->_pendingAWDLUpgradeRequest = a3;
}

- (BOOL)everConnectedOnAWDL
{
  return self->_everConnectedOnAWDL;
}

- (void)setEverConnectedOnAWDL:(BOOL)a3
{
  self->_everConnectedOnAWDL = a3;
}

- (PDRDevice)pdrRegistryDevice
{
  return self->_pdrRegistryDevice;
}

- (void)setPdrRegistryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pdrRegistryDevice, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSUUID)monitoringBluetoothIdPairingId
{
  return self->_monitoringBluetoothIdPairingId;
}

- (void)setMonitoringBluetoothIdPairingId:(id)a3
{
  self->_monitoringBluetoothIdPairingId = (NSUUID *)a3;
}

- (BOOL)monitoringCompatibilityState
{
  return self->_monitoringCompatibilityState;
}

- (void)setMonitoringCompatibilityState:(BOOL)a3
{
  self->_monitoringCompatibilityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_pdrRegistryDevice, 0);
  objc_storeStrong((id *)&self->_awdlUpgradeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_networkRelayDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_networkRelayDevicePreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createNetworkRelayDeviceMonitor
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[PSYLinkUpgradeMonitor createNetworkRelayDeviceMonitor]";
  _os_log_error_impl(&dword_20CFE4000, log, OS_LOG_TYPE_ERROR, "%s: Couldn't get BTUUID. Started Observing", (uint8_t *)&v1, 0xCu);
}

@end
