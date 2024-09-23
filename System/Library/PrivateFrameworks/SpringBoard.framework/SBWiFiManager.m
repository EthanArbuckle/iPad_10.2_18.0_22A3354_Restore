@implementation SBWiFiManager

- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4
{
  int v7;
  _QWORD v8[5];
  int v9;
  int v10;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[SBWiFiManager _cachedIsAssociated](self, "_cachedIsAssociated"))
  {
    v7 = (int)fminf(fmaxf(ceilf(a4 * 3.0), 1.0), 3.0);
  }
  else
  {
    a3 = 0;
    v7 = 0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SBWiFiManager__updateSignalStrengthFromRawRSSI_andScaledRSSI___block_invoke;
  v8[3] = &unk_1E8E9DE88;
  v8[4] = self;
  v9 = v7;
  v10 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_cachedIsAssociated
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_currentNetworkHasBeenSet)
  {
    self->_currentNetworkHasBeenSet = 1;
    -[SBWiFiManager _updateCurrentNetwork](self, "_updateCurrentNetwork");
  }
  v3 = self->_currentNetwork != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

void __64__SBWiFiManager__updateSignalStrengthFromRawRSSI_andScaledRSSI___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v2 + 80) == v3 && (v4 = *(_DWORD *)(a1 + 44), *(_DWORD *)(v2 + 84) == v4))
  {
    v5 = *(unsigned __int8 *)(v2 + 88);
    *(_DWORD *)(v2 + 84) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    if (v5)
      return;
  }
  else
  {
    *(_DWORD *)(v2 + 80) = v3;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84) = *(_DWORD *)(a1 + 44);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  }
  SBLogStatusBarish();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(a1 + 40);
    v9[0] = 67240192;
    v9[1] = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] signal strength bars changed to %{public}d", (uint8_t *)v9, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBWifiSignalStrengthChangedNotification"), 0, 0);

}

- (int)signalStrengthBars
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_mainThread_signalStrengthHasBeenSet)
  {
    dispatch_get_global_queue(-2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SBWiFiManager_signalStrengthBars__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(v3, block);

  }
  return self->_mainThread_signalStrengthBars;
}

- (BOOL)isAssociatedToIOSHotspot
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_currentNetworkIsIOSHotspotHasBeenSet)
  {
    self->_currentNetworkIsIOSHotspotHasBeenSet = 1;
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SBWiFiManager_isAssociatedToIOSHotspot__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(v3, block);

  }
  return self->_currentNetworkIsIOSHotspot;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_52);
  return (id)sharedInstance___sharedInstance_2;
}

uint64_t __31__SBWiFiManager_sharedInstance__block_invoke()
{
  SBWiFiManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBWiFiManager);
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBWiFiManager)init
{
  SBWiFiManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBWiFiManager;
  v2 = -[SBWiFiManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSRecursiveLock lock](v2->_lock, "lock");
    -[SBWiFiManager _lock_manager](v2, "_lock_manager");
    -[NSRecursiveLock unlock](v2->_lock, "unlock");
  }
  return v2;
}

- (void)_updateDevicePresence
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBWiFiManager__updateDevicePresence__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __38__SBWiFiManager__updateDevicePresence__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  v2 = WiFiManagerClientCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)WiFiManagerClientCopyDevices();
    v5 = objc_msgSend(v4, "count") != 0;
    CFRelease(v3);

  }
  else
  {
    v5 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SBWiFiManager__updateDevicePresence__block_invoke_2;
  v6[3] = &unk_1E8E9F508;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

void __38__SBWiFiManager__updateDevicePresence__block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 48))
  {
    *(_BYTE *)(v2 + 48) = v1;
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
        v5 = CFSTR("PRESENT");
      else
        v5 = CFSTR("NOT PRESENT");
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] WiFi device is: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0DAC410], 0);

  }
}

- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3
{
  __WiFiDeviceClient *device;
  NSObject *v6;
  __WiFiDeviceClient *v7;
  NSString *deviceInterfaceName;
  NSString *v9;
  NSString *v10;
  int v11;
  __WiFiDeviceClient *v12;
  __int16 v13;
  __WiFiDeviceClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    device = self->_device;
    if (device)
    {
      if (CFEqual(a3, device))
        goto LABEL_12;
      if (self->_device)
      {
        SBLogStatusBarish();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = self->_device;
          v11 = 138543618;
          v12 = v7;
          v13 = 2114;
          v14 = a3;
          _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _setWiFiDevice: unexpected device change from '%{public}@' -> '%{public}@'", (uint8_t *)&v11, 0x16u);
        }

        if (self->_device)
        {
          WiFiDeviceClientRegisterPowerCallback();
          WiFiDeviceClientRegisterExtendedLinkCallback();
          WiFiDeviceClientRegisterLQMCallback();
          CFRelease(self->_device);
          self->_device = 0;
        }
      }
    }
    deviceInterfaceName = self->_deviceInterfaceName;
    if (deviceInterfaceName)
    {
      self->_deviceInterfaceName = 0;

    }
    self->_device = (__WiFiDeviceClient *)CFRetain(a3);
    WiFiDeviceClientRegisterPowerCallback();
    WiFiDeviceClientRegisterExtendedLinkCallback();
    WiFiDeviceClientRegisterLQMCallback();
    WiFiDeviceClientGetInterfaceName();
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_deviceInterfaceName;
    self->_deviceInterfaceName = v9;

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_16);
    -[SBWiFiManager _powerStateDidChange](self, "_powerStateDidChange");
    -[SBWiFiManager _linkDidChange](self, "_linkDidChange");
  }
LABEL_12:
  -[SBWiFiManager _updateDevicePresence](self, "_updateDevicePresence");
}

void __37__SBWiFiManager__lock_setWiFiDevice___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0DAC408], 0);

}

- (__WiFiManagerClient)_lock_manager
{
  __WiFiManagerClient *result;
  NWSystemPathMonitor *v4;
  NWSystemPathMonitor *systemPathMonitor;

  result = self->_manager;
  if (!result)
  {
    if (MobileWiFiContainsRadio())
    {
      result = (__WiFiManagerClient *)WiFiManagerClientCreate();
      self->_manager = result;
      if (!result)
        return result;
    }
    else
    {
      result = self->_manager;
      if (!result)
        return result;
    }
    -[SBWiFiManager _lock_spawnManagerCallbackThread](self, "_lock_spawnManagerCallbackThread");
    WiFiManagerClientScheduleWithRunLoop();
    CFRunLoopWakeUp(self->_callbackRunLoop);
    WiFiManagerClientRegisterServerRestartCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    -[SBWiFiManager _updateWiFiDevice](self, "_updateWiFiDevice");
    objc_msgSend(MEMORY[0x1E0CCECC8], "sharedSystemPathMonitor");
    v4 = (NWSystemPathMonitor *)objc_claimAutoreleasedReturnValue();
    systemPathMonitor = self->_systemPathMonitor;
    self->_systemPathMonitor = v4;

    -[NWSystemPathMonitor addObserver:forKeyPath:options:context:](self->_systemPathMonitor, "addObserver:forKeyPath:options:context:", self, CFSTR("wifiPrimary"), 5, &self->_isPrimaryInterface);
    return self->_manager;
  }
  return result;
}

- (void)_lock_spawnManagerCallbackThread
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__runManagerCallbackThread, 0);
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", objc_msgSend(v3, "qualityOfService"));

  objc_msgSend(v4, "start");
  -[SBWiFiManager performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_class, v4, 0, 1);

}

- (void)_runManagerCallbackThread
{
  void *v3;
  void *v4;
  CFRunLoopRef Current;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1D17E5334](self, a2);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("SBWiFiManager callback thread"));

  Current = CFRunLoopGetCurrent();
  self->_callbackRunLoop = (__CFRunLoop *)CFRetain(Current);
  objc_msgSend(MEMORY[0x1E0C99DD0], "port");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleInRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "run");

}

- (void)_updateWiFiState
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[SBWiFiManager _updateCurrentNetwork](self, "_updateCurrentNetwork");
  if (self->_poweredHasBeenSet)
    -[SBWiFiManager _updateSignalStrength](self, "_updateSignalStrength");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_powerStateDidChange
{
  _BOOL4 powered;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  powered = self->_powered;
  if (self->_device)
    v4 = WiFiDeviceClientGetPower() != 0;
  else
    v4 = 0;
  self->_powered = v4;
  self->_poweredHasBeenSet = 1;
  -[SBWiFiManager _updateWiFiState](self, "_updateWiFiState");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  SBLogStatusBarish();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = powered;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _powerStateDidChange from %d to %d", (uint8_t *)v6, 0xEu);
  }

  -[SBWiFiManager _updateDevicePresence](self, "_updateDevicePresence");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_29_1);
}

void __37__SBWiFiManager__powerStateDidChange__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0DAC418], 0);

}

- (void)_linkDidChange
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  SBLogStatusBarish();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _linkDidChange", v5, 2u);
  }

  v4 = MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_30_0);
  -[SBWiFiManager _updateWiFiState](self, "_updateWiFiState");
  dispatch_async(v4, &__block_literal_global_31);

}

void __31__SBWiFiManager__linkDidChange__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBWifiManagerLinkWillChangeNotification"), 0);

}

void __31__SBWiFiManager__linkDidChange__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBWifiManagerLinkDidChangeNotification"), 0);

}

- (void)_updateCurrentNetwork
{
  uint64_t v3;
  __WiFiNetwork *v4;
  NSObject *v5;
  __WiFiNetwork *v6;
  __WiFiNetwork **p_currentNetwork;
  __WiFiNetwork *currentNetwork;
  char v9;
  NSObject *v10;
  __WiFiNetwork *v11;
  NSObject *v12;
  char v13;
  __WiFiNetwork *previousNetwork;
  __WiFiNetwork *SSID;
  __WiFiNetwork *v16;
  NSObject *v17;
  NSObject *v18;
  __WiFiNetwork *v19;
  __WiFiNetwork *v20;
  _BOOL4 isPrimaryInterface;
  BOOL v22;
  NSObject *v23;
  NSObject *primaryInterfaceUpdateTimeoutSource;
  OS_dispatch_source *v25;
  NSObject *v26;
  NSObject *v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  _QWORD block[5];
  BOOL v34;
  _QWORD handler[5];
  uint8_t buf[4];
  __WiFiNetwork *v37;
  __int16 v38;
  __WiFiNetwork *v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[SBWiFiManager _lock_manager](self, "_lock_manager");
  v3 = MEMORY[0x1E0C809B0];
  if (!self->_device)
  {
    SBLogStatusBarish();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: no _device to query current network - assuming nil", buf, 2u);
    }

    goto LABEL_12;
  }
  v4 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
  SBLogStatusBarish();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: WiFiDeviceClientCopyCurrentNetwork: %{public}@", buf, 0xCu);
  }

  if (!v4)
  {
LABEL_12:
    p_currentNetwork = &self->_currentNetwork;
    currentNetwork = self->_currentNetwork;
    if (!currentNetwork)
      goto LABEL_31;
    v4 = 0;
    v9 = 1;
    goto LABEL_14;
  }
  p_currentNetwork = &self->_currentNetwork;
  v6 = self->_currentNetwork;
  if (!v6)
    goto LABEL_20;
  if (CFEqual(v4, v6))
  {
LABEL_30:
    CFRelease(v4);
    goto LABEL_31;
  }
  currentNetwork = *p_currentNetwork;
  if (!*p_currentNetwork)
  {
LABEL_20:
    previousNetwork = self->_previousNetwork;
    if (previousNetwork)
    {
      CFRelease(previousNetwork);
      self->_previousNetwork = 0;
    }
    goto LABEL_22;
  }
  v9 = 0;
LABEL_14:
  v11 = self->_previousNetwork;
  if (v11)
  {
    CFRelease(v11);
    currentNetwork = *p_currentNetwork;
  }
  self->_currentNetwork = 0;
  self->_previousNetwork = currentNetwork;
  SBLogStatusBarish();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: setting _previousNetwork = _currentNetwork, _currentNetwork = nil", buf, 2u);
  }

  if ((v9 & 1) != 0)
  {
    v13 = 1;
    goto LABEL_25;
  }
LABEL_22:
  SSID = (__WiFiNetwork *)CFRetain(v4);
  self->_currentNetwork = SSID;
  if (self->_isPrimaryInterface)
  {
    if (!self->_isPrimaryInterfaceChanging)
    {
      if (-[SBWiFiManager isPrimaryInterface](self, "isPrimaryInterface"))
      {
        SBLogStatusBarish();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: all is good but need to fire a notification that primary may have changed", buf, 2u);
        }

        dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_33);
        primaryInterfaceUpdateTimeoutSource = self->_primaryInterfaceUpdateTimeoutSource;
        if (primaryInterfaceUpdateTimeoutSource)
        {
          dispatch_source_cancel(primaryInterfaceUpdateTimeoutSource);
          v25 = self->_primaryInterfaceUpdateTimeoutSource;
          self->_primaryInterfaceUpdateTimeoutSource = 0;

        }
      }
      else if (!self->_primaryInterfaceUpdateTimeoutSource)
      {
        SBLogStatusBarish();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: wifi is primary but the current network is not - scheduling a timer", buf, 2u);
        }

        dispatch_get_global_queue(0, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v27);
        v29 = self->_primaryInterfaceUpdateTimeoutSource;
        self->_primaryInterfaceUpdateTimeoutSource = v28;

        v30 = self->_primaryInterfaceUpdateTimeoutSource;
        handler[0] = v3;
        handler[1] = 3221225472;
        handler[2] = __38__SBWiFiManager__updateCurrentNetwork__block_invoke;
        handler[3] = &unk_1E8E9DED8;
        handler[4] = self;
        dispatch_source_set_event_handler(v30, handler);
        v31 = self->_primaryInterfaceUpdateTimeoutSource;
        v32 = dispatch_time(0, 5000000000);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        dispatch_resume((dispatch_object_t)self->_primaryInterfaceUpdateTimeoutSource);
      }
    }
    v13 = 0;
LABEL_25:
    SSID = *p_currentNetwork;
    if (!*p_currentNetwork)
      goto LABEL_27;
    goto LABEL_26;
  }
  v13 = 0;
  if (SSID)
LABEL_26:
    SSID = (__WiFiNetwork *)WiFiNetworkGetSSID();
LABEL_27:
  v16 = SSID;
  SBLogStatusBarish();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v16;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: network change -> '%{public}@'", buf, 0xCu);
  }

  if ((v13 & 1) == 0)
    goto LABEL_30;
LABEL_31:
  self->_currentNetworkHasBeenSet = 1;
  SBLogStatusBarish();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_currentNetwork;
    v20 = self->_previousNetwork;
    isPrimaryInterface = self->_isPrimaryInterface;
    *(_DWORD *)buf = 138543874;
    v37 = v19;
    v38 = 2114;
    v39 = v20;
    v40 = 1026;
    v41 = isPrimaryInterface;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _updateCurrentNetwork: current network has been set... _currentNetwork: %{public}@, _previousNetwork: %{public}@, _isPrimaryInterface: %{public}d", buf, 0x1Cu);
  }

  if (self->_currentNetwork)
    v22 = WiFiNetworkIsApplePersonalHotspot() != 0;
  else
    v22 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __38__SBWiFiManager__updateCurrentNetwork__block_invoke_34;
  block[3] = &unk_1E8E9F508;
  block[4] = self;
  v34 = v22;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

uint64_t __38__SBWiFiManager__updateCurrentNetwork__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[121] && (objc_msgSend(v2, "isPrimaryInterface") & 1) == 0)
  {
    SBLogStatusBarish();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBWiFiManager] _primaryInterfaceUpdateTimeout: didn't receive a systemPathMonitor update - assuming the new network is primary", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_primaryInterfaceChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

void __38__SBWiFiManager__updateCurrentNetwork__block_invoke_32()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBWifiManagerPrimaryInterfaceMayHaveChangedNotification"), 0);

}

void __38__SBWiFiManager__updateCurrentNetwork__block_invoke_34(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(v1 + 73);
  v3 = *(unsigned __int8 *)(a1 + 40);
  *(_BYTE *)(v1 + 74) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = *(_BYTE *)(a1 + 40);
  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBWifiManagerLinkHotSpotnessDidChangeNotification"), 0);

  }
}

uint64_t __41__SBWiFiManager_isAssociatedToIOSHotspot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentNetwork");
}

- (id)currentNetworkName
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_currentNetwork)
    v3 = (void *)objc_msgSend((id)WiFiNetworkGetSSID(), "copy");
  else
    v3 = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)isPowered
{
  BOOL powered;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_poweredHasBeenSet)
  {
    -[SBWiFiManager _linkDidChange](self, "_linkDidChange");
    self->_poweredHasBeenSet = 1;
  }
  powered = self->_powered;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return powered;
}

- (void)setPowered:(BOOL)a3
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_poweredHasBeenSet)
  {
    -[SBWiFiManager _linkDidChange](self, "_linkDidChange");
    self->_poweredHasBeenSet = 1;
  }
  if (-[SBWiFiManager _lock_manager](self, "_lock_manager"))
    WiFiManagerClientSetPower();
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)wiFiEnabled
{
  void *v3;
  char v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[SBWiFiManager _lock_manager](self, "_lock_manager"))
  {
    v3 = (void *)WiFiManagerClientCopyProperty();
    v4 = objc_msgSend(v3, "BOOLValue");
    if (v3)
      CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)setWiFiEnabled:(BOOL)a3
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[SBWiFiManager _lock_manager](self, "_lock_manager"))
    WiFiManagerClientSetProperty();
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

uint64_t __35__SBWiFiManager_signalStrengthBars__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSignalStrength");
}

- (int)signalStrengthRSSI
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_mainThread_signalStrengthHasBeenSet)
  {
    dispatch_get_global_queue(-2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SBWiFiManager_signalStrengthRSSI__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(v3, block);

  }
  return self->_mainThread_signalStrengthRSSI;
}

uint64_t __35__SBWiFiManager_signalStrengthRSSI__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSignalStrength");
}

- (void)_updateSignalStrength
{
  __WiFiNetwork *currentNetwork;
  BOOL v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;

  currentNetwork = self->_currentNetwork;
  v4 = currentNetwork != 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!-[SBWiFiManager _cachedIsAssociated](self, "_cachedIsAssociated") || !self->_device)
  {
    if (!currentNetwork)
      goto LABEL_8;
    v10 = 0;
    v9 = 0;
LABEL_7:
    LODWORD(v5) = v9;
    -[SBWiFiManager _updateSignalStrengthFromRawRSSI:andScaledRSSI:](self, "_updateSignalStrengthFromRawRSSI:andScaledRSSI:", v10, v5);
    goto LABEL_8;
  }
  v6 = (void *)WiFiDeviceClientCopyProperty();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v9 = v8;
  }
  else
  {
    v4 = 0;
    v9 = 0;
  }
  v11 = (void *)WiFiDeviceClientCopyProperty();

  if (v11)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("RSSI_CTL_AGR"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "intValue");

    if (v4)
      goto LABEL_7;
  }
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isPrimaryInterface
{
  NWSystemPathMonitor *systemPathMonitor;
  __WiFiNetwork *currentNetwork;
  __WiFiNetwork *primaryInterface;
  BOOL v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_primaryInterfaceHasBeenSet)
  {
    systemPathMonitor = self->_systemPathMonitor;
    if (systemPathMonitor)
    {
      self->_primaryInterfaceHasBeenSet = 1;
      -[SBWiFiManager _primaryInterfaceChanged:](self, "_primaryInterfaceChanged:", -[NWSystemPathMonitor isWiFiPrimary](systemPathMonitor, "isWiFiPrimary"));
    }
  }
  currentNetwork = self->_currentNetwork;
  v6 = currentNetwork
    && (primaryInterface = self->_primaryInterface) != 0
    && CFEqual(currentNetwork, primaryInterface) != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (__CFRunLoop)wifiRunLoopRef
{
  __CFRunLoop *callbackRunLoop;

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[SBWiFiManager _lock_manager](self, "_lock_manager");
  callbackRunLoop = self->_callbackRunLoop;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return callbackRunLoop;
}

- (id)_wifiInterface
{
  NSString *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_deviceInterfaceName;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_primaryInterfaceChanged:(BOOL)a3
{
  _BOOL4 v3;
  __WiFiNetwork *primaryInterface;
  __WiFiNetwork *currentNetwork;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *primaryInterfaceUpdateTimeoutSource;
  OS_dispatch_source *v11;
  __WiFiNetwork *previousNetwork;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isPrimaryInterface = v3;
  self->_isPrimaryInterfaceChanging = 1;
  -[SBWiFiManager _updateCurrentNetwork](self, "_updateCurrentNetwork");
  primaryInterface = self->_primaryInterface;
  if (primaryInterface)
    CFRelease(primaryInterface);
  if (!v3)
  {
    self->_primaryInterface = 0;
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    LOWORD(v13) = 0;
    v8 = "[SBWiFiManager] _primaryInterfaceChanged: wifi is no longer primary";
    v9 = (uint8_t *)&v13;
    goto LABEL_9;
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    self->_primaryInterface = (__WiFiNetwork *)CFRetain(currentNetwork);
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = 0;
    v8 = "[SBWiFiManager] _primaryInterfaceChanged: marking current network as primary";
    v9 = (uint8_t *)&v16;
    goto LABEL_9;
  }
  previousNetwork = self->_previousNetwork;
  if (previousNetwork)
  {
    self->_primaryInterface = (__WiFiNetwork *)CFRetain(previousNetwork);
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v8 = "[SBWiFiManager] _primaryInterfaceChanged: current network is nil, marking previous network as primary";
      v9 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    self->_primaryInterface = 0;
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v8 = "[SBWiFiManager] _primaryInterfaceChanged: primary is wifi but no networks known - marking as not primary";
      v9 = (uint8_t *)&v14;
      goto LABEL_9;
    }
  }
LABEL_10:

  self->_isPrimaryInterfaceChanging = 0;
  if (self->_primaryInterfaceHasBeenSet)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_41_2);
  primaryInterfaceUpdateTimeoutSource = self->_primaryInterfaceUpdateTimeoutSource;
  if (primaryInterfaceUpdateTimeoutSource)
  {
    dispatch_source_cancel(primaryInterfaceUpdateTimeoutSource);
    v11 = self->_primaryInterfaceUpdateTimeoutSource;
    self->_primaryInterfaceUpdateTimeoutSource = 0;

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock", v13);
}

void __42__SBWiFiManager__primaryInterfaceChanged___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBWifiManagerPrimaryInterfaceMayHaveChangedNotification"), 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  __CFRunLoop *callbackRunLoop;
  const void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  char v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (&self->_isPrimaryInterface != a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWiFiManager.m"), 660, CFSTR("SBWiFiManager: got a key/value callback that it doesn't understand -> %@"), v11);

  }
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  callbackRunLoop = self->_callbackRunLoop;
  if (!callbackRunLoop)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWiFiManager.m"), 663, CFSTR("SBWiFiManager: shouldn't be possible to get a key/value callback before the runloop has been started"));

    callbackRunLoop = self->_callbackRunLoop;
  }
  v17 = (const void *)*MEMORY[0x1E0C9B280];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBWiFiManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E8E9F508;
  block[4] = self;
  v21 = v15;
  CFRunLoopPerformBlock(callbackRunLoop, v17, block);
  CFRunLoopWakeUp(self->_callbackRunLoop);

}

uint64_t __64__SBWiFiManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_primaryInterfaceChanged:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

- (void)_updateWiFiDevice
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "[SBWiFiManager] ERROR: WiFi device not found, no WiFi untill a device is attached", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryInterfaceUpdateTimeoutSource, 0);
  objc_storeStrong((id *)&self->_systemPathMonitor, 0);
  objc_storeStrong((id *)&self->_deviceInterfaceName, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
