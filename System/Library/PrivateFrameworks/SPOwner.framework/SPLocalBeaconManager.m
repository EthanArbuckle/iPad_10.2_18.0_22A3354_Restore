@implementation SPLocalBeaconManager

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SPLocalBeaconManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Dealloc %{public}@", buf, 0xCu);
  }

  -[SPLocalBeaconManager _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SPLocalBeaconManager;
  -[SPLocalBeaconManager dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v13;
  uint8_t v14[16];

  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconMangager invalidate called.", v14, 2u);
  }

  -[SPLocalBeaconManager monitorWrapper](self, "monitorWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[SPLocalBeaconManager setMonitorWrapper:](self, "setMonitorWrapper:", 0);
  -[SPLocalBeaconManager periodicActionXpcActivity](self, "periodicActionXpcActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SPLocalBeaconManager setSchedulePeriodicActionXpcActivity:](self, "setSchedulePeriodicActionXpcActivity:", 0);
    -[SPLocalBeaconManager periodicActionXpcActivity](self, "periodicActionXpcActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateCriteria");

    -[SPLocalBeaconManager setPeriodicActionXpcActivity:](self, "setPeriodicActionXpcActivity:", 0);
  }
  -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

  }
  -[SPLocalBeaconManager setPeriodicActionDispatchTimer:](self, "setPeriodicActionDispatchTimer:", 0);
  -[SPLocalBeaconManager spdSession](self, "spdSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[SPLocalBeaconManager setSpdSession:](self, "setSpdSession:", 0);
  -[SPLocalBeaconManager findMyBeaconDaemonSession](self, "findMyBeaconDaemonSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[SPLocalBeaconManager setFindMyBeaconDaemonSession:](self, "setFindMyBeaconDaemonSession:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SPBeaconsChangedNotification"), 0);
  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v13, self, CFSTR("SPBeaconingStateChangedNotification"), 0);
}

- (FMXPCSession)spdSession
{
  return self->_spdSession;
}

- (void)setSpdSession:(id)a3
{
  objc_storeStrong((id *)&self->_spdSession, a3);
}

- (void)setPeriodicActionDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActionDispatchTimer, a3);
}

- (void)setMonitorWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_monitorWrapper, a3);
}

- (void)setFindMyBeaconDaemonSession:(id)a3
{
  objc_storeStrong((id *)&self->_findMyBeaconDaemonSession, a3);
}

- (FMXPCActivity)periodicActionXpcActivity
{
  return self->_periodicActionXpcActivity;
}

- (OS_dispatch_source)periodicActionDispatchTimer
{
  return self->_periodicActionDispatchTimer;
}

- (SPMonitorsWrapper)monitorWrapper
{
  return self->_monitorWrapper;
}

- (FMXPCSession)findMyBeaconDaemonSession
{
  return self->_findMyBeaconDaemonSession;
}

- (void)invalidate
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __34__SPLocalBeaconManager_invalidate__block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: invalidate", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (SPLocalBeaconManager)init
{
  SPLocalBeaconManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  uint64_t v12;
  FMXPCServiceDescription *spdServiceDescription;
  const __CFString *v14;
  id v15;
  void *v16;
  uint64_t v17;
  FMXPCServiceDescription *findMyBeaconingDaemonServiceDescription;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id WeakRetained;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  SPLocalBeaconManager *v33;
  objc_super v34;
  uint8_t buf[4];
  SPLocalBeaconManager *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)SPLocalBeaconManager;
  v2 = -[SPLocalBeaconManager init](&v34, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SPLocalBeaconManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (os_variant_has_internal_content())
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "environment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UNDER_TEST"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

      if (!v9)
        return v2;
    }
    v10 = objc_alloc(MEMORY[0x1E0D20238]);
    -[SPLocalBeaconManager remoteInterface](v2, "remoteInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager"), 0, v11, 0, 0);
    spdServiceDescription = v2->_spdServiceDescription;
    v2->_spdServiceDescription = (FMXPCServiceDescription *)v12;

    if (_os_feature_enabled_impl())
      v14 = CFSTR("com.apple.findmy.LocalBeaconing");
    else
      v14 = CFSTR("com.apple.icloud.searchpartyd.beaconmanager");
    v15 = objc_alloc(MEMORY[0x1E0D20238]);
    -[SPLocalBeaconManager remoteInterface](v2, "remoteInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", v14, 0, v16, 0, 0);
    findMyBeaconingDaemonServiceDescription = v2->_findMyBeaconingDaemonServiceDescription;
    v2->_findMyBeaconingDaemonServiceDescription = (FMXPCServiceDescription *)v17;

    LogCategory_BeaconManager();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v2;
      _os_log_impl(&dword_1AEA79000, v19, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Created %{public}@", buf, 0xCu);
    }

  }
  if (((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()) && runningInBluetoothd())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__SPLocalBeaconManager_init__block_invoke;
    block[3] = &unk_1E5E16668;
    v33 = v2;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);

  }
  if (runningInBluetoothd())
  {
    objc_initWeak((id *)buf, v2);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "processName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.icloud.searchpartyd.SPBeaconManager.%@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0D20228]);
    v24 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __28__SPLocalBeaconManager_init__block_invoke_2;
    v30[3] = &unk_1E5E16E18;
    objc_copyWeak(&v31, (id *)buf);
    v28[0] = v24;
    v28[1] = 3221225472;
    v28[2] = __28__SPLocalBeaconManager_init__block_invoke_3;
    v28[3] = &unk_1E5E16E40;
    objc_copyWeak(&v29, (id *)buf);
    v25 = (void *)objc_msgSend(v23, "initWithName:qos:criteriaBlock:handler:", v22, 17, v30, v28);
    WeakRetained = objc_loadWeakRetained((id *)buf);
    objc_msgSend(WeakRetained, "setPeriodicActionXpcActivity:", v25);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE25DF0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_beaconingKeysOfType_withCompletion_, 0, 1);

  return v2;
}

uint64_t __34__SPLocalBeaconManager_invalidate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __34__SPLocalBeaconManager_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SPLocalBeaconManager_invalidate__block_invoke_2;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfBeaconingConfigurations, 0);
  objc_storeStrong((id *)&self->_selfBeaconingPublicKey, 0);
  objc_storeStrong((id *)&self->_selfBeaconingDerivedSharedSecretKey, 0);
  objc_storeStrong((id *)&self->_selfBeaconingPairDate, 0);
  objc_storeStrong((id *)&self->_selfBeaconingUUID, 0);
  objc_storeStrong((id *)&self->_bleMonitor, 0);
  objc_storeStrong((id *)&self->_monitorWrapper, 0);
  objc_storeStrong((id *)&self->_periodicActionDispatchTimer, 0);
  objc_storeStrong((id *)&self->_periodicActionXpcActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_findMyBeaconDaemonProxy, 0);
  objc_storeStrong((id *)&self->_searchPartyDaemonProxy, 0);
  objc_storeStrong((id *)&self->_findMyBeaconDaemonSession, 0);
  objc_storeStrong((id *)&self->_spdSession, 0);
  objc_storeStrong((id *)&self->_findMyBeaconingDaemonServiceDescription, 0);
  objc_storeStrong((id *)&self->_spdServiceDescription, 0);
  objc_storeStrong(&self->_beaconingKeyChangedBlockWithCompletion, 0);
  objc_storeStrong(&self->_statusChangedBlockWithCompletion, 0);
  objc_storeStrong(&self->_stateChangedBlockWithCompletion, 0);
}

void __28__SPLocalBeaconManager_init__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    bluetoothContextStartup(v1);
}

id __28__SPLocalBeaconManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "xpcActivityCriteria:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __28__SPLocalBeaconManager_init__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint8_t v8[16];

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action xpc timer fired", v8, 2u);
  }

  objc_msgSend(WeakRetained, "handlerForActivity:state:", v5, a3);
}

- (SPLocalBeaconManagerXPCProtocol)searchPartyDaemonProxy
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
  -[SPLocalBeaconManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPLocalBeaconManager spdSession](self, "spdSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPLocalBeaconManager spdServiceDescription](self, "spdServiceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPLocalBeaconManager setSpdSession:](self, "setSpdSession:", v7);

    LogCategory_BeaconManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPLocalBeaconManager spdServiceDescription](self, "spdServiceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPLocalBeaconManager spdSession](self, "spdSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPLocalBeaconManager spdSession](self, "spdSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPLocalBeaconManagerXPCProtocol *)v13;
}

- (SPLocalBeaconManagerXPCProtocol)findMyBeaconDaemonProxy
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
  -[SPLocalBeaconManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPLocalBeaconManager findMyBeaconDaemonSession](self, "findMyBeaconDaemonSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPLocalBeaconManager findMyBeaconingDaemonServiceDescription](self, "findMyBeaconingDaemonServiceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPLocalBeaconManager setFindMyBeaconDaemonSession:](self, "setFindMyBeaconDaemonSession:", v7);

    LogCategory_BeaconManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPLocalBeaconManager findMyBeaconingDaemonServiceDescription](self, "findMyBeaconingDaemonServiceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPLocalBeaconManager findMyBeaconDaemonSession](self, "findMyBeaconDaemonSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPLocalBeaconManager findMyBeaconDaemonSession](self, "findMyBeaconDaemonSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPLocalBeaconManagerXPCProtocol *)v13;
}

- (id)rawNVRAMData
{
  void *v2;
  void *v3;

  +[SPNVRAM read](SPNVRAM, "read");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)localActivationLockInfoChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[SPLocalBeaconManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPLocalBeaconManager_localActivationLockInfoChanged__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __54__SPLocalBeaconManager_localActivationLockInfoChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStateFromNVRAM");
}

- (void)updateStateFromNVRAM
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "*** Forcing NVRAM beaconing because _qa_forceBeaconFromNVRAM set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_OfflineAdvertising();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    if (v5)
    {
      LogCategory_OfflineAdvertising();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl(&dword_1AEA79000, v14, OS_LOG_TYPE_DEFAULT, "Read FMDActivationLockInfo: %@", buf, 0xCu);
      }

      v15 = objc_msgSend(v5, "isOfflineFindingEnabled");
      v16 = *(void **)(a1 + 32);
    }
    else
    {
      v16 = *(void **)(a1 + 32);
      v15 = 0;
    }
    objc_msgSend(v16, "setIsOfflineFindingEnabled:", v15);
    LogCategory_OfflineAdvertising();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_1(a1, v17);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_113;
    v18[3] = &unk_1E5E16E68;
    v18[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v19, (id *)(a1 + 40));
    _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: Calling beaconingStateChanged (post-erase)", OS_ACTIVITY_FLAG_DEFAULT, v18);
    objc_destroyWeak(&v19);
  }

}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_113(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_2;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedLocalBeaconManagerState:", 1);
  objc_msgSend(WeakRetained, "beaconingStateChanged:", 1);

}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  LogCategory_OfflineAdvertising();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "poisonBeaconIdentifier %@ success.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)start
{
  void *v3;
  id v4;
  _QWORD activity_block[4];
  id v6;
  SPLocalBeaconManager *v7;

  -[SPLocalBeaconManager queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __29__SPLocalBeaconManager_start__block_invoke;
  activity_block[3] = &unk_1E5E16818;
  v6 = v3;
  v7 = self;
  v4 = v3;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __29__SPLocalBeaconManager_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  SPMonitorsWrapper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager start called.", buf, 2u);
  }

  v3 = _os_feature_enabled_impl();
  v4 = MEMORY[0x1E0C809B0];
  if ((v3 & 1) != 0 || _os_feature_enabled_impl())
  {
    LogCategory_BeaconManager();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "BA_LPEM || BA_Power_Off is ENABLED", buf, 2u);
    }

    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __29__SPLocalBeaconManager_start__block_invoke_115;
    block[3] = &unk_1E5E16668;
    v6 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_sync(v6, block);
  }
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __29__SPLocalBeaconManager_start__block_invoke_2;
  v15[3] = &unk_1E5E16668;
  v7 = *(NSObject **)(a1 + 32);
  v15[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v7, v15);
  v8 = -[SPMonitorsWrapper initWithBeaconManager:delegateQueue:]([SPMonitorsWrapper alloc], "initWithBeaconManager:delegateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setMonitorWrapper:", v8);

  objc_msgSend(*(id *)(a1 + 40), "monitorWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");

  v10 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "setBleMonitor:", v10);

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "bleMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "bleMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startMonitoring");

  return objc_msgSend(*(id *)(a1 + 40), "refreshBeaconingState");
}

uint64_t __29__SPLocalBeaconManager_start__block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStateFromNVRAM");
}

void __29__SPLocalBeaconManager_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SPLocalBeaconManager_start__block_invoke_3;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v2 = (void *)MEMORY[0x1AF455E74]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_beaconsChanged_, CFSTR("SPBeaconsChanged"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_beaconingStateChangedNotification_, CFSTR("SPBeaconingStateChanged"), 0);

  objc_autoreleasePoolPop(v2);
}

void __29__SPLocalBeaconManager_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;

  v2 = (void *)MEMORY[0x1AF455E74]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)beaconsChangedTrampoline, CFSTR("SPBeaconsChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, *(const void **)(a1 + 32), (CFNotificationCallback)beaconingStateChangedTrampoline, CFSTR("SPBeaconingStateChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, *(const void **)(a1 + 32), (CFNotificationCallback)localActivationLockInfoChangedTrampoline, (CFStringRef)*MEMORY[0x1E0D21388], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_autoreleasePoolPop(v2);
}

- (void)beaconingStateChangedNotification:(id)a3
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: beaconingStateChangedNotification:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SPLocalBeaconManager beaconingStateChangedNotification:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke_123;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

uint64_t __58__SPLocalBeaconManager_beaconingStateChangedNotification___block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshBeaconingState");
}

- (void)beaconsChanged:(id)a3
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPLocalBeaconManager_beaconsChanged___block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: beaconsChanged:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __39__SPLocalBeaconManager_beaconsChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: beaconsChanged", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "beaconFromNVRAM") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SPLocalBeaconManager_beaconsChanged___block_invoke_124;
    block[3] = &unk_1E5E16668;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

uint64_t __39__SPLocalBeaconManager_beaconsChanged___block_invoke_124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "periodicActionWithCompletion:", 0);
}

- (void)beaconingStateChanged:(int64_t)a3
{
  _QWORD v5[6];

  if (-[SPLocalBeaconManager beaconFromNVRAM](self, "beaconFromNVRAM"))
    a3 = -[SPLocalBeaconManager isOfflineFindingEnabled](self, "isOfflineFindingEnabled");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke;
  v5[3] = &unk_1E5E16CB8;
  v5[4] = self;
  v5[5] = a3;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: beaconsChanged:", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

uint64_t __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  int v13;
  uint64_t result;
  NSObject *v15;
  int v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  _BYTE v20[10];
  _BYTE v21[6];
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v20 = "-[SPLocalBeaconManager beaconingStateChanged:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(*(id *)(a1 + 32), "monitorWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkUp");

  LogCategory_BeaconManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v20 = v7;
    *(_WORD *)&v20[8] = 1024;
    *(_DWORD *)v21 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: beaconingStateChanged: %ld networkState: %d", buf, 0x12u);
  }

  v8 = objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState");
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "setCurrentBeaconingState:", 0);
      objc_msgSend(*(id *)(a1 + 32), "monitorWrapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pause");
      goto LABEL_10;
    case 1:
      v10 = 1;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentBeaconingState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "monitorWrapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resume");
      goto LABEL_11;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "setCurrentBeaconingState:", v5 ^ 1u);
      objc_msgSend(*(id *)(a1 + 32), "monitorWrapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resume");
LABEL_10:
      v10 = 0;
LABEL_11:

      break;
    default:
      v10 = 0;
      break;
  }
  LogCategory_BeaconManager();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "initialStateChangeSent");
    v13 = objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState");
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v20 = v12;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v8;
    *(_WORD *)v21 = 1024;
    *(_DWORD *)&v21[2] = v13;
    v22 = 1024;
    v23 = v10;
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "Initial state changed? [%i], Old beaconing state [%i], current state [%i] requestNewKeys [%i]", buf, 0x1Au);
  }

  if (((v10 | objc_msgSend(*(id *)(a1 + 32), "initialStateChangeSent") ^ 1) & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"), v8 != (_DWORD)result))
  {
    if (v8 != objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"))
    {
      LogCategory_SystemHealth();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v20 = v16;
        _os_log_impl(&dword_1AEA79000, v15, OS_LOG_TYPE_DEFAULT, "Beaconing state changed to %i", buf, 8u);
      }

    }
    if ((v10 & objc_msgSend(*(id *)(a1 + 32), "initialStateChangeSent")) == 1)
      objc_msgSend(*(id *)(a1 + 32), "notifyBeaconingKeysChangedBlockWithCompletion:", &__block_literal_global_6);
    if ((v8 & 1) != 0 || !objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"))
    {
      objc_msgSend(*(id *)(a1 + 32), "notifyStateChange:", objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"));
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_127;
      v18[3] = &unk_1E5E16668;
      v18[4] = v17;
      objc_msgSend(v17, "periodicActionWithCompletion:", v18);
    }
    return objc_msgSend(*(id *)(a1 + 32), "setInitialStateChangeSent:", 1);
  }
  return result;
}

void __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_125(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyBeaconingKeysChangedBlockWithCompletion completion: %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __46__SPLocalBeaconManager_beaconingStateChanged___block_invoke_127(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"))
    objc_msgSend(*(id *)(a1 + 32), "notifyStatusChange:", objc_msgSend(*(id *)(a1 + 32), "currentStatus"));
  return objc_msgSend(*(id *)(a1 + 32), "notifyStateChange:", objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState"));
}

- (void)notifyStateChange:(BOOL)a3
{
  _BOOL4 v3;
  SPPowerAssertion *v5;
  void *v6;
  NSObject *v7;
  _QWORD activity_block[4];
  SPPowerAssertion *v9;
  id v10;
  BOOL v11;
  uint8_t buf[4];
  _BOOL8 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[SPPowerAssertion initWithReason:type:timeout:]([SPPowerAssertion alloc], "initWithReason:type:timeout:", CFSTR("SPBeaconManager.stateChanged"), 1, 5.0);
  -[SPPowerAssertion hold](v5, "hold");
  -[SPLocalBeaconManager stateChangedBlockWithCompletion](self, "stateChangedBlockWithCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v3;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyStateChange: %ld ", buf, 0xCu);
  }

  if (v6)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __42__SPLocalBeaconManager_notifyStateChange___block_invoke;
    activity_block[3] = &unk_1E5E16F00;
    v10 = v6;
    v11 = v3;
    v9 = v5;
    _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: Calling stateChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __42__SPLocalBeaconManager_notifyStateChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__SPLocalBeaconManager_notifyStateChange___block_invoke_2;
  v3[3] = &unk_1E5E16ED8;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v1, v3);

}

uint64_t __42__SPLocalBeaconManager_notifyStateChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "stateChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "drop");
}

- (void)notifyStatusChange:(unsigned __int8)a3
{
  unsigned int v3;
  SPPowerAssertion *v5;
  void *v6;
  NSObject *v7;
  _QWORD activity_block[4];
  SPPowerAssertion *v9;
  id v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[SPPowerAssertion initWithReason:type:timeout:]([SPPowerAssertion alloc], "initWithReason:type:timeout:", CFSTR("SPBeaconManager.statusChanged"), 1, 5.0);
  -[SPPowerAssertion hold](v5, "hold");
  -[SPLocalBeaconManager statusChangedBlockWithCompletion](self, "statusChangedBlockWithCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v3;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: notifyStatusChange: %ld ", buf, 0xCu);
  }

  if (v6)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __43__SPLocalBeaconManager_notifyStatusChange___block_invoke;
    activity_block[3] = &unk_1E5E16F00;
    v10 = v6;
    v11 = v3;
    v9 = v5;
    _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: Calling statusChangedBlockWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __43__SPLocalBeaconManager_notifyStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SPLocalBeaconManager_notifyStatusChange___block_invoke_2;
  v3[3] = &unk_1E5E16ED8;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v1, v3);

}

uint64_t __43__SPLocalBeaconManager_notifyStatusChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "statusChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "drop");
}

- (void)handlerForActivity:(id)a3 state:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = v6;
    -[SPLocalBeaconManager timerFired](self, "timerFired");
    objc_msgSend(v7, "done");
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v7 = v6;
    objc_msgSend(v6, "defer");
LABEL_5:
    v6 = v7;
  }

}

- (id)xpcActivityCriteria:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (-[SPLocalBeaconManager schedulePeriodicActionXpcActivity](self, "schedulePeriodicActionXpcActivity"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPLocalBeaconManager timeIntervalToNextFireDateFromDate:](self, "timeIntervalToNextFireDateFromDate:", v5);
    v7 = v6;
    -[SPLocalBeaconManager periodicActionXpcActivityInterval](self, "periodicActionXpcActivityInterval");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20230]), "initWithPriority:repeating:delay:gracePeriod:interval:options:", 0, 1, (uint64_t)v7, (uint64_t)(v8 * 0.5), (uint64_t)v8, 515);
    v10 = (void *)v9;
    if (v4)
      v11 = v4;
    else
      v11 = (void *)v9;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)timeIntervalToNextFireDateFromDate:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = ceil(v4 / 900.0);
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return -(v7 - v5 * 900.0);
}

- (void)setPeriodicActionDispatchTimerWithInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  -[SPLocalBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[SPLocalBeaconManager setPeriodicActionDispatchTimer:](self, "setPeriodicActionDispatchTimer:", 0);
  }
  if ((a3 < 0.0 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(_QWORD *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    v10 = -1;
    v11 = -1;
  }
  else
  {
    v10 = (unint64_t)((double)(unint64_t)(a3 * 1000000000.0) * 0.02);
    v11 = dispatch_walltime(0, (unint64_t)(a3 * 1000000000.0) - 1);
  }
  -[SPLocalBeaconManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  -[SPLocalBeaconManager setPeriodicActionDispatchTimer:](self, "setPeriodicActionDispatchTimer:", v13);

  -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v14, v11, 0xFFFFFFFFFFFFFFFFLL, v10);

  objc_initWeak(&location, self);
  -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer");
  v15 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __67__SPLocalBeaconManager_setPeriodicActionDispatchTimerWithInterval___block_invoke;
  v20 = &unk_1E5E16B08;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v15, &v17);

  -[SPLocalBeaconManager periodicActionDispatchTimer](self, "periodicActionDispatchTimer", v17, v18, v19, v20);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __67__SPLocalBeaconManager_setPeriodicActionDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action dispatch timer fired", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timerFired");

}

- (void)timerFired
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __34__SPLocalBeaconManager_timerFired__block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: timerFired", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __34__SPLocalBeaconManager_timerFired__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id buf[2];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager periodic action timer fired", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SPLocalBeaconManager_timerFired__block_invoke_136;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v5, buf);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __34__SPLocalBeaconManager_timerFired__block_invoke_136(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "periodicActionWithCompletion:", 0);

}

- (void)periodicActionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SPLocalBeaconManager *v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[SPLocalBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  -[SPLocalBeaconManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke;
  v9[3] = &unk_1E5E16FA0;
  v7 = v6;
  v10 = v7;
  v11 = self;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  -[SPLocalBeaconManager notifyNearbyTokensChangedBlockWithCompletion:](self, "notifyNearbyTokensChangedBlockWithCompletion:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16F78;
  v6 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_3;
  v5[3] = &unk_1E5E16F50;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "notifyBeaconingKeysChangedBlockWithCompletion:", v5);

  objc_destroyWeak(&v10);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_4;
  block[3] = &unk_1E5E16F28;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v10 = v3;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v14);
}

void __53__SPLocalBeaconManager_periodicActionWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = v2;
    if (!v3)
      goto LABEL_8;
    objc_msgSend(v2, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    if (v7 > v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(*(id *)(a1 + 40), "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

      v4 = (id)v14;
    }
    objc_msgSend(v4, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = v19;

    if (v17 > v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v4, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);

      v4 = (id)v24;
    }
    if (v4)
      goto LABEL_8;
  }
  else
  {
    v4 = v3;
    if (v4)
    {
LABEL_8:
      objc_msgSend(v4, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceNow");
      objc_msgSend(WeakRetained, "setPeriodicActionDispatchTimerWithInterval:");

      objc_msgSend(*(id *)(a1 + 48), "setSchedulePeriodicActionXpcActivity:", 1);
      objc_msgSend(v4, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v27);
      objc_msgSend(*(id *)(a1 + 48), "setPeriodicActionXpcActivityInterval:");

      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setSchedulePeriodicActionXpcActivity:", 0);
LABEL_11:
  objc_msgSend(*(id *)(a1 + 48), "periodicActionXpcActivity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateCriteria");

  v29 = *(_QWORD *)(a1 + 56);
  if (v29)
    (*(void (**)(void))(v29 + 16))();

}

- (void)notifyBeaconingKeysChangedBlockWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD activity_block[5];
  id v8;

  v4 = a3;
  -[SPLocalBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v8 = v4;
  v6 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: notifyBeaconingKeysChangedBlockWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  SPPowerAssertion *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  __CFString *v18;
  id v19;
  SPPowerAssertion *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SPLocalBeaconManager notifyBeaconingKeysChangedBlockWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SPPowerAssertion initWithReason:type:timeout:]([SPPowerAssertion alloc], "initWithReason:type:timeout:", CFSTR("SPBeaconManager.notifyBeaconingKeysChanged"), 1, 5.0);
  -[SPPowerAssertion hold](v4, "hold");
  objc_msgSend(*(id *)(a1 + 32), "beaconingKeyChangedBlockWithCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "currentBeaconingState") && v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "beaconFromNVRAM") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "monitorWrapper"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isNetworkUp"),
          v6,
          (v7 & 1) == 0))
    {
      v9 = 0;
      v8 = CFSTR(".wild");
    }
    else
    {
      v8 = CFSTR(".nearOwner");
      v9 = 1;
    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_147;
    v17 = &unk_1E5E17030;
    v18 = (__CFString *)v8;
    v19 = v3;
    v23 = 1907;
    v21 = v5;
    v20 = v4;
    v22 = *(id *)(a1 + 40);
    v10 = _Block_copy(&v14);
    v11 = objc_msgSend(*(id *)(a1 + 32), "beaconFromNVRAM", v14, v15, v16, v17);
    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "generateBeaconingKeysOfType:now:withCompletion:", v9, v13, v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "findMyBeaconDaemonProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beaconingKeysOfType:withCompletion:", v9, v10);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
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
  __int128 v29;
  id obj;
  _QWORD activity_block[4];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v40 = v5;
    v41 = 2114;
    v42 = v6;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Calling beaconingKeyChangedBlock with %lu %{public}@ keys.", buf, 0x16u);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    *(_QWORD *)&v9 = 138412802;
    v29 = v9;
    obj = v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CB36A8];
        objc_msgSend(v13, "dateInterval", v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromDate:timeZone:formatOptions:", v16, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0CB36A8];
        objc_msgSend(v13, "dateInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate:timeZone:formatOptions:", v20, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        LogCategory_BeaconManager();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "key");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fm_hexString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v29;
          v40 = (uint64_t)v24;
          v41 = 2114;
          v42 = v17;
          v43 = 2114;
          v44 = v21;
          _os_log_impl(&dword_1AEA79000, v22, OS_LOG_TYPE_DEFAULT, "  key: %@ (%{public}@ - %{public}@)", buf, 0x20u);

        }
      }
      v7 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v10);
  }

  v25 = *(void **)(a1 + 56);
  if (v25)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_149;
    activity_block[3] = &unk_1E5E16FC8;
    v34 = v25;
    v32 = v7;
    v33 = *(id *)(a1 + 48);
    _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: Calling beaconingKeyChangedBlockWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    v26 = *(void **)(a1 + 48);
    if (v26)
      objc_msgSend(v26, "drop");
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "fm_map:", &__block_literal_global_152);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPLocalBeaconManager scheduleDateInterval:](SPLocalBeaconManager, "scheduleDateInterval:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_149(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E16ED8;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v1, v3);

}

uint64_t __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "beaconingKeyChangedBlockWithCompletion completed with status - %li", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "drop");
}

uint64_t __70__SPLocalBeaconManager_notifyBeaconingKeysChangedBlockWithCompletion___block_invoke_150(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dateInterval");
}

- (void)notifyNearbyTokensChangedBlockWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (id)scheduleDateInterval:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    objc_msgSend(v5, "endDate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    objc_msgSend(v5, "endDate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__SPLocalBeaconManager_scheduleDateInterval___block_invoke;
    v9[3] = &unk_1E5E17058;
    v9[4] = &v16;
    v9[5] = &v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    v7 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v17[5], v11[5]);
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__SPLocalBeaconManager_scheduleDateInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timeIntervalSinceReferenceDate");
  if (v5 < v6)
  {
    objc_msgSend(v12, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v10 = *(_QWORD *)(v8 + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v7;

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceReferenceDate");
  if (v5 > v9)
  {
    objc_msgSend(v12, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)refreshBeaconingState
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[SPLocalBeaconManager queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SPLocalBeaconManager beaconFromNVRAM](self, "beaconFromNVRAM"))
  {
    -[SPLocalBeaconManager queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke;
    block[3] = &unk_1E5E16C70;
    objc_copyWeak(&v7, &location);
    v6 = v3;
    dispatch_async(v4, block);

    objc_destroyWeak(&v7);
  }

  objc_destroyWeak(&location);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "findMyBeaconDaemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_2;
  v5[3] = &unk_1E5E170D0;
  v6 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "beaconingStateWithCompletion:", v5);

  objc_destroyWeak(&v7);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD activity_block[4];
  id v5;
  id v6[2];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_3;
  activity_block[3] = &unk_1E5E170A8;
  v5 = *(id *)(a1 + 32);
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalBeaconManager: Calling beaconingStateChanged", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(v6);

}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4[2];

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_4;
  v3[3] = &unk_1E5E17080;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
  objc_destroyWeak(v4);
}

void __45__SPLocalBeaconManager_refreshBeaconingState__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedLocalBeaconManagerState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "beaconingStateChanged:", *(_QWORD *)(a1 + 40));

}

- (void)stateDidChange:(BOOL)a3 powerState:(unint64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v5 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Monitor Delegate: networkUp [%i], powerState [%lu]", (uint8_t *)v8, 0x12u);
  }

  -[SPLocalBeaconManager refreshBeaconingState](self, "refreshBeaconingState");
}

- (void)bleMonitor:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a4;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPBLEStateMonitor Delegate: didChangeState [%lu]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPLocalBeaconManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "periodicActionWithCompletion:", &__block_literal_global_156);

}

void __50__SPLocalBeaconManager_bleMonitor_didChangeState___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  LogCategory_BeaconManager();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AEA79000, v0, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: SPBLEStateMonitor finished periodicActionWithCompletion.", v1, 2u);
  }

}

- (id)stateChangedBlockWithCompletion
{
  return self->_stateChangedBlockWithCompletion;
}

- (void)setStateChangedBlockWithCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)statusChangedBlockWithCompletion
{
  return self->_statusChangedBlockWithCompletion;
}

- (void)setStatusChangedBlockWithCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)beaconingKeyChangedBlockWithCompletion
{
  return self->_beaconingKeyChangedBlockWithCompletion;
}

- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FMXPCServiceDescription)spdServiceDescription
{
  return self->_spdServiceDescription;
}

- (void)setSpdServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_spdServiceDescription, a3);
}

- (FMXPCServiceDescription)findMyBeaconingDaemonServiceDescription
{
  return self->_findMyBeaconingDaemonServiceDescription;
}

- (void)setFindMyBeaconingDaemonServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_findMyBeaconingDaemonServiceDescription, a3);
}

- (void)setSearchPartyDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_searchPartyDaemonProxy, a3);
}

- (void)setFindMyBeaconDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_findMyBeaconDaemonProxy, a3);
}

- (SPLocalBeaconManagerXPCProtocol)userAgentProxy
{
  return self->_userAgentProxy;
}

- (void)setUserAgentProxy:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentProxy, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setPeriodicActionXpcActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActionXpcActivity, a3);
}

- (BOOL)schedulePeriodicActionXpcActivity
{
  return self->_schedulePeriodicActionXpcActivity;
}

- (void)setSchedulePeriodicActionXpcActivity:(BOOL)a3
{
  self->_schedulePeriodicActionXpcActivity = a3;
}

- (double)periodicActionXpcActivityInterval
{
  return self->_periodicActionXpcActivityInterval;
}

- (void)setPeriodicActionXpcActivityInterval:(double)a3
{
  self->_periodicActionXpcActivityInterval = a3;
}

- (SPBLEStateMonitor)bleMonitor
{
  return self->_bleMonitor;
}

- (void)setBleMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_bleMonitor, a3);
}

- (BOOL)currentBeaconingState
{
  return self->_currentBeaconingState;
}

- (void)setCurrentBeaconingState:(BOOL)a3
{
  self->_currentBeaconingState = a3;
}

- (BOOL)forceBeaconingOff
{
  return self->_forceBeaconingOff;
}

- (void)setForceBeaconingOff:(BOOL)a3
{
  self->_forceBeaconingOff = a3;
}

- (unsigned)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(unsigned __int8)a3
{
  self->_currentStatus = a3;
}

- (int64_t)cachedLocalBeaconManagerState
{
  return self->_cachedLocalBeaconManagerState;
}

- (void)setCachedLocalBeaconManagerState:(int64_t)a3
{
  self->_cachedLocalBeaconManagerState = a3;
}

- (BOOL)initialStateChangeSent
{
  return self->_initialStateChangeSent;
}

- (void)setInitialStateChangeSent:(BOOL)a3
{
  self->_initialStateChangeSent = a3;
}

- (BOOL)beaconFromNVRAM
{
  return self->_beaconFromNVRAM;
}

- (void)setBeaconFromNVRAM:(BOOL)a3
{
  self->_beaconFromNVRAM = a3;
}

- (BOOL)isOfflineFindingEnabled
{
  return self->_isOfflineFindingEnabled;
}

- (void)setIsOfflineFindingEnabled:(BOOL)a3
{
  self->_isOfflineFindingEnabled = a3;
}

- (NSUUID)selfBeaconingUUID
{
  return self->_selfBeaconingUUID;
}

- (void)setSelfBeaconingUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)selfBeaconingIndex
{
  return self->_selfBeaconingIndex;
}

- (void)setSelfBeaconingIndex:(unint64_t)a3
{
  self->_selfBeaconingIndex = a3;
}

- (NSDate)selfBeaconingPairDate
{
  return self->_selfBeaconingPairDate;
}

- (void)setSelfBeaconingPairDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)selfBeaconingDerivedSharedSecretKey
{
  return self->_selfBeaconingDerivedSharedSecretKey;
}

- (void)setSelfBeaconingDerivedSharedSecretKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSData)selfBeaconingPublicKey
{
  return self->_selfBeaconingPublicKey;
}

- (void)setSelfBeaconingPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDictionary)selfBeaconingConfigurations
{
  return self->_selfBeaconingConfigurations;
}

- (void)setSelfBeaconingConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)alreadyPoisonedLocalBeacon
{
  return self->_alreadyPoisonedLocalBeacon;
}

- (void)setAlreadyPoisonedLocalBeacon:(BOOL)a3
{
  self->_alreadyPoisonedLocalBeacon = a3;
}

- (unint64_t)bucketWithBaseTime:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  unint64_t v16;
  unint64_t v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  if (v8 >= v9)
    v10 = v6;
  else
    v10 = v5;
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:", floor(v13 / 900.0) * 900.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v14);
  v16 = (unint64_t)(v15 / 900.0);
  v17 = v16 + 1;
  if (v16 == -1)
    -[SPLocalBeaconManager(KeyGeneration) bucketWithBaseTime:date:].cold.1();

  return v17;
}

- (id)dateIntervalForIndex:(unint64_t)a3 baseDate:(id)a4
{
  double v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  long double v16;
  void *v17;
  void *v18;
  NSObject *v19;

  if (a3)
  {
    v5 = (double)(a3 - 1) * 900.0;
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = a4;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", floor(v8 / 900.0) * 900.0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v7, v5);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v9, v5);
    v12 = (void *)v11;
    if (a3 == 1)
      v13 = v10;
    else
      v13 = (void *)v11;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v11, 900.0);
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)nextafter(v16, 0.0));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v17);

  }
  else
  {
    v9 = a4;
    LogCategory_BeaconManager();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) dateIntervalForIndex:baseDate:].cold.1();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v9, 0.0);
  }

  return v18;
}

- (void)generateBeaconingKeysOfType:(int64_t)a3 now:(id)a4 withCompletion:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  double v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];

  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  -[SPLocalBeaconManager selfBeaconingPairDate](self, "selfBeaconingPairDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:", floor(v11 / 900.0) * 900.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SPLocalBeaconManager selfBeaconingIndex](self, "selfBeaconingIndex");
  v14 = -[SPLocalBeaconManager bucketWithBaseTime:date:](self, "bucketWithBaseTime:date:", v9, v7);
  -[SPLocalBeaconManager selfBeaconingDerivedSharedSecretKey](self, "selfBeaconingDerivedSharedSecretKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocalBeaconManager selfBeaconingPublicKey](self, "selfBeaconingPublicKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v14 >= v13)
  {
    if (v13 == 1)
      v18 = v14;
    else
      v18 = v14 - v13;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__SPLocalBeaconManager_KeyGeneration__generateBeaconingKeysOfType_now_withCompletion___block_invoke;
    v20[3] = &unk_1E5E17118;
    v25 = v14;
    v23 = v32;
    v20[4] = self;
    v21 = v12;
    v22 = v9;
    v24 = &v26;
    +[SPCrypto generateTokensWithPublicKey:sharedSecretKey:initialRatchetsToSkip:ratchetStep:](SPCrypto, "generateTokensWithPublicKey:sharedSecretKey:initialRatchetsToSkip:ratchetStep:", v16, v15, v18, v20);
    v19 = (void *)objc_msgSend((id)v27[5], "copy");
    v8[2](v8, v19);

  }
  else
  {
    LogCategory_BeaconManager();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) generateBeaconingKeysOfType:now:withCompletion:].cold.1();

    v8[2](v8, (void *)MEMORY[0x1E0C9AA60]);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
}

void __86__SPLocalBeaconManager_KeyGeneration__generateBeaconingKeysOfType_now_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SPBeaconingKey *v15;
  id v16;

  v16 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + *(_QWORD *)(a1 + 72);
  v8 = a3;
  +[SPCrypto compactKey:](SPCrypto, "compactKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dateIntervalForIndex:baseDate:", v7, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

    v10 = (void *)v14;
  }
  v15 = -[SPBeaconingKey initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:]([SPBeaconingKey alloc], "initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:", v10, v9, 0, v7, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v15);
  if ((uint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 5)
    *a4 = 1;

}

- (id)generateOfflineAdvertisingKeysForReason:(int64_t)a3 now:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  char v12;
  char v13;
  char v14;
  char v15;
  NSObject *v16;
  void *v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  SPOfflineAdvertisingKeys *v35;
  SPOfflineAdvertisingKeys *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  NSObject *v46;
  _QWORD *v47;
  __int128 *p_buf;
  unint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  _QWORD block[7];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[2];
  uint8_t v60[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__1;
  v57 = __Block_byref_object_dispose__1;
  v58 = 0;
  -[SPLocalBeaconManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke;
  block[3] = &unk_1E5E17140;
  block[4] = self;
  block[5] = &v53;
  block[6] = a3;
  dispatch_sync(v8, block);

  LogCategory_BeaconManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v54[5])
      v11 = CFSTR("(not-nil)");
    else
      v11 = CFSTR("(nil)");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "Done reading selfBeaconing config %@", (uint8_t *)&buf, 0xCu);
  }

  if (!v54[5])
  {
    LogCategory_BeaconManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:].cold.1(a3, v16, v25, v26, v27, v28, v29, v30);
    goto LABEL_28;
  }
  v12 = _os_feature_enabled_impl();
  if (a3 == 1)
    v13 = v12;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    LogCategory_BeaconManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:].cold.4();
    goto LABEL_28;
  }
  v14 = _os_feature_enabled_impl();
  if (a3 == 2)
    v15 = v14;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    LogCategory_BeaconManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) generateOfflineAdvertisingKeysForReason:now:].cold.3();
LABEL_28:
    v24 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_29;
  }
  v40 = objc_msgSend((id)v54[5], "shortIntervalCount");
  v41 = objc_msgSend((id)v54[5], "longIntervalCount");
  -[SPLocalBeaconManager selfBeaconingPairDate](self, "selfBeaconingPairDate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99D68];
  -[NSObject timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:", floor(v18 / 900.0) * 900.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SPLocalBeaconManager selfBeaconingIndex](self, "selfBeaconingIndex");
  v20 = -[SPLocalBeaconManager bucketWithBaseTime:date:](self, "bucketWithBaseTime:date:", v16, v7);
  -[SPLocalBeaconManager selfBeaconingPublicKey](self, "selfBeaconingPublicKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocalBeaconManager selfBeaconingDerivedSharedSecretKey](self, "selfBeaconingDerivedSharedSecretKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == 1)
    v21 = v20;
  else
    v21 = v20 - v19;
  if (v19 <= v20)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__1;
    v67 = __Block_byref_object_dispose__1;
    v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44[0] = v9;
    v44[1] = 3221225472;
    v44[2] = __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_384;
    v44[3] = &unk_1E5E17168;
    v49 = v20;
    v47 = v51;
    v44[4] = self;
    v23 = v39;
    v45 = v39;
    v46 = v16;
    p_buf = &buf;
    v50 = v41 + v40;
    +[SPCrypto generateTokensWithPublicKey:sharedSecretKey:initialRatchetsToSkip:ratchetStep:](SPCrypto, "generateTokensWithPublicKey:sharedSecretKey:initialRatchetsToSkip:ratchetStep:", v43, v42, v21, v44);
    if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") != v41 + v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPLocalBeaconManager.m"), 1084, CFSTR("Generated %lu keys -- expected %lu!"), objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"), v41 + v40);

    }
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "fm_map:", &__block_literal_global_390);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "subarrayWithRange:", 0, v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "subarrayWithRange:", v40, v41);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SPOfflineAdvertisingKeys initWithInterval:keys:]([SPOfflineAdvertisingKeys alloc], "initWithInterval:keys:", 15, v33);
    v36 = -[SPOfflineAdvertisingKeys initWithInterval:keys:]([SPOfflineAdvertisingKeys alloc], "initWithInterval:keys:", 1440, v34);
    LogCategory_BeaconManager();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v60 = 134218240;
      v61 = v40;
      v62 = 2048;
      v63 = v41;
      _os_log_impl(&dword_1AEA79000, v37, OS_LOG_TYPE_DEFAULT, "Returning: %lu shortInterval keys and %lu longInterval keys", v60, 0x16u);
    }

    v59[0] = v35;
    v59[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v51, 8);
  }
  else
  {
    LogCategory_BeaconManager();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v39;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SPLocalBeaconManager(KeyGeneration) generateBeaconingKeysOfType:now:withCompletion:].cold.1();

    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_29:
  _Block_object_dispose(&v53, 8);

  return v24;
}

void __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "selfBeaconingConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    LogCategory_BeaconManager();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "no selfBeaconingConfigurations. Reloading state from NVRAM", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateStateFromNVRAM");
  }
  objc_msgSend(*(id *)(a1 + 32), "selfBeaconingConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_384(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SPBeaconingKey *v15;
  id v16;

  v16 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + *(_QWORD *)(a1 + 72);
  v8 = a3;
  +[SPCrypto compactKey:](SPCrypto, "compactKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dateIntervalForIndex:baseDate:", v7, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

    v10 = (void *)v14;
  }
  v15 = -[SPBeaconingKey initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:]([SPBeaconingKey alloc], "initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:", v10, v9, 0, v7, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v15);
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 80))
    *a4 = 1;

}

uint64_t __83__SPLocalBeaconManager_KeyGeneration__generateOfflineAdvertisingKeysForReason_now___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "isOfflineFindingEnabled");
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "Setting isOfflineFindingEnabled to %d", (uint8_t *)v4, 8u);
  OUTLINED_FUNCTION_3();
}

void __44__SPLocalBeaconManager_updateStateFromNVRAM__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "activationLockInfoFromDeviceWithCompletion: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
