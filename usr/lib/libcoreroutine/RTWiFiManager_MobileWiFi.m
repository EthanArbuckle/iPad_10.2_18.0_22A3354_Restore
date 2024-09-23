@implementation RTWiFiManager_MobileWiFi

- (void)_setup
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[RTWiFiManager_MobileWiFi setAccessPointForInterface:](self, "setAccessPointForInterface:", v3);

  -[RTWiFiManager_MobileWiFi _establishConnectionToWiFiManager](self, "_establishConnectionToWiFiManager");
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTWiFiManager_MobileWiFi _destroyConnectionToWiFiManager](self, "_destroyConnectionToWiFiManager");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_scheduleScan
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RTWiFiManager_MobileWiFi *v10;

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultScanRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiManager_MobileWiFi devices](self, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__RTWiFiManager_MobileWiFi__scheduleScan__block_invoke;
    v8[3] = &unk_1E92973B8;
    v9 = v5;
    v10 = self;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)_scheduleScanWithCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RTWiFiManager_MobileWiFi *v10;

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "cacheScanRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiManager_MobileWiFi devices](self, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__RTWiFiManager_MobileWiFi__scheduleScanWithCache__block_invoke;
    v8[3] = &unk_1E92973B8;
    v9 = v5;
    v10 = self;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)_scheduleActiveScan
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RTWiFiManager_MobileWiFi *v10;

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "activeScanRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiManager_MobileWiFi devices](self, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__RTWiFiManager_MobileWiFi__scheduleActiveScan__block_invoke;
    v8[3] = &unk_1E92973B8;
    v9 = v5;
    v10 = self;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)_scheduleScanWithChannels:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  RTWiFiManager_MobileWiFi *v12;

  v9 = a3;
  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "scanRequestWithType:dwellTime:channels:lowPriority:merge:", 2, 110, v9, 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiManager_MobileWiFi devices](self, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__RTWiFiManager_MobileWiFi__scheduleScanWithChannels___block_invoke;
    v10[3] = &unk_1E92973B8;
    v11 = v6;
    v12 = self;
    v8 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  }
}

- (void)_cancelScan
{
  id v2;

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_95);

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManager_MobileWiFi;
  -[RTWiFiManager internalAddObserver:name:](&v9, sel_internalAddObserver_name_, a3, v6);
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8 && -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6) == 1)
    -[RTWiFiManager_MobileWiFi _setRegisteredForScanUpdateCallbacks:](self, "_setRegisteredForScanUpdateCallbacks:", 1);

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManager_MobileWiFi;
  -[RTWiFiManager internalRemoveObserver:name:](&v9, sel_internalRemoveObserver_name_, a3, v6);
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8 && !-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6))
    -[RTWiFiManager_MobileWiFi _setRegisteredForScanUpdateCallbacks:](self, "_setRegisteredForScanUpdateCallbacks:", 0);

}

- (void)_establishConnectionToWiFiManager
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[RTWiFiManager_MobileWiFi _destroyConnectionToWiFiManager](self, "_destroyConnectionToWiFiManager");
  -[RTWiFiManager_MobileWiFi setWifiManager:](self, "setWifiManager:", WiFiManagerClientCreate());
  if (-[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager"))
  {
    -[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager");
    v3 = (void *)WiFiManagerClientCopyDevices();
    -[RTWiFiManager_MobileWiFi setDevices:](self, "setDevices:", v3);

    -[RTWiFiManager_MobileWiFi _setRegisteredForExtendedLinkCallbacks:](self, "_setRegisteredForExtendedLinkCallbacks:", 1);
    -[RTWiFiManager_MobileWiFi _setRegisteredForPowerCallbacks:](self, "_setRegisteredForPowerCallbacks:", 1);
    -[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager");
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[RTWiFiManager_MobileWiFi devices](self, "devices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134217984;
      v7 = objc_msgSend(v5, "count");
      _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "created WiFiManagerClient with %lu devices", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)_destroyConnectionToWiFiManager
{
  void *v3;
  uint64_t v4;
  const void *v5;
  __WiFiManagerClient *v6;
  __CFRunLoop *Main;
  _QWORD block[5];

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[RTWiFiManager_MobileWiFi _setRegisteredForPowerCallbacks:](self, "_setRegisteredForPowerCallbacks:", 0);
    -[RTWiFiManager_MobileWiFi _setRegisteredForExtendedLinkCallbacks:](self, "_setRegisteredForExtendedLinkCallbacks:", 0);
  }
  -[RTWiFiManager_MobileWiFi setDevices:](self, "setDevices:", 0);
  if (-[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager"))
  {
    -[RTWiFiManager_MobileWiFi _setRegisteredForScanUpdateCallbacks:](self, "_setRegisteredForScanUpdateCallbacks:", 0);
    -[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager");
    CFRunLoopGetMain();
    v5 = (const void *)*MEMORY[0x1E0C9B270];
    WiFiManagerClientUnscheduleFromRunLoop();
    v6 = -[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager");
    -[RTWiFiManager_MobileWiFi setWifiManager:](self, "setWifiManager:", 0);
    Main = CFRunLoopGetMain();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__RTWiFiManager_MobileWiFi__destroyConnectionToWiFiManager__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    CFRunLoopPerformBlock(Main, v5, block);
  }
}

- (void)_setRegisteredForExtendedLinkCallbacks:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (a3)
    -[RTWiFiManager_MobileWiFi _pollAccessPoints](self, "_pollAccessPoints");
  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__RTWiFiManager_MobileWiFi__setRegisteredForExtendedLinkCallbacks___block_invoke;
  v6[3] = &unk_1E92A2A30;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  if (!a3)
    -[RTWiFiManager setAccessPoints:](self, "setAccessPoints:", 0);
}

- (void)_setRegisteredForPowerCallbacks:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (a3)
    -[RTWiFiManager_MobileWiFi _pollManagerPowerStatus](self, "_pollManagerPowerStatus");
  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__RTWiFiManager_MobileWiFi__setRegisteredForPowerCallbacks___block_invoke;
  v6[3] = &unk_1E92A2A30;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  if (!a3)
    -[RTWiFiManager setPowerStatus:](self, "setPowerStatus:", 0);
}

- (void)_setRegisteredForScanUpdateCallbacks:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__RTWiFiManager_MobileWiFi__setRegisteredForScanUpdateCallbacks___block_invoke;
  v6[3] = &unk_1E92A2A30;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientPowerCallback___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_handleWiFiDeviceClientPowerCallback:(__WiFiDeviceClient *)a3
{
  int Power;
  NSObject *v5;
  uint64_t v6;
  uint64_t InterfaceName;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    Power = WiFiDeviceClientGetPower();
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (Power)
        v6 = 2;
      else
        v6 = 1;
      InterfaceName = WiFiDeviceClientGetInterfaceName();
      +[RTWiFiManager powerStatusToString:](RTWiFiManager, "powerStatusToString:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = InterfaceName;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "power status for device, %@, changed to, %@", (uint8_t *)&v9, 0x16u);

    }
  }
  -[RTWiFiManager_MobileWiFi _pollManagerPowerStatus](self, "_pollManagerPowerStatus");
}

- (void)_pollManagerPowerStatus
{
  uint64_t v3;

  -[RTWiFiManager_MobileWiFi wifiManager](self, "wifiManager");
  if (WiFiManagerClientGetPower())
    v3 = 2;
  else
    v3 = 1;
  -[RTWiFiManager setPowerStatus:](self, "setPowerStatus:", v3);
}

- (void)handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  __WiFiDeviceClient *v11;

  v6 = a4;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientExtendedLinkCallback_eventData___block_invoke;
  block[3] = &unk_1E9297BC8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleWiFiDeviceClientExtendedLinkCallback:(__WiFiDeviceClient *)a3 eventData:(id)a4
{
  id v6;
  __WiFiDeviceClient *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __WiFiDeviceClient *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WiFiDeviceClientGetInterfaceName();
  v7 = (__WiFiDeviceClient *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_NETWORK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18580]), "initWithWiFiNetwork:", v8);
    -[RTWiFiManager_MobileWiFi accessPointForInterface](self, "accessPointForInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_IS_LINKDOWN"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");
      _rt_log_facility_get_os_log(RTLogFacilityWiFi);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (v12)
          v14 = 1;
        else
          v14 = 2;
        +[RTWiFiManager linkStatusToString:](RTWiFiManager, "linkStatusToString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v7;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "link status for interface, %@, changed to status, %@, ap, %@", (uint8_t *)&v18, 0x20u);

      }
    }
    -[RTWiFiManager_MobileWiFi accessPointForInterface](self, "accessPointForInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiManager setAccessPoints:](self, "setAccessPoints:", v17);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = a3;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "no interface name for device, %p", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (void)_pollAccessPoints
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[RTWiFiManager_MobileWiFi devices](self, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__RTWiFiManager_MobileWiFi__pollAccessPoints__block_invoke;
  v6[3] = &unk_1E92974C8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  -[RTWiFiManager setAccessPoints:](self, "setAccessPoints:", v5);
}

- (void)handleWiFiDeviceClientScanUpdateCallback:(__WiFiDeviceClient *)a3 scanRequest:(id)a4 scanResults:(id)a5 error:(int)a6
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;

  v8 = a5;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanUpdateCallback_scanRequest_scanResults_error___block_invoke;
  block[3] = &unk_1E92A2A58;
  block[4] = self;
  v12 = v8;
  v13 = a6;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)handleWiFiDeviceClientScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanCallback_scanResults_error___block_invoke;
  block[3] = &unk_1E92A2A58;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)handleWiFiDeviceClientCacheScanCallback:(__WiFiDeviceClient *)a3 scanResults:(id)a4 error:(int)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientCacheScanCallback_scanResults_error___block_invoke;
  block[3] = &unk_1E92A2A58;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)_handleScanResultsCallback:(id)a3 attemptCacheFallback:(BOOL)a4 error:(int)a5
{
  _BOOL4 v6;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__RTWiFiManager_MobileWiFi__handleScanResultsCallback_attemptCacheFallback_error___block_invoke;
  v13[3] = &unk_1E92974C8;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  if (!a5 || (!objc_msgSend(v12, "count") ? (v11 = !v6) : (v11 = 1), v11))
    -[RTWiFiManager _notifyScanResults:](self, "_notifyScanResults:", v12);
  else
    -[RTWiFiManager_MobileWiFi _scheduleScanWithCache](self, "_scheduleScanWithCache");

}

+ (id)cacheScanRequest
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SCAN_MAXAGE");
  v3[1] = CFSTR("SCAN_MERGE");
  v4[0] = &unk_1E9328CA0;
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[2] = CFSTR("SCAN_TYPE");
  v3[3] = CFSTR("SCAN_DWELL_TIME");
  v4[2] = &unk_1E9328CB8;
  v4[3] = &unk_1E9328CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultScanRequest
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SCAN_MERGE");
  v3[1] = CFSTR("SCAN_TYPE");
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = &unk_1E9328CB8;
  v3[2] = CFSTR("SCAN_DWELL_TIME");
  v4[2] = &unk_1E9328CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)activeScanRequest
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SCAN_MERGE");
  v3[1] = CFSTR("SCAN_TYPE");
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = &unk_1E9328CE8;
  v3[2] = CFSTR("SCAN_DWELL_TIME");
  v4[2] = &unk_1E9328CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scanRequestWithType:(int64_t)a3 dwellTime:(int64_t)a4 channels:(id)a5 lowPriority:(BOOL)a6 merge:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("SCAN_MERGE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("SCAN_TYPE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("SCAN_DWELL_TIME"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("SCAN_LOW_PRIORITY"));

  if (objc_msgSend(v11, "count"))
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("SCAN_CHANNELS"));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__RTWiFiManager_MobileWiFi_scanRequestWithType_dwellTime_channels_lowPriority_merge___block_invoke;
    v20[3] = &unk_1E92A2A80;
    v21 = v17;
    v18 = v17;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

  }
  return v12;
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManagerClient *)a3
{
  self->_wifiManager = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableDictionary)accessPointForInterface
{
  return self->_accessPointForInterface;
}

- (void)setAccessPointForInterface:(id)a3
{
  objc_storeStrong((id *)&self->_accessPointForInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPointForInterface, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
