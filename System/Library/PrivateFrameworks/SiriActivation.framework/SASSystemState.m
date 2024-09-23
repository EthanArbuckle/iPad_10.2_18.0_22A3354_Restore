@implementation SASSystemState

void __22__SASSystemState_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v11 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[SASSystemState init]_block_invoke";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #modes DisplayTransition called transition=%@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(v9, "transitionReasons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", *MEMORY[0x1E0DAB168]))
    {
      objc_msgSend(*(id *)(a1 + 32), "setLiftToWakeDetected:", 1);
      v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[SASSystemState init]_block_invoke";
        _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Device went through liftToWake transition setLiftToWake:YES", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v14 = *v10;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[SASSystemState init]_block_invoke";
        _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #modes Device went to sleep or went through another transition setLiftToWake:NO", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "setLiftToWakeDetected:", 0);
    }

  }
}

- (void)setLiftToWakeDetected:(BOOL)a3
{
  self->_liftToWakeDetected = a3;
}

+ (id)sharedSystemState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SASSystemState_sharedSystemState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSystemState_onceToken != -1)
    dispatch_once(&sharedSystemState_onceToken, block);
  return (id)sharedSystemState_sharedSystemState;
}

void __35__SASSystemState_sharedSystemState__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSystemState_sharedSystemState;
  sharedSystemState_sharedSystemState = (uint64_t)v1;

}

- (id)_initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SASSystemState;
  return -[SASSystemState init](&v3, sel_init);
}

- (SASSystemState)init
{
  SASSystemState *v2;
  SASSystemState *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  SASCallRouteObserver *v6;
  SASCallRouteObserver *callRouteObserver;
  NSMutableSet *v8;
  NSMutableSet *activeCalls;
  CXCallObserver *v10;
  CXCallObserver *callObserver;
  void *v12;
  uint64_t v13;
  SASSystemState *v14;
  void *v15;
  uint64_t v16;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  dispatch_queue_t v18;
  uint64_t v19;
  AFNotifyObserver *observerWirelessSplitter;
  uint64_t v21;
  AFNotifyObserver *observerBluetoothGuestConnected;
  id v23;
  uint64_t v24;
  AFNotifyObserver *remoteWebcamModeEnabled;
  NSObject *v26;
  uint64_t v27;
  AEInvalidatable *restrictionEnforcer;
  _QWORD block[4];
  id v31;
  id location;
  _QWORD aBlock[4];
  SASSystemState *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SASSystemState;
  v2 = -[SASSystemState init](&v35, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_carPlayConnectionState = 0;
    v2->_supportsCarPlayVehicleData = 0;
    -[SASSystemState _updateAccessibilityState](v2, "_updateAccessibilityState");
    -[SASSystemState monitorCarSessions](v3, "monitorCarSessions");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_HomeButtonTripleClickEnabled, (CFStringRef)*MEMORY[0x1E0DDE2D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASSystemState setListeners:](v3, "setListeners:", v5);

    v6 = objc_alloc_init(SASCallRouteObserver);
    callRouteObserver = v3->_callRouteObserver;
    v3->_callRouteObserver = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeCalls = v3->_activeCalls;
    v3->_activeCalls = v8;

    v10 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E0C932E8]);
    callObserver = v3->_callObserver;
    v3->_callObserver = v10;

    -[CXCallObserver setDelegate:queue:](v3->_callObserver, "setDelegate:queue:", v3, 0);
    if (AFDeviceSupportsSystemAssistantExperience())
    {
      -[SASSystemState setGameState:](v3, "setGameState:", 0);
      -[SASSystemState registerForGameMonitoring](v3, "registerForGameMonitoring");
    }
    -[SASSystemState setLiftToWakeDetected:](v3, "setLiftToWakeDetected:", 0);
    objc_msgSend(MEMORY[0x1E0D230E8], "configurationForDefaultMainDisplayMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __22__SASSystemState_init__block_invoke;
    aBlock[3] = &unk_1E91FCDE8;
    v14 = v3;
    v34 = v14;
    v15 = _Block_copy(aBlock);
    objc_msgSend(v12, "setTransitionHandler:", v15);
    objc_msgSend(MEMORY[0x1E0D230D8], "monitorWithConfiguration:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    displayLayoutMonitor = v14->_displayLayoutMonitor;
    v14->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v16;

    v18 = dispatch_queue_create("com.apple.siri.ActivationService.SystemState", 0);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE958]), "initWithName:options:queue:delegate:", CFSTR("com.apple.bluetooth.WirelessSplitterOn"), 1, v18, 0);
    observerWirelessSplitter = v14->_observerWirelessSplitter;
    v14->_observerWirelessSplitter = (AFNotifyObserver *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE958]), "initWithName:options:queue:delegate:", CFSTR("com.apple.bluetooth.GuestConnected"), 1, v18, 0);
    observerBluetoothGuestConnected = v14->_observerBluetoothGuestConnected;
    v14->_observerBluetoothGuestConnected = (AFNotifyObserver *)v21;

    v23 = objc_alloc(MEMORY[0x1E0CFE958]);
    v24 = objc_msgSend(v23, "initWithName:options:queue:delegate:", *MEMORY[0x1E0D482F8], 1, v18, 0);
    remoteWebcamModeEnabled = v14->_remoteWebcamModeEnabled;
    v14->_remoteWebcamModeEnabled = (AFNotifyObserver *)v24;

    objc_initWeak(&location, v14);
    dispatch_get_global_queue(0, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __22__SASSystemState_init__block_invoke_84;
    block[3] = &unk_1E91FBE70;
    objc_copyWeak(&v31, &location);
    dispatch_async(v26, block);

    objc_msgSend(MEMORY[0x1E0CF0FC0], "registerRestrictionEnforcer:machServiceName:", v14, CFSTR("com.apple.siri.assessment-mode-restriction"));
    v27 = objc_claimAutoreleasedReturnValue();
    restrictionEnforcer = v14->_restrictionEnforcer;
    v14->_restrictionEnforcer = (AEInvalidatable *)v27;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __22__SASSystemState_init__block_invoke_84(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isActive");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__SASSystemState_init__block_invoke_2;
  v4[3] = &unk_1E91FC230;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);

}

void __22__SASSystemState_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "didAssessmentModeRecieveInitialStateUpdate");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "setIsAssessmentModeActive:", *(unsigned __int8 *)(a1 + 40));
      v3 = v5;
    }
  }

}

+ (SASSystemState)new
{
  return 0;
}

- (void)addStateChangeListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SASSystemState listeners](self, "listeners");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeStateChangeListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SASSystemState listeners](self, "listeners");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)currentSpokenLanguageCode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)monitorLockState
{
  id v2;

  v2 = -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
}

- (SASLockStateMonitor)lockStateMonitor
{
  SASLockStateMonitor *lockStateMonitor;
  SASLockStateMonitor *v4;
  SASLockStateMonitor *v5;

  lockStateMonitor = self->_lockStateMonitor;
  if (!lockStateMonitor)
  {
    v4 = objc_alloc_init(SASLockStateMonitor);
    v5 = self->_lockStateMonitor;
    self->_lockStateMonitor = v4;

    lockStateMonitor = self->_lockStateMonitor;
  }
  return lockStateMonitor;
}

- (BOOL)hasUnlockedSinceBoot
{
  void *v2;
  char v3;

  -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUnlockedSinceBoot");

  return v3;
}

- (BOOL)deviceIsBlocked
{
  void *v2;
  char v3;

  -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlocked");

  return v3;
}

- (BOOL)deviceIsPasscodeLocked
{
  void *v2;
  unint64_t v3;

  -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "lockState") >> 1) & 1;

  return v3;
}

- (BOOL)deviceScreenIsOn
{
  void *v2;
  char v3;

  -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenOn");

  return v3;
}

- (BOOL)_deviceIsUnlocked
{
  void *v2;
  BOOL v3;

  -[SASSystemState lockStateMonitor](self, "lockStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockState") == 0;

  return v3;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSMutableSet *activeCalls;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableSet *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "hasEnded");
  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      objc_msgSend(v5, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[SASSystemState callObserver:callChanged:]";
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver Ended:%@", buf, 0x16u);

    }
    activeCalls = self->_activeCalls;
    objc_msgSend(v5, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](activeCalls, "removeObject:", v12);
  }
  else
  {
    if (v8)
    {
      v13 = v7;
      objc_msgSend(v5, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[SASSystemState callObserver:callChanged:]";
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver Changed:%@", buf, 0x16u);

    }
    v15 = self->_activeCalls;
    objc_msgSend(v5, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v15, "addObject:", v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SASSystemState listeners](self, "listeners", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "callStateChangedToIsActive:isOutgoing:", -[SASSystemState isInActiveCall](self, "isInActiveCall"), objc_msgSend(v5, "isOutgoing"));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

  if (-[NSMutableSet count](self->_activeCalls, "count") == 1)
  {
    -[SASCallRouteObserver startObserving](self->_callRouteObserver, "startObserving");
  }
  else if (!-[NSMutableSet count](self->_activeCalls, "count"))
  {
    -[SASCallRouteObserver stopObserving](self->_callRouteObserver, "stopObserving");
  }

}

- (BOOL)isInActiveCall
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[NSMutableSet count](self->_activeCalls, "count");
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SASSystemState isInActiveCall]";
    v7 = 2048;
    v8 = v2;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver activeCalls:%lu", (uint8_t *)&v5, 0x16u);
  }
  return v2 != 0;
}

- (BOOL)hasRingingCall
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v6, "hasConnected") & 1) == 0 && !objc_msgSend(v6, "hasEnded"))
        {
          LODWORD(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if ((_DWORD)v3)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v15 = "-[SASSystemState hasRingingCall]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver hasRingingCall:%@", buf, 0x16u);
  }
  return v3;
}

- (BOOL)isCallAudioRouteAllowed
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[SASCallRouteObserver isCallAudioRouteAllowed](self->_callRouteObserver, "isCallAudioRouteAllowed");
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    v6 = 136315394;
    v7 = "-[SASSystemState isCallAudioRouteAllowed]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  return v2;
}

- (BOOL)isWirelessSplitterOn
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[AFNotifyObserver state](self->_observerWirelessSplitter, "state");
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SASSystemState isWirelessSplitterOn]";
    v7 = 1024;
    v8 = v2 != 0;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %i", (uint8_t *)&v5, 0x12u);
  }
  return v2 != 0;
}

- (BOOL)isGuestConnected
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[AFNotifyObserver state](self->_observerBluetoothGuestConnected, "state");
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SASSystemState isGuestConnected]";
    v7 = 1024;
    v8 = v2 != 0;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %i", (uint8_t *)&v5, 0x12u);
  }
  return v2 != 0;
}

- (BOOL)isInAAAGame
{
  return -[SASSystemState gameState](self, "gameState") == 2;
}

- (void)registerForGameMonitoring
{
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C80D38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SASSystemState_registerForGameMonitoring__block_invoke;
  v5[3] = &unk_1E91FCE10;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.system.console_mode_model_manager_assertion_changed", &self->_gameMonitorNotifyToken, v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__SASSystemState_registerForGameMonitoring__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    if (!notify_get_state(a2, &state64) && state64 <= 2)
      objc_msgSend(WeakRetained, "setGameState:");
  }

}

- (BOOL)carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(BOOL)a3
{
  _BOOL4 v5;

  if (-[SASSystemState isConnectedToEyesFreeDevice](self, "isConnectedToEyesFreeDevice")
    || a3
    || -[SASSystemState carDNDActive](self, "carDNDActive")
    || (v5 = -[SASSystemState _internalAlwaysEyesFreeEnabled](self, "_internalAlwaysEyesFreeEnabled")))
  {
    if (-[SASSystemState _deviceIsUnlocked](self, "_deviceIsUnlocked"))
      LOBYTE(v5) = 0;
    else
      LOBYTE(v5) = !-[SASSystemState _mapsAppIsVisibleOnLockscreen](self, "_mapsAppIsVisibleOnLockscreen");
  }
  return v5;
}

- (BOOL)_mapsAppIsVisibleOnLockscreen
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SASSystemState displayLayoutMonitor](self, "displayLayoutMonitor", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Maps"));

          if (v11)
          {
            if (objc_msgSend(v9, "layoutRole") == 6)
            {
              v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)carDNDActive
{
  return -[SASSystemState carDNDStatus](self, "carDNDStatus") == 2;
}

- (unint64_t)carDNDStatus
{
  void *v3;
  unint64_t v4;

  if (!objc_msgSend(MEMORY[0x1E0D0D328], "isAutomaticDNDAvailable"))
    return 1;
  -[SASSystemState carAutomaticDNDStatus](self, "carAutomaticDNDStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cachedAutomaticDNDActiveState");

  return v4;
}

- (void)monitorCarSessions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  if (objc_msgSend(MEMORY[0x1E0D0D328], "isAutomaticDNDAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pairedVehiclesDidChange_, *MEMORY[0x1E0D0D318], 0);

    -[SASSystemState setCurrentCarPlaySupportedOEMAppIdList:](self, "setCurrentCarPlaySupportedOEMAppIdList:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0D0D338]);
    -[SASSystemState setCarPlaySessionStatus:](self, "setCarPlaySessionStatus:", v4);

    -[SASSystemState carPlaySessionStatus](self, "carPlaySessionStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSessionObserver:", self);

    v6 = objc_alloc_init(MEMORY[0x1E0D0D328]);
    -[SASSystemState setCarAutomaticDNDStatus:](self, "setCarAutomaticDNDStatus:", v6);

    -[SASSystemState carAutomaticDNDStatus](self, "carAutomaticDNDStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAutomaticDNDAssertionWithReply:", 0);

    v8 = objc_alloc_init(MEMORY[0x1E0D0D368]);
    -[SASSystemState setCarFeatureAvailability:](self, "setCarFeatureAvailability:", v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__voiceTriggerModeChanged_, *MEMORY[0x1E0D0D300], 0);

  }
}

- (void)_setCarPlayConnectionState:(int)a3
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_carPlayConnectionState != a3)
  {
    self->_carPlayConnectionState = a3;
    switch(a3)
    {
      case 2:
        v3 = *MEMORY[0x1E0CFE6A0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          return;
        v5 = 136315138;
        v6 = "-[SASSystemState _setCarPlayConnectionState:]";
        v4 = "%s Paired to a trusted CarPlay device.";
        goto LABEL_11;
      case 1:
        v3 = *MEMORY[0x1E0CFE6A0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          return;
        v5 = 136315138;
        v6 = "-[SASSystemState _setCarPlayConnectionState:]";
        v4 = "%s Paired to an untrusted CarPlay device.";
        goto LABEL_11;
      case 0:
        v3 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          v5 = 136315138;
          v6 = "-[SASSystemState _setCarPlayConnectionState:]";
          v4 = "%s Disconnected from CarPlay display.";
LABEL_11:
          _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
        }
        break;
    }
  }
}

- (void)_updateCarPlayConnectionState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[10];

  -[SASSystemState carPlaySessionStatus](self, "carPlaySessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MFiCertificateSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[5] = MEMORY[0x1E0C809B0];
    v6[6] = 3221225472;
    v6[7] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke;
    v6[8] = &unk_1E91FCE60;
    v6[9] = self;
    CRIsPairedWithCertificateSerialNumber();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke_3;
    v6[3] = &unk_1E91FC1A0;
    v6[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

void __47__SASSystemState__updateCarPlayConnectionState__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke_2;
  v2[3] = &unk_1E91FCE38;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __47__SASSystemState__updateCarPlayConnectionState__block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    v3 = 2;
  else
    v3 = 1;
  return objc_msgSend(v2, "_setCarPlayConnectionState:", v3);
}

uint64_t __47__SASSystemState__updateCarPlayConnectionState__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCarPlayConnectionState:", 0);
}

- (void)_fetchVehicleInformation
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *vehicleName;
  NSString *v7;
  NSString *vehicleModel;
  NSString *v9;
  NSString *vehicleManufacturer;
  unint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  CGSize *v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;

  -[CARSessionStatus currentSession](self->_carPlaySessionStatus, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "vehicleName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  vehicleName = self->_vehicleName;
  self->_vehicleName = v5;

  objc_msgSend(v4, "vehicleModelName");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  vehicleModel = self->_vehicleModel;
  self->_vehicleModel = v7;

  objc_msgSend(v4, "vehicleManufacturer");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  vehicleManufacturer = self->_vehicleManufacturer;
  self->_vehicleManufacturer = v9;

  self->_rightHandDrive = objc_msgSend(v4, "rightHandDrive");
  v11 = objc_msgSend(v4, "supportsSiriZLL");
  if (objc_msgSend(v4, "supportsSiriZLLButton"))
    v11 |= 2uLL;
  if (objc_msgSend(v4, "supportsSiriMixable"))
    v11 |= 4uLL;
  if (objc_msgSend(v4, "supportsVehicleData"))
    self->_supportsCarPlayVehicleData = 1;
  self->_carPlayEnhancedSiriCharacteristics = v11;
  self->_carPlayTransportType = -[SASSystemState _carPlayTransportTypeFromConfiguration:](self, "_carPlayTransportTypeFromConfiguration:", v4);
  -[SASSystemState _updateEnhancedVoiceTriggerMode](self, "_updateEnhancedVoiceTriggerMode");
  v14 = 0;
  v15 = (CGSize *)&v14;
  v16 = 0x3010000000;
  v17 = "";
  v18 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v4, "screens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__SASSystemState__fetchVehicleInformation__block_invoke;
  v13[3] = &unk_1E91FCE88;
  v13[4] = &v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

  self->_carPlayPrimaryScreenPhysicalSize = v15[2];
  _Block_object_dispose(&v14, 8);

}

void __42__SASSystemState__fetchVehicleInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (!objc_msgSend(v9, "screenType"))
  {
    objc_msgSend(v9, "physicalSize");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v6 + 32) = v7;
    *(_QWORD *)(v6 + 40) = v8;
    *a4 = 1;
  }

}

- (void)_updateEnhancedVoiceTriggerMode
{
  void *v3;
  char v4;
  NSObject *v5;
  const char *v6;
  int64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CARSessionStatus currentSession](self->_carPlaySessionStatus, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRFeatureAvailability deviceSupportedCarPlayFeatures](self->_carFeatureAvailability, "deviceSupportedCarPlayFeatures");
  if (!v3)
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
      v6 = "%s #CarPlay CARSession is currently nil, setting mode to be not applicable.";
      goto LABEL_7;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if ((v4 & 2) == 0)
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
      v6 = "%s #CarPlay Enhanced Siri is not supported, setting mode to be not applicable.";
LABEL_7:
      _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v12, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = objc_msgSend(v3, "voiceTriggerMode");
  switch(v8)
  {
    case 2:
      v10 = *MEMORY[0x1E0CFE6A0];
      v7 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        v7 = 1;
        _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is activity detection", (uint8_t *)&v12, 0xCu);
      }
      break;
    case 1:
      v11 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is trigger detection", (uint8_t *)&v12, 0xCu);
      }
      v7 = 2;
      break;
    case -1:
      v9 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is disabled", (uint8_t *)&v12, 0xCu);
      }
      v7 = 3;
      break;
    default:
      goto LABEL_10;
  }
LABEL_9:
  self->_carPlayEnhancedVoiceTriggerMode = v7;
LABEL_10:

}

- (int64_t)_carPlayTransportTypeFromConfiguration:(id)a3
{
  id v3;
  int64_t v4;
  unint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsVehicleData") & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v5 = objc_msgSend(v3, "transportType");
    if (v5 > 3)
      v4 = 2;
    else
      v4 = qword_1D1378708[v5];
  }

  return v4;
}

- (void)_fetchOEMAppContext
{
  void *v3;
  id v4;
  NSArray *currentCarPlaySupportedOEMAppIdList;
  _QWORD v6[5];

  -[CARSessionStatus currentSession](self->_carPlaySessionStatus, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D0D350]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SASSystemState__fetchOEMAppContext__block_invoke;
    v6[3] = &unk_1E91FCEB0;
    v6[4] = self;
    objc_msgSend(v4, "fetchApplicationBundleIdentifiersForCarIntents:", v6);

  }
  else
  {
    currentCarPlaySupportedOEMAppIdList = self->_currentCarPlaySupportedOEMAppIdList;
    self->_currentCarPlaySupportedOEMAppIdList = (NSArray *)MEMORY[0x1E0C9AA60];

  }
}

void __37__SASSystemState__fetchOEMAppContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCurrentCarPlaySupportedOEMAppIdList:", v9);

  }
  else
  {
    v10 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __37__SASSystemState__fetchOEMAppContext__block_invoke_cold_1((uint64_t)v6, v10);
  }
  v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    objc_msgSend(v12, "currentCarPlaySupportedOEMAppIdList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[SASSystemState _fetchOEMAppContext]_block_invoke";
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_INFO, "%s #CarPlay supported OEM apps: %@", (uint8_t *)&v15, 0x16u);

  }
}

- (BOOL)isConnectedToCarPlay
{
  return -[SASSystemState carPlayConnectionState](self, "carPlayConnectionState") != 0;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)isConnectedToTrustedCarPlay
{
  return -[SASSystemState carPlayConnectionState](self, "carPlayConnectionState") == 2;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (BOOL)carPlaySupportsAnyEnhancedSiriCharacteristics
{
  return -[SASSystemState carPlayEnhancedSiriCharacteristics](self, "carPlayEnhancedSiriCharacteristics") != 0;
}

- (BOOL)carPlaySupportsEnhancedSiriCharacteristic:(unint64_t)a3
{
  return SASCarPlayEnhancedSiriCharacteristicsContainsCharacteristic(-[SASSystemState carPlayEnhancedSiriCharacteristics](self, "carPlayEnhancedSiriCharacteristics"), a3);
}

- (unint64_t)carPlayEnhancedSiriCharacteristics
{
  return self->_carPlayEnhancedSiriCharacteristics;
}

- (int64_t)carPlayEnhancedVoiceTriggerMode
{
  return self->_carPlayEnhancedVoiceTriggerMode;
}

- (int64_t)carPlayTransportType
{
  return self->_carPlayTransportType;
}

- (BOOL)smartCoverClosed
{
  return BKSHIDServicesIsSmartCoverClosed() != 0;
}

- (void)sessionDidConnect:(id)a3
{
  -[SASSystemState _updateCarPlayConnectionState](self, "_updateCarPlayConnectionState", a3);
  -[SASSystemState _fetchVehicleInformation](self, "_fetchVehicleInformation");
  -[SASSystemState _fetchOEMAppContext](self, "_fetchOEMAppContext");
}

- (void)_voiceTriggerModeChanged:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SASSystemState _voiceTriggerModeChanged:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode changed", (uint8_t *)&v5, 0xCu);
  }
  -[SASSystemState _updateEnhancedVoiceTriggerMode](self, "_updateEnhancedVoiceTriggerMode");
}

- (void)sessionDidDisconnect:(id)a3
{
  -[SASSystemState _updateCarPlayConnectionState](self, "_updateCarPlayConnectionState", a3);
  -[SASSystemState _fetchVehicleInformation](self, "_fetchVehicleInformation");
  -[SASSystemState _fetchOEMAppContext](self, "_fetchOEMAppContext");
}

- (void)_updateAccessibilityState
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)_AXSTripleClickCopyOptions();
  -[SASSystemState setAccessibilityShortcutEnabled:](self, "setAccessibilityShortcutEnabled:", objc_msgSend(v3, "count") != 0);

  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!self->_accessibilityShortcutEnabled)
      v5 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[SASSystemState _updateAccessibilityState]";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabled:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)siriIsEnabled
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASSystemState setEnabled:](self, "setEnabled:", objc_msgSend(v3, "assistantIsEnabled"));

  return -[SASSystemState enabled](self, "enabled");
}

- (BOOL)siriIsSupported
{
  void *v2;
  void *v3;
  int v4;
  char v5;

  -[SASSystemState currentSpokenLanguageCode](self, "currentSpokenLanguageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (AFPreferencesLanguageIsSupported() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isCurrentLocaleNativelySupported"),
        v3,
        v4))
  {
    v5 = AFAssistantCapable();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isConnectedToEyesFreeDevice
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "ac_isEyesFree") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isConnectedToBluetoothVehicle
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "ac_isBluetoothVehicle") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isRemoteWebcamMode
{
  return -[AFNotifyObserver state](self->_remoteWebcamModeEnabled, "state") != 0;
}

- (BOOL)siriInCallEnabled
{
  int v2;
  void *v3;
  char v4;

  v2 = AFSupportsSiriInCall();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "siriInCallEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)callHangUpEnabled
{
  void *v2;
  char v3;

  if ((AFSupportsSiriInCall() & 1) != 0 || !AFSupportsCallHangUp())
    return 0;
  objc_msgSend(MEMORY[0x1E0DC8658], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canUseVoiceTriggerDuringPhoneCall");

  return v3;
}

- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke;
  block[3] = &unk_1E91FC548;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDidAssessmentModeRecieveInitialStateUpdate:", 1);
    objc_msgSend(v3, "setIsAssessmentModeActive:", 1);
    v4 = dispatch_group_create();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 1;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "listeners");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            dispatch_group_enter(v4);
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2;
            v14[3] = &unk_1E91FCED8;
            v16 = v21;
            v15 = v4;
            objc_msgSend(v9, "assessmentModeChangedToIsActive:completion:", 1, v14);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v6);
    }

    dispatch_get_global_queue(2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3;
    block[3] = &unk_1E91FCF00;
    v13 = v21;
    v12 = *(id *)(a1 + 32);
    dispatch_group_notify(v4, v10, block);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    *(_BYTE *)(v2 + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0CFEB48];
    v7 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deactivate assistant"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v6);

  }
}

- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SASSystemState_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke;
  block[3] = &unk_1E91FC548;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__SASSystemState_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDidAssessmentModeRecieveInitialStateUpdate:", 1);
    objc_msgSend(v3, "setIsAssessmentModeActive:", 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v3, "listeners", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "assessmentModeChangedToIsActive:completion:", 0, 0);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setLockStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateMonitor, a3);
}

- (int)carPlayConnectionState
{
  return self->_carPlayConnectionState;
}

- (void)setCarPlayConnectionState:(int)a3
{
  self->_carPlayConnectionState = a3;
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
}

- (BOOL)accessibilityShortcutEnabled
{
  return self->_accessibilityShortcutEnabled;
}

- (void)setAccessibilityShortcutEnabled:(BOOL)a3
{
  self->_accessibilityShortcutEnabled = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (NSMutableSet)activeCalls
{
  return self->_activeCalls;
}

- (void)setActiveCalls:(id)a3
{
  objc_storeStrong((id *)&self->_activeCalls, a3);
}

- (SASCallRouteObserver)callRouteObserver
{
  return self->_callRouteObserver;
}

- (void)setCallRouteObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callRouteObserver, a3);
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (BOOL)liftToWakeDetected
{
  return self->_liftToWakeDetected;
}

- (int)gameMonitorNotifyToken
{
  return self->_gameMonitorNotifyToken;
}

- (void)setGameMonitorNotifyToken:(int)a3
{
  self->_gameMonitorNotifyToken = a3;
}

- (int)gameState
{
  return self->_gameState;
}

- (void)setGameState:(int)a3
{
  self->_gameState = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, a3);
}

- (CARSessionStatus)carPlaySessionStatus
{
  return self->_carPlaySessionStatus;
}

- (void)setCarPlaySessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carPlaySessionStatus, a3);
}

- (CARAutomaticDNDStatus)carAutomaticDNDStatus
{
  return self->_carAutomaticDNDStatus;
}

- (void)setCarAutomaticDNDStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carAutomaticDNDStatus, a3);
}

- (CRFeatureAvailability)carFeatureAvailability
{
  return self->_carFeatureAvailability;
}

- (void)setCarFeatureAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_carFeatureAvailability, a3);
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleName, a3);
}

- (NSString)vehicleModel
{
  return self->_vehicleModel;
}

- (void)setVehicleModel:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleModel, a3);
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (void)setVehicleManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleManufacturer, a3);
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (AFNotifyObserver)observerWirelessSplitter
{
  return self->_observerWirelessSplitter;
}

- (void)setObserverWirelessSplitter:(id)a3
{
  objc_storeStrong((id *)&self->_observerWirelessSplitter, a3);
}

- (AFNotifyObserver)observerBluetoothGuestConnected
{
  return self->_observerBluetoothGuestConnected;
}

- (void)setObserverBluetoothGuestConnected:(id)a3
{
  objc_storeStrong((id *)&self->_observerBluetoothGuestConnected, a3);
}

- (AFNotifyObserver)remoteWebcamModeEnabled
{
  return self->_remoteWebcamModeEnabled;
}

- (void)setRemoteWebcamModeEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_remoteWebcamModeEnabled, a3);
}

- (void)setCarPlayEnhancedSiriCharacteristics:(unint64_t)a3
{
  self->_carPlayEnhancedSiriCharacteristics = a3;
}

- (void)setCarPlayEnhancedVoiceTriggerMode:(int64_t)a3
{
  self->_carPlayEnhancedVoiceTriggerMode = a3;
}

- (void)setCarPlayTransportType:(int64_t)a3
{
  self->_carPlayTransportType = a3;
}

- (CGSize)carPlayPrimaryScreenPhysicalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_carPlayPrimaryScreenPhysicalSize.width;
  height = self->_carPlayPrimaryScreenPhysicalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCarPlayPrimaryScreenPhysicalSize:(CGSize)a3
{
  self->_carPlayPrimaryScreenPhysicalSize = a3;
}

- (BOOL)isAssessmentModeActive
{
  return self->_isAssessmentModeActive;
}

- (void)setIsAssessmentModeActive:(BOOL)a3
{
  self->_isAssessmentModeActive = a3;
}

- (BOOL)didAssessmentModeRecieveInitialStateUpdate
{
  return self->_didAssessmentModeRecieveInitialStateUpdate;
}

- (void)setDidAssessmentModeRecieveInitialStateUpdate:(BOOL)a3
{
  self->_didAssessmentModeRecieveInitialStateUpdate = a3;
}

- (AEInvalidatable)restrictionEnforcer
{
  return self->_restrictionEnforcer;
}

- (void)setRestrictionEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionEnforcer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionEnforcer, 0);
  objc_storeStrong((id *)&self->_remoteWebcamModeEnabled, 0);
  objc_storeStrong((id *)&self->_observerBluetoothGuestConnected, 0);
  objc_storeStrong((id *)&self->_observerWirelessSplitter, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_vehicleModel, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_carFeatureAvailability, 0);
  objc_storeStrong((id *)&self->_carAutomaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_carPlaySessionStatus, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_callRouteObserver, 0);
  objc_storeStrong((id *)&self->_activeCalls, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
}

void __37__SASSystemState__fetchOEMAppContext__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SASSystemState _fetchOEMAppContext]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D132F000, a2, OS_LOG_TYPE_ERROR, "%s #CarPlay failed to lookup car intent extensions: %@", (uint8_t *)&v2, 0x16u);
}

@end
