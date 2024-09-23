@implementation WFSettingsController

- (WFSettingsController)initWithDetailsContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFSettingsController *v7;

  v4 = (void *)MEMORY[0x24BEC2918];
  v5 = a3;
  objc_msgSend(v4, "defaultAppearanceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFSettingsController initWithDetailsContext:appearanceProxy:](self, "initWithDetailsContext:appearanceProxy:", v5, v6);

  return v7;
}

- (WFSettingsController)initWithDetailsContext:(id)a3 appearanceProxy:(id)a4
{
  id v7;
  id v8;
  WFSettingsController *v9;
  WFSettingsController *v10;
  void *v11;
  uint64_t v12;
  WFNetworkScanRecord *network;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  NSOperationQueue *v18;
  NSOperationQueue *queue;
  NSOperationQueue *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 cloudSyncRunning;
  uint64_t v24;
  WFIPMonitor *ipMonitor;
  uint64_t v26;
  WFNetworkSettingsConfig *config;
  uint64_t v28;
  NSString *hardwareMACAddress;
  uint64_t v30;
  WFNetworkSettingsViewController *settingsViewController;
  void *v32;
  NSObject *v34;
  uint64_t v35;
  const char *v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)WFSettingsController;
  v9 = -[WFSettingsController init](&v37, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_34;
  if (!v7)
  {
    WFLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35))
      goto LABEL_33;
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: details context is nil";
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v9->_detailsContext, a3);
  objc_storeStrong((id *)&v10->_appearanceProxy, a4);
  -[WFAppearanceProxy apply](v10->_appearanceProxy, "apply");
  -[WFDetailsContext network](v10->_detailsContext, "network");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    WFLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35))
      goto LABEL_33;
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: network is nil";
    goto LABEL_32;
  }
  -[WFDetailsContext network](v10->_detailsContext, "network");
  v12 = objc_claimAutoreleasedReturnValue();
  network = v10->_network;
  v10->_network = (WFNetworkScanRecord *)v12;

  WFLogForCategory(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      -[WFDetailsContext profile](v10->_detailsContext, "profile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_219FC8000, v16, v15, "%s: provided profile %@", buf, 0x16u);

    }
  }

  v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
  queue = v10->_queue;
  v10->_queue = v18;

  v20 = v10->_queue;
  if (!v20)
    goto LABEL_34;
  -[NSOperationQueue setName:](v20, "setName:", CFSTR("WFSettingsController Queue"));
  -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_queue, "setMaxConcurrentOperationCount:", 1);
  -[NSOperationQueue setQualityOfService:](v10->_queue, "setQualityOfService:", -1);
  v10->_cloudSyncRunning = WiFiCloudSyncEngineIsRunning() != 0;
  WFLogForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
  {
    cloudSyncRunning = v10->_cloudSyncRunning;
    *(_DWORD *)buf = 136315394;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v40 = 1024;
    LODWORD(v41) = cloudSyncRunning;
    _os_log_impl(&dword_219FC8000, v21, v22, "%s: cloudSyncRunning %d", buf, 0x12u);
  }

  -[WFDetailsContext ipMonitor](v10->_detailsContext, "ipMonitor");
  v24 = objc_claimAutoreleasedReturnValue();
  ipMonitor = v10->_ipMonitor;
  v10->_ipMonitor = (WFIPMonitor *)v24;

  if (!v10->_ipMonitor)
  {
    WFLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v34 || !os_log_type_enabled(v34, (os_log_type_t)v35))
      goto LABEL_33;
    *(_DWORD *)buf = 136315138;
    v39 = "-[WFSettingsController initWithDetailsContext:appearanceProxy:]";
    v36 = "%s: ipmonitor is nil";
LABEL_32:
    _os_log_impl(&dword_219FC8000, v34, (os_log_type_t)v35, v36, buf, 0xCu);
LABEL_33:

LABEL_34:
    v10 = 0;
    goto LABEL_19;
  }
  v10->_currentNetwork = -[WFDetailsContext isCurrent](v10->_detailsContext, "isCurrent");
  -[WFSettingsController _baseConfigForNetwork:current:](v10, "_baseConfigForNetwork:current:", v10->_network, -[WFDetailsContext isCurrent](v10->_detailsContext, "isCurrent"));
  v26 = objc_claimAutoreleasedReturnValue();
  config = v10->_config;
  v10->_config = (WFNetworkSettingsConfig *)v26;

  if (!v10->_config)
    goto LABEL_34;
  -[WFSettingsController _refreshSettingsConfig:](v10, "_refreshSettingsConfig:");
  objc_msgSend(v7, "hardwareMACAddress");
  v28 = objc_claimAutoreleasedReturnValue();
  hardwareMACAddress = v10->_hardwareMACAddress;
  v10->_hardwareMACAddress = (NSString *)v28;

  v30 = objc_msgSend(objc_alloc(MEMORY[0x24BEC2980]), "initWithConfig:detailsContext:hardwareMACAddress:appearanceProxy:", v10->_config, v10->_detailsContext, v10->_hardwareMACAddress, v10->_appearanceProxy);
  settingsViewController = v10->_settingsViewController;
  v10->_settingsViewController = (WFNetworkSettingsViewController *)v30;

  -[WFNetworkSettingsViewController setDeviceCapability:](v10->_settingsViewController, "setDeviceCapability:", WFCurrentDeviceCapability());
  -[WFNetworkSettingsViewController setDataCoordinator:](v10->_settingsViewController, "setDataCoordinator:", v10);
  if (!v10->_settingsViewController)
    goto LABEL_34;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", v10, sel__currentNetworkDidChange_, CFSTR("WFInterfaceNetworkChangedNotification"), 0);

  if (-[WFDetailsContext isCurrent](v10->_detailsContext, "isCurrent"))
    -[WFSettingsController _startMontoringIPChanges](v10, "_startMontoringIPChanges");
LABEL_19:

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFInterfaceNetworkChangedNotification"), 0);

  -[WFSettingsController _stopMonitoringIPChanges](self, "_stopMonitoringIPChanges");
  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  v4.receiver = self;
  v4.super_class = (Class)WFSettingsController;
  -[WFSettingsController dealloc](&v4, sel_dealloc);
}

- (void)_currentNetworkDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFInterfaceNetworkKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[WFSettingsController detailsContext](self, "detailsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEquivalentRecord:", v10);

  if (v7 != -[WFSettingsController isCurrentNetwork](self, "isCurrentNetwork"))
  {
    self->_currentNetwork = v7;
    -[WFSettingsController network](self, "network");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSettingsController _baseConfigForNetwork:current:](self, "_baseConfigForNetwork:current:", v8, v10 != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSettingsController _refreshSettingsConfig:](self, "_refreshSettingsConfig:", v9);
    if (self->_currentNetwork)
    {
      if (!self->_monitorIPChanges)
      {
        -[WFSettingsController _startMontoringIPChanges](self, "_startMontoringIPChanges");
LABEL_7:

        goto LABEL_8;
      }
    }
    else if (!self->_monitorIPChanges)
    {
      goto LABEL_7;
    }
    -[WFSettingsController _stopMonitoringIPChanges](self, "_stopMonitoringIPChanges");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_stopMonitoringIPChanges
{
  void *v3;

  if (self->_monitorIPChanges)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFIPMonitorStateChangedNotification"), 0);

    self->_monitorIPChanges = 0;
  }
}

- (void)_startMontoringIPChanges
{
  void *v3;
  id v4;

  if (!self->_monitorIPChanges)
  {
    self->_monitorIPChanges = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[WFSettingsController ipMonitor](self, "ipMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__ipStateDidChange_, CFSTR("WFIPMonitorStateChangedNotification"), v3);

  }
}

- (void)_ipStateDidChange:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 136315394;
      v11 = "-[WFSettingsController _ipStateDidChange:]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s- %@", (uint8_t *)&v10, 0x16u);

    }
  }

  if (-[WFSettingsController isCurrentNetwork](self, "isCurrentNetwork"))
  {
    -[WFSettingsController config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSettingsController _refreshSettingsConfig:](self, "_refreshSettingsConfig:", v9);

  }
}

- (id)_baseConfigForNetwork:(id)a3 current:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v26;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  BOOL v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  os_log_type_t v39;
  NSObject *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  os_log_type_t v45;
  NSObject *v46;
  int v47;
  _BOOL8 v48;
  void *v49;
  os_log_type_t v50;
  NSObject *v51;
  int v52;
  void *v53;
  void *v54;
  os_log_type_t v55;
  NSObject *v56;
  int v57;
  void *v58;
  void *v59;
  os_log_type_t v60;
  int v61;
  int v62;
  uint64_t v63;
  int v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  os_log_type_t v69;
  NSObject *v70;
  int v71;
  _BOOL8 v72;
  void *v73;
  os_log_type_t v74;
  NSObject *v75;
  int v76;
  int v78;
  int v79;
  id v80;
  uint8_t buf[4];
  _BYTE v82[10];
  _BYTE v83[6];
  __int16 v84;
  int v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  int v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v4 = a4;
  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BEC2978]);
  -[WFSettingsController detailsContext](self, "detailsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "entryContext") != 2)
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "isHotspot20");

  if (!v9)
  {
LABEL_6:
    objc_msgSend(v6, "ssid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSsid:", v10);
    goto LABEL_9;
  }
  -[WFSettingsController detailsContext](self, "detailsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayedOperatorName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[WFSettingsController detailsContext](self, "detailsContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayedOperatorName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSsid:", v15);

  }
  else
  {
    objc_msgSend(v6, "ssid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSsid:", v13);
  }

LABEL_9:
  -[WFSettingsController detailsContext](self, "detailsContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayFriendlyName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[WFSettingsController detailsContext](self, "detailsContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayFriendlyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayFriendlyName:", v21);

  }
  else
  {
    objc_msgSend(v7, "ssid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayFriendlyName:", v19);
  }

  -[WFSettingsController ipMonitor](self, "ipMonitor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHttpProxyConfigurable:", objc_msgSend(v22, "globalProxyIsEnabled") ^ 1);

  objc_msgSend(v7, "setCurrent:", v4);
  -[WFSettingsController detailsContext](self, "detailsContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v4)
  {
    objc_msgSend(v7, "setDiagnosable:", objc_msgSend(v23, "diagnosable"));

    -[WFSettingsController detailsContext](self, "detailsContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recommendations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHealthRecommendations:", v26);

    objc_msgSend(v7, "setForgetable:", 1);
    WFLogForCategory(0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v27)
    {
      v29 = v27;
      if (os_log_type_enabled(v29, v28))
      {
        objc_msgSend(v7, "healthRecommendations");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v82 = v30;
        _os_log_impl(&dword_219FC8000, v29, v28, "Health recommendations %@", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(v7, "setJoinable:", objc_msgSend(v23, "isJoinable"));

    objc_msgSend(v7, "setCanRenewLease:", 0);
  }
  -[WFDetailsContext profile](self->_detailsContext, "profile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v34 = v32 == 0;
  else
    v34 = 1;
  v35 = !v34;
  if (v31)
  {
    v80 = v6;
    if (v35 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v82 = v31;
      _os_log_impl(&dword_219FC8000, v32, v33, "Found profile %@", buf, 0xCu);
    }

    objc_msgSend(v7, "setAutoJoinConfigurable:", objc_msgSend(v31, "autoJoinConfigurable"));
    if (objc_msgSend(v7, "autoJoinConfigurable"))
    {
      objc_msgSend(v7, "setAutoJoinEnabled:", objc_msgSend(v31, "isAutoJoinDisabled") ^ 1);
      if (-[WFDetailsContext autoJoinEnabled](self->_detailsContext, "autoJoinEnabled"))
        objc_msgSend(v7, "setAutoJoinEnabled:", 1);
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "processEvent:", v37);

      WFLogForCategory(0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v38)
      {
        v40 = v38;
        if (os_log_type_enabled(v40, v39))
        {
          v41 = objc_msgSend(v7, "autoJoinEnabled");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v41;
          _os_log_impl(&dword_219FC8000, v40, v39, "Auto join enabled %d", buf, 8u);
        }

      }
    }
    objc_msgSend(v7, "setAutoLoginConfigurable:", objc_msgSend(v31, "autoLoginConfigurable"));
    if (objc_msgSend(v7, "autoLoginConfigurable"))
    {
      objc_msgSend(v7, "setAutoLoginEnabled:", objc_msgSend(v31, "bypassCaptive") ^ 1);
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "processEvent:", v43);

      WFLogForCategory(0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v44)
      {
        v46 = v44;
        if (os_log_type_enabled(v46, v45))
        {
          v47 = objc_msgSend(v7, "autoLoginEnabled");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v47;
          _os_log_impl(&dword_219FC8000, v46, v45, "Auto login enabled %d", buf, 8u);
        }

      }
    }
    objc_msgSend(v7, "setSaveDataModeConfigurable:", objc_msgSend(v31, "saveDataModeConfigurable"));
    if (objc_msgSend(v7, "saveDataModeConfigurable"))
    {
      if (objc_msgSend(v31, "lowDataMode") == 1)
      {
        v48 = 1;
      }
      else if (objc_msgSend(v31, "isPersonalHotspot"))
      {
        v48 = objc_msgSend(v31, "lowDataMode") == 0;
      }
      else
      {
        v48 = 0;
      }
      objc_msgSend(v7, "setIsInSaveDataMode:", v48);
      WFLogForCategory(0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49)
      {
        v51 = v49;
        if (os_log_type_enabled(v51, v50))
        {
          v52 = objc_msgSend(v7, "isInSaveDataMode");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v52;
          _os_log_impl(&dword_219FC8000, v51, v50, "Data-saver mode enabled %d", buf, 8u);
        }

      }
    }
    -[WFSettingsController detailsContext](self, "detailsContext");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrivacyProxyTierStatus:", objc_msgSend(v53, "privacyProxyTierStatus"));

    if (objc_msgSend(v7, "privacyProxyTierStatus"))
    {
      objc_msgSend(v7, "setPrivacyProxyEnabled:", objc_msgSend(v31, "isPrivacyProxyEnabled"));
      WFLogForCategory(0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v54)
      {
        v56 = v54;
        if (os_log_type_enabled(v56, v55))
        {
          v57 = objc_msgSend(v7, "privacyProxyEnabled");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v82 = v57;
          _os_log_impl(&dword_219FC8000, v56, v55, "Privacy Proxy enabled %d", buf, 8u);
        }

      }
    }
    objc_msgSend(v7, "setNetworkQualityVisible:", objc_msgSend(v31, "networkQualityVisible"));
    if (objc_msgSend(v7, "networkQualityVisible"))
    {
      objc_msgSend(v31, "networkQualityResponsiveness");
      objc_msgSend(v7, "setNetworkQualityResponsiveness:");
      objc_msgSend(v31, "networkQualityDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "copy");
      objc_msgSend(v7, "setNetworkQualityDate:", v59);

    }
    objc_msgSend(v7, "setForgetable:", objc_msgSend(v31, "forgetable"));
    WFLogForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    v60 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v32)
    {
      v32 = v32;
      if (os_log_type_enabled(v32, v60))
      {
        v79 = objc_msgSend(v7, "autoJoinConfigurable");
        v78 = objc_msgSend(v7, "autoLoginConfigurable");
        v61 = objc_msgSend(v7, "saveDataModeConfigurable");
        v62 = objc_msgSend(v7, "forgetable");
        v63 = objc_msgSend(v7, "privacyProxyTierStatus");
        v64 = objc_msgSend(v7, "networkQualityVisible");
        -[WFDetailsContext portalURL](self->_detailsContext, "portalURL");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v82 = v79;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v78;
        *(_WORD *)v83 = 1024;
        *(_DWORD *)&v83[2] = v61;
        v84 = 1024;
        v85 = v62;
        v86 = 2048;
        v87 = v63;
        v6 = v80;
        v88 = 1024;
        v89 = v64;
        v90 = 2112;
        v91 = v65;
        _os_log_impl(&dword_219FC8000, v32, v60, "Network Details: Auto join configurable=%d, Auto login configurable=%d, Data-saver configurable=%d, Forgetable=%d, Privacy Proxy Configurable=%ld, Network Quality Visible=%d, portalURL='%@'", buf, 0x34u);

      }
    }
  }
  else if (v35 && os_log_type_enabled(v32, v33))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v82 = v6;
    _os_log_impl(&dword_219FC8000, v32, v33, "No existing profile for network %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "isAirPortBaseStation"))
  {
    v66 = v6;
    -[WFSettingsController detailsContext](self, "detailsContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setManageable:", objc_msgSend(v67, "supportsAirportManagement"));

    WFLogForCategory(0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v68)
    {
      v70 = v68;
      if (os_log_type_enabled(v70, v69))
      {
        v71 = objc_msgSend(v7, "manageable");
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v82 = "-[WFSettingsController _baseConfigForNetwork:current:]";
        *(_WORD *)&v82[8] = 1024;
        *(_DWORD *)v83 = v71;
        _os_log_impl(&dword_219FC8000, v70, v69, "%s: airport management supported %d", buf, 0x12u);
      }

    }
    v6 = v66;
  }
  if (objc_msgSend(v6, "isCloudSyncable"))
    v72 = -[WFSettingsController cloudSyncRunning](self, "cloudSyncRunning");
  else
    v72 = 0;
  objc_msgSend(v7, "setCloudSyncable:", v72);
  WFLogForCategory(0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v73)
  {
    v75 = v73;
    if (os_log_type_enabled(v75, v74))
    {
      v76 = objc_msgSend(v7, "cloudSyncable");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v82 = "-[WFSettingsController _baseConfigForNetwork:current:]";
      *(_WORD *)&v82[8] = 1024;
      *(_DWORD *)v83 = v76;
      _os_log_impl(&dword_219FC8000, v75, v74, "%s: network cloudSyncable %d", buf, 0x12u);
    }

  }
  return v7;
}

- (void)_refreshSettingsConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFGetSettingsOperation *v8;
  void *v9;
  void *v10;
  WFGetSettingsOperation *v11;
  WFGetSettingsOperation *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  WFSettingsController *v21;
  id v22;
  _QWORD *v23;
  id v24;
  id location;
  _QWORD v26[5];
  WFGetSettingsOperation *v27;

  v4 = a3;
  -[WFSettingsController detailsContext](self, "detailsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interfaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [WFGetSettingsOperation alloc];
  -[WFSettingsController network](self, "network");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ssid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFGetSettingsOperation initWithSSID:interfaceName:](v8, "initWithSSID:interfaceName:", v10, v7);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  v12 = v11;
  v27 = v12;
  v13 = (id)objc_msgSend(v4, "copy");
  objc_initWeak(&location, self);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __47__WFSettingsController__refreshSettingsConfig___block_invoke;
  v19 = &unk_24DC36090;
  v23 = v26;
  objc_copyWeak(&v24, &location);
  v20 = v13;
  v21 = self;
  v14 = v20;
  v22 = v14;
  -[WFGetSettingsOperation setCompletionBlock:](v12, "setCompletionBlock:", &v16);
  -[WFSettingsController queue](self, "queue", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v12);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_2;
  block[3] = &unk_24DC36090;
  v9 = *(_QWORD *)(a1 + 56);
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v10);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_type_t v29;
  NSObject *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_type_t v37;
  NSObject *v38;
  char *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  os_log_type_t v44;
  NSObject *v45;
  char *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  os_log_type_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  os_log_type_t v63;
  NSObject *v64;
  const __CFString *v65;
  void *v66;
  uint64_t v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  os_log_type_t v72;
  NSObject *v73;
  const char *v74;
  void *v75;
  os_log_type_t v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint32_t v86;
  os_log_type_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  os_log_type_t v96;
  NSObject *v97;
  char *v98;
  void *v99;
  os_log_type_t v100;
  NSObject *v101;
  char *v102;
  void *v103;
  os_log_type_t v104;
  NSObject *v105;
  char *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  char *v113;
  id v114;
  NSObject *v115;
  os_log_type_t v116;
  const char *v117;
  void *v118;
  void *v119;
  void *v120;
  os_log_type_t v121;
  NSObject *v122;
  uint64_t v123;
  const __CFString *v124;
  void *v125;
  os_log_type_t v126;
  NSObject *v127;
  char *v128;
  void *v129;
  os_log_type_t v130;
  NSObject *v131;
  char *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  char *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  NSObject *v141;
  os_log_type_t v142;
  void *v143;
  os_log_type_t v144;
  NSObject *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  os_log_type_t v151;
  void *v152;
  void *v153;
  _BOOL4 v154;
  void *v155;
  void *v156;
  NSObject *v157;
  int v158;
  void *v159;
  os_log_type_t v160;
  NSObject *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  os_log_type_t v166;
  NSObject *v167;
  os_log_type_t type;
  int location;
  id *from;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  void *v175;
  void *v176;
  id WeakRetained;
  void *v178;
  void *v179;
  _QWORD v180[4];
  id v181;
  char *v182;
  id v183;
  id v184;
  id v185;
  id v186;
  uint64_t v187;
  uint8_t buf[4];
  const char *v189;
  __int16 v190;
  void *v191;
  __int16 v192;
  _BYTE v193[18];
  uint64_t v194;

  v194 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 56;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "settings");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  from = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "ipMonitor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "isCurrentNetwork");
  objc_msgSend(v178, "ipv4Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v6;
  v7 = v6 != 0;
  if (v6)
    v8 = objc_msgSend(v6, "method");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = v5;
  else
    v9 = 0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 3;
  else
    v10 = v8;
  v174 = v7;
  if (v9 == 1)
    v10 = objc_msgSend(v179, "ipv4ConfigMethod");
  switch(v10)
  {
    case 1:
    case 3:
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "setIpv4Config:", v10 == 5);
      if (v10 == 5 || !objc_msgSend(WeakRetained, "isCurrentNetwork"))
      {
        WFLogForCategory(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v14)
        {
          v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219FC8000, v16, v15, "IPv4 config is BootP", buf, 2u);
          }

        }
      }
      else
      {
        WFLogForCategory(0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
        {
          v13 = v11;
          if (os_log_type_enabled(v13, v12))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219FC8000, v13, v12, "IPv4 config is automatic/DHCP", buf, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "setCanRenewLease:", 1);
      }
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "detailsContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "interface");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "IPv4Addresses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setIpv4Address:", v20);

          WFLogForCategory(0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v21)
          {
            v23 = v21;
            if (os_log_type_enabled(v23, v22))
            {
              objc_msgSend(*(id *)(a1 + 32), "ipv4Address");
              v24 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v189 = v24;
              _os_log_impl(&dword_219FC8000, v23, v22, "IPv4 Address %@", buf, 0xCu);

            }
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "detailsContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "interface");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "IPv4RouterAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(*(id *)(a1 + 32), "setIpv4RouterAddress:", v27);
          WFLogForCategory(0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v28)
          {
            v30 = v28;
            if (os_log_type_enabled(v30, v29))
            {
              objc_msgSend(*(id *)(a1 + 32), "ipv4RouterAddress");
              v31 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v189 = v31;
              _os_log_impl(&dword_219FC8000, v30, v29, "IPv4 Router %@", buf, 0xCu);

            }
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "detailsContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "interface");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "IPv4SubnetMasks");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v34, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setIpv4SubnetMask:", v35);

          WFLogForCategory(0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v36)
          {
            v38 = v36;
            if (os_log_type_enabled(v38, v37))
            {
              objc_msgSend(*(id *)(a1 + 32), "ipv4SubnetMask");
              v39 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v189 = v39;
              _os_log_impl(&dword_219FC8000, v38, v37, "IPv4 Subnet Mask %@", buf, 0xCu);

            }
          }

        }
        v40 = v10 == 5;
        objc_msgSend(v179, "ipv4DHCPClientID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
          v40 = 1;

        if (!v40)
        {
          objc_msgSend(v179, "ipv4DHCPClientID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setDhcpClientID:", v42);

          WFLogForCategory(0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v43)
          {
            v45 = v43;
            if (os_log_type_enabled(v45, v44))
            {
              objc_msgSend(*(id *)(a1 + 32), "dhcpClientID");
              v46 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v189 = v46;
              _os_log_impl(&dword_219FC8000, v45, v44, "IPv4 DHCP Client ID %@", buf, 0xCu);

            }
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "network");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "carPlayType") == 2;

        if (v48)
        {
          objc_msgSend(v179, "DHCPLeaseExpirationDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setDhcpLeaseExpirationDate:", v49);

        }
        goto LABEL_91;
      }
      goto LABEL_92;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "setIpv4Config:", 2);
      WFLogForCategory(0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v50)
      {
        v52 = v50;
        if (os_log_type_enabled(v52, v51))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219FC8000, v52, v51, "IPv4 config is manual", buf, 2u);
        }

      }
      if (v176)
      {
        objc_msgSend(v176, "addresses");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend(v176, "addresses");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = 0;
        }
        objc_msgSend(v176, "subnetMasks");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          objc_msgSend(v176, "subnetMasks");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = 0;
        }
        objc_msgSend(v176, "router");
        v59 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v5)
        {
          v34 = 0;
          v27 = 0;
          v19 = 0;
          goto LABEL_83;
        }
        objc_msgSend(v179, "ipv4Addresses");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v179, "ipv4Addresses");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = 0;
        }
        objc_msgSend(v179, "ipv4SubnetMasks");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(v179, "ipv4SubnetMasks");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = 0;
        }
        objc_msgSend(v179, "ipv4Router");
        v59 = objc_claimAutoreleasedReturnValue();
      }
      v27 = (void *)v59;
LABEL_83:
      WFLogForCategory(0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v62)
      {
        v64 = v62;
        if (os_log_type_enabled(v64, v63))
        {
          v65 = CFSTR("Setup:");
          *(_DWORD *)buf = 138413058;
          if (v176)
            v65 = CFSTR("Custom:");
          v189 = (const char *)v65;
          v190 = 2112;
          v191 = v19;
          v192 = 2112;
          *(_QWORD *)v193 = v27;
          *(_WORD *)&v193[8] = 2112;
          *(_QWORD *)&v193[10] = v34;
          _os_log_impl(&dword_219FC8000, v64, v63, "IPv4 (%@) Manual address %@, router %@, subnet mask: %@", buf, 0x2Au);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setIpv4AddressManual:", v19);
      objc_msgSend(*(id *)(a1 + 32), "setIpv4RouterAddressManual:", v27);
      objc_msgSend(*(id *)(a1 + 32), "setIpv4SubnetMaskManual:", v34);
LABEL_91:

LABEL_92:
      objc_msgSend(v178, "ipv6Settings");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v66;
      if (v66)
        v67 = objc_msgSend(v66, "method");
      else
        v67 = 0x7FFFFFFFFFFFFFFFLL;
      if (v67 == 0x7FFFFFFFFFFFFFFFLL)
        v68 = v5;
      else
        v68 = 0;
      if (v68 == 1)
      {
        v67 = objc_msgSend(v179, "ipv6ConfigMethod");
      }
      else if (!v5)
      {
        goto LABEL_153;
      }
      if (!v67)
        goto LABEL_153;
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 9);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "processEvent:", v70);

      switch(v67)
      {
        case 3:
          objc_msgSend(*(id *)(a1 + 32), "setIpv6Config:", 1);
          WFLogForCategory(0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v75)
          {
            v77 = v75;
            if (os_log_type_enabled(v77, v76))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v77, v76, "IPv6 config is manual", buf, 2u);
            }

          }
          if (!v175)
            goto LABEL_134;
          objc_msgSend(v175, "addresses");
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            objc_msgSend(v175, "addresses");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "firstObject");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setIpv6AddressManual:", v80);

          }
          objc_msgSend(v175, "router");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (v81)
          {
            objc_msgSend(v175, "router");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setIpv6RouterAddressManual:", v82);

          }
          objc_msgSend(v175, "prefixLengths");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v83)
            goto LABEL_134;
          objc_msgSend(v175, "prefixLengths");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "firstObject");
          v73 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setIpv6PrefixLengthManual:", v73);
          goto LABEL_132;
        case 2:
          objc_msgSend(*(id *)(a1 + 32), "setIpv6Config:", 2);
          WFLogForCategory(0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() < 4 || !v71)
            goto LABEL_133;
          v73 = v71;
          if (!os_log_type_enabled(v73, v72))
            goto LABEL_131;
          *(_WORD *)buf = 0;
          v74 = "IPv6 config is link local";
          break;
        case 1:
          objc_msgSend(*(id *)(a1 + 32), "setIpv6Config:", 0);
          WFLogForCategory(0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() < 4 || !v71)
            goto LABEL_133;
          v73 = v71;
          if (!os_log_type_enabled(v73, v72))
            goto LABEL_131;
          *(_WORD *)buf = 0;
          v74 = "IPv6 config is automatic";
          break;
        default:
          WFLogForCategory(0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v71)
            goto LABEL_133;
          v73 = v71;
          if (!os_log_type_enabled(v73, v87))
            goto LABEL_131;
          v88 = objc_msgSend(v179, "ipv6ConfigMethod");
          *(_DWORD *)buf = 134349056;
          v189 = (const char *)v88;
          v74 = "Unknown IPv6 configuration method %{public}lu";
          v84 = v73;
          v85 = v87;
          v86 = 12;
          goto LABEL_130;
      }
      v84 = v73;
      v85 = v72;
      v86 = 2;
LABEL_130:
      _os_log_impl(&dword_219FC8000, v84, v85, v74, buf, v86);
LABEL_131:
      v71 = v73;
LABEL_132:

LABEL_133:
LABEL_134:
      objc_msgSend(v179, "ipv6Addresses");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {

      }
      else
      {
        objc_msgSend(v179, "ipv6Router");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90 == 0;

        if (v91)
          goto LABEL_153;
      }
      objc_msgSend(v179, "ipv6Addresses");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setIpv6Addresses:", v92);

      objc_msgSend(v179, "ipv6PrefixLengths");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setIpv6PrefixLengths:", v93);

      objc_msgSend(v179, "ipv6Router");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setIpv6RouterAddress:", v94);

      WFLogForCategory(0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v95)
      {
        v97 = v95;
        if (os_log_type_enabled(v97, v96))
        {
          objc_msgSend(*(id *)(a1 + 32), "ipv6Addresses");
          v98 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v189 = v98;
          _os_log_impl(&dword_219FC8000, v97, v96, "IPv6 addresses %@", buf, 0xCu);

        }
      }

      WFLogForCategory(0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v99)
      {
        v101 = v99;
        if (os_log_type_enabled(v101, v100))
        {
          objc_msgSend(*(id *)(a1 + 32), "ipv6PrefixLengths");
          v102 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v189 = v102;
          _os_log_impl(&dword_219FC8000, v101, v100, "IPv6 prefix lengths %@", buf, 0xCu);

        }
      }

      WFLogForCategory(0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v103)
      {
        v105 = v103;
        if (os_log_type_enabled(v105, v104))
        {
          objc_msgSend(*(id *)(a1 + 32), "ipv6RouterAddress");
          v106 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v189 = v106;
          _os_log_impl(&dword_219FC8000, v105, v104, "IPv6 router address %@", buf, 0xCu);

        }
      }

LABEL_153:
      objc_msgSend(v178, "dnsSettings");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v107;
      if (v107)
      {
        objc_msgSend(v107, "searchDomains");
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v109)
        {
          objc_msgSend(v108, "searchDomains");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v173 = 0;
        }
        objc_msgSend(v108, "serverAddresses");
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        if (v118)
        {
          objc_msgSend(v108, "serverAddresses");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v172 = 0;
        }
        v110 = 1;
        v174 = 1;
        goto LABEL_180;
      }
      if (!v5)
      {
        v172 = 0;
        v173 = 0;
        v110 = 0;
        goto LABEL_180;
      }
      LODWORD(v110) = objc_msgSend(v179, "isUsingCustomDNSSettings");
      objc_msgSend(v179, "dnsSearchDomains");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "dnsDomainName");
      v112 = objc_claimAutoreleasedReturnValue();
      v113 = (char *)v112;
      if (v111)
      {
        v114 = v111;

        WFLogForCategory(0);
        v115 = objc_claimAutoreleasedReturnValue();
        v116 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v115)
          goto LABEL_175;
        v115 = v115;
        if (!os_log_type_enabled(v115, v116))
        {
LABEL_174:

LABEL_175:
          goto LABEL_176;
        }
        *(_DWORD *)buf = 138412290;
        v189 = (const char *)v114;
        v117 = "Using dnsSearchDomains (%@) for dns info";
LABEL_173:
        _os_log_impl(&dword_219FC8000, v115, v116, v117, buf, 0xCu);
        goto LABEL_174;
      }
      if (v112)
      {
        v187 = v112;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v187, 1);
        v114 = (id)objc_claimAutoreleasedReturnValue();
        WFLogForCategory(0);
        v115 = objc_claimAutoreleasedReturnValue();
        v116 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v115)
          goto LABEL_175;
        v115 = v115;
        if (!os_log_type_enabled(v115, v116))
          goto LABEL_174;
        *(_DWORD *)buf = 138412290;
        v189 = v113;
        v117 = "Using dnsDomainName (%@) for dns info";
        goto LABEL_173;
      }
LABEL_176:
      objc_msgSend(v179, "dnsServerAddresses");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      if (v119)
      {
        objc_msgSend(v179, "dnsServerAddresses");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v172 = 0;
      }

      v173 = 0;
      v110 = v110;
LABEL_180:
      WFLogForCategory(0);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v120)
      {
        v122 = v120;
        if (os_log_type_enabled(v122, v121))
        {
          v123 = objc_msgSend(*(id *)(a1 + 32), "dnsConfig");
          v124 = CFSTR("Manual");
          if (!v123)
            v124 = CFSTR("Automatic");
          *(_DWORD *)buf = 138412290;
          v189 = (const char *)v124;
          _os_log_impl(&dword_219FC8000, v122, v121, "DNS config is %@", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setDnsConfig:", v110);
      WFLogForCategory(0);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v125)
      {
        v127 = v125;
        if (os_log_type_enabled(v127, v126))
        {
          objc_msgSend(*(id *)(a1 + 32), "dnsSearchDomains");
          v128 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v189 = v128;
          _os_log_impl(&dword_219FC8000, v127, v126, "DNS search domains %@", buf, 0xCu);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "setDnsSearchDomains:", v173);
      WFLogForCategory(0);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v129)
      {
        v131 = v129;
        if (os_log_type_enabled(v131, v130))
        {
          objc_msgSend(*(id *)(a1 + 32), "dnsServerAddresses");
          v132 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v189 = v132;
          _os_log_impl(&dword_219FC8000, v131, v130, "DNS server addresses %@", buf, 0xCu);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "setDnsServerAddresses:", v172);
      objc_msgSend(v178, "proxySettings");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v133;
      if (!v133)
      {
        if (!v5 || !objc_msgSend(v179, "isUsingCustomProxySetting"))
          goto LABEL_213;
        location = objc_msgSend(v179, "httpProxyAutoConfigured");
        if (location)
        {
          objc_msgSend(v179, "httpProxyAutoConfigURL");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          WFLogForCategory(0);
          v141 = objc_claimAutoreleasedReturnValue();
          v142 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v141)
          {
            v141 = v141;
            if (os_log_type_enabled(v141, v142))
            {
              *(_WORD *)buf = 0;
              v135 = 2;
              _os_log_impl(&dword_219FC8000, v141, v142, "Using automatic HTTP proxy settings", buf, 2u);
            }
            else
            {
              v135 = 2;
            }
LABEL_232:

            goto LABEL_233;
          }
          v135 = 2;
        }
        else
        {
          WFLogForCategory(0);
          v141 = objc_claimAutoreleasedReturnValue();
          v151 = OSLogForWFLogLevel(4uLL);
          v171 = 0;
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v141)
          {
            v141 = v141;
            if (os_log_type_enabled(v141, v151))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v141, v151, "Using manual HTTP proxy settings", buf, 2u);
            }
            v171 = 0;
            v135 = 1;
            goto LABEL_232;
          }
          v135 = 1;
        }
LABEL_233:

        objc_msgSend(v179, "httpProxyServer");
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        if (v152)
        {
          objc_msgSend(v179, "httpProxyServer");
          v136 = (char *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v136 = 0;
        }
        objc_msgSend(v179, "httpProxyPort");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v153 == 0;

        if (v154)
        {
          objc_msgSend(v179, "httpProxyPort");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "stringValue");
          v137 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v137 = 0;
        }
        if (objc_msgSend(v179, "httpProxyIsAuthenticated"))
          v138 = objc_msgSend(v179, "httpProxyIsAuthenticated");
        else
          v138 = 0;
        objc_msgSend(v179, "httpProxyUsername");
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        if (v139)
        {
          objc_msgSend(v179, "httpProxyUsername");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
        }
        WFLogForCategory(0);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        type = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v156)
        {
          v157 = v156;
          if (os_log_type_enabled(v157, type))
          {
            v158 = objc_msgSend(*(id *)(a1 + 32), "httpProxyAuthenticationRequired");
            *(_DWORD *)buf = 138413058;
            v189 = v136;
            v190 = 2112;
            v191 = v137;
            v192 = 1024;
            *(_DWORD *)v193 = v158;
            *(_WORD *)&v193[4] = 2112;
            *(_QWORD *)&v193[6] = v139;
            _os_log_impl(&dword_219FC8000, v157, type, "HTTP proxy server %@ port %@ authenticated %d username %@", buf, 0x26u);
          }

        }
        if ((v138 & (location ^ 1)) == 1)
        {
          WFLogForCategory(0);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v159)
          {
            v161 = v159;
            if (os_log_type_enabled(v161, v160))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v161, v160, "Fetching HTTP proxy password from keychain", buf, 2u);
            }

          }
          +[WFProxyKeychainOperation getPasswordOperationForHost:port:username:](WFProxyKeychainOperation, "getPasswordOperationForHost:port:username:", v136, v137, v139);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          if (v162)
          {
            objc_initWeak((id *)buf, v162);
            v180[0] = MEMORY[0x24BDAC760];
            v180[1] = 3221225472;
            v180[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_26;
            v180[3] = &unk_24DC36068;
            objc_copyWeak(&v185, (id *)buf);
            objc_copyWeak(&v186, from);
            v181 = *(id *)(a1 + 48);
            v182 = v136;
            v183 = v137;
            v184 = v139;
            objc_msgSend(v162, "setCompletionBlock:", v180);
            v163 = objc_loadWeakRetained(from);
            objc_msgSend(v163, "queue");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "addOperation:", v162);

            objc_destroyWeak(&v186);
            objc_destroyWeak(&v185);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            WFLogForCategory(0);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v165)
            {
              v167 = v165;
              if (os_log_type_enabled(v167, v166))
              {
                *(_DWORD *)buf = 138412802;
                v189 = v136;
                v190 = 2112;
                v191 = v137;
                v192 = 2112;
                *(_QWORD *)v193 = v139;
                _os_log_impl(&dword_219FC8000, v167, v166, "Failed to create WFProxyKeychainOperation for host: %@ port: %@ username: %@", buf, 0x20u);
              }

            }
          }

          v140 = 0;
          v138 = 1;
          v135 = 1;
        }
        else
        {
          v140 = 0;
        }
LABEL_203:
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyConfig:", v135);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyServerAddress:", v136);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyServerPort:", v137);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyAuthenticationRequired:", v138);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyUsername:", v139);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyPassword:", v140);
        objc_msgSend(*(id *)(a1 + 32), "setHttpProxyConfigPAC:", v171);
        if (!v174)
          goto LABEL_221;
        goto LABEL_214;
      }
      if ((objc_msgSend(v133, "customProxy") & 1) != 0)
      {
        if (objc_msgSend(v134, "isAutomatic"))
          v135 = 2;
        else
          v135 = 1;
        objc_msgSend(v134, "server");
        v136 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "port");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = objc_msgSend(v134, "authenticated");
        objc_msgSend(v134, "username");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "password");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "autoConfigureURL");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = 1;
        goto LABEL_203;
      }
      LOBYTE(v174) = 1;
LABEL_213:
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyConfig:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyServerAddress:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyServerPort:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyAuthenticationRequired:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyUsername:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyPassword:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setHttpProxyConfigPAC:", 0);
      v140 = 0;
      v136 = 0;
      v137 = 0;
      v139 = 0;
      v171 = 0;
      if ((v174 & 1) == 0)
        goto LABEL_221;
LABEL_214:
      if (objc_msgSend(*(id *)(a1 + 40), "cloudSyncRunning"))
      {
        WFLogForCategory(0);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v143)
        {
          v145 = v143;
          if (os_log_type_enabled(v145, v144))
          {
            *(_DWORD *)buf = 136315138;
            v189 = "-[WFSettingsController _refreshSettingsConfig:]_block_invoke";
            _os_log_impl(&dword_219FC8000, v145, v144, "%s: network has custom settings and is not cloud syncable", buf, 0xCu);
          }

        }
        objc_msgSend(WeakRetained, "config");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "setCloudSyncable:", 0);

      }
LABEL_221:
      v147 = *(void **)(a1 + 32);
      objc_msgSend(WeakRetained, "config");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v147) = objc_msgSend(v147, "isEqual:", v148);

      if ((v147 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "setConfig:", *(_QWORD *)(a1 + 32));
        objc_msgSend(WeakRetained, "settingsViewController");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "refreshConfig:", *(_QWORD *)(a1 + 32));

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "postNotificationName:object:", CFSTR("WFSettingsControllerDidRefreshConfigNotificationName"), *(_QWORD *)(a1 + 40));

      }
      return;
    default:
      goto LABEL_92;
  }
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_26(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_3:
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      WFLogForCategory(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7)
      {
        v9 = v7;
        if (os_log_type_enabled(v9, v8))
        {
          v10 = objc_loadWeakRetained(v2);
          objc_msgSend(v10, "error");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v11;
          _os_log_impl(&dword_219FC8000, v9, v8, "WFProxyKeychainOperation errro %{public}@", buf, 0xCu);

        }
      }

    }
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_219FC8000, v12, v13, "Failed to get password for host: %@ port: %@ username: %@", buf, 0x20u);
    }

    return;
  }
  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "password");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_3;
  WFLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v19, v20, "Successfully fetched HTTP proxy password from keychain, updating config", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WFSettingsController__refreshSettingsConfig___block_invoke_27;
  block[3] = &unk_24DC34D00;
  objc_copyWeak(&v23, (id *)(a1 + 72));
  objc_copyWeak(&v24, v2);
  v22 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
}

void __47__WFSettingsController__refreshSettingsConfig___block_invoke_27(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "httpProxyPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v9, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v11, "config");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHttpProxyPassword:", v10);

    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "settingsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshConfig:", *(_QWORD *)(a1 + 32));

  }
}

- (void)networkSettingsViewController:(id)a3 saveConfig:(id)a4 errorHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  WFSettingsIPV4 *v18;
  void *v19;
  WFSettingsIPV4 *v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFSettingsDNS *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  os_log_type_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  os_log_type_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  WFSettingsIPV4 *v55;
  void *v56;
  void *v57;
  WFSettingsIPV4 *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  WFSettingsIPV6 *v69;
  void *v70;
  void *v71;
  WFSettingsIPV6 *v72;
  NSObject *v73;
  os_log_type_t v74;
  NSObject *v75;
  os_log_type_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  void *v81;
  NSObject *v82;
  os_log_type_t v83;
  NSObject *v84;
  os_log_type_t v85;
  void *v86;
  uint64_t v87;
  int64x2_t v88;
  int64x2_t v89;
  int8x16_t v90;
  int8x16_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  void *v96;
  void *v97;
  NSObject *v98;
  os_log_type_t v99;
  void *v100;
  uint64_t v101;
  int64x2_t v102;
  int64x2_t v103;
  int64x2_t v104;
  int8x16_t v105;
  int8x16_t v106;
  int8x16_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  os_log_type_t v111;
  void *v112;
  NSObject *v113;
  os_log_type_t v114;
  WFSettingsProxy *v115;
  void *v116;
  void *v117;
  WFSettingsProxy *v118;
  NSObject *v119;
  os_log_type_t v120;
  unint64_t v121;
  uint64_t v122;
  NSObject *v123;
  os_log_type_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  os_log_type_t v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  WFSaveSettingsOperation *v134;
  void *v135;
  void *v136;
  WFSaveSettingsOperation *v137;
  void *v138;
  os_log_type_t v139;
  NSObject *v140;
  void *v141;
  void *v142;
  void *v143;
  os_log_type_t v144;
  NSObject *v145;
  os_log_type_t v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  int8x16_t v152;
  int8x16_t v153;
  uint64_t v154;
  int64x2_t v155;
  uint64_t v156;
  void (**v157)(id, uint64_t);
  NSObject *v158;
  uint64_t v159;
  WFSettingsController *val;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  NSObject *obj;
  id v165;
  void *v166;
  _QWORD v167[4];
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  void *v173;
  void *v174;
  void *v175;
  WFSettingsIPV4 *v176;
  uint8_t v177[128];
  uint8_t buf[4];
  _BYTE v179[10];
  id v180;
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v147 = a3;
  v165 = a4;
  v157 = (void (**)(id, uint64_t))a5;
  val = self;
  -[WFSettingsController config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changesBetweenConfig:", v165);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v148, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array", v147);
    v158 = objc_claimAutoreleasedReturnValue();
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    obj = v148;
    v163 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
    if (v163)
    {
      v166 = 0;
      v161 = *MEMORY[0x24BEC29F0];
      v162 = *(_QWORD *)v170;
      v159 = *MEMORY[0x24BEC29F8];
      v156 = *MEMORY[0x24BEC29E8];
      v154 = *MEMORY[0x24BEC2A00];
      v155 = vdupq_n_s64(2uLL);
      v152 = (int8x16_t)vdupq_n_s64(3uLL);
      v153 = (int8x16_t)vdupq_n_s64(5uLL);
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v170 != v162)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isEqualToString:", v161))
          break;
        if (objc_msgSend(v10, "isEqualToString:", v159))
        {
          -[NSObject objectForKey:](obj, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          WFLogForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v21 && os_log_type_enabled(v21, v22))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v11;
            _os_log_impl(&dword_219FC8000, v21, v22, "IPv6 changes: %@", buf, 0xCu);
          }

          if ((objc_msgSend(v165, "validIPv6Configuration") & 1) == 0)
          {
            WFLogForCategory(0);
            v23 = objc_claimAutoreleasedReturnValue();
            v46 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v46))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v11;
              _os_log_impl(&dword_219FC8000, v23, v46, "Disregarding ipv6 edits %@, invalid configuration", buf, 0xCu);
            }
            goto LABEL_165;
          }
          objc_msgSend(v11, "objectForKey:", CFSTR("ipv6Config"));
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23 || (v24 = objc_msgSend(0, "integerValue"), v24 == -1))
            v24 = objc_msgSend(v165, "ipv6Config");
          switch(v24)
          {
            case 2:
              +[WFSettingsIPV6 linkLocalConfig](WFSettingsIPV6, "linkLocalConfig");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v158, "addObject:", v59);
              break;
            case 1:
              objc_msgSend(v165, "ipv6AddressManual");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", CFSTR("ipv6AddressManual"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              if (v61)
              {
                objc_msgSend(v11, "objectForKey:", CFSTR("ipv6AddressManual"));
                v62 = objc_claimAutoreleasedReturnValue();

                v59 = (void *)v62;
              }
              objc_msgSend(v165, "ipv6PrefixLengthManual");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", CFSTR("ipv6PrefixLengthManual"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              if (v64)
              {
                objc_msgSend(v11, "objectForKey:", CFSTR("ipv6PrefixLengthManual"));
                v65 = objc_claimAutoreleasedReturnValue();

                v63 = (void *)v65;
              }
              objc_msgSend(v165, "ipv6RouterAddressManual");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", CFSTR("ipv6RouterAddressManual"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (v67)
              {
                objc_msgSend(v11, "objectForKey:", CFSTR("ipv6RouterAddressManual"));
                v68 = objc_claimAutoreleasedReturnValue();

                v66 = (void *)v68;
              }
              v69 = [WFSettingsIPV6 alloc];
              if (v59)
              {
                v174 = v59;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v174, 1);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v150;
                if (v63)
                  goto LABEL_94;
LABEL_147:
                v72 = -[WFSettingsIPV6 initWithMethod:addresses:prefixLengths:router:](v69, "initWithMethod:addresses:prefixLengths:router:", 3, v70, 0, v66);
                if (v59)
                  goto LABEL_148;
              }
              else
              {
                v70 = 0;
                if (!v63)
                  goto LABEL_147;
LABEL_94:
                v173 = v63;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v173, 1);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = -[WFSettingsIPV6 initWithMethod:addresses:prefixLengths:router:](v69, "initWithMethod:addresses:prefixLengths:router:", 3, v70, v71, v66);

                if (v59)
LABEL_148:

              }
              if (v72)
              {
                -[NSObject addObject:](v158, "addObject:", v72);
              }
              else
              {
                WFLogForCategory(0);
                v98 = objc_claimAutoreleasedReturnValue();
                v99 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v98 && os_log_type_enabled(v98, v99))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v179 = v11;
                  _os_log_impl(&dword_219FC8000, v98, v99, "Failed to create WFSettingsIPV6 from ipv6Changes %@", buf, 0xCu);
                }

              }
              break;
            case 0:
              +[WFSettingsIPV6 automaticConfig](WFSettingsIPV6, "automaticConfig");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v158, "addObject:", v59);
              break;
            default:
LABEL_158:
              -[WFSettingsController config](val, "config");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v100, "ipv6Config");
              v102.i64[0] = v24;
              v102.i64[1] = v101;
              v103 = vdupq_n_s64(1uLL);
              v104 = vdupq_n_s64(2uLL);
              v105 = (int8x16_t)vcgtq_u64((uint64x2_t)v104, (uint64x2_t)vaddq_s64(v102, v103));
              v106 = (int8x16_t)vceqq_s64(v102, v104);
              v107 = vbslq_s8(v105, v152, vbslq_s8((int8x16_t)vceqq_s64(v102, v103), (int8x16_t)vdupq_n_s64(4uLL), vornq_s8(vandq_s8(v106, v153), v106)));
              v108 = v107.i64[1];
              v109 = v107.i64[0];
              if (v107.i64[0] == v107.i64[1])
              {
                WFLogForCategory(0);
                v110 = objc_claimAutoreleasedReturnValue();
                v111 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v110 && os_log_type_enabled(v110, v111))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v179 = v109;
                  *(_WORD *)&v179[4] = 1024;
                  *(_DWORD *)&v179[6] = v109;
                  _os_log_impl(&dword_219FC8000, v110, v111, "Dropping IPv6 configure event as the types didn't change %d -> %d", buf, 0xEu);
                }
              }
              else
              {
                +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                v110 = objc_claimAutoreleasedReturnValue();
                +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 1, v109, v108);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject processEvent:](v110, "processEvent:", v112);

              }
LABEL_165:

              goto LABEL_166;
          }

          goto LABEL_158;
        }
        if (objc_msgSend(v10, "isEqualToString:", v156))
        {
          -[NSObject objectForKey:](obj, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          WFLogForCategory(0);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v25 && os_log_type_enabled(v25, v26))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v11;
            _os_log_impl(&dword_219FC8000, v25, v26, "DNS changes: %@", buf, 0xCu);
          }

          v27 = objc_msgSend(v165, "dnsConfig");
          objc_msgSend(v11, "objectForKey:", CFSTR("dnsConfig"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("dnsConfig"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v29, "integerValue");

          }
          if (v27)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("dnsServerAddresses"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              objc_msgSend(v165, "dnsServerAddresses");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v11, "objectForKey:", CFSTR("dnsSearchDomains"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              objc_msgSend(v165, "dnsSearchDomains");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v32 = -[WFSettingsDNS initWithServerAddresses:searchDomains:]([WFSettingsDNS alloc], "initWithServerAddresses:searchDomains:", v30, v31);
            if (v32)
            {
              -[NSObject addObject:](v158, "addObject:", v32);
            }
            else
            {
              WFLogForCategory(0);
              v75 = objc_claimAutoreleasedReturnValue();
              v76 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v75 && os_log_type_enabled(v75, v76))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v179 = v11;
                _os_log_impl(&dword_219FC8000, v75, v76, "Failed to create WFSettingsDNS from dnsChanges %@", buf, 0xCu);
              }

            }
            v60 = 7;
          }
          else
          {
            +[WFSettingsDNS automaticConfig](WFSettingsDNS, "automaticConfig");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v158, "addObject:", v30);
            v60 = 6;
          }

          -[WFSettingsController config](val, "config");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v77, "dnsConfig"))
            v78 = 7;
          else
            v78 = 6;
          if (v60 == v78)
          {
            WFLogForCategory(0);
            v79 = objc_claimAutoreleasedReturnValue();
            v80 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v79 && os_log_type_enabled(v79, v80))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v179 = v60;
              *(_WORD *)&v179[4] = 1024;
              *(_DWORD *)&v179[6] = v60;
              _os_log_impl(&dword_219FC8000, v79, v80, "Dropping DNS configure event as the types didn't change %d -> %d", buf, 0xEu);
            }
          }
          else
          {
            +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
            v79 = objc_claimAutoreleasedReturnValue();
            +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 2, v60, v78);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject processEvent:](v79, "processEvent:", v81);

          }
          goto LABEL_166;
        }
        if (objc_msgSend(v10, "isEqualToString:", v154))
        {
          -[NSObject objectForKey:](obj, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v36, "allKeys");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "containsObject:", CFSTR("httpProxyPassword"));

          if (v38)
            objc_msgSend(v36, "setObject:forKey:", CFSTR("<REDACTED>"), CFSTR("httpProxyPassword"));
          WFLogForCategory(0);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v39 && os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v36;
            _os_log_impl(&dword_219FC8000, v39, v40, "Proxy changes: %@", buf, 0xCu);
          }

          if ((objc_msgSend(v165, "validProxyConfiguration") & 1) == 0)
          {
            WFLogForCategory(0);
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v73 && os_log_type_enabled(v73, v74))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v11;
              _os_log_impl(&dword_219FC8000, v73, v74, "Disregarding proxy edits %@, invalid configuration", buf, 0xCu);
            }
            goto LABEL_210;
          }
          objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyConfig"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v41
            || (objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyConfig")),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                v43 = objc_msgSend(v42, "integerValue"),
                v42,
                v43 == -1))
          {
            v43 = objc_msgSend(v165, "httpProxyConfig");
          }
          switch(v43)
          {
            case 2:
              objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyConfigPAC"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v44, "length"))
              {
                WFLogForCategory(0);
                v113 = objc_claimAutoreleasedReturnValue();
                v114 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v113 && os_log_type_enabled(v113, v114))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_219FC8000, v113, v114, "No httpProxyConfigPAC supplied, using auto discovery", buf, 2u);
                }

              }
              v115 = -[WFSettingsProxy initWithAutoConfigureURL:]([WFSettingsProxy alloc], "initWithAutoConfigureURL:", v44);
              -[NSObject addObject:](v158, "addObject:", v115);

              v45 = 9;
              break;
            case 1:
              objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyServerAddress"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v44)
              {
                objc_msgSend(v165, "httpProxyServerAddress");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyServerPort"));
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v149)
              {
                objc_msgSend(v165, "httpProxyServerPort");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyUsername"));
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v116)
              {
                objc_msgSend(v165, "httpProxyUsername");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v11, "objectForKey:", CFSTR("httpProxyPassword"));
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v117)
              {
                objc_msgSend(v165, "httpProxyPassword");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if (!objc_msgSend(v44, "length")
                || !objc_msgSend(v149, "length")
                || objc_msgSend(v165, "httpProxyAuthenticationRequired")
                && (!objc_msgSend(v116, "length") || !objc_msgSend(v117, "length")))
              {
                WFLogForCategory(0);
                v145 = objc_claimAutoreleasedReturnValue();
                v146 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v145 && os_log_type_enabled(v145, v146))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_219FC8000, v145, v146, "Can't save proxy settings, missing fields", buf, 2u);
                }

                v133 = obj;
                goto LABEL_235;
              }
              v118 = -[WFSettingsProxy initWithManualServer:port:username:password:]([WFSettingsProxy alloc], "initWithManualServer:port:username:password:", v44, v149, v116, v117);
              if (v158)
              {
                -[NSObject addObject:](v158, "addObject:", v118);
              }
              else
              {
                WFLogForCategory(0);
                v119 = objc_claimAutoreleasedReturnValue();
                v120 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v119 && os_log_type_enabled(v119, v120))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v179 = v11;
                  _os_log_impl(&dword_219FC8000, v119, v120, "Failed to create WFSettingsProxy from proxyChanges %@", buf, 0xCu);
                }

              }
              v45 = 10;
              break;
            case 0:
              +[WFSettingsProxy offConfig](WFSettingsProxy, "offConfig");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v158, "addObject:", v44);
              v45 = 8;
              break;
            default:
              v45 = -1;
LABEL_200:
              -[WFSettingsController config](val, "config");
              v73 = objc_claimAutoreleasedReturnValue();
              v121 = -[NSObject httpProxyConfig](v73, "httpProxyConfig");
              if (v121 > 2)
                v122 = -1;
              else
                v122 = qword_21A062C80[v121];
              if (v45 == v122)
              {
                WFLogForCategory(0);
                v123 = objc_claimAutoreleasedReturnValue();
                v124 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v123 && os_log_type_enabled(v123, v124))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v179 = v45;
                  *(_WORD *)&v179[4] = 1024;
                  *(_DWORD *)&v179[6] = v45;
                  _os_log_impl(&dword_219FC8000, v123, v124, "Dropping HTTP Proxy configure event as the types didn't change %d -> %d", buf, 0xEu);
                }
              }
              else
              {
                +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                v123 = objc_claimAutoreleasedReturnValue();
                +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 3, v45, v122);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject processEvent:](v123, "processEvent:", v125);

              }
LABEL_210:

LABEL_166:
              v35 = (uint64_t)v166;
LABEL_167:

              v166 = (void *)v35;
              goto LABEL_168;
          }

          goto LABEL_200;
        }
LABEL_168:
        if (v163 == ++v9)
        {
          v126 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
          v163 = v126;
          if (v126)
            goto LABEL_4;
          goto LABEL_219;
        }
      }
      -[NSObject objectForKey:](obj, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v11;
        _os_log_impl(&dword_219FC8000, v12, v13, "IPv4 changes: %@", buf, 0xCu);
      }

      if ((objc_msgSend(v165, "validIPv4Configuration") & 1) == 0)
      {
        WFLogForCategory(0);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v33 && os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v179 = v11;
          _os_log_impl(&dword_219FC8000, v33, v34, "Disregarding ipv4 edits %@, invalid configuration", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifikit.error"), 1, v11);
        v35 = objc_claimAutoreleasedReturnValue();

        v157[2](v157, v35);
        goto LABEL_167;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("ipv4Config"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14 || (v16 = objc_msgSend(v14, "integerValue"), v16 == -1))
        v16 = objc_msgSend(v165, "ipv4Config");
      if (v16 != 2)
      {
        if (v16 == 1)
        {
          +[WFSettingsIPV4 bootPConfig](WFSettingsIPV4, "bootPConfig");
          v20 = (WFSettingsIPV4 *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            WFLogForCategory(0);
            v82 = objc_claimAutoreleasedReturnValue();
            v83 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v82 && os_log_type_enabled(v82, v83))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v11;
              _os_log_impl(&dword_219FC8000, v82, v83, "Failed to create WFSettingsIPV4 from ipv4Changes %@", buf, 0xCu);
            }

            goto LABEL_133;
          }
        }
        else
        {
          if (v16)
          {
LABEL_134:
            -[WFSettingsController config](val, "config");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v86, "ipv4Config");
            v88.i64[0] = v16;
            v88.i64[1] = v87;
            v89 = vdupq_n_s64(1uLL);
            v90 = (int8x16_t)vceqq_s64(v88, v89);
            v91 = vbicq_s8(vbslq_s8((int8x16_t)vceqq_s64(v88, v155), (int8x16_t)v155, vornq_s8(vandq_s8(v90, (int8x16_t)v89), v90)), (int8x16_t)vcgtq_u64((uint64x2_t)v155, (uint64x2_t)vaddq_s64(v88, v89)));
            v92 = v91.i64[1];
            v93 = v91.i64[0];
            if (v91.i64[0] == v91.i64[1])
            {
              WFLogForCategory(0);
              v94 = objc_claimAutoreleasedReturnValue();
              v95 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v94 && os_log_type_enabled(v94, v95))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v93;
                *(_WORD *)&v179[4] = 1024;
                *(_DWORD *)&v179[6] = v93;
                _os_log_impl(&dword_219FC8000, v94, v95, "Dropping IPv4 configure event as the types didn't change %d -> %d", buf, 0xEu);
              }
            }
            else if (v91.i64[0] == 2)
            {
              +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
              v94 = objc_claimAutoreleasedReturnValue();
              +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 2, 2, v92);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject processEvent:](v94, "processEvent:", v97);

            }
            else
            {
              if (v91.i64[0] == 1)
              {
                +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                v94 = objc_claimAutoreleasedReturnValue();
                +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 1, 1, v92);
              }
              else
              {
                +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                v94 = objc_claimAutoreleasedReturnValue();
                +[WFUserConfigureEvent configureEventWithType:new:old:](WFUserConfigureEvent, "configureEventWithType:new:old:", 0, v93, v92);
              }
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject processEvent:](v94, "processEvent:", v96);

            }
            goto LABEL_166;
          }
          objc_msgSend(v11, "objectForKey:", CFSTR("dhcpClientID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = [WFSettingsIPV4 alloc];
            objc_msgSend(v11, "objectForKey:", CFSTR("dhcpClientID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[WFSettingsIPV4 initWithMethod:addresses:subnetMasks:router:dhcpClientID:](v18, "initWithMethod:addresses:subnetMasks:router:dhcpClientID:", 1, 0, 0, 0, v19);

          }
          else
          {
            +[WFSettingsIPV4 automaticConfig](WFSettingsIPV4, "automaticConfig");
            v20 = (WFSettingsIPV4 *)objc_claimAutoreleasedReturnValue();
          }
        }
        -[NSObject addObject:](v158, "addObject:", v20);
LABEL_133:

        goto LABEL_134;
      }
      objc_msgSend(v165, "ipv4AddressManual");
      v20 = (WFSettingsIPV4 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("ipv4AddressManual"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("ipv4AddressManual"));
        v48 = objc_claimAutoreleasedReturnValue();

        v20 = (WFSettingsIPV4 *)v48;
      }
      objc_msgSend(v165, "ipv4SubnetMaskManual");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("ipv4SubnetMaskManual"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("ipv4SubnetMaskManual"));
        v51 = objc_claimAutoreleasedReturnValue();

        v49 = (void *)v51;
      }
      objc_msgSend(v165, "ipv4RouterAddressManual");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("ipv4RouterAddressManual"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("ipv4RouterAddressManual"));
        v54 = objc_claimAutoreleasedReturnValue();

        v52 = (void *)v54;
      }
      v55 = [WFSettingsIPV4 alloc];
      if (v20)
      {
        v176 = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v176, 1);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v151;
        if (v49)
          goto LABEL_75;
      }
      else
      {
        v56 = 0;
        if (v49)
        {
LABEL_75:
          v175 = v49;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v175, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[WFSettingsIPV4 initWithMethod:addresses:subnetMasks:router:dhcpClientID:](v55, "initWithMethod:addresses:subnetMasks:router:dhcpClientID:", 4, v56, v57, v52, 0);

          if (!v20)
            goto LABEL_125;
          goto LABEL_124;
        }
      }
      v58 = -[WFSettingsIPV4 initWithMethod:addresses:subnetMasks:router:dhcpClientID:](v55, "initWithMethod:addresses:subnetMasks:router:dhcpClientID:", 4, v56, 0, v52, 0);
      if (!v20)
      {
LABEL_125:
        if (v58)
        {
          -[NSObject addObject:](v158, "addObject:", v58);
        }
        else
        {
          WFLogForCategory(0);
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v84 && os_log_type_enabled(v84, v85))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v179 = v11;
            _os_log_impl(&dword_219FC8000, v84, v85, "Failed to create WFSettingsIPV4 from ipv4Changes %@", buf, 0xCu);
          }

        }
        goto LABEL_133;
      }
LABEL_124:

      goto LABEL_125;
    }
    v166 = 0;
LABEL_219:

    if (-[NSObject count](v158, "count"))
    {
      -[WFSettingsController detailsContext](val, "detailsContext");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "interface");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "interfaceName");
      v133 = objc_claimAutoreleasedReturnValue();

      v134 = [WFSaveSettingsOperation alloc];
      -[WFSettingsController network](val, "network");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "ssid");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = -[WFSaveSettingsOperation initWithSSID:interfaceName:settings:](v134, "initWithSSID:interfaceName:settings:", v136, v133, v158);

      WFLogForCategory(0);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v138)
      {
        v140 = v138;
        if (os_log_type_enabled(v140, v139))
        {
          -[WFSettingsController network](val, "network");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "ssid");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v179 = v158;
          *(_WORD *)&v179[8] = 2112;
          v180 = v142;
          _os_log_impl(&dword_219FC8000, v140, v139, "Saving new network settings %@ for %@", buf, 0x16u);

        }
      }

      -[WFSaveSettingsOperation setCurrentNetwork:](v137, "setCurrentNetwork:", -[WFSettingsController isCurrentNetwork](val, "isCurrentNetwork"));
      objc_initWeak((id *)buf, val);
      v167[0] = MEMORY[0x24BDAC760];
      v167[1] = 3221225472;
      v167[2] = __78__WFSettingsController_networkSettingsViewController_saveConfig_errorHandler___block_invoke;
      v167[3] = &unk_24DC347A0;
      objc_copyWeak(&v168, (id *)buf);
      -[WFSaveSettingsOperation setCompletionBlock:](v137, "setCompletionBlock:", v167);
      -[WFSettingsController queue](val, "queue");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "addOperation:", v137);

      objc_destroyWeak(&v168);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      WFLogForCategory(0);
      v133 = objc_claimAutoreleasedReturnValue();
      v144 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v133 && os_log_type_enabled(v133, v144))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v133, v144, "Bailing of saving, no setting changes to persist", buf, 2u);
      }
    }
LABEL_235:

    v129 = v158;
    goto LABEL_236;
  }
  WFLogForCategory(0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v127)
  {
    v129 = v127;
    if (os_log_type_enabled(v129, v128))
    {
      -[WFSettingsController config](val, "config", v147);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v179 = v130;
      *(_WORD *)&v179[8] = 2112;
      v180 = v165;
      _os_log_impl(&dword_219FC8000, v129, v128, "No changes between configs (existing %@, new %@), nothing to do.", buf, 0x16u);

    }
    v166 = v129;
LABEL_236:

    v127 = v166;
  }

}

void __78__WFSettingsController_networkSettingsViewController_saveConfig_errorHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "config");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_refreshSettingsConfig:", v1);

}

- (void)_applySetupAppearances
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6E60], "appearance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (WFNetworkSettingsViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsViewController, a3);
}

- (WFNetworkSettingsConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (BOOL)monitorIPChanges
{
  return self->_monitorIPChanges;
}

- (void)setMonitorIPChanges:(BOOL)a3
{
  self->_monitorIPChanges = a3;
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ipMonitor, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)cloudSyncRunning
{
  return self->_cloudSyncRunning;
}

- (void)setCloudSyncRunning:(BOOL)a3
{
  self->_cloudSyncRunning = a3;
}

- (WFDetailsContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
  objc_storeStrong((id *)&self->_detailsContext, a3);
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (BOOL)isCurrentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(BOOL)a3
{
  self->_currentNetwork = a3;
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareMACAddress, a3);
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
}

@end
