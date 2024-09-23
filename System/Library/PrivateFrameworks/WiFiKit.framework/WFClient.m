@implementation WFClient

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219FC8000, v2, v3, "Core WiFi Service restarted.", v4, 2u);
  }

  objc_msgSend(WeakRetained, "reloadConfiguration");
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_53);

}

- (WFInterface)interface
{
  WFInterface *interface;
  NSObject *v4;
  os_log_type_t v5;
  CWFInterface *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  os_log_type_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  interface = self->_interface;
  if (!interface)
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v12 = 136315138;
      v13 = "-[WFClient interface]";
      _os_log_impl(&dword_219FC8000, v4, v5, "%s: recreating WFInterface in WFClient because it's nil when trying to access", (uint8_t *)&v12, 0xCu);
    }

    if (self->_manager)
    {
      v6 = self->_cInterface;
      if (!v6)
      {
        WFLogForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
        {
          v12 = 136315138;
          v13 = "-[WFClient interface]";
          _os_log_impl(&dword_219FC8000, v7, v8, "%s: recreating cInterface to recreate WFInterface", (uint8_t *)&v12, 0xCu);
        }

        v6 = (CWFInterface *)objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
        -[CWFInterface requestParameters](v6, "requestParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTimeout:", 120000000000);

        objc_storeStrong((id *)&self->_cInterface, v6);
        -[CWFInterface resume](v6, "resume");
        -[WFClient _startMonitoringCoreWiFiEventsWithInterface:](self, "_startMonitoringCoreWiFiEventsWithInterface:", v6);
      }
      -[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:](self, "_setupDefaultInterfaceWithManager:coreWiFiInterface:", self->_manager, v6);
    }
    else
    {
      WFLogForCategory(0);
      v6 = (CWFInterface *)objc_claimAutoreleasedReturnValue();
      v11 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled((os_log_t)v6, v11))
      {
        v12 = 136315138;
        v13 = "-[WFClient interface]";
        _os_log_impl(&dword_219FC8000, (os_log_t)v6, v11, "%s: cannot recreate WFInterface in WFClient because WiFiManagerClientRef is nil", (uint8_t *)&v12, 0xCu);
      }
    }

    interface = self->_interface;
  }
  return interface;
}

- (BOOL)isCellularOutrankingWiFi
{
  return -[WFClient cellularOutrankState](self, "cellularOutrankState") != 0;
}

- (unint64_t)cellularOutrankState
{
  return self->_cellularOutrankState;
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "integerValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  LOBYTE(v4) = objc_msgSend(v4, "startMonitoringEventType:error:", v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v4 & 1) == 0)
  {
    WFLogForCategory(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        v10 = objc_msgSend(v3, "integerValue");
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        v14 = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke";
        v15 = 2048;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_219FC8000, v9, v8, "%s: unable to register for event %lu - error %@", buf, 0x20u);
      }

    }
  }

}

- (BOOL)powered
{
  return self->_powered;
}

void __25__WFClient_asyncPowered___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[WFClient asyncPowered:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePowerState");
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __25__WFClient_asyncPowered___block_invoke_86;
    v6[3] = &unk_24DC35468;
    v5 = *(id *)(a1 + 32);
    v6[4] = WeakRetained;
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

- (void)_updatePowerState
{
  void *v3;
  int v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_manager)
  {
    -[WFClient cInterface](self, "cInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "powerOn");

    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFClient _updatePowerState]";
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: current power %d", buf, 0x12u);
    }

    if (self->_powered != v4)
    {
      v7 = MEMORY[0x24BDAC760];
      self->_powered = v4;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __29__WFClient__updatePowerState__block_invoke;
      block[3] = &unk_24DC348F8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

- (WFClient)initWithCallbackRunLoop:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFClient *v8;
  uint64_t v9;
  __WiFiManagerClient *manager;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialClientQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *stateMonitorQueue;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  __WiFiManagerClient *v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  WFClient *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
  objc_msgSend(v6, "requestParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeout:", 120000000000);

  v27.receiver = self;
  v27.super_class = (Class)WFClient;
  v8 = -[WFClient init](&v27, sel_init);
  if (!v8)
    goto LABEL_24;
  v9 = WiFiManagerClientCreate();
  if (v9)
  {
    v8->_manager = (__WiFiManagerClient *)v9;
    v8->_cellularOutrankWiFiNotificationToken = -1;
    -[WFClient _registerForCellularRankingStateNotification](v8, "_registerForCellularRankingStateNotification");
    objc_storeStrong((id *)&v8->_callbackRunLoop, a3);
    -[WFClient _scheduleCallbacksWithManager:runLoop:](v8, "_scheduleCallbacksWithManager:runLoop:", v8->_manager, v5);
    if (v6)
    {
      objc_msgSend(v6, "resume");
      -[WFClient setCInterface:](v8, "setCInterface:", v6);
      v8->_powered = objc_msgSend(v6, "powerOn");
      manager = v8->_manager;
      -[WFClient cInterface](v8, "cInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:](v8, "_setupDefaultInterfaceWithManager:coreWiFiInterface:", manager, v11);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel__managedConfigurationDidChange_, *MEMORY[0x24BE63740], 0);

      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFClient initWithCallbackRunLoop:]";
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_219FC8000, v13, v14, "%s %@", buf, 0x16u);
      }

      v15 = dispatch_queue_create("com.apple.wifikit.wfclient-serial", 0);
      serialClientQueue = v8->_serialClientQueue;
      v8->_serialClientQueue = (OS_dispatch_queue *)v15;

      v17 = dispatch_queue_create("WFWiFiStateMonitorQueue", 0);
      stateMonitorQueue = v8->_stateMonitorQueue;
      v8->_stateMonitorQueue = (OS_dispatch_queue *)v17;

      if (objc_opt_class())
      {
        objc_msgSend(MEMORY[0x24BE60C20], "shared");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v8->_lockdownModeEnabled = objc_msgSend(v19, "enabled");

      }
      v20 = 2;
      if (v8->_lockdownModeEnabled)
        v20 = -1;
      v8->_askToJoinMode = v20;
      v8->_autoInstantHotspotJoinOption = 1;
      -[WFClient reloadConfiguration](v8, "reloadConfiguration");
      -[WFClient cInterface](v8, "cInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFClient _startMonitoringCoreWiFiEventsWithInterface:](v8, "_startMonitoringCoreWiFiEventsWithInterface:", v21);
      goto LABEL_13;
    }
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v25 = "Fail to create CoreWiFi Interface";
  }
  else
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v25 = "failed to create WiFiManagerClientRef";
  }
  _os_log_impl(&dword_219FC8000, v23, v24, v25, buf, 2u);
LABEL_23:

LABEL_24:
  v26 = v8->_manager;
  if (v26)
  {
    CFRelease(v26);
    v8->_manager = 0;
  }
  v21 = v8;
  v8 = 0;
LABEL_13:

  return v8;
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (void)asyncPowered:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WFClient stateMonitorQueue](self, "stateMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__WFClient_asyncPowered___block_invoke;
  block[3] = &unk_24DC359B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateAirplaneModeStickiness
{
  const void *v3;
  const void *v4;
  BOOL v5;
  int v6;
  const void *v7;
  unint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFClient manager](self, "manager");
  v3 = (const void *)WiFiManagerClientCopyProperty();
  v4 = (const void *)*MEMORY[0x24BDBD270];
  if (v3)
    v5 = v3 == v4;
  else
    v5 = 1;
  v6 = v5;
  if (v3)
    CFRelease(v3);
  if (v6)
  {
    -[WFClient manager](self, "manager");
    v7 = (const void *)WiFiManagerClientCopyProperty();
    if (v7 != v4 || v7 == 0)
      v9 = 1;
    else
      v9 = 2;
    if (v7)
      CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  if (v9 != self->_airplaneModeBehavior)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      v12 = off_24DC35AA0[v9];
      v13 = 136315394;
      v14 = "-[WFClient _updateAirplaneModeStickiness]";
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_219FC8000, v10, v11, "%s: updating to %@", (uint8_t *)&v13, 0x16u);
    }

    self->_airplaneModeBehavior = v9;
  }
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  float v27;
  WFLinkQuality *v28;
  float v29;
  void *v30;
  WFLinkQuality *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  os_log_type_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  os_log_type_t v47;
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD block[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  const __CFString *v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(v3, "type");
  switch(v5)
  {
    case 1:
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v11, v12, "CWFEventTypePowerChanged - event %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "_updatePowerState");
      goto LABEL_25;
    case 2:
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v13, v14, "CWFEventTypeSSIDChanged - event %@", buf, 0xCu);
      }

LABEL_25:
      objc_msgSend(WeakRetained, "interface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "asyncCurrentNetwork:", 0);
      goto LABEL_53;
    case 3:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      goto LABEL_54;
    case 4:
      WFLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v16, v17, "CWFEventTypeCountryCodeChanged - event %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "interface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateDeviceScanChannelsPerCurLocale");
      goto LABEL_53;
    case 6:
      WFLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v18, v19, "CWFEventTypeLinkChanged - event %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "interface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "asyncCurrentNetwork:", 0);

      v21 = dispatch_time(0, 1000000000);
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_54;
      v55[3] = &unk_24DC348F8;
      v55[4] = WeakRetained;
      dispatch_after(v21, MEMORY[0x24BDAC9B8], v55);
      goto LABEL_54;
    case 7:
      objc_msgSend(v3, "info");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("LinkQualityMetric"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "interface");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentNetwork");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v28 = 0;
LABEL_61:
        v30 = 0;
        goto LABEL_63;
      }
      v26 = objc_msgSend(v23, "RSSI");
      v27 = WFScaleRSSI(v26);
      v28 = 0;
      if (v26)
      {
        v29 = v27;
        v30 = 0;
        if (v27 == 0.0)
          goto LABEL_63;
        v31 = [WFLinkQuality alloc];
        objc_msgSend(WeakRetained, "interface");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "currentNetwork");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "ssid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v35 = v29;
        v28 = -[WFLinkQuality initWithSSID:rssi:scaledRSSI:](v31, "initWithSSID:rssi:scaledRSSI:", v34, v26, v35);

        if (v28)
        {
          v60 = CFSTR("WFInterfaceLinkQualityKey");
          v61[0] = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_63;
        }
        goto LABEL_61;
      }
      v30 = 0;
LABEL_63:
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_59;
      v53[3] = &unk_24DC348F8;
      v54 = v30;
      v48 = v30;
      dispatch_async(MEMORY[0x24BDAC9B8], v53);

LABEL_54:
      return;
    case 13:
      objc_msgSend(v3, "info");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", CFSTR("JoinStatus"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v37 && os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v37, v38, "CWFEventTypeJoinStatusChanged - event='%@'", buf, 0xCu);
      }

      if (v15)
      {
        objc_msgSend(v15, "error");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "code");

        if (v40)
        {
          WFLogForCategory(0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v41)
          {
            v43 = v41;
            if (os_log_type_enabled(v43, v42))
            {
              objc_msgSend(v15, "error");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v57 = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke";
              v58 = 2112;
              v59 = v44;
              _os_log_impl(&dword_219FC8000, v43, v42, "%s: updating asyncCurrentNetwork on join error %@", buf, 0x16u);

            }
          }

          objc_msgSend(WeakRetained, "interface");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "asyncCurrentNetwork:", 0);

        }
      }
LABEL_53:

      goto LABEL_54;
    case 19:
    case 20:
      WFLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_219FC8000, v6, v7, "CWFEventTypeIPChanged - event='%@'", buf, 0xCu);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_62;
      block[3] = &unk_24DC348F8;
      v52 = v3;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v8 = v52;
      goto LABEL_14;
    default:
      if (v5 == 27)
      {
        WFLogForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v46 && os_log_type_enabled(v46, v47))
        {
          *(_DWORD *)buf = 138412290;
          v57 = (const char *)v3;
          _os_log_impl(&dword_219FC8000, v46, v47, "CWFEventTypeUserSettingsChanged - event='%@'", buf, 0xCu);
        }

        objc_msgSend(WeakRetained, "reloadConfiguration");
      }
      else if (v5 == 30)
      {
        WFLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138412290;
          v57 = (const char *)v3;
          _os_log_impl(&dword_219FC8000, v9, v10, "CWFEventTypeKnownNetworkProfileChanged - event %@", buf, 0xCu);
        }

        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_63;
        v49[3] = &unk_24DC34BE8;
        v49[4] = WeakRetained;
        v50 = v3;
        dispatch_async(MEMORY[0x24BDAC9B8], v49);
        v8 = v50;
LABEL_14:

      }
      goto LABEL_54;
  }
}

void __45__WFClient__notifyWiFiPropertyChanged_value___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[6];
  v6 = a1[5];
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WFClientUserInterfacePropertyChangedNotification"), v3, v5);

}

void __31__WFClient_reloadConfiguration__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v28 = 136315138;
    v29 = "-[WFClient reloadConfiguration]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: reloading WFClient configuration", (uint8_t *)&v28, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "_askToJoinModeFromCoreWiFiAskToJoinMode:", objc_msgSend(v5, "askToJoinMode"));
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 24))
    v8 = -1;
  else
    v8 = v6;
  if (v8 != *(_QWORD *)(v7 + 48))
  {
    *(_QWORD *)(v7 + 48) = v8;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_notifyWiFiPropertyChanged:value:", CFSTR("kWFClientUserInterfacePropertyATJKey"), v10);

    v7 = *(_QWORD *)(a1 + 32);
  }
  v11 = objc_msgSend((id)v7, "_hotspotJoinOptionFromCoreWiFiAutoHotspotMode:", objc_msgSend(v5, "autoHotspotMode"));
  v12 = *(_QWORD *)(a1 + 32);
  if (v11 != *(_QWORD *)(v12 + 56))
  {
    *(_QWORD *)(v12 + 56) = v11;
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_notifyWiFiPropertyChanged:value:", CFSTR("kWFClientUserInterfacePropertyHotspotAJKey"), v14);

  }
  objc_msgSend(v5, "OSSpecificAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v5, "OSSpecificAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("WAPIEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v5, "OSSpecificAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DiagnosticsEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v5, "OSSpecificAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE67EF0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v5, "OSSpecificAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE67DC8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v5, "OSSpecificAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("WiFiMobileAssetIsHealthMonitorDisabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = objc_msgSend(v25, "BOOLValue");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = CFPreferencesGetAppBooleanValue(CFSTR("ShowWiFiUI"), CFSTR("com.apple.wifi.ui"), 0) != 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 22) = CFPreferencesGetAppBooleanValue(CFSTR("ShowWiFiAwareUI"), CFSTR("com.apple.wifi.ui"), 0) != 0;
  }
  else
  {
    WFLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
    {
      v28 = 138412290;
      v29 = (const char *)v5;
      _os_log_impl(&dword_219FC8000, v26, v27, "nil OSSpecificAttributes from user settings='%@'", (uint8_t *)&v28, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateNetworkRestrictionActive");
  objc_msgSend(*(id *)(a1 + 32), "_updateAirplaneModeStickiness");
  objc_msgSend(*(id *)(a1 + 32), "_updateWPA3Properties:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 32), "_updatePowerModificationDisableState");
  objc_msgSend(*(id *)(a1 + 32), "_updateManagedAppleIDState");
  objc_msgSend(*(id *)(a1 + 32), "_updateCellularRankingState");

}

- (void)setWPA3PersonalEnabled:(BOOL)a3
{
  self->_WPA3PersonalEnabled = a3;
}

- (void)setWPA3EnterpriseEnabled:(BOOL)a3
{
  self->_WPA3EnterpriseEnabled = a3;
}

- (void)setPowerModificationDisableState:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_powerModificationDisabled == a3)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[WFClient setPowerModificationDisableState:]";
      _os_log_impl(&dword_219FC8000, v3, v4, "%s: No change in state", buf, 0xCu);
    }

  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    self->_powerModificationDisabled = a3;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __45__WFClient_setPowerModificationDisableState___block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)setNetworkRestrictionActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *whitelistingUUID;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 networkRestrictionActive;
  NSString *v15;
  uint64_t v16;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v19[10];
  _BYTE v20[10];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v19 = "-[WFClient setNetworkRestrictionActive:]";
    *(_WORD *)&v19[8] = 1024;
    *(_DWORD *)v20 = v3;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: restriction %d", buf, 0x12u);
  }

  if (self->_networkRestrictionActive != v3)
  {
    if (v3)
    {
      -[WFClient cInterface](self, "cInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "OSSpecificAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE67EF8]);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      whitelistingUUID = self->_whitelistingUUID;
      self->_whitelistingUUID = v10;

    }
    else
    {
      v8 = self->_whitelistingUUID;
      self->_whitelistingUUID = 0;
    }

    if (self->_networkRestrictionActive != v3)
    {
      WFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        networkRestrictionActive = self->_networkRestrictionActive;
        v15 = self->_whitelistingUUID;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v19 = networkRestrictionActive;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = v3;
        *(_WORD *)v20 = 2112;
        *(_QWORD *)&v20[2] = v15;
        _os_log_impl(&dword_219FC8000, v12, v13, "Restriction policy changed (was %d is %d) policyUUID='%@'", buf, 0x18u);
      }

      v16 = MEMORY[0x24BDAC760];
      self->_networkRestrictionActive = v3;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __40__WFClient_setNetworkRestrictionActive___block_invoke;
      block[3] = &unk_24DC348F8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

- (void)setMfpCapable:(BOOL)a3
{
  self->_mfpCapable = a3;
}

- (void)setManagedAppleID:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_managedAppleID == a3)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[WFClient setManagedAppleID:]";
      _os_log_impl(&dword_219FC8000, v3, v4, "%s: No change in state", buf, 0xCu);
    }

  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    self->_managedAppleID = a3;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __30__WFClient_setManagedAppleID___block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)setCInterface:(id)a3
{
  objc_storeStrong((id *)&self->_cInterface, a3);
}

- (void)reloadConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WFClient_reloadConfiguration__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isWPA3PersonalEnabled
{
  return self->_WPA3PersonalEnabled;
}

- (BOOL)isWPA3EnterpriseEnabled
{
  return self->_WPA3EnterpriseEnabled;
}

- (BOOL)isMfpCapable
{
  return self->_mfpCapable;
}

- (unint64_t)cellularOutrankWiFiSymtpomsState
{
  return self->_cellularOutrankWiFiSymtpomsState;
}

- (int)cellularOutrankWiFiNotificationToken
{
  return self->_cellularOutrankWiFiNotificationToken;
}

- (void)_updateWPA3Properties:(__WiFiManagerClient *)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WFClient setWPA3PersonalEnabled:](self, "setWPA3PersonalEnabled:", WiFiManagerClientIsWPA3PersonalSupported() != 0);
  -[WFClient setWPA3EnterpriseEnabled:](self, "setWPA3EnterpriseEnabled:", WiFiManagerClientIsWPA3EnterpriseSupported() != 0);
  -[WFClient setMfpCapable:](self, "setMfpCapable:", WiFiManagerClientIsMfpCapableDevice() != 0);
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = 136315906;
      v8 = "-[WFClient _updateWPA3Properties:]";
      v9 = 1024;
      v10 = -[WFClient isWPA3PersonalEnabled](self, "isWPA3PersonalEnabled");
      v11 = 1024;
      v12 = -[WFClient isWPA3EnterpriseEnabled](self, "isWPA3EnterpriseEnabled");
      v13 = 1024;
      v14 = -[WFClient isMfpCapable](self, "isMfpCapable");
      _os_log_impl(&dword_219FC8000, v6, v5, "%s: WPA3 personal (%d) WPA3 enterprise (%d) MFP Capable (%d)", (uint8_t *)&v7, 0x1Eu);
    }

  }
}

- (void)_updatePowerModificationDisableState
{
  int IsPowerModificationDisabled;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFClient manager](self, "manager");
  IsPowerModificationDisabled = WiFiManagerClientIsPowerModificationDisabled();
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = "Enabled";
    if (IsPowerModificationDisabled)
      v6 = "Disabled";
    v7 = 136315394;
    v8 = "-[WFClient _updatePowerModificationDisableState]";
    v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: PowerModification is %s", (uint8_t *)&v7, 0x16u);
  }

  -[WFClient setPowerModificationDisableState:](self, "setPowerModificationDisableState:", IsPowerModificationDisabled != 0);
}

- (void)_updateNetworkRestrictionActive
{
  int IsRestrictionPolicyActive;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[WFClient manager](self, "manager");
  IsRestrictionPolicyActive = WiFiManagerClientIsRestrictionPolicyActive();
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[WFClient _updateNetworkRestrictionActive]";
    v8 = 1024;
    v9 = IsRestrictionPolicyActive != 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: restrictionState %d", (uint8_t *)&v6, 0x12u);
  }

  -[WFClient setNetworkRestrictionActive:](self, "setNetworkRestrictionActive:", IsRestrictionPolicyActive != 0);
}

- (void)_updateManagedAppleIDState
{
  int IsManagedAppleID;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFClient manager](self, "manager");
  IsManagedAppleID = WiFiManagerClientIsManagedAppleID();
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = "Non-Managed";
    if (IsManagedAppleID)
      v6 = "Managed";
    v7 = 136315394;
    v8 = "-[WFClient _updateManagedAppleIDState]";
    v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: %s Account", (uint8_t *)&v7, 0x16u);
  }

  -[WFClient setManagedAppleID:](self, "setManagedAppleID:", IsManagedAppleID != 0);
}

- (void)_updateCellularRankingState
{
  unint64_t v3;
  unint64_t *p_cellularOutrankWiFiSymtpomsState;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  unint64_t v11;
  os_log_type_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  const char *v20;
  unint64_t v21;
  unint64_t cellularOutrankWiFiSymtpomsState;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFClient cellularOutrankWiFiSymtpomsState](self, "cellularOutrankWiFiSymtpomsState");
  p_cellularOutrankWiFiSymtpomsState = &self->_cellularOutrankWiFiSymtpomsState;
  if (notify_get_state(-[WFClient cellularOutrankWiFiNotificationToken](self, "cellularOutrankWiFiNotificationToken"), &self->_cellularOutrankWiFiSymtpomsState))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6))
      goto LABEL_12;
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFClient _updateCellularRankingState]";
    v7 = "%s: notify_get_state returned error";
    v8 = v5;
    v9 = v6;
    v10 = 12;
LABEL_11:
    _os_log_impl(&dword_219FC8000, v8, v9, v7, buf, v10);
LABEL_12:

    return;
  }
  v11 = *p_cellularOutrankWiFiSymtpomsState;
  if (v3 == *p_cellularOutrankWiFiSymtpomsState)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v12))
      goto LABEL_12;
    v13 = *p_cellularOutrankWiFiSymtpomsState;
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFClient _updateCellularRankingState]";
    v26 = 2048;
    v27 = (const char *)v13;
    v7 = "%s: no change to cellular outranking state: %llu";
    v8 = v5;
    v9 = v12;
    v10 = 22;
    goto LABEL_11;
  }
  if ((v11 & 1) != 0)
  {
    if ((v11 & 0x40000000) != 0)
    {
      v14 = 5;
    }
    else
    {
      v15 = 3;
      v16 = 4;
      if ((v11 & 0x800) == 0)
        v16 = 2;
      if ((v11 & 0x8000) == 0)
        v15 = v16;
      if ((v11 & 0x2000000) != 0)
        v14 = 1;
      else
        v14 = v15;
    }
  }
  else
  {
    v14 = 0;
  }
  -[WFClient setCellularOutrankState:](self, "setCellularOutrankState:", v14);
  WFLogForCategory(0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17)
  {
    v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      if (-[WFClient isCellularOutrankingWiFi](self, "isCellularOutrankingWiFi"))
        v20 = "TRUE";
      else
        v20 = "FALSE";
      v21 = -[WFClient cellularOutrankState](self, "cellularOutrankState");
      cellularOutrankWiFiSymtpomsState = self->_cellularOutrankWiFiSymtpomsState;
      *(_DWORD *)buf = 136315906;
      v25 = "-[WFClient _updateCellularRankingState]";
      v26 = 2080;
      v27 = v20;
      v28 = 2048;
      v29 = v21;
      v30 = 2048;
      v31 = cellularOutrankWiFiSymtpomsState;
      _os_log_impl(&dword_219FC8000, v19, v18, "%s: symptoms cellular outrank recommendation is set to %s (%lu - %llu)", buf, 0x2Au);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFClient__updateCellularRankingState__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_startMonitoringCoreWiFiEventsWithInterface:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke;
  v13[3] = &unk_24DC347A0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v13);
  -[WFClient cInterface](self, "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2;
  v11[3] = &unk_24DC358F0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "setEventHandler:", v11);

  -[WFClient stateMonitorQueue](self, "stateMonitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_65;
  v9[3] = &unk_24DC348F8;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_setupDefaultInterfaceWithManager:(__WiFiManagerClient *)a3 coreWiFiInterface:(id)a4
{
  id v5;
  WFInterface *v6;
  NSObject *v7;
  os_log_type_t v8;
  WFInterface *v9;
  WFInterface *interface;
  NSObject *v11;
  os_log_type_t v12;
  WFInterface *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  os_log_type_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  WFInterface *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (WFInterface *)WiFiManagerClientCopyDevices();
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v19 = 136315394;
    v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: devices %@", (uint8_t *)&v19, 0x16u);
  }

  if (v6)
  {
    v9 = -[WFInterface initWithDevice:coreWiFiInterface:]([WFInterface alloc], "initWithDevice:coreWiFiInterface:", -[WFInterface objectAtIndex:](v6, "objectAtIndex:", 0), v5);
    interface = self->_interface;
    self->_interface = v9;

    -[WFInterface setWifiClient:](self->_interface, "setWifiClient:", self);
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = self->_interface;
      v19 = 136315394;
      v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
      v21 = 2112;
      v22 = v13;
      v14 = "%s: Setting up WFInterface %@ in WFClient";
      v15 = v11;
      v16 = v12;
      v17 = 22;
LABEL_14:
      _os_log_impl(&dword_219FC8000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v18))
    {
      v19 = 136315138;
      v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
      v14 = "%s: failed to acquire WiFiDeviceClientRef";
      v15 = v11;
      v16 = v18;
      v17 = 12;
      goto LABEL_14;
    }
  }

}

- (void)_scheduleCallbacksWithManager:(__WiFiManagerClient *)a3 runLoop:(id)a4
{
  objc_msgSend(a4, "getCFRunLoop");
  WiFiManagerClientScheduleWithRunLoop();
  WiFiManagerClientRegisterNotificationCallback();
  WiFiManagerClientRegisterDeviceAttachmentCallback();
  WiFiManagerClientRegisterManagedAppleIDStateChangedCallback();
}

- (void)_registerForCellularRankingStateNotification
{
  int *p_cellularOutrankWiFiNotificationToken;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[WFClient cellularOutrankWiFiNotificationToken](self, "cellularOutrankWiFiNotificationToken") == -1)
  {
    objc_initWeak(&location, self);
    p_cellularOutrankWiFiNotificationToken = &self->_cellularOutrankWiFiNotificationToken;
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__WFClient__registerForCellularRankingStateNotification__block_invoke;
    v5[3] = &unk_24DC359E0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.symptoms.celloutrankrecommendation", p_cellularOutrankWiFiNotificationToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyWiFiPropertyChanged:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[WFClient _notifyWiFiPropertyChanged:value:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_219FC8000, v8, v9, "%s: key='%@' value='%@'", buf, 0x20u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WFClient__notifyWiFiPropertyChanged_value___block_invoke;
  block[3] = &unk_24DC34BC0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (int64_t)_hotspotJoinOptionFromCoreWiFiAutoHotspotMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 1;
  else
    return qword_21A062B70[a3];
}

- (int64_t)_askToJoinModeFromCoreWiFiAskToJoinMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 0;
  else
    return a3 - 1;
}

+ (WFClient)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  return (WFClient *)(id)_sharedWFClient;
}

void __26__WFClient_sharedInstance__block_invoke()
{
  WFClient *v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(WFClient);
  v1 = (void *)_sharedWFClient;
  _sharedWFClient = (uint64_t)v0;

  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = 136315138;
    v5 = "+[WFClient sharedInstance]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: WFClient sharedInstance is deprecated and should be removed.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)dealloc
{
  void *v3;
  __WiFiManagerClient *manager;
  WFInterface *interface;
  CWFInterface *cInterface;
  CWFInterface *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_cellularOutrankWiFiNotificationToken);
  self->_cellularOutrankWiFiNotificationToken = -1;
  if (self->_manager)
  {
    -[WFClient _unscheduleCallbacksWithManager:](self, "_unscheduleCallbacksWithManager:");
    manager = self->_manager;
    if (manager)
    {
      CFRelease(manager);
      self->_manager = 0;
    }
  }
  interface = self->_interface;
  if (interface)
  {
    self->_interface = 0;

  }
  cInterface = self->_cInterface;
  if (cInterface)
  {
    -[CWFInterface invalidate](cInterface, "invalidate");
    v7 = self->_cInterface;
    self->_cInterface = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)WFClient;
  -[WFClient dealloc](&v8, sel_dealloc);
}

- (WFClient)init
{
  void *v3;
  WFClient *v4;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFClient initWithCallbackRunLoop:](self, "initWithCallbackRunLoop:", v3);

  return v4;
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_52()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("WFClientServerRestartedNotification"), 0);

}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_54(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "interface");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "asyncCurrentNetwork:", 0);

}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_59(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceLinkQualityNotification"), 0, *(_QWORD *)(a1 + 32));

}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_62(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceIPAddressChangedNotification"), 0, v2);

}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_63(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFClientPreferredNetworksDidChangeNotification"), v2, v3);

}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_65(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  _QWORD v4[4];
  id v5;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke_2";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: Entering WFClient stateMonitorQueue", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_77;
  v4[3] = &unk_24DC35918;
  v5 = *(id *)(a1 + 32);
  p_buf = &buf;
  objc_msgSend(&unk_24DC5DBA0, "enumerateObjectsUsingBlock:", v4);

  _Block_object_dispose(&buf, 8);
}

- (void)_unscheduleCallbacksWithManager:(__WiFiManagerClient *)a3
{
  void *v4;

  if (a3)
  {
    -[WFClient callbackRunLoop](self, "callbackRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getCFRunLoop");
    WiFiManagerClientUnscheduleFromRunLoop();

    -[WFClient setCallbackRunLoop:](self, "setCallbackRunLoop:", 0);
    WiFiManagerClientRegisterNotificationCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
    WiFiManagerClientRegisterPreferredNetworksChangedCallback();
    WiFiManagerClientRegisterManagedAppleIDStateChangedCallback();
  }
}

- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[WFClient _updateWithDeviceAttachment:]";
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: Device became available", buf, 0xCu);
  }

  -[WFClient interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFClient _updateWithDeviceAttachment:]";
      _os_log_impl(&dword_219FC8000, v8, v9, "%s: interface already exists", buf, 0xCu);
    }

    -[WFClient interface](self, "interface");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDevice:](v10, "setDevice:", a3);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__WFClient__updateWithDeviceAttachment___block_invoke;
    v12[3] = &unk_24DC348D0;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v10, v12);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("WFClientInterfaceAvailableNotification"), self);

}

void __40__WFClient__updateWithDeviceAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interfaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WFClient__updateWithDeviceAttachment___block_invoke_2;
  block[3] = &unk_24DC34F48;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __40__WFClient__updateWithDeviceAttachment___block_invoke_2(uint64_t a1)
{
  id v2;
  WFInterface *v3;
  uint64_t v4;
  void *v5;
  WFInterface *v6;
  void *v7;
  id v8;

  v2 = *(id *)(a1 + 32);
  v3 = [WFInterface alloc];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "cInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFInterface initWithDevice:coreWiFiInterface:interfaceName:](v3, "initWithDevice:coreWiFiInterface:interfaceName:", v4, v5, v2);
  objc_msgSend(*(id *)(a1 + 40), "setInterface:", v6);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWifiClient:", v7);

}

void __29__WFClient__updatePowerState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientPowerStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (OS_dispatch_queue)stateMonitorQueue
{
  OS_dispatch_queue *stateMonitorQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  stateMonitorQueue = self->_stateMonitorQueue;
  if (!stateMonitorQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("WFWiFiStateMonitorQueue", 0);
    v5 = self->_stateMonitorQueue;
    self->_stateMonitorQueue = v4;

    stateMonitorQueue = self->_stateMonitorQueue;
  }
  return stateMonitorQueue;
}

- (void)setPowered:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  const __CFString *v12;
  _QWORD v13[5];
  _QWORD block[5];
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  if (-[WFClient powered](self, "powered") == a3)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      v12 = CFSTR("OFF");
      if (v3)
        v12 = CFSTR("ON");
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFClient setPowered:]";
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_219FC8000, v10, v11, "%s: no change to power state (%@)", buf, 0x16u);
    }

  }
  else
  {
    self->_powered = v3;
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v7 = CFSTR("OFF");
      if (v3)
        v7 = CFSTR("ON");
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFClient setPowered:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: setting power to %@", buf, 0x16u);
    }

    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__WFClient_setPowered___block_invoke;
    block[3] = &unk_24DC35940;
    block[4] = self;
    v15 = v3;
    dispatch_async(v8, block);

    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __23__WFClient_setPowered___block_invoke_84;
    v13[3] = &unk_24DC348F8;
    v13[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
  }
}

void __23__WFClient_setPowered___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 40);
  v9 = 0;
  v4 = objc_msgSend(v2, "setPower:error:", v3, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v8 = CFSTR("ON");
      if (!*(_BYTE *)(a1 + 40))
        v8 = CFSTR("OFF");
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_219FC8000, v6, v7, "failed to set power to %@, error: %@", buf, 0x16u);
    }

  }
}

void __23__WFClient_setPowered___block_invoke_84(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientPowerStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)setPoweredToggle:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  const __CFString *v13;
  _QWORD block[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[WFClient powered](self, "powered") == v4)
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = CFSTR("OFF");
      if (v4)
        v13 = CFSTR("ON");
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFClient setPoweredToggle:handler:]";
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: no change to power state (%@)", buf, 0x16u);
    }

  }
  else
  {
    self->_powered = v4;
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      v9 = CFSTR("OFF");
      if (v4)
        v9 = CFSTR("ON");
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFClient setPoweredToggle:handler:]";
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_219FC8000, v7, v8, "%s: setting power to %@", buf, 0x16u);
    }

    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__WFClient_setPoweredToggle_handler___block_invoke;
    block[3] = &unk_24DC35990;
    v16 = v4;
    block[4] = self;
    v15 = v6;
    dispatch_async(v10, block);

  }
}

void __37__WFClient_setPoweredToggle_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  const __CFString *v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v12 = 0;
  v4 = objc_msgSend(v2, "setPower:error:", v3, &v12);
  v5 = v12;

  if ((v4 & 1) == 0)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v8 = CFSTR("ON");
      if (!*(_BYTE *)(a1 + 48))
        v8 = CFSTR("OFF");
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_219FC8000, v6, v7, "failed to set power to %@, error: %@", buf, 0x16u);
    }

    v14[3] = *(_BYTE *)(a1 + 48) == 0;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__WFClient_setPoweredToggle_handler___block_invoke_85;
  v9[3] = &unk_24DC35968;
  v10 = *(id *)(a1 + 40);
  v11 = &v13;
  v9[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  _Block_object_dispose(&v13, 8);
}

void __37__WFClient_setPoweredToggle_handler___block_invoke_85(_QWORD *a1)
{
  id v2;

  (*(void (**)(_QWORD, BOOL))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientPowerStateChangedNotification"), a1[4]);

}

uint64_t __25__WFClient_asyncPowered___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "powered"));
}

- (void)setWAPIEnabled:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v5 = MEMORY[0x24BDBD1C8];
  else
    v5 = MEMORY[0x24BDBD1C0];
  v7 = CFSTR("WAPIEnabled");
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFClient _updateOSSpecificAttributes:](self, "_updateOSSpecificAttributes:", v6);

  self->_WAPIEnabled = a3;
}

- (int64_t)_coreWiFiAskToJoinModeFromAskToJoinMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 4)
    return a3 + 1;
  else
    return 1;
}

- (void)setAskToJoinMode:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BE29F38]);
  objc_msgSend(v5, "setAskToJoinMode:", -[WFClient _coreWiFiAskToJoinModeFromAskToJoinMode:](self, "_coreWiFiAskToJoinModeFromAskToJoinMode:", a3));
  -[WFClient cInterface](self, "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24DC5D510, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v6, "applyUserSettings:properties:error:", v5, v7, &v12);
  v9 = v12;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    -[WFClient _notifyWiFiPropertyChanged:value:](self, "_notifyWiFiPropertyChanged:value:", CFSTR("kWFClientUserInterfacePropertyATJKey"), v10);
  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_219FC8000, v10, v11, "failed to set ask to join to %ld, error='%@'", buf, 0x16u);
    }
  }

  self->_askToJoinMode = a3;
}

- (BOOL)hasShownSBPickerDontAsk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WFClient cInterface](self, "cInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "OSSpecificAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE67E88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setHasShownSBPickerDontAsk:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = MEMORY[0x24BDBD1C8];
  else
    v4 = MEMORY[0x24BDBD1C0];
  v6 = *MEMORY[0x24BE67E88];
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFClient _updateOSSpecificAttributes:](self, "_updateOSSpecificAttributes:", v5);

}

void __40__WFClient_setNetworkRestrictionActive___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientNetworkRestrictionPolicyDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __45__WFClient_setPowerModificationDisableState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientPowerModificationStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __39__WFClient__updateCellularRankingState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v6 = CFSTR("kWFClientCellularOutrankWiFiStateKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "cellularOutrankState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WFClientCellularOutrankWiFiNotification"), v3, v5);

}

void __56__WFClient__registerForCellularRankingStateNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v5 = 136315138;
    v6 = "-[WFClient _registerForCellularRankingStateNotification]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: cellular outranking state notification", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCellularRankingState");

}

void __30__WFClient_setManagedAppleID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFClientManagedAppleIDStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_logWiFiManagerPropertyChange:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 136315650;
    v9 = "-[WFClient _logWiFiManagerPropertyChange:value:]";
    v10 = 2112;
    v11 = v5;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: wifi manager property %@ changed to %d", (uint8_t *)&v8, 0x1Cu);
  }

}

- (void)setAirplaneModeBehavior:(unint64_t)a3
{
  unint64_t airplaneModeBehavior;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t *v13;
  const __CFString **v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  airplaneModeBehavior = self->_airplaneModeBehavior;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (airplaneModeBehavior != a3)
  {
    if (v9 && os_log_type_enabled(v6, v7))
    {
      if (a3 > 2)
        v11 = &stru_24DC36C30;
      else
        v11 = off_24DC35AA0[a3];
      *(_DWORD *)buf = 136315394;
      v28 = "-[WFClient setAirplaneModeBehavior:]";
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: new state %@", buf, 0x16u);
    }

    if (a3 == 2)
    {
      v19 = CFSTR("KeepWiFiPoweredAirplaneModeEnabled");
      v20 = CFSTR("KeepWiFiPoweredAirplaneMode");
      v21 = MEMORY[0x24BDBD1C8];
      v22 = MEMORY[0x24BDBD1C8];
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v21;
      v14 = &v19;
    }
    else if (a3 == 1)
    {
      v15 = CFSTR("KeepWiFiPoweredAirplaneModeEnabled");
      v16 = CFSTR("KeepWiFiPoweredAirplaneMode");
      v17 = MEMORY[0x24BDBD1C8];
      v18 = MEMORY[0x24BDBD1C0];
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v17;
      v14 = &v15;
    }
    else
    {
      if (a3)
      {
        v6 = 0;
        goto LABEL_28;
      }
      v23 = CFSTR("KeepWiFiPoweredAirplaneModeEnabled");
      v24 = CFSTR("KeepWiFiPoweredAirplaneMode");
      v25 = MEMORY[0x24BDBD1C0];
      v26 = MEMORY[0x24BDBD1C0];
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v25;
      v14 = &v23;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    -[WFClient _updateOSSpecificAttributes:](self, "_updateOSSpecificAttributes:", v6);
    self->_airplaneModeBehavior = a3;
    goto LABEL_29;
  }
  if (v9 && os_log_type_enabled(v6, v7))
  {
    if (a3 > 2)
      v10 = &stru_24DC36C30;
    else
      v10 = off_24DC35AA0[a3];
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFClient setAirplaneModeBehavior:]";
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: stickiness already equal to %@", buf, 0x16u);
  }
LABEL_29:

}

- (BOOL)isInfraAssociationAllowed
{
  -[WFClient manager](self, "manager");
  return WiFiManagerClientIsInfraAllowed() != 0;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v3)
  {
    if (v8)
    {
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v5, v6, "Enabled Auto Join", buf, 2u);
      }
    }

    -[WFClient manager](self, "manager");
    WiFiManagerClientEnable();
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "Disabled Auto Join", v9, 2u);
    }

    -[WFClient manager](self, "manager");
    WiFiManagerClientDisable();
  }
}

- (void)setAutoInstantHotspotJoinOption:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BE29F38]);
  objc_msgSend(v5, "setAutoHotspotMode:", -[WFClient _coreWiFiHotspotJoinOptionFromAutoHotspotMode:](self, "_coreWiFiHotspotJoinOptionFromAutoHotspotMode:", a3));
  -[WFClient cInterface](self, "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24DC5D570, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v6, "applyUserSettings:properties:error:", v5, v7, &v12);
  v9 = v12;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    -[WFClient _notifyWiFiPropertyChanged:value:](self, "_notifyWiFiPropertyChanged:value:", CFSTR("kWFClientUserInterfacePropertyHotspotAJKey"), v10);
  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_219FC8000, v10, v11, "failed to set auto hotspot join option to %ld, error='%@'", buf, 0x16u);
    }
  }

  self->_autoInstantHotspotJoinOption = a3;
}

- (int64_t)_coreWiFiHotspotJoinOptionFromAutoHotspotMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

- (void)asyncUserAutoJoinState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFClient stateMonitorQueue](self, "stateMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WFClient_asyncUserAutoJoinState___block_invoke;
  v7[3] = &unk_24DC35378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__WFClient_asyncUserAutoJoinState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFClient asyncUserAutoJoinState:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userAutoJoinDisabled");

  if (v5 == objc_msgSend(*(id *)(a1 + 32), "userAutoJoinState"))
  {
    v6 = v5 ^ 1;
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFClient asyncUserAutoJoinState:]_block_invoke";
      v14 = 1024;
      v15 = v6;
      _os_log_impl(&dword_219FC8000, v7, v8, "%s: user auto join state changed to %d", buf, 0x12u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = v6;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__WFClient_asyncUserAutoJoinState___block_invoke_113;
    v10[3] = &unk_24DC35468;
    v9 = *(id *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

uint64_t __35__WFClient_asyncUserAutoJoinState___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "userAutoJoinState"));
}

- (void)setUserAutoJoinState:(BOOL)a3
{
  -[WFClient setUserAutoJoinState:completion:](self, "setUserAutoJoinState:completion:", a3, 0);
}

- (void)setUserAutoJoinState:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WFClient_setUserAutoJoinState_completion___block_invoke;
  block[3] = &unk_24DC35990;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __44__WFClient_setUserAutoJoinState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  int v5;
  void *v6;
  _BOOL8 v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 23);
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFClient setUserAutoJoinState:completion:]_block_invoke";
    v15 = 1024;
    v16 = v4;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: setting user auto join state to %d (current state=%d)", buf, 0x18u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = *(_BYTE *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(a1 + 48) == 0;
  v12 = 0;
  objc_msgSend(v6, "setUserAutoJoinDisabled:error:", v7, &v12);
  v8 = (char *)v12;

  if (v8)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_219FC8000, v9, v10, "Failed to set user auto join state, error: %@", buf, 0xCu);
    }

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

- (void)_userAutoJoinStateDidChange:(BOOL)a3 info:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v10 = 136315650;
    v11 = "-[WFClient _userAutoJoinStateDidChange:info:]";
    v12 = 1024;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: enabled %d info %@", (uint8_t *)&v10, 0x1Cu);
  }

  self->_userAutoJoinState = v4;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("WFClientUserAutoJoinStateChangedNotification"), self);

}

- (void)_managedConfigurationDidChange:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFClient _managedConfigurationDidChange:]";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s- userInfo %@", buf, 0x16u);

    }
  }

  v9 = dispatch_time(0, 500000000);
  -[WFClient serialClientQueue](self, "serialClientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__WFClient__managedConfigurationDidChange___block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_after(v9, v10, block);

  v12 = dispatch_time(0, 100000000);
  -[WFClient serialClientQueue](self, "serialClientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __43__WFClient__managedConfigurationDidChange___block_invoke_2;
  v14[3] = &unk_24DC348F8;
  v14[4] = self;
  dispatch_after(v12, v13, v14);

}

uint64_t __43__WFClient__managedConfigurationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNetworkRestrictionActive");
}

uint64_t __43__WFClient__managedConfigurationDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerModificationDisableState");
}

- (void)_askToJoinNotification:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFClient _askToJoinNotification:]";
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s- notificationId %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3, CFSTR("WFClientNotificationIdKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WFClientAskToJoinNotification"), self, v8);

}

- (void)_trustNotificationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4 data:(id)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  __WiFiNetwork *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "-[WFClient _trustNotificationWithID:network:data:]";
    v17 = 1024;
    v18 = v6;
    v19 = 2112;
    v20 = a4;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_219FC8000, v9, v10, "%s- notificationId %d network %@ data %@", buf, 0x26u);
  }

  v11 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("WFClientNotificationIdKey"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v13, "setObject:forKey:", a4, CFSTR("WFClientNotificationNetworkKey"));
  if (v8)
    objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("WFClientEAPTrustNotificationRequestedDataKey"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("WFClientEAPTrustNotification"), self, v13);

}

- (void)asyncMISState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFClient stateMonitorQueue](self, "stateMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__WFClient_asyncMISState___block_invoke;
  v7[3] = &unk_24DC35378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __26__WFClient_asyncMISState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int MISState;
  NSObject *v5;
  os_log_type_t v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFClient asyncMISState:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "manager");
  MISState = WiFiManagerClientGetMISState();
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFClient asyncMISState:]_block_invoke";
    v12 = 1024;
    v13 = MISState != 0;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: MIS state %d", buf, 0x12u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __26__WFClient_asyncMISState___block_invoke_115;
    v7[3] = &unk_24DC35350;
    v8 = *(id *)(a1 + 40);
    v9 = MISState != 0;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __26__WFClient_asyncMISState___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setMISState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFClient setMISState:]";
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: setting MIS state %d", buf, 0x12u);
  }

  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __24__WFClient_setMISState___block_invoke;
  v8[3] = &unk_24DC35940;
  v8[4] = self;
  v9 = v3;
  dispatch_async(v7, v8);

}

uint64_t __24__WFClient_setMISState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "manager");
  return WiFiManagerClientSetMISState();
}

- (void)asyncMISDiscoveryState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFClient stateMonitorQueue](self, "stateMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WFClient_asyncMISDiscoveryState___block_invoke;
  v7[3] = &unk_24DC35378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__WFClient_asyncMISDiscoveryState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int MISDiscoveryState;
  NSObject *v5;
  os_log_type_t v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFClient asyncMISDiscoveryState:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "manager");
  MISDiscoveryState = WiFiManagerClientGetMISDiscoveryState();
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFClient asyncMISDiscoveryState:]_block_invoke";
    v12 = 1024;
    v13 = MISDiscoveryState != 0;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: MIS discovery state %d", buf, 0x12u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__WFClient_asyncMISDiscoveryState___block_invoke_116;
    v7[3] = &unk_24DC35350;
    v8 = *(id *)(a1 + 40);
    v9 = MISDiscoveryState != 0;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __35__WFClient_asyncMISDiscoveryState___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFClient setMISDiscoveryState:immediateDisable:]";
    v15 = 1024;
    v16 = v5;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: setting MIS discovery state %d (immediateDisable %d)", buf, 0x18u);
  }

  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__WFClient_setMISDiscoveryState_immediateDisable___block_invoke;
  v10[3] = &unk_24DC34F98;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  dispatch_async(v9, v10);

}

uint64_t __50__WFClient_setMISDiscoveryState_immediateDisable___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "manager");
  return WiFiManagerClientSetMISDiscoveryState();
}

- (void)dispatchCertificateTrustAction:(int64_t)a3 profile:(id)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "ssid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[WFClient dispatchCertificateTrustAction:profile:]";
      v15 = 2048;
      v16 = a3;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_219FC8000, v9, v8, "%s: dispatching trust action %lu for network %@", (uint8_t *)&v13, 0x20u);

    }
  }

  if (v6)
  {
    objc_msgSend(v6, "networkAttributes");
    v11 = objc_claimAutoreleasedReturnValue();
    -[WFClient manager](self, "manager");
    WiFiManagerClientDispatchNotificationResponse();
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = 136315138;
      v14 = "-[WFClient dispatchCertificateTrustAction:profile:]";
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: nil profile provided", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)_joinRecommendationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4
{
  void *v6;
  void *v7;
  WFNetworkProfile *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("WFClientNotificationIdKey"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v8 = -[WFNetworkProfile initWithNetworkRef:]([WFNetworkProfile alloc], "initWithNetworkRef:", a4);
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("WFClientNotificationNetworkProfileKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WFClientAutoJoinRecommendationNotification"), self, v10);

}

- (void)dispatchJoinRecommendationAction:(int64_t)a3 profile:(id)a4
{
  int v4;
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "ssid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[WFClient dispatchJoinRecommendationAction:profile:]";
      v15 = 1024;
      v16 = v4;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_219FC8000, v9, v8, "%s: dispatching auto join action %d for network %@", (uint8_t *)&v13, 0x1Cu);

    }
  }

  if (v6)
  {
    objc_msgSend(v6, "networkAttributes");
    v11 = objc_claimAutoreleasedReturnValue();
    -[WFClient manager](self, "manager");
    WiFiManagerClientDispatchNotificationResponse();
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = 136315138;
      v14 = "-[WFClient dispatchJoinRecommendationAction:profile:]";
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: nil profile provided", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)dispatchAskToJoinAction:(unint64_t)a3 notificationId:(unsigned int)a4 network:(id)a5
{
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    v14 = 136315650;
    v15 = "-[WFClient dispatchAskToJoinAction:notificationId:network:]";
    v16 = 2048;
    v17 = a3;
    v18 = 1024;
    v19 = a4;
    _os_log_impl(&dword_219FC8000, v9, v10, "%s: dispatching ask to join action %lu for notificationId %d", (uint8_t *)&v14, 0x1Cu);
  }

  if (a3 <= 2)
  {
    if (v8)
      goto LABEL_7;
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  if (!v8)
    goto LABEL_13;
LABEL_7:
  objc_msgSend(v8, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
  {
    v14 = 136315394;
    v15 = "-[WFClient dispatchAskToJoinAction:notificationId:network:]";
    v16 = 2112;
    v17 = (unint64_t)v8;
    _os_log_impl(&dword_219FC8000, v12, v13, "%s: network %@", (uint8_t *)&v14, 0x16u);
  }

LABEL_14:
  -[WFClient manager](self, "manager");
  WiFiManagerClientDispatchNotificationResponse();

}

- (void)setClientTypeAsForeground
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315138;
    v6 = "-[WFClient setClientTypeAsForeground]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: Setting client type as foreground", (uint8_t *)&v5, 0xCu);
  }

  -[WFClient manager](self, "manager");
  WiFiManagerClientSetType();
}

- (NSString)hardwareMACAddress
{
  const __CFData *v2;
  const __CFData *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  -[WFClient manager](self, "manager");
  v2 = (const __CFData *)WiFiManagerClientCopyProperty();
  if (!v2
    || (v3 = v2,
        WFConvertEthernetNetworkAddressToString(v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        CFRelease(v3),
        !v4))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "Fail to get hardware MAC Address!", v8, 2u);
    }

    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setRandomAddressModeForNetwork:(id)a3 mode:(unint64_t)a4 randomMAC:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  WFClient *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__WFClient_setRandomAddressModeForNetwork_mode_randomMAC___block_invoke;
  v13[3] = &unk_24DC35A08;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __58__WFClient_setRandomAddressModeForNetwork_mode_randomMAC___block_invoke(_QWORD *a1)
{
  void *v2;
  ether_addr *v3;
  CFDataRef v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  int v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (!v2)
  {
    v14 = WiFiManagerClientSetPrivateMacPrefForScanRecord();
    WFLogForCategory(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v15 = v6 == 0;
    else
      v15 = 1;
    v16 = !v15;
    if (v14)
    {
      if (v16 && os_log_type_enabled(v6, v7))
        goto LABEL_13;
      goto LABEL_31;
    }
    if (!v16 || !os_log_type_enabled(v6, v7))
      goto LABEL_31;
LABEL_29:
    v17 = a1[6];
    v18 = a1[7];
    v19 = a1[4];
    v20 = 138412802;
    v21 = v17;
    v22 = 2048;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v13 = "failed to save private address for '%@' (mode=%lu, address='%@')";
    goto LABEL_30;
  }
  v3 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
  v4 = CFDataCreate(0, v3->octet, 6);
  v5 = WiFiManagerClientSetPrivateMacPrefForScanRecord();
  if (v4)
    CFRelease(v4);
  WFLogForCategory(8uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v5)
  {
    if (!v9 || !os_log_type_enabled(v6, v7))
      goto LABEL_31;
    goto LABEL_29;
  }
  if (v9 && os_log_type_enabled(v6, v7))
  {
LABEL_13:
    v10 = a1[6];
    v11 = a1[7];
    v12 = a1[4];
    v20 = 138412802;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v13 = "saved private address for '%@' (mode=%lu, address='%@')";
LABEL_30:
    _os_log_impl(&dword_219FC8000, v6, v7, v13, (uint8_t *)&v20, 0x20u);
  }
LABEL_31:

}

- (void)setEnableRandomMACForNetwork:(id)a3 enable:(BOOL)a4 randomMAC:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 3;
  -[WFClient setRandomAddressModeForNetwork:mode:randomMAC:](self, "setRandomAddressModeForNetwork:mode:randomMAC:", a3, v5, a5);
}

- (id)newRandomMACAddressForSSID:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  os_log_type_t v7;
  const void *v8;
  NSObject *v9;
  os_log_type_t v10;
  const __CFData *PrivateMacAddress;
  const __CFData *v12;
  void *v13;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFClient manager](self, "manager");
  v5 = (const void *)WiFiManagerClientCopyProperty();
  if (!v5)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_219FC8000, v6, v7, "Fail to read hardwareData", (uint8_t *)&v17, 2u);
    }

  }
  -[WFClient manager](self, "manager");
  v8 = (const void *)WiFiManagerClientCopyProperty();
  if (!v8)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_219FC8000, v9, v10, "Fail to read specifierData", (uint8_t *)&v17, 2u);
    }

  }
  -[WFClient manager](self, "manager");
  WiFiManagerClientCopyProperty();
  PrivateMacAddress = (const __CFData *)WiFiManagerClientCreatePrivateMacAddress();
  v12 = PrivateMacAddress;
  if (PrivateMacAddress)
  {
    WFConvertEthernetNetworkAddressToString(PrivateMacAddress);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  WFLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_219FC8000, v15, v16, "Fail to generate random MAC for ssid: %@", (uint8_t *)&v17, 0xCu);
  }

  v13 = 0;
  if (v5)
LABEL_15:
    CFRelease(v5);
LABEL_16:
  if (v12)
    CFRelease(v12);
  if (v8)
    CFRelease(v8);

  return v13;
}

- (void)_updateOSSpecificAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE29F38]);
  objc_msgSend(v5, "setOSSpecificAttributes:", v4);
  -[WFClient cInterface](self, "cInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "applyUserSettings:properties:error:", v5, 0, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_219FC8000, v9, v10, "failed to set OSSpecificAttributes for %@, error='%@'", buf, 0x16u);
    }

  }
}

- (BOOL)isNetworkRestrictionActive
{
  return self->_networkRestrictionActive;
}

- (BOOL)isKnownNetworkUIEnabled
{
  return self->_isKnownNetworkUIEnabled;
}

- (unint64_t)airplaneModeBehavior
{
  return self->_airplaneModeBehavior;
}

- (NSString)whitelistingUUID
{
  return self->_whitelistingUUID;
}

- (BOOL)isWAPIEnabled
{
  return self->_WAPIEnabled;
}

- (BOOL)isDiagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (int64_t)askToJoinMode
{
  return self->_askToJoinMode;
}

- (BOOL)isPowerModificationDisabled
{
  return self->_powerModificationDisabled;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (int64_t)autoInstantHotspotJoinOption
{
  return self->_autoInstantHotspotJoinOption;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (NSRunLoop)callbackRunLoop
{
  return (NSRunLoop *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCallbackRunLoop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)showAllHS20Networks
{
  return self->_showAllHS20Networks;
}

- (void)setShowAllHS20Networks:(BOOL)a3
{
  self->_showAllHS20Networks = a3;
}

- (BOOL)isWiFiHealthUIDisabled
{
  return self->_wiFiHealthUIDisabled;
}

- (void)setWiFiHealthUIDisabled:(BOOL)a3
{
  self->_wiFiHealthUIDisabled = a3;
}

- (BOOL)extraLoggingEnabled
{
  return self->_extraLoggingEnabled;
}

- (void)setExtraLoggingEnabled:(BOOL)a3
{
  self->_extraLoggingEnabled = a3;
}

- (BOOL)isDiagnosticsModeEnabled
{
  return self->_diagnosticsModeEnabled;
}

- (void)setDiagnosticsModeEnabled:(BOOL)a3
{
  self->_diagnosticsModeEnabled = a3;
}

- (BOOL)isNANUIEnabled
{
  return self->_nanUIEnabled;
}

- (void)setNanUIEnabled:(BOOL)a3
{
  self->_nanUIEnabled = a3;
}

- (NSNumber)rssiThresholdNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRssiThresholdNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)userAutoJoinState
{
  return self->_userAutoJoinState;
}

- (OS_dispatch_queue)serialClientQueue
{
  return self->_serialClientQueue;
}

- (void)setSerialClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialClientQueue, a3);
}

- (void)setStateMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateMonitorQueue, a3);
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (void)setCellularOutrankWiFiNotificationToken:(int)a3
{
  self->_cellularOutrankWiFiNotificationToken = a3;
}

- (void)setCellularOutrankWiFiSymtpomsState:(unint64_t)a3
{
  self->_cellularOutrankWiFiSymtpomsState = a3;
}

- (void)setCellularOutrankState:(unint64_t)a3
{
  self->_cellularOutrankState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitorQueue, 0);
  objc_storeStrong((id *)&self->_serialClientQueue, 0);
  objc_storeStrong((id *)&self->_rssiThresholdNumber, 0);
  objc_storeStrong((id *)&self->_callbackRunLoop, 0);
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_whitelistingUUID, 0);
}

@end
