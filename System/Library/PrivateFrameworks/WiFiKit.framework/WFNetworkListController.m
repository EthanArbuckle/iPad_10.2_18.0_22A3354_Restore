@implementation WFNetworkListController

- (WFNetworkListController)initWithViewController:(id)a3
{
  return -[WFNetworkListController initWithViewController:viewProvider:client:](self, "initWithViewController:viewProvider:client:", a3, 0, 0);
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4
{
  return -[WFNetworkListController initWithViewController:viewProvider:client:](self, "initWithViewController:viewProvider:client:", a3, a4, 0);
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5 knownNetworksManager:(id)a6
{
  id v10;
  WFNetworkListController *v11;
  WFNetworkListController *v12;

  v10 = a6;
  v11 = -[WFNetworkListController initWithViewController:viewProvider:client:](self, "initWithViewController:viewProvider:client:", a3, a4, a5);
  v12 = v11;
  if (v11)
    -[WFNetworkListController setKnownNetworksManager:](v11, "setKnownNetworksManager:", v10);

  return v12;
}

- (WFNetworkListController)initWithViewController:(id)a3 viewProvider:(id)a4 client:(id)a5
{
  id v9;
  id v10;
  WFClient *v11;
  WFNetworkListController *v12;
  WFNetworkListController *v13;
  void *v14;
  void *v15;
  char v16;
  id *p_viewController;
  void **p_viewProvider;
  void *v19;
  char v20;
  id v21;
  void *v22;
  WFClient *v23;
  WFDiagnosticsManager *v24;
  WFDiagnosticsManager *diagnosticsManager;
  WFNetworkListRandomMACManager *v26;
  WFNetworkListRandomMACManager *randomMACManager;
  WFAssociationContextQueue *v28;
  WFAssociationContextQueue *associationContextQueue;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *p_super;
  os_log_type_t v35;
  const char *v36;
  WFNetworkListController *v37;
  NSObject *v39;
  os_log_type_t v40;
  NSObject *v41;
  os_log_type_t v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (WFClient *)a5;
  v43.receiver = self;
  v43.super_class = (Class)WFNetworkListController;
  v12 = -[WFNetworkListController init](&v43, sel_init);
  v13 = v12;
  v14 = 0;
  if (v9 && v12)
  {
    NSProtocolFromString(CFSTR("WFNetworkListing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "conformsToProtocol:", v15);

    if ((v16 & 1) != 0)
    {
      p_viewController = (id *)&v13->_viewController;
      objc_storeStrong((id *)&v13->_viewController, a3);
      -[WFNetworkListing setListDelegate:](v13->_viewController, "setListDelegate:", v13);
      p_viewProvider = (void **)&v13->_viewProvider;
      objc_storeStrong((id *)&v13->_viewProvider, a4);
      v13->_shouldShowDetailTapOnCurrentNetwork = 1;
      v13->_isRandomMACManageFeatureEnabled = _os_feature_enabled_impl();
      if (!v13->_viewProvider)
      {
        NSProtocolFromString(CFSTR("WFNetworkViewProvider"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(0, "conformsToProtocol:", v19);

        if ((v20 & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
          v21 = objc_alloc_init((Class)objc_opt_class());
          v22 = *p_viewProvider;
          *p_viewProvider = v21;

        }
      }
      if (!objc_msgSend(*p_viewController, "deviceCapability"))
        objc_msgSend(*p_viewController, "setDeviceCapability:", WFCurrentDeviceCapability());
      v23 = v11;
      if (!v11)
        v23 = objc_alloc_init(WFClient);
      objc_storeStrong((id *)&v13->_wifiClient, v23);
      v24 = objc_alloc_init(WFDiagnosticsManager);
      diagnosticsManager = v13->_diagnosticsManager;
      v13->_diagnosticsManager = v24;

      v26 = -[WFNetworkListRandomMACManager initWithClient:]([WFNetworkListRandomMACManager alloc], "initWithClient:", v13->_wifiClient);
      randomMACManager = v13->_randomMACManager;
      v13->_randomMACManager = v26;

      -[WFClient interface](v13->_wifiClient, "interface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_storeStrong((id *)&v13->_interface, v14);
        -[WFNetworkListController _setupWithInterface:](v13, "_setupWithInterface:", v13->_interface);
        -[WFNetworkListController _updateViewControllerConnectedNetwork](v13, "_updateViewControllerConnectedNetwork");
      }
      else
      {
        WFLogForCategory(0);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v41 && os_log_type_enabled(v41, v42))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "-[WFNetworkListController initWithViewController:viewProvider:client:]";
          _os_log_impl(&dword_219FC8000, v41, v42, "%s: can't get WFInterface instance", buf, 0xCu);
        }

      }
      if (!v13->_interface)
        -[WFNetworkListController _setupWithoutInterface](v13, "_setupWithoutInterface");
      v28 = objc_alloc_init(WFAssociationContextQueue);
      associationContextQueue = v13->_associationContextQueue;
      v13->_associationContextQueue = v28;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObserver:selector:name:object:", v13, sel__interfaceDidBecomeAvailable_, CFSTR("WFClientInterfaceAvailableNotification"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:selector:name:object:", v13, sel__clientRestartedNotification_, CFSTR("WFClientServerRestartedNotification"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:selector:name:object:", v13, sel__cellularOutrankNotification_, CFSTR("WFClientCellularOutrankWiFiNotification"), 0);

      if (objc_opt_class())
      {
        objc_msgSend(MEMORY[0x24BE60C20], "shared");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13->_lockdownModeEnabled = objc_msgSend(v33, "enabled");

      }
      WFLogForCategory(0);
      p_super = objc_claimAutoreleasedReturnValue();
      v35 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v35))
      {
        v36 = "enabled";
        if (!v13->_lockdownModeEnabled)
          v36 = "disabled";
        *(_DWORD *)buf = 136315394;
        v45 = "-[WFNetworkListController initWithViewController:viewProvider:client:]";
        v46 = 2080;
        v47 = v36;
        _os_log_impl(&dword_219FC8000, p_super, v35, "%s: Lockdown mode is %s", buf, 0x16u);
      }
    }
    else
    {
      WFLogForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v39 && os_log_type_enabled(v39, v40))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v39, v40, "View Controller doesn't conform to WFNetworkListing protocol", buf, 2u);
      }

      v14 = 0;
      p_super = &v13->super;
      v23 = v11;
      v13 = 0;
    }
  }
  else
  {
    p_super = &v12->super;
    v23 = v11;
    v13 = 0;
  }

  v37 = v13;
  return v37;
}

- (WFNetworkListController)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFNetworkListController init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_setupWithInterface:(id)a3
{
  WFNetworkListing *v4;
  NSObject *v5;
  os_log_type_t v6;
  WFWiFiStateMonitor *v7;
  void *v8;
  WFWiFiStateMonitor *v9;
  WFWiFiStateMonitor *stateMonitor;
  NSOperationQueue *v11;
  NSOperationQueue *backgroundQueue;
  NSOperationQueue *v13;
  WFScanManager *v14;
  void *v15;
  void *v16;
  WFScanManager *v17;
  WFScanManager *scanManager;
  WFHotspotInterface *v19;
  WFHotspotInterface *hotspotInterface;
  WFHotspotInterface *v21;
  WFHealthManager *v22;
  WFHealthManager *healthManager;
  WFScanMetricsManager *v24;
  WFScanMetricsManager *scanMetricsManager;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  WFNetworkListing *viewController;
  void *v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  void *v50;
  id v51;
  id location;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  WFNetworkListing *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = (WFNetworkListing *)a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[WFNetworkListController _setupWithInterface:]";
    v55 = 2112;
    v56 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: interface %@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  v7 = [WFWiFiStateMonitor alloc];
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = MEMORY[0x24BDAC760];
  v48 = 3221225472;
  v49 = __47__WFNetworkListController__setupWithInterface___block_invoke;
  v50 = &unk_24DC34A28;
  objc_copyWeak(&v51, &location);
  v9 = -[WFWiFiStateMonitor initWithClient:handler:](v7, "initWithClient:handler:", v8, &v47);
  stateMonitor = self->_stateMonitor;
  self->_stateMonitor = v9;

  -[WFWiFiStateMonitor setIdentifier:](self->_stateMonitor, "setIdentifier:", CFSTR("com.apple.WiFiSettings"), v47, v48, v49, v50);
  v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v11;

  v13 = self->_backgroundQueue;
  if (v13)
  {
    -[NSOperationQueue setQualityOfService:](v13, "setQualityOfService:", 9);
    -[WFNetworkListController _setupGASControllerWithInterface:](self, "_setupGASControllerWithInterface:", v4);
    v14 = [WFScanManager alloc];
    -[WFNetworkListController wifiClient](self, "wifiClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFScanProxy scanProxyWithClient:](WFScanProxy, "scanProxyWithClient:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WFScanManager initWithScanProxy:delegate:](v14, "initWithScanProxy:delegate:", v16, self);
    scanManager = self->_scanManager;
    self->_scanManager = v17;

    if (self->_scanManager)
    {
      v19 = objc_alloc_init(WFHotspotInterface);
      hotspotInterface = self->_hotspotInterface;
      self->_hotspotInterface = v19;

      v21 = self->_hotspotInterface;
      if (v21)
      {
        -[WFHotspotInterface setDelegate:](v21, "setDelegate:", self);
        v22 = -[WFHealthManager initWithInterface:]([WFHealthManager alloc], "initWithInterface:", v4);
        healthManager = self->_healthManager;
        self->_healthManager = v22;

        if (self->_healthManager)
        {
          v24 = objc_alloc_init(WFScanMetricsManager);
          scanMetricsManager = self->_scanMetricsManager;
          self->_scanMetricsManager = v24;

          if (self->_scanMetricsManager)
          {
            self->_privacyProxyFeatureTier = 0;
            if (-[WFNetworkListController isAirPortSettings](self, "isAirPortSettings"))
            {
              self->_scanForPersonalHotspots = 1;
              -[WFNetworkListController _updatePrivacyProxyFeatureEnabled](self, "_updatePrivacyProxyFeatureEnabled");
            }
            self->_canScanForPersonalHotspots = 1;
            -[WFNetworkListController wifiClient](self, "wifiClient");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkListing setShowOtherNetwork:](self->_viewController, "setShowOtherNetwork:", objc_msgSend(v26, "isNetworkRestrictionActive") ^ 1);

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              -[WFNetworkListController _registerForApplicationNotifications](self, "_registerForApplicationNotifications");
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__ipStateDidChange_, CFSTR("WFIPMonitorStateChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__powerDidChangeNotification_, CFSTR("WFClientPowerStateChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__networkDidChangeNotification_, CFSTR("WFInterfaceNetworkChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__networkLinkQualityDidChangeNotification_, CFSTR("WFInterfaceLinkQualityNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__networkRestrictionStateDidChange_, CFSTR("WFClientNetworkRestrictionPolicyDidChangeNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObserver:selector:name:object:", self, sel__networkHealthIssuesDidChange_, CFSTR("WFHealthManagerHealthIssuesDidChangeNotification"), self->_healthManager);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__powerModificationDisableStateDidChange_, CFSTR("WFClientPowerModificationStateChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObserver:selector:name:object:", self, sel__managedAppleIDStateDidChange_, CFSTR("WFClientManagedAppleIDStateChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObserver:selector:name:object:", self, sel__wifiPropertyDidChanged_, CFSTR("WFClientUserInterfacePropertyChangedNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObserver:selector:name:object:", self, sel__preferredNetworksDidChange_, CFSTR("WFClientPreferredNetworksDidChangeNotification"), 0);

            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObserver:selector:name:object:", self, sel__ipStateDidChange_, CFSTR("WFInterfaceIPAddressChangedNotification"), 0);

            if (!-[WFNetworkListController isSetup](self, "isSetup"))
            {
              WFLogForCategory(0);
              v38 = objc_claimAutoreleasedReturnValue();
              v39 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v39))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_219FC8000, v38, v39, "Enabling auto join", buf, 2u);
              }

              -[WFNetworkListController wifiClient](self, "wifiClient");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setAutoJoinEnabled:", 1);

            }
            -[WFNetworkListController setViewControllerSupportsCurrentNetworkSubtitle:](self, "setViewControllerSupportsCurrentNetworkSubtitle:", objc_opt_respondsToSelector() & 1);
            if (!-[WFNetworkListController viewControllerSupportsCurrentNetworkSubtitle](self, "viewControllerSupportsCurrentNetworkSubtitle"))
            {
              WFLogForCategory(0);
              v41 = objc_claimAutoreleasedReturnValue();
              v42 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v41 && os_log_type_enabled(v41, v42))
              {
                viewController = self->_viewController;
                *(_DWORD *)buf = 136315394;
                v54 = "-[WFNetworkListController _setupWithInterface:]";
                v55 = 2112;
                v56 = viewController;
                _os_log_impl(&dword_219FC8000, v41, v42, "%s: %@ doesn't support currentNetworkSubtitle", buf, 0x16u);
              }

            }
            -[WFNetworkListController wifiClient](self, "wifiClient");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "powered");

            if (self->_powerState == 3)
              -[WFNetworkListController setPowerState:](self, "setPowerState:", v45);
            else
              self->_powerState = v45;
            -[WFNetworkListController viewController](self, "viewController");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "deviceCapability");
            -[WFHealthManager setIsChinaDevice:](self->_healthManager, "setIsChinaDevice:", WFCapabilityIsChinaDevice());

            -[WFNetworkListController _refreshKnownHiddenNetworkNamesCache](self, "_refreshKnownHiddenNetworkNamesCache");
          }
        }
      }
    }
  }
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

}

void __47__WFNetworkListController__setupWithInterface___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateMonitorChangedStates:oldState:", a3, a2);

}

- (void)_setupWithoutInterface
{
  self->_powerState = 3;
  -[WFNetworkListController setPowerState:](self, "setPowerState:", 3);
  -[WFNetworkListController _updateViewControllerDisabled](self, "_updateViewControllerDisabled");
}

- (void)_setupGASControllerWithInterface:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__WFNetworkListController__setupGASControllerWithInterface___block_invoke;
  v5[3] = &unk_24DC34A50;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v4, "asyncHS20Supported:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __60__WFNetworkListController__setupGASControllerWithInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  os_log_type_t v5;
  id WeakRetained;
  WFGasQueryController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v14 = 136315394;
    v15 = "-[WFNetworkListController _setupGASControllerWithInterface:]_block_invoke";
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: HS20Supported %d", (uint8_t *)&v14, 0x12u);
  }

  objc_copyWeak((id *)&v14, (id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)&v14);
  objc_msgSend(WeakRetained, "setHS20Supported:", a2);

  if ((_DWORD)a2)
  {
    v7 = [WFGasQueryController alloc];
    objc_msgSend(*(id *)(a1 + 32), "wifiClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFGasQueryController initWithInterface:](v7, "initWithInterface:", v9);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 112);
    *(_QWORD *)(v11 + 112) = v10;

    v13 = objc_loadWeakRetained((id *)&v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setDelegate:", v13);

  }
  objc_destroyWeak((id *)&v14);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFNetworkListController;
  -[WFNetworkListController dealloc](&v4, sel_dealloc);
}

- (void)_registerForApplicationNotifications
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v9 = 136315138;
    v10 = "-[WFNetworkListController _registerForApplicationNotifications]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

}

- (void)_applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint8_t v11[16];

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "entered foreground", v11, 2u);
  }

  -[WFNetworkListController scanMetricsManager](self, "scanMetricsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[WFNetworkListController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(CFSTR("WFKnownNetworksViewProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "conformsToProtocol:", v8) & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      return;
    -[WFNetworkListController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "knownNetworksWillEnterForeground");
  }
  else
  {

  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v5, v6, "entered background", buf, 2u);
  }

  -[WFNetworkListController scanMetricsManager](self, "scanMetricsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submit");

  -[WFNetworkListController _cleanUpStatesForDismissal](self, "_cleanUpStatesForDismissal");
  -[WFNetworkListController hotspotInterface](self, "hotspotInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScanning");

  if (v9)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFNetworkListController _applicationDidEnterBackground:]";
      _os_log_impl(&dword_219FC8000, v10, v11, "%s: creating bg task to disable hotspot scanning", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_1);

    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__WFNetworkListController__applicationDidEnterBackground___block_invoke_87;
    v15[3] = &unk_24DC34AB8;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = v13;
    dispatch_async(v14, v15);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }

}

void __58__WFNetworkListController__applicationDidEnterBackground___block_invoke()
{
  NSObject *v0;
  os_log_type_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    v2 = 136315138;
    v3 = "-[WFNetworkListController _applicationDidEnterBackground:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v0, v1, "%s: failed to stop scanning", (uint8_t *)&v2, 0xCu);
  }

}

void __58__WFNetworkListController__applicationDidEnterBackground___block_invoke_87(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopHotspotScan");

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(a1 + 40));

}

- (void)_applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint8_t v11[16];

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "did become active", v11, 2u);
  }

  -[WFNetworkListController _updatePowerState](self, "_updatePowerState");
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadConfiguration");

  -[WFNetworkListController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(CFSTR("WFKnownNetworksViewProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "conformsToProtocol:", v8) & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      return;
    -[WFNetworkListController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "knownNetworksDidBecomeActive");
  }
  else
  {

  }
}

- (void)_applicationWillResignActive:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint8_t v10[16];

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "will resign active", v10, 2u);
  }

  if (-[WFNetworkListController _shouldPauseScanning](self, "_shouldPauseScanning"))
    -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
  -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
  -[WFNetworkListController removeScanCache](self, "removeScanCache");
  -[WFNetworkListController viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(CFSTR("WFKnownNetworksViewProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", v7) & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    -[WFNetworkListController viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "knownNetworksWillResignActive");
  }
  else
  {

  }
}

- (void)_cleanUpStatesForDismissal
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!-[WFNetworkListController isSetup](self, "isSetup"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      v20 = 136315138;
      v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
      _os_log_impl(&dword_219FC8000, v3, v4, "%s: enabling autojoin", (uint8_t *)&v20, 0xCu);
    }

    -[WFNetworkListController wifiClient](self, "wifiClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoJoinEnabled:", 1);

    -[WFNetworkListController _dismissVisibleContext](self, "_dismissVisibleContext");
    -[WFNetworkListController associationContext](self, "associationContext");
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
          -[WFNetworkListController associationContext](self, "associationContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 136315394;
          v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
          v22 = 2112;
          v23 = v10;
          _os_log_impl(&dword_219FC8000, v9, v8, "%s: association context %@", (uint8_t *)&v20, 0x16u);

        }
      }

      -[WFNetworkListController associationContext](self, "associationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "state");

      if (v12 == 2)
      {
        WFLogForCategory(0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v13)
        {
          v15 = v13;
          if (os_log_type_enabled(v15, v14))
          {
            -[WFNetworkListController associationContext](self, "associationContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "networkName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 136315394;
            v21 = "-[WFNetworkListController _cleanUpStatesForDismissal]";
            v22 = 2112;
            v23 = v17;
            _os_log_impl(&dword_219FC8000, v15, v14, "%s: canceling association to %@ waiting on user input due to backgrounding", (uint8_t *)&v20, 0x16u);

          }
        }

        objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController _associationDidFinish:error:network:](self, "_associationDidFinish:error:network:", 1, v18, 0);

      }
      -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeAll");

      -[WFNetworkListController setAssociationContext:](self, "setAssociationContext:", 0);
    }
    -[WFNetworkListController setKnownHiddenNetworkNames:](self, "setKnownHiddenNetworkNames:", 0);
  }
}

- (void)_networkRestrictionStateDidChange:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
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
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkRestrictionActive");

  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v21 = 136315394;
    v22 = "-[WFNetworkListController _networkRestrictionStateDidChange:]";
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: network restriction did change (new state: %d)", (uint8_t *)&v21, 0x12u);
  }

  v8 = v5 ^ 1u;
  -[WFNetworkListController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowOtherNetwork:", v8);

  -[WFNetworkListController viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refresh");

  -[WFNetworkListController scanManager](self, "scanManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pause");

  if ((v8 & 1) != 0)
  {
    -[WFNetworkListController scanManager](self, "scanManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

    -[WFNetworkListController setCanScanForPersonalHotspots:](self, "setCanScanForPersonalHotspots:", v8);
    -[WFNetworkListController _startHotspotScan](self, "_startHotspotScan");
  }
  else
  {
    -[WFNetworkListController gasController](self, "gasController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllProfiles");

    -[WFNetworkListController viewController](self, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNetworks:", 0);

    -[WFNetworkListController scanManager](self, "scanManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    -[WFNetworkListController scanManager](self, "scanManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController networks](self, "networks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController scanManager:filterScanResults:](self, "scanManager:filterScanResults:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController setNetworks:](self, "setNetworks:", v17);

    -[WFNetworkListController viewController](self, "viewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController networks](self, "networks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNetworks:", v19);

    -[WFNetworkListController setCanScanForPersonalHotspots:](self, "setCanScanForPersonalHotspots:", v8);
    -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
  }
}

- (void)_powerModificationDisableStateDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPowerModificationDisabled");

  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = "Enabled";
    if ((_DWORD)v5)
      v8 = "Disabled";
    v12 = 136315394;
    v13 = "-[WFNetworkListController _powerModificationDisableStateDidChange:]";
    v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: Power Modification %s", (uint8_t *)&v12, 0x16u);
  }

  -[WFNetworkListController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "powerModificationStateDidChange:", v5);

  }
}

- (void)_managedAppleIDStateDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isManagedAppleID");

  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = "Non-Managed";
    if ((_DWORD)v5)
      v8 = "Managed";
    v12 = 136315394;
    v13 = "-[WFNetworkListController _managedAppleIDStateDidChange:]";
    v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: %s Account", (uint8_t *)&v12, 0x16u);
  }

  -[WFNetworkListController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedAppleIDStateChange:", v5);

  }
}

- (void)removeScanCache
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "removing scan cache", v8, 2u);
  }

  -[WFNetworkListController setNetworks:](self, "setNetworks:", 0);
  -[WFNetworkListController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworks:", 0);

  -[WFNetworkListController viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refresh");

  -[WFNetworkListController gasController](self, "gasController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllProfiles");

  -[WFNetworkListController setFirstScanFinished:](self, "setFirstScanFinished:", 0);
}

- (void)_powerStateChanged
{
  void *v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController setPowerState:](self, "setPowerState:", objc_msgSend(v3, "powered"));

  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      -[WFNetworkListController powerState](self, "powerState");
      WFPowerStateToggleToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFNetworkListController _powerStateChanged]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_219FC8000, v6, v5, "%s: power state changed to %@", (uint8_t *)&v10, 0x16u);

    }
  }

  -[WFNetworkListController setPowerState:](self, "setPowerState:", -[WFNetworkListController powerState](self, "powerState"));
  if (-[WFNetworkListController powerState](self, "powerState") == 1)
  {
    -[WFNetworkListController _resumeScanning](self, "_resumeScanning");
  }
  else
  {
    -[WFNetworkListController scanManager](self, "scanManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

    -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
    -[WFNetworkListController setNetworks:](self, "setNetworks:", 0);
    -[WFNetworkListController setFirstScanFinished:](self, "setFirstScanFinished:", 0);
    -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAll");

  }
}

- (void)_updatePowerState
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[WFNetworkListController _updatePowerState]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: updating power state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WFNetworkListController__updatePowerState__block_invoke;
  v6[3] = &unk_24DC34A50;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  objc_msgSend(v5, "asyncPowered:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __44__WFNetworkListController__updatePowerState__block_invoke(uint64_t a1, unsigned int a2)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  NSObject *v24;
  os_log_type_t v25;
  os_log_type_t v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
    v31 = 1024;
    v32 = a2;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: powered %d", buf, 0x12u);
  }

  objc_msgSend(WeakRetained, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
    v10 = 3;
  else
    v10 = a2;
  objc_msgSend(WeakRetained, "setPowerState:", v10);
  objc_msgSend(WeakRetained, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __44__WFNetworkListController__updatePowerState__block_invoke_101;
  v27[3] = &unk_24DC34B20;
  objc_copyWeak(&v28, v4);
  objc_msgSend(v11, "asyncCurrentNetwork:", v27);

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "applicationState") == 0;

    if (!v13)
    {
      WFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v14 || !os_log_type_enabled(v14, v15))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v16 = "WiFi application status is not active";
      goto LABEL_19;
    }
    if (objc_msgSend(WeakRetained, "isAssociating"))
    {
      WFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v14 || !os_log_type_enabled(v14, v15))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v16 = "not resuming scans due to in progress association";
LABEL_19:
      v17 = v14;
      v18 = v15;
      v19 = 2;
LABEL_20:
      _os_log_impl(&dword_219FC8000, v17, v18, v16, buf, v19);
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "networkListVisible");

      if ((v23 & 1) == 0)
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        v26 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v14 || !os_log_type_enabled(v14, v26))
          goto LABEL_21;
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
        v16 = "%s: Skipping scanning for setup until wifi page is visible";
        v17 = v14;
        v18 = v26;
        v19 = 12;
        goto LABEL_20;
      }
    }
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v24 && os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFNetworkListController _updatePowerState]_block_invoke";
      _os_log_impl(&dword_219FC8000, v24, v25, "%s: resuming scans due to power state", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "_resumeScanning");
  }
LABEL_22:
  objc_destroyWeak(&v28);

}

void __44__WFNetworkListController__updatePowerState__block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "isHS20Supported");
  if (v3)
  {
    if (v5)
    {
      if (objc_msgSend(v3, "isHotspot20"))
      {
        objc_msgSend(v3, "matchingKnownNetworkProfile");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          WFLogForCategory(0);
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
          {
            v10 = 136315394;
            v11 = "-[WFNetworkListController _updatePowerState]_block_invoke";
            v12 = 2112;
            v13 = v3;
            _os_log_impl(&dword_219FC8000, v7, v8, "%s: resolving profile for %@", (uint8_t *)&v10, 0x16u);
          }

          objc_msgSend(WeakRetained, "gasController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "resolveProfileForNetwork:handler:force:", v3, &__block_literal_global_104, 1);

        }
      }
    }
  }

}

void __44__WFNetworkListController__updatePowerState__block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  WFLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)startScanning
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t v6[16];

  WFLogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "start scanning", v6, 2u);
  }

  -[WFNetworkListController _startHotspotScan](self, "_startHotspotScan");
  -[WFNetworkListController scanManager](self, "scanManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

}

- (void)stopScanning
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t v6[16];

  WFLogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "stop scanning", v6, 2u);
  }

  -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
  -[WFNetworkListController scanManager](self, "scanManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");

}

- (void)_resumeScanning
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t v6[16];

  WFLogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "resume scans", v6, 2u);
  }

  -[WFNetworkListController _startHotspotScan](self, "_startHotspotScan");
  -[WFNetworkListController scanManager](self, "scanManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

- (BOOL)_shouldPauseScanning
{
  void *v3;
  BOOL v4;
  void *v5;

  -[WFNetworkListController scanManager](self, "scanManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[WFNetworkListController scanManager](self, "scanManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "state") == 2;

  }
  return v4;
}

- (void)_pauseScanning
{
  id v2;

  -[WFNetworkListController scanManager](self, "scanManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)_startHotspotScan
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[WFNetworkListController scanForPersonalHotspots](self, "scanForPersonalHotspots")
    && -[WFNetworkListController canScanForPersonalHotspots](self, "canScanForPersonalHotspots"))
  {
    -[WFNetworkListController hotspotInterface](self, "hotspotInterface");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startBrowsing");

  }
  else
  {
    WFLogForCategory(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3)
    {
      v5 = v3;
      if (os_log_type_enabled(v5, v4))
      {
        *(_DWORD *)buf = 136315650;
        v8 = "-[WFNetworkListController _startHotspotScan]";
        v9 = 1024;
        v10 = -[WFNetworkListController scanForPersonalHotspots](self, "scanForPersonalHotspots");
        v11 = 1024;
        v12 = -[WFNetworkListController canScanForPersonalHotspots](self, "canScanForPersonalHotspots");
        _os_log_impl(&dword_219FC8000, v5, v4, "%s: hotspot scanning disabled (scan %d, canScan %d)", buf, 0x18u);
      }

    }
  }
}

- (void)_stopHotspotScan
{
  id v2;

  -[WFNetworkListController hotspotInterface](self, "hotspotInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopBrowsing");

}

- (void)_updateViewControllerScanResults
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  os_log_type_t v27;
  NSObject *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  WFNetworkProfile *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  os_log_type_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  os_log_type_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  os_log_type_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char isKindOfClass;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  os_log_type_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  os_log_type_t v88;
  void *v89;
  void *v90;
  id obj;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  WFNetworkProfile *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[6];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[5];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t v119[128];
  uint8_t v120[4];
  const char *v121;
  __int16 v122;
  uint64_t v123;
  uint8_t v124[128];
  _BYTE buf[24];
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  __CFString *v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "networks");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x24BDBCEF0];
  if (v1)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "scanManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "networks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scanManager:filterScanResults:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithSet:", v6);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "hotspotInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networks");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    v93 = (void *)objc_msgSend(v89, "mutableCopy");
    v100 = (void *)objc_msgSend(v93, "mutableCopy");
    v101 = (void *)objc_msgSend(v90, "mutableCopy");
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v90;
    v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
    if (v94)
    {
      v92 = *(_QWORD *)v116;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v116 != v92)
          {
            v9 = v8;
            objc_enumerationMutation(obj);
            v8 = v9;
          }
          v96 = v8;
          v10 = (void *)MEMORY[0x24BDD1758];
          v102 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v8);
          objc_msgSend(v102, "ssid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "predicateWithFormat:", CFSTR("ssid == %@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "filteredSetUsingPredicate:", v12);
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v97, "count") >= 2)
          {
            WFLogForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v13, v14, "More than one HS of same name nearby!", buf, 2u);
            }

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v126 = __Block_byref_object_copy_;
            v127 = __Block_byref_object_dispose_;
            v128 = &stru_24DC36C30;
            v114[0] = MEMORY[0x24BDAC760];
            v114[1] = 3221225472;
            v114[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_114;
            v114[3] = &unk_24DC34B48;
            v114[4] = buf;
            objc_msgSend(v97, "enumerateObjectsUsingBlock:", v114);
            WFLogForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
            {
              v17 = *(const char **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v120 = 138412290;
              v121 = v17;
              _os_log_impl(&dword_219FC8000, v15, v16, "Hotspot networks: %@", v120, 0xCu);
            }

            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            v18 = v97;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
            if (v19)
            {
              v20 = 0;
              v21 = *(_QWORD *)v111;
              do
              {
                v22 = 0;
                v23 = -v20;
                v98 = v20 + v19;
                do
                {
                  if (*(_QWORD *)v111 != v21)
                    objc_enumerationMutation(v18);
                  v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v22);
                  if (v24)
                    v25 = v23 == v22;
                  else
                    v25 = 1;
                  if (v25)
                  {
                    WFLogForCategory(0);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = OSLogForWFLogLevel(4uLL);
                    if ((unint64_t)WFCurrentLogLevel() >= 4 && v26)
                    {
                      v28 = v26;
                      if (os_log_type_enabled(v28, v27))
                      {
                        objc_msgSend(v24, "ssid");
                        v29 = (char *)objc_claimAutoreleasedReturnValue();
                        v30 = objc_msgSend(v24, "uniqueIdentifier");
                        *(_DWORD *)v120 = 138412546;
                        v121 = v29;
                        v122 = 2048;
                        v123 = v30;
                        _os_log_impl(&dword_219FC8000, v28, v27, "Shown hotspot: %@, uniqueidentifier: %lu\n", v120, 0x16u);

                      }
                    }

                  }
                  else
                  {
                    objc_msgSend(v101, "removeObject:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v22));
                  }
                  ++v22;
                }
                while (v19 != v22);
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
                v20 = v98;
              }
              while (v19);
            }

            _Block_object_dispose(buf, 8);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v102, "uniqueIdentifier"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = [WFNetworkProfile alloc];
          objc_msgSend(*(id *)(a1 + 32), "interface");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "currentNetwork");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "matchingKnownNetworkProfile");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = -[WFNetworkProfile initWithCoreWiFiProfile:](v32, "initWithCoreWiFiProfile:", v35);

          if (v102)
          {
            if (v99)
            {
              -[WFNetworkProfile hotspotDeviceIdentifier](v99, "hotspotDeviceIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToString:", v31);

              if (v37)
              {
                WFLogForCategory(0);
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = OSLogForWFLogLevel(4uLL);
                if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v39))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_219FC8000, v38, v39, "Removing current connected hotspot from scan results", buf, 2u);
                }

                objc_msgSend(v101, "removeObject:", v102);
              }
            }
          }
          v109 = 0u;
          v107 = 0u;
          v108 = 0u;
          v106 = 0u;
          v40 = v93;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v107;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v107 != v42)
                  objc_enumerationMutation(v40);
                v44 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
                if (v44)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "ssid");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "ssid");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v45, "isEqualToString:", v46) & 1) != 0)
                  {
                    v47 = objc_msgSend(v44, "iOSHotspot");

                    if (v47)
                    {
                      WFLogForCategory(0);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = OSLogForWFLogLevel(4uLL);
                      if ((unint64_t)WFCurrentLogLevel() >= 4 && v48)
                      {
                        v50 = v48;
                        if (os_log_type_enabled(v50, v49))
                        {
                          objc_msgSend(v102, "ssid");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v51;
                          _os_log_impl(&dword_219FC8000, v50, v49, "Removing AP record for hotspot ssid: %@", buf, 0xCu);

                        }
                      }

                      objc_msgSend(v100, "removeObject:", v44);
                    }
                  }
                  else
                  {

                  }
                }
              }
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
            }
            while (v41);
          }

          v8 = v96 + 1;
        }
        while (v96 + 1 != v94);
        v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
      }
      while (v94);
    }

    WFLogForCategory(0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v52)
    {
      v54 = v52;
      if (os_log_type_enabled(v54, v53))
      {
        v55 = objc_msgSend(v101, "count");
        v56 = objc_msgSend(v100, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v56;
        _os_log_impl(&dword_219FC8000, v54, v53, "Hotspots count: %lu, AP count: %lu", buf, 0x16u);
      }

    }
    v57 = (void *)objc_msgSend(v100, "mutableCopy");
    objc_msgSend(v57, "unionSet:", v101);

  }
  else
  {
    v57 = v89;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isAssociating"))
  {
    objc_msgSend(*(id *)(a1 + 32), "associationContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58 == 0;

    if (!v59)
    {
      WFLogForCategory(0);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v60 && os_log_type_enabled(v60, v61))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke";
        _os_log_impl(&dword_219FC8000, v60, v61, "%s: update during association", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "associationContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "network");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "isAirPortSettings") & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "associationContext");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "network");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            goto LABEL_103;
        }
        else
        {

        }
        WFLogForCategory(0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v80)
        {
          v82 = v80;
          if (os_log_type_enabled(v82, v81))
          {
            objc_msgSend(*(id *)(a1 + 32), "associationContext");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "network");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v84;
            _os_log_impl(&dword_219FC8000, v82, v81, "%s: removing associationCtx network %{public}@ from scan results", buf, 0x16u);

          }
        }

        objc_msgSend(*(id *)(a1 + 32), "associationContext");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "network");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "removeObject:", v85);

      }
      goto LABEL_102;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "interface");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "currentNetwork");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(*(id *)(a1 + 32), "interface");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "currentNetwork");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v126 = __Block_byref_object_copy_;
      v127 = __Block_byref_object_dispose_;
      v128 = (__CFString *)objc_opt_new();
      v70 = MEMORY[0x24BDAC760];
      v105[0] = MEMORY[0x24BDAC760];
      v105[1] = 3221225472;
      v105[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_123;
      v105[3] = &unk_24DC34B70;
      v105[4] = *(_QWORD *)(a1 + 32);
      v105[5] = buf;
      objc_msgSend(v57, "enumerateObjectsUsingBlock:", v105);
      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
      {
        WFLogForCategory(0);
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v71 && os_log_type_enabled(v71, v72))
        {
          v73 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v120 = 136315394;
          v121 = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke_2";
          v122 = 2112;
          v123 = v73;
          _os_log_impl(&dword_219FC8000, v71, v72, "%s: networks to remove from scan list='%@'", v120, 0x16u);
        }

      }
      v74 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v103[0] = v70;
      v103[1] = 3221225472;
      v103[2] = __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_125;
      v103[3] = &unk_24DC34B98;
      v104 = v57;
      objc_msgSend(v74, "enumerateObjectsUsingBlock:", v103);
      if (objc_msgSend(v62, "isHotspot20"))
      {
        objc_msgSend(v62, "matchingKnownNetworkProfile");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v75;
        if (v75)
        {
          objc_msgSend(v75, "displayedOperatorName");
          v77 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "viewController");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "currentNetwork");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setHotspot20Name:", v77);

        }
        else
        {
          WFLogForCategory(0);
          v77 = objc_claimAutoreleasedReturnValue();
          v88 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v77 && os_log_type_enabled(v77, v88))
          {
            *(_DWORD *)v120 = 136315394;
            v121 = "-[WFNetworkListController _updateViewControllerScanResults]_block_invoke_2";
            v122 = 2112;
            v123 = (uint64_t)v62;
            _os_log_impl(&dword_219FC8000, v77, v88, "%s: no profile for network='%@'", v120, 0x16u);
          }
        }

      }
      _Block_object_dispose(buf, 8);

    }
LABEL_102:

  }
LABEL_103:
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setNetworks:", v57);

  objc_msgSend(*(id *)(a1 + 32), "scanMetricsManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "ingestScanResults:", v57);

}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_114(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a2;
  objc_msgSend(v5, "ssid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "uniqueIdentifier");

  objc_msgSend(v4, "stringWithFormat:", CFSTR("network ssid: %@, uniqueidentifier: %lu\n"), v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_123(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

uint64_t __59__WFNetworkListController__updateViewControllerScanResults__block_invoke_125(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

- (BOOL)_canScanForHiddenNetwork:(id)a3
{
  return 1;
}

- (void)scanManagerScanningWillStart:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "scanning started", v5, 2u);
  }

}

- (void)scanManager:(id)a3 stateDidChange:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__WFNetworkListController_scanManager_stateDidChange___block_invoke;
  v4[3] = &unk_24DC348D0;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __54__WFNetworkListController_scanManager_stateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40) == 2;
    objc_msgSend(v4, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScanning:", v5);

  }
}

- (void)scanManager:(id)a3 updatedPartialResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFNetworkListController *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v32 = self;
  -[WFNetworkListController networks](self, "networks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    v13 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "ssid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v15, "ssid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v13, v18);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v31 = v7;
  objc_msgSend(v7, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (v26)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "ssid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v20, "removeObject:", v26);
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v23);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v30);

  -[WFNetworkListController setNetworks:](v32, "setNetworks:", v29);
  -[WFNetworkListController _updateViewControllerScanResults](v32, "_updateViewControllerScanResults");

}

- (void)scanManagerScanningDidFinish:(id)a3 withResults:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WFNetworkListController_scanManagerScanningDidFinish_withResults_error___block_invoke;
  block[3] = &unk_24DC34BC0;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__WFNetworkListController_scanManagerScanningDidFinish_withResults_error___block_invoke(id *a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1[4], "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScanning:", 0);

  }
  v5 = a1[5];
  if (objc_msgSend(a1[6], "code") == 16 || objc_msgSend(a1[6], "code") == 37)
  {
    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        v9 = objc_msgSend(a1[6], "code");
        v32 = 136315394;
        v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
        v34 = 2048;
        *(_QWORD *)v35 = v9;
        _os_log_impl(&dword_219FC8000, v8, v7, "%s: scan error (%ld), not updating UI scan list", (uint8_t *)&v32, 0x16u);
      }

    }
    WFLogForCategory(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10)
    {
      v12 = v10;
      if (os_log_type_enabled(v12, v11))
      {
        objc_msgSend(a1[4], "networks");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 136315394;
        v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
        v34 = 2112;
        *(_QWORD *)v35 = v13;
        _os_log_impl(&dword_219FC8000, v12, v11, "%s: current networks %@", (uint8_t *)&v32, 0x16u);

      }
    }

    objc_msgSend(a1[4], "networks");
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v14;
  }
  objc_msgSend(a1[4], "setNetworks:", v5);
  objc_msgSend(a1[5], "hs20Networks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "knownNetworksContainsHS20Networks") & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(a1[4], "wifiClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "showAllHS20Networks");

  }
  v18 = objc_msgSend(a1[4], "isHS20Supported");
  if (v15)
  {
    WFLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      v32 = 136315906;
      v33 = "-[WFNetworkListController scanManagerScanningDidFinish:withResults:error:]_block_invoke";
      v34 = 1024;
      *(_DWORD *)v35 = v18;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v16;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_219FC8000, v19, v20, "%s: hs20Supported %d hs20ProfilesInstalled %d hs20 networks found in scan: %@", (uint8_t *)&v32, 0x22u);
    }

  }
  if (v18)
  {
    v21 = objc_msgSend(v15, "count") ? v16 : 0;
    if (v21 == 1)
    {
      objc_msgSend(a1[4], "gasController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resolveProfilesForNetworks:", v15);

    }
  }
  objc_msgSend(a1[4], "_updateViewControllerScanResults");
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1[5], "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forKey:", v24, CFSTR("count"));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("WFNetworkListControllerScanDidFinishNotification"), a1[4], v23);

  if (!a1[6])
  {
    WFLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_219FC8000, v26, v27, "Remove all cache request sent to random manager because of a successful full cycle of scan!", (uint8_t *)&v32, 2u);
    }

    objc_msgSend(a1[4], "randomMACManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "interface");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentNetwork");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ssid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resetCacheWithCurrentNetworkName:", v31);

  }
}

- (void)scanManager:(id)a3 didFindHotspotHelperNetworks:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: found hotspot helper networks %@", buf, 0x16u);
  }

  if (!v5)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_38;
    *(_DWORD *)buf = 136315138;
    v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    v25 = "%s: nil helper networks";
    goto LABEL_37;
  }
  -[WFNetworkListController networks](self, "networks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_38;
    *(_DWORD *)buf = 136315138;
    v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
    v25 = "%s: nil networks";
LABEL_37:
    _os_log_impl(&dword_219FC8000, v23, v24, v25, buf, 0xCu);
LABEL_38:

    v9 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = v5;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[WFNetworkListController networks](self, "networks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ssid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scanRecordWithSSID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v9, "addObject:", v18);
        }
        else
        {
          WFLogForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 136315394;
            v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
            v34 = 2112;
            v35 = v15;
            _os_log_impl(&dword_219FC8000, v19, v20, "%s no matching scan record for helper network %@", buf, 0x16u);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFNetworkListController scanManager:didFindHotspotHelperNetworks:]";
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_219FC8000, v21, v22, "%s: updating views for %@", buf, 0x16u);
    }

    -[WFNetworkListController _updateViewsForNetworks:](self, "_updateViewsForNetworks:", v9);
  }
  v5 = v26;
LABEL_28:

}

- (id)scanManager:(id)a3 filterScanResults:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  os_log_type_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v28;
  id obj;
  void *v30;
  WFNetworkListController *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v31 = self;
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNetworkRestrictionActive");

  if (v7)
  {
    v30 = (void *)objc_msgSend(v5, "mutableCopy");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v8)
    {
      v9 = v8;
      v32 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "matchingKnownNetworkProfile");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_9;
          v13 = (void *)v12;
          -[WFNetworkListController wifiClient](v31, "wifiClient");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "whitelistingUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "matchingKnownNetworkProfile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "OSSpecificAttributes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PolicyUUID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v15, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
          {
LABEL_9:
            WFLogForCategory(0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v20)
            {
              v22 = v20;
              if (os_log_type_enabled(v22, v21))
              {
                -[WFNetworkListController wifiClient](v31, "wifiClient");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "whitelistingUUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v38 = "-[WFNetworkListController scanManager:filterScanResults:]";
                v39 = 2112;
                v40 = v11;
                v41 = 2112;
                v42 = v24;
                _os_log_impl(&dword_219FC8000, v22, v21, "%s: disregarding network='%@' no matching policyUUID (%@)", buf, 0x20u);

              }
            }

            objc_msgSend(v30, "removeObject:", v11);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v9);
    }

    v25 = v30;
    v26 = v25;
    v5 = v28;
  }
  else
  {
    v25 = 0;
    v26 = v5;
  }

  return v26;
}

- (void)scanManager:(id)a3 willStartScanRequest:(id)a4
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  WFLogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "scan request: %@ started", (uint8_t *)&v7, 0xCu);
  }

}

- (void)scanManager:(id)a3 didFinishScanRequest:(id)a4 results:(id)a5 error:(id)a6 timeElapsed:(double)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  WFScanPerformanceEvent *v20;
  _BOOL4 v21;
  uint64_t v22;
  WFNetworkListController *v23;
  void *v24;
  uint64_t v25;
  WFScanPerformanceEvent *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WFLogForCategory(6uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      *(_DWORD *)buf = 138412802;
      v31 = v11;
      v32 = 2048;
      v33 = objc_msgSend(v12, "count");
      v34 = 2048;
      v35 = a7;
      _os_log_impl(&dword_219FC8000, v16, v15, "scan request: %@ finished with %lu results in %f sec", buf, 0x20u);
    }

  }
  objc_msgSend(v11, "ssid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = 2;
  else
    v18 = objc_msgSend(v11, "channelListIncludesTwoFour") ^ 1;
  v28 = v18;
  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [WFScanPerformanceEvent alloc];
  v21 = -[WFNetworkListController firstScanFinished](self, "firstScanFinished");
  v22 = objc_msgSend(v12, "count");
  v29 = v12;
  v23 = self;
  if (v13)
  {
    v24 = v13;
    v13 = (id)objc_msgSend(v13, "code");
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(v11, "lowPriorityScan");
  LOBYTE(v27) = objc_msgSend(v11, "applyRssiThresholdFilter");
  v26 = -[WFScanPerformanceEvent initWithScanReason:timeElasped:firstScan:results:errorCode:lowPriority:rssiFilter:](v20, "initWithScanReason:timeElasped:firstScan:results:errorCode:lowPriority:rssiFilter:", v28, (unint64_t)a7, !v21, v22, v13, v25, v27);
  objc_msgSend(v19, "processEvent:", v26);

  -[WFNetworkListController setFirstScanFinished:](v23, "setFirstScanFinished:", 1);
}

- (BOOL)isAssociating
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[WFNetworkListController associationContext](self, "associationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFNetworkListController associationContext](self, "associationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 1)
    {
      v5 = 1;
    }
    else
    {
      -[WFNetworkListController associationContext](self, "associationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "state") == 2;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_associateToScanRecord:(id)a3
{
  id v4;

  v4 = a3;
  if (-[WFNetworkListController _canStartAssociationToNetwork:](self, "_canStartAssociationToNetwork:"))
    -[WFNetworkListController _associateToScanRecord:profile:](self, "_associateToScanRecord:profile:", v4, 0);

}

- (void)_associateToScanRecord:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  char *v11;
  void *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  WFNetworkListController *v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(5uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      objc_msgSend(v6, "ssid");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v11;
      _os_log_impl(&dword_219FC8000, v10, v9, "{ASSOC+} association started to %@", buf, 0xCu);

    }
  }

  if (-[WFNetworkListController isAssociating](self, "isAssociating"))
  {
    WFLogForCategory(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v12)
    {
      v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        -[WFNetworkListController associationContext](self, "associationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stateDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "networkName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v44 = "-[WFNetworkListController _associateToScanRecord:profile:]";
        v45 = 2112;
        v46 = v16;
        v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_219FC8000, v14, v13, "%s association state is <%@> with network %@", buf, 0x20u);

      }
    }

  }
  v19 = -[WFNetworkListController _shouldPauseScanning](self, "_shouldPauseScanning");
  WFLogForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v20 && os_log_type_enabled(v20, v21))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[WFNetworkListController _associateToScanRecord:profile:]";
    v45 = 1024;
    LODWORD(v46) = v19;
    _os_log_impl(&dword_219FC8000, v20, v21, "%s- should pause scanning %d", buf, 0x12u);
  }

  if (v19)
    -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
  -[WFNetworkListController viewController](self, "viewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_32;
  }
  else
  {

  }
  -[WFNetworkListController viewController](self, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = __58__WFNetworkListController__associateToScanRecord_profile___block_invoke;
    v40 = &unk_24DC34BE8;
    v41 = self;
    v42 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], &v37);

  }
  else
  {
    -[WFNetworkListController viewController](self, "viewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCurrentNetwork:", v6);

  }
  if (-[WFNetworkListController viewControllerSupportsCurrentNetworkSubtitle](self, "viewControllerSupportsCurrentNetworkSubtitle", v37, v38, v39, v40, v41))
  {
    -[WFNetworkListController viewController](self, "viewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCurrentNetworkSubtitle:", 0);

  }
  -[WFNetworkListController viewController](self, "viewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  objc_msgSend(v6, "scaledRSSI");
  v31 = v30;
  if ((v29 & 1) != 0)
  {
    v32 = WFSignalBarsFromScaledRSSI();
    -[WFNetworkListController viewController](self, "viewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCurrentNetworkSignalBars:", v32);
  }
  else
  {
    -[WFNetworkListController viewController](self, "viewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = v31;
    objc_msgSend(v33, "setCurrentNetworkScaledRSSI:", v34);
  }

  -[WFNetworkListController viewController](self, "viewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCurrentNetworkState:", 1);

LABEL_32:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFNetworkListController _associateToHotspotDevice:](self, "_associateToHotspotDevice:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v6;
      if (objc_msgSend(v36, "isUnconfiguredAccessory"))
      {
        -[WFNetworkListController _associateToUnconfiguredAccessory:](self, "_associateToUnconfiguredAccessory:", v36);
      }
      else if (objc_msgSend(v36, "isHotspot20")
             && -[WFNetworkListController isHS20Supported](self, "isHS20Supported"))
      {
        -[WFNetworkListController _associateToHS20Network:](self, "_associateToHS20Network:", v36);
      }
      else if (objc_msgSend(v36, "isEnterprise"))
      {
        -[WFNetworkListController _associateToEnterpriseNetwork:profile:](self, "_associateToEnterpriseNetwork:profile:", v36, v7);
      }
      else
      {
        -[WFNetworkListController _associateToNetwork:profile:](self, "_associateToNetwork:profile:", v36, v7);
      }

    }
  }

}

void __58__WFNetworkListController__associateToScanRecord_profile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentNetwork:previousNetwork:reason:", v2, v4, 1);

}

- (BOOL)_isChannelAllowedForScanPerCurrentLocale:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFNetworkListController interface](self, "interface", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceScanChannelsPerCurLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "channel") == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_associateToHotspotDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v4);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke;
  v7[3] = &unk_24DC34BE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  WFScanChannel *v30;
  WFScanChannel *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  os_log_type_t v42;
  void *v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  NSObject *v47;
  os_log_type_t v48;
  void *v49;
  void *v50;
  os_log_type_t v51;
  void *v52;
  void *v53;
  void *v54;
  WFNetworkProfile *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  os_log_type_t v61;
  NSObject *v62;
  id v63;
  char *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  os_log_type_t v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  os_log_type_t v74;
  void *v75;
  os_log_type_t v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  os_log_type_t v80;
  void *v81;
  os_log_type_t v82;
  void *v83;
  NSObject *v84;
  WFNetworkProfile *v85;
  NSObject *v86;
  id v87;
  dispatch_semaphore_t v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  id v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t *v97;
  _BYTE *v98;
  id v99[2];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  id location;
  _QWORD v105[4];
  id v106;
  id v107;
  NSObject *v108;
  _BYTE *v109;
  _BYTE *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  char v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id obj;
  uint8_t v122[4];
  const char *v123;
  __int16 v124;
  void *v125;
  _BYTE v126[24];
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  id v130;
  uint8_t v131[128];
  _BYTE buf[24];
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v90;
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: TIME: start %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v133 = __Block_byref_object_copy_;
  v134 = __Block_byref_object_dispose_;
  v135 = 0;
  objc_msgSend(*(id *)(a1 + 32), "hotspotInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)&buf[8];
  obj = 0;
  objc_msgSend(v4, "enableHotspot:error:", v5, &obj);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)v126 = 136315138;
    *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: TIME: enabling remote hotspot", v126, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "interface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deviceScanChannels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v118;
LABEL_24:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v118 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v22);
        v24 = objc_msgSend(v23, "channel");
        objc_msgSend(v91, "channel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v24) = v24 == objc_msgSend(v25, "integerValue");

        if ((v24 & 1) != 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
          if (v20)
            goto LABEL_24;
          goto LABEL_30;
        }
      }
      v14 = v23;

      if (!v14)
        goto LABEL_33;
      v130 = v14;
      v26 = 1;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v130, 1);
      v86 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_30:

LABEL_33:
      objc_msgSend(*(id *)(a1 + 32), "interface");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deviceScanChannels");
      v86 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v26 = 0;
    }
    objc_msgSend(v91, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFScanRequest scanRequestForSSID:channels:](WFScanRequest, "scanRequestForSSID:channels:", v28, v86);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      objc_msgSend(v89, "setDwellTime:", 110);
      v87 = -[NSObject mutableCopy](v86, "mutableCopy");
      v29 = v26 ^ 1;
      if (!v87)
        v29 = 1;
      if ((v29 & 1) == 0 && (unint64_t)objc_msgSend(v14, "channel") >= 0x24)
      {
        if (objc_msgSend(v14, "channel") != 149
          && objc_msgSend(*(id *)(a1 + 32), "_isChannelAllowedForScanPerCurrentLocale:", 149))
        {
          v30 = -[WFScanChannel initWithChannel:flags:]([WFScanChannel alloc], "initWithChannel:flags:", 149, objc_msgSend(v14, "flags"));
          objc_msgSend(v87, "addObject:", v30);

        }
        if (objc_msgSend(v14, "channel") != 44
          && objc_msgSend(*(id *)(a1 + 32), "_isChannelAllowedForScanPerCurrentLocale:", 44))
        {
          v31 = -[WFScanChannel initWithChannel:flags:]([WFScanChannel alloc], "initWithChannel:flags:", 44, objc_msgSend(v14, "flags"));
          objc_msgSend(v87, "addObject:", v31);

        }
      }
      objc_msgSend(v91, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v87, "copy");
      +[WFScanRequest scanRequestForSSID:channels:](WFScanRequest, "scanRequestForSSID:channels:", v32, v33);
      v84 = objc_claimAutoreleasedReturnValue();

      if (v84)
      {
        -[NSObject setDwellTime:](v84, "setDwellTime:", 110);
        v88 = dispatch_semaphore_create(0);
        *(_QWORD *)v126 = 0;
        *(_QWORD *)&v126[8] = v126;
        *(_QWORD *)&v126[16] = 0x3032000000;
        v127 = __Block_byref_object_copy_;
        v128 = __Block_byref_object_dispose_;
        v129 = 0;
        do
        {
          WFLogForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v34 && os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)v122 = 136315138;
            v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
            _os_log_impl(&dword_219FC8000, v34, v35, "%s: TIME: scanning for remote hotspot", v122, 0xCu);
          }

          v113 = 0;
          v114 = &v113;
          v115 = 0x2020000000;
          v116 = 0;
          v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

          objc_msgSend(*(id *)(a1 + 32), "interface");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = MEMORY[0x24BDAC760];
          v105[1] = 3221225472;
          v105[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_146;
          v105[3] = &unk_24DC34C10;
          v109 = buf;
          v38 = v91;
          v106 = v38;
          v110 = v126;
          v111 = &v113;
          v39 = v90;
          v107 = v39;
          v112 = 0x403E000000000000;
          v40 = v88;
          v108 = v40;
          objc_msgSend(v37, "asyncScanRequest:reply:", v89, v105);

          dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
          WFLogForCategory(0);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v41 && os_log_type_enabled(v41, v42))
          {
            v43 = *(void **)(*(_QWORD *)&v126[8] + 40);
            *(_DWORD *)v122 = 136315394;
            v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke_2";
            v124 = 2112;
            v125 = v43;
            _os_log_impl(&dword_219FC8000, v41, v42, "%s: TIME: directed scan for instant hotspot found %@", v122, 0x16u);
          }

          if (*((_BYTE *)v114 + 24))
          {
            WFLogForCategory(0);
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = OSLogForWFLogLevel(1uLL);
            v46 = 4;
            if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, v45))
            {
              *(_DWORD *)v122 = 136315138;
              v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
              _os_log_impl(&dword_219FC8000, v44, v45, "%s: retrying scan ", v122, 0xCu);
            }
          }
          else if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) || (v53 = *(void **)(*(_QWORD *)&v126[8] + 40)) == 0)
          {
            WFLogForCategory(0);
            v47 = objc_claimAutoreleasedReturnValue();
            v48 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v47 && os_log_type_enabled(v47, v48))
            {
              v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v122 = 136315394;
              v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
              v124 = 2112;
              v125 = v49;
              _os_log_impl(&dword_219FC8000, v47, v48, "%s: error on directed scan for hotspot %@", v122, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "_presentHotspotErrorContextWithDevice:hotspotError:failure:", *(_QWORD *)(a1 + 40), 0, 4);
            objc_msgSend(*(id *)(a1 + 32), "wifiClient");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setAutoJoinEnabled:", 1);

            WFLogForCategory(0);
            v44 = objc_claimAutoreleasedReturnValue();
            v51 = OSLogForWFLogLevel(1uLL);
            v46 = 1;
            if (WFCurrentLogLevel() && v44)
            {
              v44 = v44;
              if (os_log_type_enabled(v44, v51))
              {
                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v122 = 136315394;
                v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
                v124 = 2112;
                v125 = v52;
                _os_log_impl(&dword_219FC8000, v44, v51, "%s: TIME: end %@", v122, 0x16u);

              }
              v46 = 1;
            }
          }
          else
          {
            objc_msgSend(v53, "matchingKnownNetworkProfile");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54
              && (v55 = [WFNetworkProfile alloc],
                  objc_msgSend(*(id *)(*(_QWORD *)&v126[8] + 40), "matchingKnownNetworkProfile"),
                  v56 = (void *)objc_claimAutoreleasedReturnValue(),
                  v85 = -[WFNetworkProfile initWithCoreWiFiProfile:](v55, "initWithCoreWiFiProfile:", v56),
                  v56,
                  v85))
            {
              v57 = (void *)-[WFNetworkProfile mutableCopy](v85, "mutableCopy");
            }
            else
            {
              +[WFMutableNetworkProfile mutableProfileForNetwork:](WFMutableNetworkProfile, "mutableProfileForNetwork:", *(_QWORD *)(*(_QWORD *)&v126[8] + 40));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = 0;
            }
            objc_msgSend(v38, "password");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setPassword:", v58);

            objc_msgSend(v57, "setInstantHotspotJoin:", 1);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setHotspotDeviceIdentifier:", v59);

            WFLogForCategory(0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v60)
            {
              v62 = v60;
              if (os_log_type_enabled(v62, v61))
              {
                v63 = v14;
                objc_msgSend(v57, "ssid");
                v64 = (char *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "hotspotDeviceIdentifier");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v122 = 138412546;
                v123 = v64;
                v124 = 2112;
                v125 = v65;
                _os_log_impl(&dword_219FC8000, v62, v61, "Saving device identifier for hotspot: %@, deviceID: %@", v122, 0x16u);

                v14 = v63;
              }

            }
            objc_initWeak(&location, *(id *)(a1 + 32));
            v100 = 0;
            v101 = &v100;
            v102 = 0x2020000000;
            v103 = 0;
            objc_msgSend(*(id *)(a1 + 32), "interface");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = *(_QWORD *)(*(_QWORD *)&v126[8] + 40);
            v92[0] = MEMORY[0x24BDAC760];
            v92[1] = 3221225472;
            v92[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_151;
            v92[3] = &unk_24DC34C38;
            objc_copyWeak(v99, &location);
            v97 = &v100;
            v93 = v39;
            v99[1] = (id)0x403E000000000000;
            v94 = *(id *)(a1 + 40);
            v68 = v40;
            v95 = v68;
            v98 = v126;
            v44 = v57;
            v96 = v44;
            objc_msgSend(v66, "asyncAssociateToNetwork:profile:reply:", v67, v44, v92);

            dispatch_semaphore_wait(v68, 0xFFFFFFFFFFFFFFFFLL);
            if (*((_BYTE *)v101 + 24))
            {
              v46 = 4;
            }
            else
            {
              WFLogForCategory(0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v69)
              {
                v71 = v69;
                if (os_log_type_enabled(v71, v70))
                {
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v122 = 136315394;
                  v123 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
                  v124 = 2112;
                  v125 = v72;
                  _os_log_impl(&dword_219FC8000, v71, v70, "%s: TIME: end %@", v122, 0x16u);

                }
              }

              v46 = 0;
            }

            objc_destroyWeak(v99);
            _Block_object_dispose(&v100, 8);
            objc_destroyWeak(&location);

          }
          _Block_object_dispose(&v113, 8);
        }
        while (v46 == 4);
        _Block_object_dispose(v126, 8);

      }
      else
      {
        WFLogForCategory(0);
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v79 && os_log_type_enabled(v79, v80))
        {
          *(_DWORD *)v126 = 136315138;
          *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
          _os_log_impl(&dword_219FC8000, v79, v80, "%s: error creating scan request for retry", v126, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_presentHotspotErrorContextWithDevice:hotspotError:failure:", *(_QWORD *)(a1 + 40), 0, 4);
        objc_msgSend(*(id *)(a1 + 32), "wifiClient");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setAutoJoinEnabled:", 1);

        WFLogForCategory(0);
        v40 = objc_claimAutoreleasedReturnValue();
        v82 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v40)
        {
          v40 = v40;
          if (os_log_type_enabled(v40, v82))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v126 = 136315394;
            *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
            *(_WORD *)&v126[12] = 2112;
            *(_QWORD *)&v126[14] = v83;
            _os_log_impl(&dword_219FC8000, v40, v82, "%s: TIME: end %@", v126, 0x16u);

          }
        }
      }

      v77 = v84;
    }
    else
    {
      WFLogForCategory(0);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v73 && os_log_type_enabled(v73, v74))
      {
        *(_DWORD *)v126 = 136315138;
        *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        _os_log_impl(&dword_219FC8000, v73, v74, "%s: error creating scan request", v126, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_presentHotspotErrorContextWithDevice:hotspotError:failure:", *(_QWORD *)(a1 + 40), 0, 4);
      objc_msgSend(*(id *)(a1 + 32), "wifiClient");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setAutoJoinEnabled:", 1);

      WFLogForCategory(0);
      v87 = (id)objc_claimAutoreleasedReturnValue();
      v76 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v87)
        goto LABEL_111;
      v77 = v87;
      if (os_log_type_enabled(v77, v76))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v126 = 136315394;
        *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        *(_WORD *)&v126[12] = 2112;
        *(_QWORD *)&v126[14] = v78;
        _os_log_impl(&dword_219FC8000, v77, v76, "%s: TIME: end %@", v126, 0x16u);

      }
      v87 = v77;
    }

LABEL_111:
    v16 = v86;
LABEL_112:

    goto LABEL_113;
  }
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v126 = 136315394;
    *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
    *(_WORD *)&v126[12] = 2112;
    *(_QWORD *)&v126[14] = v11;
    _os_log_impl(&dword_219FC8000, v9, v10, "%s: error enabling hotspot: %@", v126, 0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == -71146)
    v12 = 19;
  else
    v12 = 5;
  objc_msgSend(*(id *)(a1 + 32), "_presentHotspotErrorContextWithDevice:hotspotError:failure:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v12);
  objc_msgSend(*(id *)(a1 + 32), "wifiClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoJoinEnabled:", 1);

  WFLogForCategory(0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v126 = 136315394;
      *(_QWORD *)&v126[4] = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
      *(_WORD *)&v126[12] = 2112;
      *(_QWORD *)&v126[14] = v17;
      _os_log_impl(&dword_219FC8000, v16, v15, "%s: TIME: end %@", v126, 0x16u);

    }
    v14 = v16;
    goto LABEL_112;
  }
LABEL_113:

  _Block_object_dispose(buf, 8);
}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  os_log_type_t v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = v5;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("ssid == %@"), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "filteredSetUsingPredicate:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v17 < *(double *)(a1 + 80);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
      _os_log_impl(&dword_219FC8000, v18, v19, "%s: scan failed, dispatch retry in 1 second", buf, 0xCu);
    }

    v20 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(21, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_147;
    block[3] = &unk_24DC348F8;
    v23 = *(id *)(a1 + 48);
    dispatch_after(v20, v21, block);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

intptr_t __53__WFNetworkListController__associateToHotspotDevice___block_invoke_147(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__WFNetworkListController__associateToHotspotDevice___block_invoke_151(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  BOOL v18;
  int v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    if (objc_msgSend(WeakRetained, "viewControllerSupportsCurrentNetworkSubtitle"))
    {
      objc_msgSend(v7, "viewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentNetworkSubtitle:", 0);

    }
    objc_msgSend(v7, "_handleAssociationResult:error:network:profile:shouldSaveProfile:", 1, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56), 0);
    WFLogForCategory(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9)
    {
      v11 = v9;
      if (os_log_type_enabled(v11, v10))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "ssid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke_2";
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_219FC8000, v11, v10, "%s: TIME: associated to hotspot %@ sucessfully", buf, 0x16u);

      }
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14 < *(double *)(a1 + 88);
    v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v18 = v16 == 0;
    else
      v18 = 1;
    v19 = !v18;
    if (v15)
    {
      if (v19 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        _os_log_impl(&dword_219FC8000, v16, v17, "%s: association failed, dispatch retry in 1 second", buf, 0xCu);
      }

      v20 = dispatch_time(0, 1000000000);
      dispatch_get_global_queue(21, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__WFNetworkListController__associateToHotspotDevice___block_invoke_152;
      block[3] = &unk_24DC348F8;
      v23 = *(id *)(a1 + 48);
      dispatch_after(v20, v21, block);

    }
    else
    {
      if (v19 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFNetworkListController _associateToHotspotDevice:]_block_invoke";
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_219FC8000, v16, v17, "%s: error on associating to hotspot %@", buf, 0x16u);
      }

      objc_msgSend(v7, "_presentHotspotErrorContextWithDevice:hotspotError:failure:", *(_QWORD *)(a1 + 40), 0, 13);
    }

  }
}

intptr_t __53__WFNetworkListController__associateToHotspotDevice___block_invoke_152(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_associateToNetwork:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFNetworkProfile *v10;
  void *v11;
  WFNetworkProfile *v12;
  WFNetworkProfile *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  os_log_type_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  char *v47;
  os_log_type_t v48;
  char *v49;
  WFNetworkProfile *v50;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  os_log_type_t v56;
  NSObject *v57;
  char *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v6);
  v72 = v7;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  if (!v8)
  {
    objc_msgSend(v6, "matchingKnownNetworkProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (v10 = [WFNetworkProfile alloc],
          objc_msgSend(v6, "matchingKnownNetworkProfile"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = -[WFNetworkProfile initWithCoreWiFiProfile:](v10, "initWithCoreWiFiProfile:", v11),
          v8 = (void *)-[WFNetworkProfile mutableCopy](v12, "mutableCopy"),
          v12,
          v11,
          !v8))
    {
      v13 = -[WFNetworkProfile initWithNetwork:]([WFNetworkProfile alloc], "initWithNetwork:", v6);
      v8 = (void *)-[WFNetworkProfile mutableCopy](v13, "mutableCopy");

    }
  }
  objc_msgSend(v6, "ssid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController randomMACManager](self, "randomMACManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSSIDinCache:", v14);

  if (v16)
  {
    -[WFNetworkListController randomMACManager](self, "randomMACManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldEnableRandomMACForSSID:", v14);

    objc_msgSend(v8, "setRandomMACAddressEnabled:", v18);
    -[WFNetworkListController randomMACManager](self, "randomMACManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachedRandomMACForSSID:", v14);
    v20 = (char *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setRandomMACAddress:", v20);
    WFLogForCategory(8uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412802;
      v79 = v20;
      v80 = 2112;
      v81 = v14;
      v82 = 1024;
      LODWORD(v83) = v18;
      _os_log_impl(&dword_219FC8000, v21, v22, "using cached address='%@' for association to '%@' (private address enabled=%d)", buf, 0x1Cu);
    }

  }
  objc_msgSend(v8, "password");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (v24)
  {
    -[WFNetworkListController scanManager](self, "scanManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hotspotHelperForScanRecord:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      WFLogForCategory(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27)
      {
        v29 = v27;
        if (os_log_type_enabled(v29, v28))
        {
          objc_msgSend(v26, "ssid");
          v30 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "bundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v79 = v30;
          v80 = 2112;
          v81 = v31;
          _os_log_impl(&dword_219FC8000, v29, v28, "Found matching hotspot plugin network ssid: %@ (bundleIdentifier %@), using supplied password", buf, 0x16u);

        }
      }

      objc_msgSend(v26, "password");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPassword:", v32);

      objc_msgSend(v8, "setUserProvidedPassword:", 1);
      objc_msgSend(v26, "bundleIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOriginatorBundleIdentifier:", v33);

    }
  }
  if (objc_msgSend(v8, "shouldBeRemovedIfApplicationIsNoLongerInstalled"))
  {
    WFLogForCategory(0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v34)
    {
      v36 = v34;
      if (os_log_type_enabled(v36, v35))
      {
        objc_msgSend(v8, "originatorBundleIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v79 = "-[WFNetworkListController _associateToNetwork:profile:]";
        v80 = 2112;
        v81 = v8;
        v82 = 2114;
        v83 = v37;
        _os_log_impl(&dword_219FC8000, v36, v35, "%s: removing application based network (%@) as it's host application (%{public}@) not installed", buf, 0x20u);

      }
    }

    objc_msgSend(v6, "matchingKnownNetworkProfile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[WFNetworkListController wifiClient](self, "wifiClient");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "cInterface");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "matchingKnownNetworkProfile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0;
      v42 = objc_msgSend(v40, "removeKnownNetworkProfile:reason:error:", v41, 2, &v77);
      v43 = v77;

      if ((v42 & 1) != 0)
      {
LABEL_39:

        v50 = -[WFNetworkProfile initWithNetwork:]([WFNetworkProfile alloc], "initWithNetwork:", v6);
        v51 = -[WFNetworkProfile mutableCopy](v50, "mutableCopy");

        v8 = (void *)v51;
        goto LABEL_40;
      }
      WFLogForCategory(0);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v44)
      {
        v46 = v44;
        if (os_log_type_enabled(v46, v45))
        {
          objc_msgSend(v6, "ssid");
          v47 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v79 = v47;
          v80 = 2112;
          v81 = v43;
          _os_log_impl(&dword_219FC8000, v46, v45, "Failed to remove '%@' error='%@'", buf, 0x16u);

        }
      }
    }
    else
    {
      WFLogForCategory(0);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v48 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v43)
        goto LABEL_39;
      v44 = v43;
      if (os_log_type_enabled(v44, v48))
      {
        objc_msgSend(v6, "ssid");
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v49;
        _os_log_impl(&dword_219FC8000, v44, v48, "no matching known network profile for '%@'", buf, 0xCu);

      }
      v43 = v44;
    }

    goto LABEL_39;
  }
LABEL_40:
  if (objc_msgSend(v6, "securityMode") == 128
    && (objc_msgSend(v8, "password"),
        v52 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = v52 == 0,
        v52,
        v53))
  {
    -[WFNetworkListController associationContext](self, "associationContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setState:", 2);

    -[WFNetworkListController _promptCredentialsForNetwork:profile:](self, "_promptCredentialsForNetwork:profile:", v6, v8);
  }
  else
  {
    -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      WFLogForCategory(0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v55)
      {
        v57 = v55;
        if (os_log_type_enabled(v57, v56))
        {
          -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
          v58 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v58;
          _os_log_impl(&dword_219FC8000, v57, v56, "other network vc is visible %@", buf, 0xCu);

        }
      }

      -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_opt_respondsToSelector();

      if ((v60 & 1) != 0)
      {
        -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setJoining:", 1);

      }
      -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_opt_respondsToSelector();

      if ((v63 & 1) != 0)
      {
        v64 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkJoiningPromptFormat"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ssid");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setActivityString:", v68);

      }
    }
    objc_initWeak((id *)buf, self);
    -[WFNetworkListController interface](self, "interface");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __55__WFNetworkListController__associateToNetwork_profile___block_invoke;
    v73[3] = &unk_24DC34C60;
    objc_copyWeak(&v76, (id *)buf);
    v74 = v6;
    v75 = v8;
    objc_msgSend(v70, "asyncAssociateToNetwork:profile:reply:", v74, v75, v73);

    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);
  }

}

void __55__WFNetworkListController__associateToNetwork_profile___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAssociationResult:error:network:profile:shouldSaveProfile:", a2, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_associateToEnterpriseNetwork:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFNetworkProfile *v10;
  void *v11;
  WFNetworkProfile *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  char *v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  char v22;
  void *v23;
  os_log_type_t v24;
  BOOL v25;
  int v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  NSObject *v32;
  char *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v6);
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  if (!v8)
  {
    objc_msgSend(v6, "matchingKnownNetworkProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (v10 = [WFNetworkProfile alloc],
          objc_msgSend(v6, "matchingKnownNetworkProfile"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = -[WFNetworkProfile initWithCoreWiFiProfile:](v10, "initWithCoreWiFiProfile:", v11),
          v8 = (void *)-[WFNetworkProfile mutableCopy](v12, "mutableCopy"),
          v12,
          v11,
          !v8))
    {
      WFLogForCategory(5uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          objc_msgSend(v6, "ssid");
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v40 = v16;
          _os_log_impl(&dword_219FC8000, v15, v14, "no existing profile for %@", buf, 0xCu);

        }
      }

      +[WFMutableNetworkProfile mutableProfileForNetwork:](WFMutableNetworkProfile, "mutableProfileForNetwork:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v8, "securityMode") == 1075)
  {
    WFLogForCategory(5uLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17)
    {
      v19 = v17;
      if (os_log_type_enabled(v19, v18))
      {
        objc_msgSend(v6, "ssid");
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "securityMode");
        *(_DWORD *)buf = 138543618;
        v40 = v20;
        v41 = 2048;
        v42 = v21;
        _os_log_impl(&dword_219FC8000, v19, v18, "%{public}@ security is any-encrpytion, proceeding with scanned network's security %ld", buf, 0x16u);

      }
    }

    objc_msgSend(v8, "setSecurityMode:", objc_msgSend(v6, "securityMode"));
  }
  v22 = objc_msgSend(v8, "canAttemptJoin");
  WFLogForCategory(5uLL);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v25 = v23 == 0;
  else
    v25 = 1;
  v26 = !v25;
  if ((v22 & 1) != 0)
  {
    if (v26)
    {
      v27 = v23;
      if (os_log_type_enabled(v27, v24))
      {
        objc_msgSend(v6, "ssid");
        v28 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v28;
        v41 = 2112;
        v42 = (uint64_t)v8;
        _os_log_impl(&dword_219FC8000, v27, v24, "proceeding with join for %@ (profile: %@)", buf, 0x16u);

      }
    }

    WFLogForCategory(5uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "-[WFNetworkListController _associateToEnterpriseNetwork:profile:]";
      v41 = 2112;
      v42 = (uint64_t)v6;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_219FC8000, v29, v30, "%s: Invoking asyncAssociateToNetwork with network %@ profile %@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    -[WFNetworkListController interface](self, "interface");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __65__WFNetworkListController__associateToEnterpriseNetwork_profile___block_invoke;
    v35[3] = &unk_24DC34C60;
    objc_copyWeak(&v38, (id *)buf);
    v36 = v6;
    v37 = v8;
    objc_msgSend(v31, "asyncAssociateToNetwork:profile:reply:", v36, v37, v35);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v26)
    {
      v32 = v23;
      if (os_log_type_enabled(v32, v24))
      {
        objc_msgSend(v6, "ssid");
        v33 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v33;
        _os_log_impl(&dword_219FC8000, v32, v24, "user credentials prompt required for %@", buf, 0xCu);

      }
    }

    -[WFNetworkListController associationContext](self, "associationContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setState:", 2);

    -[WFNetworkListController _promptCredentialsForNetwork:profile:](self, "_promptCredentialsForNetwork:profile:", v6, v8);
  }

}

void __65__WFNetworkListController__associateToEnterpriseNetwork_profile___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAssociationResult:error:network:profile:shouldSaveProfile:", a2, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_associateToHS20Network:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  WFNetworkProfile *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "associating to HS20 network %@", buf, 0xCu);
  }

  objc_msgSend(v4, "matchingKnownNetworkProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WFLogForCategory(5uLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        objc_msgSend(v4, "matchingKnownNetworkProfile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_impl(&dword_219FC8000, v10, v9, "using matchingKnownNetworkProfile %@", buf, 0xCu);

      }
    }

    v12 = [WFNetworkProfile alloc];
    objc_msgSend(v4, "matchingKnownNetworkProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFNetworkProfile initWithCoreWiFiProfile:](v12, "initWithCoreWiFiProfile:", v13);
  }
  else
  {
    -[WFNetworkListController gasController](self, "gasController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profileForNetwork:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  if (v15)
  {
    WFLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_219FC8000, v16, v17, "using cached profile %@", buf, 0xCu);
    }

    -[WFNetworkListController _associateToEnterpriseNetwork:profile:](self, "_associateToEnterpriseNetwork:profile:", v4, v15);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[WFNetworkListController gasController](self, "gasController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __51__WFNetworkListController__associateToHS20Network___block_invoke;
    v19[3] = &unk_24DC34C88;
    objc_copyWeak(&v21, (id *)buf);
    v20 = v4;
    objc_msgSend(v18, "resolveProfileForNetwork:handler:force:", v20, v19, 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

void __51__WFNetworkListController__associateToHS20Network___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  id WeakRetained;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "resolved profile %@ error %@", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_associateToEnterpriseNetwork:profile:", *(_QWORD *)(a1 + 32), v5);

}

- (void)_associateToUnconfiguredAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "associating to unconfigured accessory %@", (uint8_t *)&v7, 0xCu);
  }

  if (objc_msgSend(v4, "unconfiguredAccessoryType") == 4)
    -[WFNetworkListController _promptForSecureWACDevice:](self, "_promptForSecureWACDevice:", v4);
  else
    -[WFNetworkListController _runUnconfiguredJoinOperationForNetwork:](self, "_runUnconfiguredJoinOperationForNetwork:", v4);

}

- (void)_promptForSecureWACDevice:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int IsChinaDevice;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[WFNetworkListController _promptForSecureWACDevice:]";
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: network %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSecureWACPromptTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "unconfiguredDeviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v29, v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceCapability");
  IsChinaDevice = WFCapabilityIsChinaDevice();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (IsChinaDevice)
    v14 = CFSTR("kWFLocSecureWACPromptMessage_CH");
  else
    v14 = CFSTR("kWFLocSecureWACPromptMessage");
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v28, v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsChinaDevice)
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFLocSecureWACPromptButtonAdd_CH"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  else
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFLocSecureWACPromptButtonAdd"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67E8];
  v19 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __53__WFNetworkListController__promptForSecureWACDevice___block_invoke;
  v32[3] = &unk_24DC34CB0;
  objc_copyWeak(&v34, (id *)buf);
  v20 = v4;
  v33 = v20;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v17, 0, v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v21);
  v22 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocHomeAppRequiredButtonCancel"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __53__WFNetworkListController__promptForSecureWACDevice___block_invoke_2;
  v30[3] = &unk_24DC34CD8;
  objc_copyWeak(&v31, (id *)buf);
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v25);
  -[WFNetworkListController viewController](self, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentViewController:animated:completion:", v15, 1, 0);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);

  objc_destroyWeak((id *)buf);
}

void __53__WFNetworkListController__promptForSecureWACDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_openHomeAppForNetwork:", *(_QWORD *)(a1 + 32));

}

void __53__WFNetworkListController__promptForSecureWACDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateViewControllerConnectedNetwork");

}

- (void)_downloadHomeApp
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v4[16];

  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219FC8000, v2, v3, "Starting Home download", v4, 2u);
  }

}

- (void)_runUnconfiguredJoinOperationForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  WFUnconfiguredJoinOperation *v14;
  void *v15;
  WFUnconfiguredJoinOperation *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id from;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x24BE03960], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isUnconfiguredAccessorySTAOnly"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[WFNetworkListController networks](self, "networks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "attributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BE03958]);
  }
  -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v4);
  v14 = [WFUnconfiguredJoinOperation alloc];
  -[WFNetworkListController viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFUnconfiguredJoinOperation initWithParameters:rootViewController:](v14, "initWithParameters:rootViewController:", v7, v15);

  objc_initWeak(&location, v16);
  objc_initWeak(&from, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__WFNetworkListController__runUnconfiguredJoinOperationForNetwork___block_invoke;
  v19[3] = &unk_24DC34D00;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  v17 = v4;
  v20 = v17;
  -[WFUnconfiguredJoinOperation setCompletionBlock:](v16, "setCompletionBlock:", v19);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __67__WFNetworkListController__runUnconfiguredJoinOperationForNetwork___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WFLogForCategory(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        objc_msgSend(WeakRetained, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_219FC8000, v6, v5, "Error joining unconfigured network %@", (uint8_t *)&v11, 0xCu);

      }
    }

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_associationDidFinish:error:network:", v9 == 0, v10, *(_QWORD *)(a1 + 32));

}

- (void)_openHomeAppForNetwork:(id)a3
{
  NSObject *v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  os_log_type_t v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      -[NSObject unconfiguredDeviceID](v4, "unconfiguredDeviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s: network %@ (id: %{Public}@)", (uint8_t *)&v18, 0x20u);

    }
  }

  if (!v4)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v16))
      goto LABEL_13;
    v18 = 136315138;
    v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    v17 = "%s: nil network";
LABEL_22:
    _os_log_impl(&dword_219FC8000, v13, v16, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_13;
  }
  -[NSObject unconfiguredDeviceID](v4, "unconfiguredDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v16))
      goto LABEL_13;
    v18 = 136315138;
    v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    v17 = "%s: nil network unconfiguredDeviceID";
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("com.apple.Home://reprovisionDevice/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject unconfiguredDeviceID](v4, "unconfiguredDeviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController _convertToHexString:](self, "_convertToHexString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
  {
    v18 = 136315394;
    v19 = "-[WFNetworkListController _openHomeAppForNetwork:]";
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_219FC8000, v14, v15, "%s: launchURL %@", (uint8_t *)&v18, 0x16u);
  }

  -[WFNetworkListController _openURL:](self, "_openURL:", v13);
LABEL_13:

}

- (id)_convertToHexString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i < v6; i += 2)
    {
      objc_msgSend(v3, "substringWithRange:", i, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(":"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_openURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDC15A0]);
  objc_msgSend(v4, "setSensitive:", 1);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__WFNetworkListController__openURL___block_invoke;
  v7[3] = &unk_24DC34D28;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v6, v4, v7);

}

void __36__WFNetworkListController__openURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[WFNetworkListController _openURL:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_219FC8000, v4, v5, "%s: failed to launch URL %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)_associateToUserSuppliedNetwork:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "ssid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFNetworkListController _associateToUserSuppliedNetwork:]";
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s: joining other network %@", buf, 0x16u);

    }
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(v4, "ssid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController interface](self, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceScanChannels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFScanRequest scanRequestForSSID:channels:](WFScanRequest, "scanRequestForSSID:channels:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController interface](self, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke;
  v15[3] = &unk_24DC34D78;
  v15[4] = self;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v4;
  v16 = v14;
  objc_msgSend(v13, "asyncScanRequest:reply:", v12, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id WeakRetained;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 17)
    && (objc_msgSend(v7, "scanResult"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isAllowedInLockdownMode"),
        v9,
        (v10 & 1) == 0))
  {
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v12, v13, "In Lockdown Mode, prompting user", buf, 2u);
    }

    v14 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_188;
    aBlock[3] = &unk_24DC34D50;
    objc_copyWeak(&v26, (id *)(a1 + 48));
    v24 = *(id *)(a1 + 40);
    v25 = v6;
    v15 = _Block_copy(aBlock);
    if (objc_msgSend(*(id *)(a1 + 40), "security"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "security") == 1)
      {
        v16 = 2;
      }
      else if (objc_msgSend(*(id *)(a1 + 40), "security") == 4)
      {
        v16 = 1;
      }
      else
      {
        v16 = 7;
      }
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)MEMORY[0x24BEC2970];
    objc_msgSend(*(id *)(a1 + 40), "ssid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lockdownModeAlertControllerWithNetworkName:securityType:completionHandler:", v18, v16, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_190;
    block[3] = &unk_24DC34BE8;
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v19;
    v20 = v19;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v26);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_associateToUserSuppliedNetworkHelper:networks:", *(_QWORD *)(a1 + 40), v6);

  }
}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_188(uint64_t a1, int a2)
{
  NSObject *v3;
  os_log_type_t v4;
  id WeakRetained;
  uint8_t buf[16];

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_associateToUserSuppliedNetworkHelper:networks:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "User declined joining non-secure network in Lockdown Mode- canceling association", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
  }
}

void __59__WFNetworkListController__associateToUserSuppliedNetwork___block_invoke_190(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "otherNetworkVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "otherNetworkVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_associateToUserSuppliedNetworkHelper:(id)a3 networks:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  WFNetworkProfile *v17;
  void *v18;
  WFNetworkProfile *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD block[6];
  id v27;
  id v28;
  char v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_initWeak(&location, self);
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]";
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_219FC8000, v9, v10, "%s: scan results %@", buf, 0x16u);
  }

  v11 = objc_msgSend(v7, "count");
  if (v11 != 1)
  {
    v12 = 0;
LABEL_14:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_2;
    block[3] = &unk_24DC34DC8;
    v29 = 0;
    v30 = v11 == 1;
    block[4] = self;
    block[5] = self;
    v12 = v12;
    v27 = v12;
    v28 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    goto LABEL_20;
  }
  objc_msgSend(v7, "anyObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]";
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_219FC8000, v13, v14, "%s: found network %@", buf, 0x16u);
  }

  if (!objc_msgSend(v12, "isNetworkSecurityModeMatch:", objc_msgSend(v6, "security")))
    goto LABEL_14;
  self->_associatingToOtherNetwork = 1;
  objc_msgSend(v7, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "matchingKnownNetworkProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = [WFNetworkProfile alloc];
    objc_msgSend(v15, "matchingKnownNetworkProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFNetworkProfile initWithCoreWiFiProfile:](v17, "initWithCoreWiFiProfile:", v18);
    v20 = (void *)-[WFNetworkProfile mutableCopy](v19, "mutableCopy");

  }
  else
  {
    +[WFMutableNetworkProfile mutableProfileForNetwork:](WFMutableNetworkProfile, "mutableProfileForNetwork:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "setUserProvidedPassword:", 1);
  objc_msgSend(v20, "setHidden:", 1);
  if (objc_msgSend(v15, "isEnterprise"))
  {
    objc_msgSend(v6, "username");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUsername:", v21);

    objc_msgSend(v6, "password");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPassword:", v22);

    objc_msgSend(v20, "setTLSIdentity:", objc_msgSend(v6, "TLSIdentity"));
  }
  else
  {
    objc_msgSend(v6, "password");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPassword:", v23);

  }
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke;
  v31[3] = &unk_24DC34BC0;
  v31[4] = self;
  v32 = v15;
  v33 = v20;
  v24 = v20;
  v25 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], v31);

LABEL_20:
  objc_destroyWeak(&location);

}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "associationContext");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "associationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "associationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNetwork:", v8);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "associationContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOriginator:", 1);

}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  WFErrorContext *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[10];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(a1 + 64);
    v5 = *(unsigned __int8 *)(a1 + 65);
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]_block_invoke_2";
    v24 = 1024;
    *(_DWORD *)v25 = v4;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v5;
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: other network not found (foundNetwork=%d mismatchedSecurity=%d)", buf, 0x18u);
  }

  if (*(_BYTE *)(a1 + 65))
    v6 = 17;
  else
    v6 = 16;
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      objc_msgSend(*(id *)(a1 + 32), "credentialsContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[WFNetworkListController _associateToUserSuppliedNetworkHelper:networks:]_block_invoke";
      v24 = 2112;
      *(_QWORD *)v25 = v7;
      *(_WORD *)&v25[8] = 2112;
      v26 = v11;
      _os_log_impl(&dword_219FC8000, v10, v9, "%s: providing error %@ back to the credentials context %@", buf, 0x20u);

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "credentialsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finishWithError:forNetwork:profile:", v7, *(_QWORD *)(a1 + 48), 0);

  v13 = -[WFErrorContext initWithAssociationError:network:diagnosticsResult:]([WFErrorContext alloc], "initWithAssociationError:network:diagnosticsResult:", v7, *(_QWORD *)(a1 + 56), 0);
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, v13);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_193;
  v18[3] = &unk_24DC34DA0;
  objc_copyWeak(&v19, (id *)buf);
  objc_copyWeak(&v20, &location);
  -[WFErrorContext setCompletionHandler:](v13, "setCompletionHandler:", v18);
  objc_msgSend(*(id *)(a1 + 40), "_presentContext:contextType:", v13, 0);
  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(*(id *)(a1 + 56), "security");
  v16 = objc_msgSend(v7, "code");
  +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, v15, v16, 0, 0, MEMORY[0x24BDBD1A8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "processEvent:", v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __74__WFNetworkListController__associateToUserSuppliedNetworkHelper_networks___block_invoke_193(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissErrorViewControllerWithContext:", v2);

}

- (void)_handleAssociationResult:(BOOL)a3 error:(id)a4 network:(id)a5 profile:(id)a6 shouldSaveProfile:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  os_log_type_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  os_log_type_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  os_log_type_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  os_log_type_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "code") != 11
    || (-[WFNetworkListController associationContext](self, "associationContext"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "secondaryScanCompleted"),
        v14,
        (v15 & 1) != 0))
  {
    -[WFNetworkListController credentialsContext](self, "credentialsContext");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[WFNetworkListController credentialsContext](self, "credentialsContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "network");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v12);

      if (v20)
      {
        WFLogForCategory(5uLL);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v21)
        {
          v23 = v21;
          if (os_log_type_enabled(v23, v22))
          {
            -[WFNetworkListController credentialsContext](self, "credentialsContext");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkListController associationContext](self, "associationContext");
            v65 = v13;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "networkName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v69 = v24;
            v70 = 2112;
            v71 = v26;
            _os_log_impl(&dword_219FC8000, v23, v22, "credentials context (%@) in progress for %@, reusing for association", buf, 0x16u);

            v13 = v65;
          }

        }
        -[WFNetworkListController credentialsContext](self, "credentialsContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "finishWithError:forNetwork:profile:", v11, v12, v13);

      }
    }
    if (v11)
      v28 = objc_msgSend(v11, "code");
    else
      v28 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = 8;
      if (!a3)
        goto LABEL_16;
    }
    else
    {
      v29 = objc_msgSend(v12, "securityMode");
      if (!a3)
      {
LABEL_16:
        WFLogForCategory(5uLL);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v30)
        {
          v32 = v30;
          if (os_log_type_enabled(v32, v31))
          {
            -[WFNetworkListController associationContext](self, "associationContext");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "networkName");
            v66 = v13;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkListController associationContext](self, "associationContext");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v69 = v34;
            v70 = 2112;
            v71 = v35;
            _os_log_impl(&dword_219FC8000, v32, v31, "association failed for %@ (context: %@)", buf, 0x16u);

            v13 = v66;
          }

        }
        -[WFNetworkListController associationContext](self, "associationContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController _handleAssociationError:network:profile:securityMode:associationContext:](self, "_handleAssociationError:network:profile:securityMode:associationContext:", v11, v12, v13, v29, v36);

        goto LABEL_50;
      }
    }
    -[WFNetworkListController associationContext](self, "associationContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "originator");

    if (v38 == 2)
    {
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x24BDBD1A8];
      v53 = 2;
    }
    else
    {
      if (v38 != 1)
      {
        if (v38)
          goto LABEL_37;
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sectionCounts");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v67 = v13;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sectionNameJoined");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", v29, v28, v41, v43, 0, 0, MEMORY[0x24BDBD1A8]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "processEvent:", v44);

        v13 = v67;
LABEL_36:

LABEL_37:
        WFLogForCategory(5uLL);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v54)
        {
          v56 = v54;
          if (os_log_type_enabled(v56, v55))
          {
            -[WFNetworkListController associationContext](self, "associationContext");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "networkName");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkListController associationContext](self, "associationContext");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v69 = v58;
            v70 = 2112;
            v71 = v59;
            _os_log_impl(&dword_219FC8000, v56, v55, "association completed for %@ (context: %@)", buf, 0x16u);

          }
        }

        if (self->_associatingToOtherNetwork)
        {
          WFLogForCategory(5uLL);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v60)
          {
            v62 = v60;
            if (os_log_type_enabled(v62, v61))
            {
              -[WFNetworkListController credentialsContext](self, "credentialsContext");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v69 = v63;
              _os_log_impl(&dword_219FC8000, v62, v61, "association originated from WFAssociationOriginatorOther, dismissing credentials context %@", buf, 0xCu);

            }
          }

          -[WFNetworkListController credentialsContext](self, "credentialsContext");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFNetworkListController _dismissOtherNetworkViewControllerWithContext:](self, "_dismissOtherNetworkViewControllerWithContext:", v64);

        }
        -[WFNetworkListController _associationDidFinish:error:network:](self, "_associationDidFinish:error:network:", 1, 0, v12);
        goto LABEL_50;
      }
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x24BDBD1A8];
      v53 = 1;
    }
    +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", v53, v29, v28, 0, 0, v52);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "processEvent:", v40);
    goto LABEL_36;
  }
  WFLogForCategory(5uLL);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v45)
  {
    v47 = v45;
    if (os_log_type_enabled(v47, v46))
    {
      -[WFNetworkListController associationContext](self, "associationContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "networkName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController credentialsContext](self, "credentialsContext");
      v50 = v13;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v49;
      v70 = 2112;
      v71 = v51;
      _os_log_impl(&dword_219FC8000, v47, v46, "%@ requires a scan before associating, preempting credentialsContext(%@) completion until scan is complete.", buf, 0x16u);

      v13 = v50;
    }

  }
  -[WFNetworkListController _scanNetworkForAssociation:profile:](self, "_scanNetworkForAssociation:profile:", v12, v13);
LABEL_50:

}

- (void)_handleAssociationError:(id)a3 network:(id)a4 profile:(id)a5 securityMode:(int64_t)a6 associationContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  WFErrorContext *v18;
  void *v19;
  os_log_type_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_type_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  os_log_type_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  os_log_type_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  os_log_type_t v63;
  NSObject *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  os_log_type_t v72;
  NSObject *v73;
  void *v74;
  WFErrorContext *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  id v101;
  _QWORD aBlock[5];
  id v103;
  id v104;
  id v105;
  id v106[3];
  _QWORD v107[5];
  id v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id location;
  uint8_t buf[4];
  _BYTE v119[18];
  __int16 v120;
  id v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v101 = a5;
  v13 = a7;
  if (v11)
    v14 = (void *)objc_msgSend(v11, "code");
  else
    v14 = 0;
  WFAssociationErrorCodeToString(objc_msgSend(v11, "code"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(5uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v119 = v12;
    *(_WORD *)&v119[8] = 2112;
    *(_QWORD *)&v119[10] = v101;
    v120 = 2112;
    v121 = v11;
    v122 = 2112;
    v123 = v100;
    _os_log_impl(&dword_219FC8000, v15, v16, "handling association failure for %@ (profile: %@) error: %@ (%@)", buf, 0x2Au);
  }

  switch(objc_msgSend(v11, "code"))
  {
    case 0:
    case 1:
      -[WFNetworkListController associationContext](self, "associationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setState:", 2);

      if (objc_msgSend(v11, "code") == 1)
      {
        v18 = -[WFErrorContext initWithAssociationError:network:diagnosticsResult:]([WFErrorContext alloc], "initWithAssociationError:network:diagnosticsResult:", v11, v12, 0);
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v18);
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke;
        v110[3] = &unk_24DC34DF0;
        v111 = v12;
        v112 = v101;
        v113 = v11;
        v114 = v100;
        objc_copyWeak(&v115, (id *)buf);
        objc_copyWeak(&v116, &location);
        -[WFErrorContext setCompletionHandler:](v18, "setCompletionHandler:", v110);
        -[WFNetworkListController _presentContext:contextType:](self, "_presentContext:contextType:", v18, 0);
        objc_destroyWeak(&v116);
        objc_destroyWeak(&v115);

        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        -[WFNetworkListController _promptCredentialsForNetwork:profile:](self, "_promptCredentialsForNetwork:profile:", v12, v101);
      }
      -[WFNetworkListController associationContext](self, "associationContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "originator");

      switch(v44)
      {
        case 2:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 2, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "processEvent:", v54);

          break;
        case 1:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "processEvent:", v56);

          break;
        case 0:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sectionCounts");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sectionNameJoined");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", a6, v14, v46, v47, 0, 0, MEMORY[0x24BDBD1A8]);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "processEvent:", v48);

          break;
      }
      goto LABEL_75;
    case 6:
      WFLogForCategory(5uLL);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v19)
      {
        v21 = v19;
        if (os_log_type_enabled(v21, v20))
        {
          objc_msgSend(v12, "ssid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v119 = v22;
          _os_log_impl(&dword_219FC8000, v21, v20, "User cancelled association to %@", buf, 0xCu);

        }
      }

      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController _associationDidFinish:error:network:](self, "_associationDidFinish:error:network:", 0, v23, 0);

      -[WFNetworkListController associationContext](self, "associationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "originator");

      switch(v25)
      {
        case 2:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 2, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "processEvent:", v81);

          break;
        case 1:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "processEvent:", v83);

          break;
        case 0:
          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sectionCounts");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sectionNameJoined");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", a6, v14, v27, v28, 0, 0, MEMORY[0x24BDBD1A8]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "processEvent:", v29);

          break;
      }
      goto LABEL_75;
    case 7:
      WFLogForCategory(5uLL);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v30)
      {
        v32 = v30;
        if (os_log_type_enabled(v32, v31))
        {
          objc_msgSend(v12, "ssid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v119 = v33;
          _os_log_impl(&dword_219FC8000, v32, v31, "User input required for %@", buf, 0xCu);

        }
      }

      -[WFNetworkListController associationContext](self, "associationContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setState:", 2);

      if ((objc_msgSend(v12, "isEnterprise") & 1) != 0)
      {
        objc_msgSend(v11, "userInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", CFSTR("kWFAssociationCertificateChainKey"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          -[WFNetworkListController _promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:](self, "_promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:", v12, v36, v101, 0);
LABEL_28:

          goto LABEL_75;
        }
        objc_msgSend(v11, "userInfo");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "objectForKey:", CFSTR("kWFAssociationUsernameRequiredKey"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {

        }
        else
        {
          objc_msgSend(v11, "userInfo");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKey:", CFSTR("kWFAssociationPasswordRequiredKey"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v87 == 0;

          if (v88)
            goto LABEL_80;
        }
        -[WFNetworkListController _promptCredentialsForNetwork:profile:](self, "_promptCredentialsForNetwork:profile:", v12, v101);
LABEL_80:
        -[WFNetworkListController associationContext](self, "associationContext");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "originator");

        switch(v90)
        {
          case 2:
            +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 2, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "processEvent:", v96);

            break;
          case 1:
            +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "processEvent:", v98);

            break;
          case 0:
            +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "sectionCounts");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "sectionNameJoined");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", a6, v14, v92, v93, 0, 0, MEMORY[0x24BDBD1A8]);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "processEvent:", v94);

            break;
        }
        goto LABEL_28;
      }
      WFLogForCategory(5uLL);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49)
      {
        v51 = v49;
        if (os_log_type_enabled(v51, v50))
        {
          objc_msgSend(v12, "ssid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v119 = v52;
          _os_log_impl(&dword_219FC8000, v51, v50, "Recieved WFAssociationTrustRequiredErr for non-enterprise network %@", buf, 0xCu);

        }
      }

LABEL_75:
      return;
    case 11:
      -[WFNetworkListController associationContext](self, "associationContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "originator");

      if (v38 == 2)
      {
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 2, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "processEvent:", v40);
      }
      else if (v38 == 1)
      {
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, a6, v14, 0, 0, MEMORY[0x24BDBD1A8]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "processEvent:", v40);
      }
      else
      {
        if (v38)
          goto LABEL_49;
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sectionCounts");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sectionNameJoined");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", a6, v14, v40, v41, 0, 0, MEMORY[0x24BDBD1A8]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "processEvent:", v42);

      }
LABEL_49:
      WFLogForCategory(5uLL);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v57)
      {
        v59 = v57;
        if (os_log_type_enabled(v59, v58))
        {
          objc_msgSend(v12, "ssid");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v119 = v60;
          _os_log_impl(&dword_219FC8000, v59, v58, "Scan required to continue association to %@", buf, 0xCu);

        }
      }

      goto LABEL_55;
    default:
LABEL_55:
      -[WFNetworkListController associationContext](self, "associationContext");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setState:", 2);

      WFLogForCategory(5uLL);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v62)
      {
        v64 = v62;
        if (os_log_type_enabled(v64, v63))
        {
          v65 = objc_msgSend(v11, "code");
          objc_msgSend(v12, "ssid");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v119 = v65;
          *(_WORD *)&v119[4] = 2112;
          *(_QWORD *)&v119[6] = v66;
          _os_log_impl(&dword_219FC8000, v64, v63, "unhandled errorCode (%d) while associating to %@", buf, 0x12u);

        }
      }

      objc_initWeak(&location, self);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v12, "iOSHotspot"))
      {
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sectionCounts");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sectionNameJoined");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", a6, v14, v68, v69, 0, 0, MEMORY[0x24BDBD1A8]);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "processEvent:", v70);

        WFLogForCategory(0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v71)
        {
          v73 = v71;
          if (os_log_type_enabled(v73, v72))
          {
            objc_msgSend(v12, "ssid");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v119 = v74;
            _os_log_impl(&dword_219FC8000, v73, v72, "Skip running velocity test as joining a personal hotspot network: %@", buf, 0xCu);

          }
        }

        v75 = -[WFErrorContext initWithAssociationError:network:diagnosticsResult:]([WFErrorContext alloc], "initWithAssociationError:network:diagnosticsResult:", v11, v12, 0);
        objc_initWeak((id *)buf, v75);
        v107[0] = MEMORY[0x24BDAC760];
        v107[1] = 3221225472;
        v107[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_195;
        v107[3] = &unk_24DC34E18;
        v107[4] = self;
        objc_copyWeak(&v109, (id *)buf);
        v108 = v11;
        -[WFErrorContext setCompletionHandler:](v75, "setCompletionHandler:", v107);
        -[WFNetworkListController _presentContext:contextType:](self, "_presentContext:contextType:", v75, 0);

        objc_destroyWeak(&v109);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_196;
        aBlock[3] = &unk_24DC34E40;
        aBlock[4] = self;
        v106[1] = (id)a6;
        v106[2] = v14;
        v103 = v13;
        v104 = v11;
        v76 = v12;
        v105 = v76;
        objc_copyWeak(v106, &location);
        v77 = _Block_copy(aBlock);
        if (objc_msgSend(v76, "supportsJoinFailureDiagnostics"))
        {
          -[WFNetworkListController diagnosticsManager](self, "diagnosticsManager");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "ssid");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "runJoinFailureDiagnosticsFor:withUpdate:result:", v79, &__block_literal_global_201, v77);

        }
        else
        {
          objc_msgSend(v76, "ssid");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, _QWORD, _QWORD, void *))v77 + 2))(v77, 0, 0, v78);
        }

        objc_destroyWeak(v106);
      }
      objc_destroyWeak(&location);
      goto LABEL_75;
  }
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2;
  v2[3] = &unk_24DC34DF0;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  objc_copyWeak(&v7, a1 + 8);
  objc_copyWeak(&v8, a1 + 9);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(5uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v11 = 138413058;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_219FC8000, v2, v3, "Dismissing error alert and prompting credentials for %@ (profile: %@) error: %@ (%@)", (uint8_t *)&v11, 0x2Au);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_dismissErrorViewControllerWithContext:", v9);

  v10 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v10, "_promptCredentialsForNetwork:profile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_195(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "_dismissErrorViewControllerWithContext:", WeakRetained);

  return objc_msgSend(*(id *)(a1 + 32), "_associationDidFinish:error:network:", 0, *(_QWORD *)(a1 + 40), 0);
}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_196(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  WFErrorContext *v25;
  id WeakRetained;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v27 = a4;
  if (v7)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v27;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_219FC8000, v9, v10, "Diagnostics Error for ssid: %@ received: %@", buf, 0x16u);
    }

  }
  if (v8)
  {
    v11 = objc_msgSend(v8, "didPassTest");
    objc_msgSend(v8, "failedTests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v13, v14, "Empty diagnostics result returned", buf, 2u);
    }

    v11 = 0;
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  WFLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v27;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_219FC8000, v15, v16, "Diagnostics result for ssid: %@ received: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "associationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "originator");

  switch(v18)
  {
    case 2:
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 1, v11, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processEvent:", v22);
      goto LABEL_24;
    case 1:
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserJoinEvent joinEventWithType:security:error:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithType:security:error:didRun:didPass:failedTests:", 1, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 1, v11, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processEvent:", v22);
      goto LABEL_24;
    case 0:
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 40), "sectionCounts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sectionNameJoined");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserJoinEvent joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:](WFUserJoinEvent, "joinEventWithSecurity:error:sectionCounts:sectionName:didRun:didPass:failedTests:", v21, v20, v22, v23, 0, 0, MEMORY[0x24BDBD1A8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processEvent:", v24);

LABEL_24:
      break;
  }
  v25 = -[WFErrorContext initWithAssociationError:network:diagnosticsResult:]([WFErrorContext alloc], "initWithAssociationError:network:diagnosticsResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);
  objc_initWeak((id *)buf, v25);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_197;
  v28[3] = &unk_24DC34D00;
  objc_copyWeak(&v30, (id *)(a1 + 64));
  objc_copyWeak(&v31, (id *)buf);
  v29 = *(id *)(a1 + 48);
  -[WFErrorContext setCompletionHandler:](v25, "setCompletionHandler:", v28);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_presentContext:contextType:", v25, 0);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_197(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_dismissErrorViewControllerWithContext:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_associationDidFinish:error:network:", 0, *(_QWORD *)(a1 + 32), 0);

}

void __99__WFNetworkListController__handleAssociationError_network_profile_securityMode_associationContext___block_invoke_2_199(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_219FC8000, v3, v4, "Diagnostics event received: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)_supportsWiFiPasswordSharing
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[WFNetworkListing supportsWiFiPasswordSharing](self->_viewController, "supportsWiFiPasswordSharing");
  else
    return 0;
}

- (void)_promptCredentialsForNetwork:(id)a3 profile:(id)a4
{
  WFCredentialsContext *v6;
  WFNetworkProfile *v7;
  void *v8;
  WFNetworkProfile *v9;
  os_log_type_t v10;
  WFCredentialsContext *v11;
  WFWAPICertificatePromptOperation *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  WFNetworkProfile *v17;
  void *v18;
  WFNetworkProfile *v19;
  void *v20;
  WFNetworkProfile *v21;
  NSObject *v22;
  os_log_type_t v23;
  WFCredentialsContext *v24;
  _BOOL8 v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  char v29;
  void *v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  WFNetworkProfile *v40;
  WFCredentialsContext *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id from;
  _QWORD v49[4];
  WFNetworkProfile *v50;
  WFCredentialsContext *v51;
  id v52;
  id v53;
  id location;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  WFCredentialsContext *v58;
  __int16 v59;
  WFNetworkProfile *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = (WFCredentialsContext *)a3;
  v7 = (WFNetworkProfile *)a4;
  -[WFNetworkListController credentialsContext](self, "credentialsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WFLogForCategory(0);
    v9 = (WFNetworkProfile *)objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9)
    {
      v9 = v9;
      if (os_log_type_enabled(&v9->super, v10))
      {
        -[WFNetworkListController credentialsContext](self, "credentialsContext");
        v11 = (WFCredentialsContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v56 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
        v57 = 2112;
        v58 = v11;
        _os_log_impl(&dword_219FC8000, &v9->super, v10, "%s: reusing existing credentials context (%@)", buf, 0x16u);

      }
    }
  }
  else if (-[WFCredentialsContext securityMode](v6, "securityMode") == 128)
  {
    v12 = [WFWAPICertificatePromptOperation alloc];
    -[WFNetworkListController viewController](self, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFWAPICertificatePromptOperation initWithRootViewController:network:](v12, "initWithRootViewController:network:", v13, v6);

    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
      v57 = 2112;
      v58 = v6;
      v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: prompting WAPI cert for %@ (profile %@)", buf, 0x20u);
    }

    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke;
    v49[3] = &unk_24DC34EA8;
    objc_copyWeak(&v52, (id *)buf);
    objc_copyWeak(&v53, &location);
    v50 = v7;
    v51 = v6;
    -[WFNetworkProfile setCompletionBlock:](v9, "setCompletionBlock:", v49);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v9);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = v7;
    v9 = v17;
    if (!v17)
    {
      -[WFCredentialsContext matchingKnownNetworkProfile](v6, "matchingKnownNetworkProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18
        || (v19 = [WFNetworkProfile alloc],
            -[WFCredentialsContext matchingKnownNetworkProfile](v6, "matchingKnownNetworkProfile"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = -[WFNetworkProfile initWithCoreWiFiProfile:](v19, "initWithCoreWiFiProfile:", v20),
            v9 = (WFNetworkProfile *)-[WFNetworkProfile mutableCopy](v21, "mutableCopy"),
            v21,
            v20,
            !v9))
      {
        v9 = -[WFNetworkProfile initWithNetwork:]([WFNetworkProfile alloc], "initWithNetwork:", v6);
        WFLogForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
          v57 = 2112;
          v58 = v6;
          _os_log_impl(&dword_219FC8000, v22, v23, "%s: no existing profile for network %@", buf, 0x16u);
        }

      }
    }
    v24 = -[WFCredentialsContext initWithNetwork:profile:authTraits:]([WFCredentialsContext alloc], "initWithNetwork:profile:authTraits:", v6, v9, -[WFNetworkListController _defaultAuthTraits](self, "_defaultAuthTraits"));
    if (-[WFNetworkListController _supportsWiFiPasswordSharing](self, "_supportsWiFiPasswordSharing"))
    {
      if (objc_msgSend(MEMORY[0x24BE90178], "passwordSharingAvailability"))
        v25 = 0;
      else
        v25 = -[WFCredentialsContext securityMode](v6, "securityMode") == 4
           || -[WFCredentialsContext securityMode](v6, "securityMode") == 8
           || -[WFCredentialsContext securityMode](v6, "securityMode") == 512
           || -[WFCredentialsContext securityMode](v6, "securityMode") == 520;
      -[WFCredentialsContext setPasswordSharingSupported:](v24, "setPasswordSharingSupported:", v25);
    }
    WFLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]";
      v57 = 2112;
      v58 = v6;
      v59 = 2112;
      v60 = v17;
      _os_log_impl(&dword_219FC8000, v26, v27, "%s: prompting for password (network %@ profile %@)", buf, 0x20u);
    }

    -[WFNetworkListController viewProvider](self, "viewProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    -[WFNetworkListController viewProvider](self, "viewProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsViewControllerWithContext:", v24);
    v31 = (char *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if ((v29 & 1) != 0)
      {
        WFLogForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)buf = 138412546;
          v56 = v31;
          v57 = 2112;
          v58 = v24;
          _os_log_impl(&dword_219FC8000, v32, v33, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
        }

        -[WFNetworkListController viewProvider](self, "viewProvider");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "presentNetworkViewController:forContext:", v31, v24);
      }
      else
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v31);
        objc_msgSend(v34, "setModalPresentationStyle:", 2);
        if (-[WFNetworkListController associatingToOtherNetwork](self, "associatingToOtherNetwork"))
          -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
        else
          -[WFNetworkListController viewController](self, "viewController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "presentViewController:animated:completion:", v34, 1, 0);

      }
      -[WFCredentialsContext setProvider:](v24, "setProvider:", v31);
      -[WFNetworkListController setCredentialsContext:](self, "setCredentialsContext:", v24);
      -[WFNetworkListController setVisibleContext:](self, "setVisibleContext:", v24);
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v24);
      objc_initWeak(&from, v9);
      v38 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_212;
      v45[3] = &unk_24DC34DA0;
      objc_copyWeak(&v46, (id *)buf);
      objc_copyWeak(&v47, &location);
      -[WFCredentialsContext setCancellationHandler:](v24, "setCancellationHandler:", v45);
      v39[0] = v38;
      v39[1] = 3221225472;
      v39[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_2;
      v39[3] = &unk_24DC34ED0;
      objc_copyWeak(&v42, (id *)buf);
      objc_copyWeak(&v43, &from);
      v40 = v9;
      objc_copyWeak(&v44, &location);
      v41 = v6;
      -[WFCredentialsContext setCompletionHandler:](v24, "setCompletionHandler:", v39);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      WFLogForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v35 && os_log_type_enabled(v35, v36))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v35, v36, "credentialsViewController is nil -- cancelling credentials prompt", buf, 2u);
      }

      -[WFNetworkListController _promptCredentialsForNetworkCancelled:](self, "_promptCredentialsForNetworkCancelled:", v24);
    }

  }
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  WFNetworkProfile *v8;
  void *v9;
  WFNetworkProfile *v10;
  __SecCertificate *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_loadWeakRetained(a1 + 7);
  if (objc_msgSend(WeakRetained, "userCancelled"))
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke";
      _os_log_impl(&dword_219FC8000, v4, v5, "%s: User cancelled association", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_205;
    block[3] = &unk_24DC348F8;
    block[4] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v6 = (void *)objc_msgSend(a1[4], "mutableCopy");
    if (!v6)
    {
      objc_msgSend(a1[5], "matchingKnownNetworkProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7
        || (v8 = [WFNetworkProfile alloc],
            objc_msgSend(a1[5], "matchingKnownNetworkProfile"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[WFNetworkProfile initWithCoreWiFiProfile:](v8, "initWithCoreWiFiProfile:", v9),
            v6 = (void *)-[WFNetworkProfile mutableCopy](v10, "mutableCopy"),
            v10,
            v9,
            !v6))
      {
        +[WFMutableNetworkProfile mutableProfileForNetwork:](WFMutableNetworkProfile, "mutableProfileForNetwork:", a1[5]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = (__SecCertificate *)objc_msgSend(WeakRetained, "WAPIRootCertificate");
    objc_msgSend(WeakRetained, "WAPIIdentityPEMBlob");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFWAPICertificateBlobString(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPassword:", v13);

    objc_msgSend(v6, "setUserProvidedPassword:", 1);
    objc_msgSend(v6, "password");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_206;
      v21[3] = &unk_24DC34BC0;
      v21[4] = v3;
      v22 = a1[5];
      v23 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v21);

    }
    else
    {
      WFLogForCategory(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15)
      {
        v17 = v15;
        if (os_log_type_enabled(v17, (os_log_type_t)v16))
        {
          v18 = objc_msgSend(WeakRetained, "WAPIRootCertificate");
          objc_msgSend(WeakRetained, "WAPIIdentityPEMBlob");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v26 = (const char *)v18;
          v27 = 2112;
          v28 = v19;
          _os_log_impl(&dword_219FC8000, v17, (os_log_type_t)v16, "Unable to create WAPI password from Root: %@ IdentityBlob: %@", buf, 0x16u);

        }
      }

      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_associationDidFinish:error:network:", 0, v20, 0);

    }
  }

}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_205(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setOtherNetworkVC:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_associationDidFinish:error:network:", 0, v3, 0);

}

uint64_t __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_associateToNetwork:profile:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_212(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_promptCredentialsForNetworkCancelled:", v2);

}

void __64__WFNetworkListController__promptCredentialsForNetwork_profile___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  os_log_type_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v21 = 136315650;
    v22 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke_2";
    v23 = 2112;
    v24 = v5;
    v25 = 1024;
    v26 = a3;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: credentials prompt complete, provider %@, shouldDismiss %d", (uint8_t *)&v21, 0x1Cu);
  }

  v9 = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreviousPassword:", v11);

  objc_msgSend(v10, "setTLSIdentity:", objc_msgSend(v5, "TLSIdentity"));
  objc_msgSend(v5, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsername:", v12);

  objc_msgSend(v5, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPassword:", v13);

  objc_msgSend(v10, "setUserProvidedPassword:", 1);
  v14 = objc_loadWeakRetained((id *)(a1 + 64));
  v15 = objc_msgSend(v14, "passwordReceivedFromPasswordSharing");

  if (v15)
  {
    WFLogForCategory(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16)
    {
      v18 = v16;
      if (os_log_type_enabled(v18, v17))
      {
        objc_msgSend(v10, "ssid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136315394;
        v22 = "-[WFNetworkListController _promptCredentialsForNetwork:profile:]_block_invoke";
        v23 = 2112;
        v24 = v19;
        _os_log_impl(&dword_219FC8000, v18, v17, "%s: password for '%@' received from password sharing", (uint8_t *)&v21, 0x16u);

      }
    }

    objc_msgSend(v10, "setAddedFromWiFiPasswordSharing:", 1);
  }
  objc_msgSend(WeakRetained, "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 40), v10);
  if (a3)
  {
    v20 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_dismissCredentialsViewControllerWithContext:", v20);

  }
}

- (void)_promptCredentialsForNetworkCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v8 = 136315138;
    v9 = "-[WFNetworkListController _promptCredentialsForNetworkCancelled:]";
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: user cancelled credentials prompt", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController _associationDidFinish:error:network:](self, "_associationDidFinish:error:network:", 0, v7, 0);

  -[WFNetworkListController _dismissCredentialsViewControllerWithContext:](self, "_dismissCredentialsViewControllerWithContext:", v4);
}

- (void)_promptTrustCertificateForNetwork:(id)a3 certificateChain:(id)a4 profile:(id)a5 autoJoin:(BOOL)a6
{
  _BOOL4 v6;
  char *v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  os_log_type_t v19;
  NSObject *v20;
  void *v21;
  WFCertificateContext *v22;
  void *v23;
  char *v24;
  void *v25;
  char v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  char *v33;
  _QWORD v34[4];
  id v35;
  char *v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  id from;
  id location;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  _BYTE v46[14];
  __int16 v47;
  void *v48;
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a5;
  -[WFNetworkListController credentialsContext](self, "credentialsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[WFNetworkListController associatingToOtherNetwork](self, "associatingToOtherNetwork");

    if (!v14)
    {
      WFLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[WFNetworkListController _promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:]";
        _os_log_impl(&dword_219FC8000, v15, v16, "%s: dismissing credentials view controller", buf, 0xCu);
      }

      -[WFNetworkListController credentialsContext](self, "credentialsContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController _dismissCredentialsViewControllerWithContext:](self, "_dismissCredentialsViewControllerWithContext:", v17);

    }
  }
  WFLogForCategory(5uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v18)
  {
    v20 = v18;
    if (os_log_type_enabled(v20, v19))
    {
      -[WFNetworkListController associationContext](self, "associationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v44 = v10;
      v45 = 1024;
      *(_DWORD *)v46 = v6;
      *(_WORD *)&v46[4] = 2112;
      *(_QWORD *)&v46[6] = v12;
      v47 = 2112;
      v48 = v21;
      _os_log_impl(&dword_219FC8000, v20, v19, "prompting trust cert for %@ autojoin=%d (profile %@) - associationCtx: %@", buf, 0x26u);

    }
  }

  v22 = -[WFCertificateContext initWithNetwork:profile:certificateChain:]([WFCertificateContext alloc], "initWithNetwork:profile:certificateChain:", v10, v12, v11);
  -[WFNetworkListController viewProvider](self, "viewProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "certificateViewControllerWithContext:", v22);
  v24 = (char *)objc_claimAutoreleasedReturnValue();

  -[WFCertificateContext setProvider:](v22, "setProvider:", v24);
  -[WFNetworkListController viewProvider](self, "viewProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v24;
      v45 = 2112;
      *(_QWORD *)v46 = v22;
      _os_log_impl(&dword_219FC8000, v27, v28, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
    }

    -[WFNetworkListController viewProvider](self, "viewProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "presentNetworkViewController:forContext:", v24, v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceIdiom");

    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      objc_msgSend(v24, "setModalPresentationStyle:", 2);
    if (-[WFNetworkListController associatingToOtherNetwork](self, "associatingToOtherNetwork"))
      -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
    else
      -[WFNetworkListController viewController](self, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "presentViewController:animated:completion:", v24, 1, 0);
  }

  -[WFNetworkListController setCertificateContext:](self, "setCertificateContext:", v22);
  -[WFNetworkListController setVisibleContext:](self, "setVisibleContext:", v22);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v12);
  objc_initWeak(&from, v22);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __95__WFNetworkListController__promptTrustCertificateForNetwork_certificateChain_profile_autoJoin___block_invoke;
  v34[3] = &unk_24DC34EF8;
  objc_copyWeak(&v37, &location);
  v40 = v6;
  objc_copyWeak(&v38, (id *)buf);
  v32 = v11;
  v35 = v32;
  v33 = v10;
  v36 = v33;
  objc_copyWeak(&v39, &from);
  -[WFCertificateContext setCompletionHandler:](v22, "setCompletionHandler:", v34);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __95__WFNetworkListController__promptTrustCertificateForNetwork_certificateChain_profile_autoJoin___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v5, "wifiClient");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dispatchCertificateTrustAction:profile:", 0, WeakRetained);

      }
      v7 = (id)objc_msgSend(WeakRetained, "mutableCopy");
      objc_msgSend(v7, "setCertificateChain:", *(_QWORD *)(a1 + 32));
      WFLogForCategory(5uLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          objc_msgSend(v7, "ssid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v11;
          _os_log_impl(&dword_219FC8000, v10, v9, "user accepted trust prompt for %@", (uint8_t *)&v23, 0xCu);

        }
      }

      v12 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v12, "_associateToEnterpriseNetwork:profile:", *(_QWORD *)(a1 + 40), v7);
    }
    else
    {
      WFLogForCategory(5uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          objc_msgSend(WeakRetained, "ssid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v16;
          _os_log_impl(&dword_219FC8000, v15, v14, "user did not accept trust prompt for %@", (uint8_t *)&v23, 0xCu);

        }
      }

      if (*(_BYTE *)(a1 + 72))
      {
        v17 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v17, "wifiClient");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dispatchCertificateTrustAction:profile:", 1, WeakRetained);

      }
      v19 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_associationDidFinish:error:network:", 0, v20, 0);

      v7 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v7, "interface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "disassociateFromCurrentNetwork");
    }

    v21 = objc_loadWeakRetained((id *)(a1 + 56));
    v22 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v21, "_dismissTrustViewControllerWithContext:", v22);

  }
}

- (unint64_t)_getLockdownModeSecurityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;

  v3 = a3;
  objc_msgSend(v3, "scanResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isOpen"))
  {

LABEL_4:
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v3, "scanResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOWE");

  if ((v6 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "scanResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWEP");

  if ((v10 & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    objc_msgSend(v3, "scanResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isWAPI");

    if ((v12 & 1) != 0)
    {
      v7 = 3;
    }
    else
    {
      objc_msgSend(v3, "scanResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasTKIPCipher");

      if ((v14 & 1) != 0)
      {
        v7 = 4;
      }
      else
      {
        objc_msgSend(v3, "scanResult");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isPasspoint");

        if ((v16 & 1) != 0)
        {
          v7 = 5;
        }
        else
        {
          objc_msgSend(v3, "scanResult");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "matchingKnownNetworkProfile");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isCaptive");

          if (v19)
            v7 = 6;
          else
            v7 = 7;
        }
      }
    }
  }
LABEL_5:

  return v7;
}

- (BOOL)_canStartAssociationToNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  os_log_type_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, int);
  void *v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD aBlock[4];
  id v82;
  id v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFNetworkListController _canPromptForInstantHotspot](self, "_canPromptForInstantHotspot"))
  {
    -[WFNetworkListController interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ipMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "personalHotspotHasClients");

    if (v7)
    {
      WFLogForCategory(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          -[WFNetworkListController viewController](self, "viewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v85 = v11;
          _os_log_impl(&dword_219FC8000, v10, v9, "Personal Hotspot has clients, %@ requires user to be prompted before associating", buf, 0xCu);

        }
      }

      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke;
      aBlock[3] = &unk_24DC34A50;
      objc_copyWeak(&v83, (id *)buf);
      v12 = v4;
      v82 = v12;
      v13 = _Block_copy(aBlock);
      v14 = (void *)MEMORY[0x24BEC2960];
      objc_msgSend(v12, "ssid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hotspotAlertControllerWithNetworkName:completionHandler:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkListController viewController](self, "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentViewController:animated:completion:", v16, 1, 0);

      objc_destroyWeak(&v83);
      objc_destroyWeak((id *)buf);
      goto LABEL_41;
    }
  }
  if (-[WFNetworkListController _canPromptForCarPlay](self, "_canPromptForCarPlay"))
  {
    if (-[WFNetworkListController _isActiveCarPlaySession](self, "_isActiveCarPlaySession"))
    {
      -[WFNetworkListController interface](self, "interface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentNetwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v4);

      if ((v20 & 1) == 0)
      {
        WFLogForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219FC8000, v30, v31, "In active CarPlay session, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_216;
        v78[3] = &unk_24DC34A50;
        objc_copyWeak(&v80, (id *)buf);
        v32 = v4;
        v79 = v32;
        v33 = _Block_copy(v78);
        objc_msgSend(v32, "ssid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController _promptToDisableCarPlayForNetworkName:handler:](self, "_promptToDisableCarPlayForNetworkName:handler:", v34, v33);

        objc_destroyWeak(&v80);
        objc_destroyWeak((id *)buf);
        goto LABEL_41;
      }
    }
  }
  if (self->_lockdownModeEnabled)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v4, "scanResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isAllowedInLockdownMode");

      if ((v22 & 1) == 0)
      {
        WFLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219FC8000, v25, v26, "In Lockdown Mode, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 3221225472;
        v75[2] = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_217;
        v75[3] = &unk_24DC34A50;
        objc_copyWeak(&v77, (id *)buf);
        v27 = v4;
        v76 = v27;
        v28 = _Block_copy(v75);
        objc_msgSend(v27, "scanResult");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isOpen"))
        {

        }
        else
        {
          objc_msgSend(v27, "scanResult");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "isOWE");

          if ((v51 & 1) == 0)
          {
            objc_msgSend(v27, "scanResult");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "isWEP");

            if ((v59 & 1) != 0)
            {
              v52 = 2;
            }
            else
            {
              objc_msgSend(v27, "scanResult");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "isWAPI");

              if ((v61 & 1) != 0)
              {
                v52 = 3;
              }
              else
              {
                objc_msgSend(v27, "scanResult");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "hasTKIPCipher");

                if ((v63 & 1) != 0)
                {
                  v52 = 4;
                }
                else
                {
                  objc_msgSend(v27, "scanResult");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = objc_msgSend(v64, "isPasspoint");

                  if ((v65 & 1) != 0)
                  {
                    v52 = 5;
                  }
                  else
                  {
                    objc_msgSend(v27, "scanResult");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "matchingKnownNetworkProfile");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v67, "isCaptive");

                    if (v68)
                      v52 = 6;
                    else
                      v52 = 7;
                  }
                }
              }
            }
            goto LABEL_40;
          }
        }
        v52 = 0;
LABEL_40:
        v53 = (void *)MEMORY[0x24BEC2970];
        objc_msgSend(v27, "ssid");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "lockdownModeAlertControllerWithNetworkName:securityType:completionHandler:", v54, v52, v28);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFNetworkListController viewController](self, "viewController");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "presentViewController:animated:completion:", v55, 1, 0);

        objc_destroyWeak(&v77);
        objc_destroyWeak((id *)buf);
LABEL_41:
        v49 = 0;
        goto LABEL_42;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "matchingKnownNetworkProfile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v4, "matchingKnownNetworkProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "supportedSecurityTypes") & 0x40) != 0)
      {
        v35 = objc_msgSend(v4, "securityMode");

        if (v35 == 520)
        {
          WFLogForCategory(5uLL);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v36)
          {
            v38 = v36;
            if (os_log_type_enabled(v38, v37))
            {
              WFStringFromWFSecurityModeExt(512);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              WFStringFromWFSecurityModeExt(objc_msgSend(v4, "securityMode"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v85 = v4;
              v86 = 2112;
              v87 = v39;
              v88 = 2112;
              v89 = v40;
              _os_log_impl(&dword_219FC8000, v38, v37, "mismatched security for %@ (expected='%@', actual='%@')", buf, 0x20u);

            }
          }

          objc_initWeak((id *)buf, self);
          v69 = MEMORY[0x24BDAC760];
          v70 = 3221225472;
          v71 = __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_218;
          v72 = &unk_24DC34A50;
          objc_copyWeak(&v74, (id *)buf);
          v41 = v4;
          v73 = v41;
          v42 = _Block_copy(&v69);
          WFWiFiLocalizedStringFromSecurityMode(512);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          WFWiFiLocalizedStringFromSecurityMode(objc_msgSend(v41, "securityMode", v69, v70, v71, v72));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x24BEC2998];
          objc_msgSend(v41, "ssid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "securityMismatchAlertControllerWithNetworkName:previousSecurity:newSecurity:completionHandler:", v46, v43, v44, v42);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFNetworkListController viewController](self, "viewController");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "presentViewController:animated:completion:", v47, 1, 0);

          objc_destroyWeak(&v74);
          objc_destroyWeak((id *)buf);
          goto LABEL_41;
        }
      }
      else
      {

      }
    }
  }
  v49 = 1;
LABEL_42:

  return v49;
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!a2)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7))
      goto LABEL_13;
    v10 = 0;
    v8 = "User declined to stop personal hotspot- canceling association";
    v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (!objc_msgSend(WeakRetained, "_disablePersonalHotspot"))
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v8 = "Failed to disable personal hotspot- canceling association";
    v9 = buf;
LABEL_12:
    _os_log_impl(&dword_219FC8000, v6, (os_log_type_t)v7, v8, v9, 2u);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v5, "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 32), 0);
LABEL_14:

}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_216(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "Disssociating from current CarPlay network", buf, 2u);
    }

    objc_msgSend(WeakRetained, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disassociateFromCurrentNetwork");

    objc_msgSend(WeakRetained, "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "User declined to stop CarPlay session- canceling association", v10, 2u);
    }

  }
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_217(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disassociateFromCurrentNetwork");

    objc_msgSend(v5, "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219FC8000, v7, (os_log_type_t)v8, "User declined joining non-secure network in Lockdown Mode- canceling association", v9, 2u);
    }

  }
}

void __57__WFNetworkListController__canStartAssociationToNetwork___block_invoke_218(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  uint8_t v9[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "user accepted confirmation", buf, 2u);
    }

    objc_msgSend(WeakRetained, "_associateToScanRecord:profile:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "user cancelled confirmation", v9, 2u);
    }

  }
}

- (BOOL)_canStartAssociationToUserSuppliedNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, int);
  void *v31;
  id v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFNetworkListController _canPromptForInstantHotspot](self, "_canPromptForInstantHotspot"))
  {
    -[WFNetworkListController interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ipMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "personalHotspotHasClients");

    if (v7)
    {
      WFLogForCategory(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          -[WFNetworkListController viewController](self, "viewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v11;
          _os_log_impl(&dword_219FC8000, v10, v9, "Personal Hotspot has clients, %@ requires user to be prompted before associating", buf, 0xCu);

        }
      }

      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke;
      aBlock[3] = &unk_24DC34A50;
      objc_copyWeak(&v36, (id *)buf);
      v12 = v4;
      v35 = v12;
      v13 = _Block_copy(aBlock);
      v14 = (void *)MEMORY[0x24BEC2960];
      objc_msgSend(v12, "ssid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hotspotAlertControllerWithNetworkName:completionHandler:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFNetworkListController otherNetworkVC](self, "otherNetworkVC");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentViewController:animated:completion:", v16, 1, 0);

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
LABEL_18:
      v21 = 0;
      goto LABEL_19;
    }
  }
  if (-[WFNetworkListController _canPromptForCarPlay](self, "_canPromptForCarPlay"))
  {
    if (-[WFNetworkListController _isActiveCarPlaySession](self, "_isActiveCarPlaySession"))
    {
      -[WFNetworkListController interface](self, "interface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentNetwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v4);

      if ((v20 & 1) == 0)
      {
        WFLogForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219FC8000, v22, v23, "In active CarPlay session, prompting user", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke_220;
        v31 = &unk_24DC34A50;
        objc_copyWeak(&v33, (id *)buf);
        v24 = v4;
        v32 = v24;
        v25 = _Block_copy(&v28);
        objc_msgSend(v24, "ssid", v28, v29, v30, v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController _promptToDisableCarPlayForNetworkName:handler:](self, "_promptToDisableCarPlayForNetworkName:handler:", v26, v25);

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
        goto LABEL_18;
      }
    }
  }
  v21 = 1;
LABEL_19:

  return v21;
}

void __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!a2)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7))
      goto LABEL_13;
    v10 = 0;
    v8 = "User declined to stop personal hotspot- canceling association";
    v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (!objc_msgSend(WeakRetained, "_disablePersonalHotspot"))
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v6 || !os_log_type_enabled(v6, (os_log_type_t)v7))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v8 = "Failed to disable personal hotspot- canceling association";
    v9 = buf;
LABEL_12:
    _os_log_impl(&dword_219FC8000, v6, (os_log_type_t)v7, v8, v9, 2u);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v5, "_associateToUserSuppliedNetwork:", *(_QWORD *)(a1 + 32));
LABEL_14:

}

void __69__WFNetworkListController__canStartAssociationToUserSuppliedNetwork___block_invoke_220(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "Disssociating from current CarPlay network", buf, 2u);
    }

    objc_msgSend(WeakRetained, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disassociateFromCurrentNetwork");

    objc_msgSend(WeakRetained, "_associateToUserSuppliedNetwork:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "User declined to stop CarPlay session- canceling association", v10, 2u);
    }

  }
}

- (void)_associationWillStart:(id)a3
{
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFAssociationContext *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  os_log_type_t v32;
  NSObject *v33;
  char *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  os_log_type_t v44;
  NSObject *v45;
  char *v46;
  void *v47;
  id v48;
  _QWORD block[5];
  id v50;
  const __CFString *v51;
  char *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  WFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "association will start for %@", buf, 0xCu);
  }

  -[WFNetworkListController associationContext](self, "associationContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[WFNetworkListController associationContext](self, "associationContext"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "state"),
        v9,
        v8,
        v10 == 2))
  {
    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        -[WFNetworkListController associationContext](self, "associationContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stateDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "networkName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v54 = "-[WFNetworkListController _associationWillStart:]";
        v55 = 2112;
        v56 = v15;
        v57 = 2112;
        v58 = v17;
        _os_log_impl(&dword_219FC8000, v13, v12, "%s association already in progress current state is <%@> with network %@", buf, 0x20u);

      }
    }

    -[WFNetworkListController associationContext](self, "associationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setState:", 1);
  }
  else
  {
    if (v4)
    {
      v51 = CFSTR("network");
      v52 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__WFNetworkListController__associationWillStart___block_invoke;
    block[3] = &unk_24DC34BE8;
    block[4] = self;
    v48 = v19;
    v50 = v48;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v20 = -[WFAssociationContext initWithNetwork:]([WFAssociationContext alloc], "initWithNetwork:", v4);
    -[WFAssociationContext setState:](v20, "setState:", 1);
    -[WFNetworkListController scanMetricsManager](self, "scanMetricsManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sectionNameForRecord:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAssociationContext setSectionNameJoined:](v20, "setSectionNameJoined:", v22);

    -[WFNetworkListController scanMetricsManager](self, "scanMetricsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sectionCounts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAssociationContext setSectionCounts:](v20, "setSectionCounts:", v24);

    -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "push:", v20);

    -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "peek");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqual:", v4);

    if ((v29 & 1) != 0)
    {
      v30 = v27;
    }
    else
    {
      do
      {
        WFLogForCategory(0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v31)
        {
          v33 = v31;
          if (os_log_type_enabled(v33, v32))
          {
            objc_msgSend(v4, "ssid");
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v54 = v34;
            v55 = 2112;
            v56 = v27;
            _os_log_impl(&dword_219FC8000, v33, v32, "top association context in queue doesn't match current association attempt network: %@, skipping context: %@", buf, 0x16u);

          }
        }

        -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v35, "pop");

        -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "peek");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "network");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqual:", v4);

        v27 = v30;
      }
      while (!v39);
    }
    -[WFNetworkListController associationContextQueue](self, "associationContextQueue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "peek");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController setAssociationContext:](self, "setAssociationContext:", v41);

    -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
    -[WFNetworkListController wifiClient](self, "wifiClient");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAutoJoinEnabled:", 0);

    WFLogForCategory(5uLL);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v43)
    {
      v45 = v43;
      if (os_log_type_enabled(v45, v44))
      {
        -[WFNetworkListController associationContext](self, "associationContext");
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ssid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = v46;
        v55 = 2112;
        v56 = v47;
        _os_log_impl(&dword_219FC8000, v45, v44, "association context: %@ for %@", buf, 0x16u);

      }
    }

    v18 = v48;
  }

}

void __49__WFNetworkListController__associationWillStart___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WFNetworkListControllerAssociationDidStartNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_associationDidFinish:(BOOL)a3 error:(id)a4 network:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__WFNetworkListController__associationDidFinish_error_network___block_invoke;
  v12[3] = &unk_24DC34F20;
  v15 = a3;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __63__WFNetworkListController__associationDidFinish_error_network___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  os_log_type_t v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  os_log_type_t v56;
  void *v57;
  NSObject *v58;
  os_log_type_t v59;
  _QWORD block[5];
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  NSObject *v64;
  const __CFString *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "associationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(5uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v68 = v3;
    v69 = 1024;
    LODWORD(v70) = v6;
    _os_log_impl(&dword_219FC8000, v4, v5, "{ASSOC-} association finished for %@ - success %d", buf, 0x12u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    WFLogForCategory(5uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        WFAssociationErrorCodeToString(objc_msgSend(*(id *)(a1 + 40), "code"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v68 = v10;
        v69 = 2112;
        v70 = v11;
        _os_log_impl(&dword_219FC8000, v9, v8, "association failure: <%@> (error %@)", buf, 0x16u);

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "credentialsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    WFLogForCategory(5uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v3;
      _os_log_impl(&dword_219FC8000, v13, v14, "dismissing credentials view controller for %@", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "credentialsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_dismissCredentialsViewControllerWithContext:", v16);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isAssociating") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "associationContextQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "pop");

    objc_msgSend(*(id *)(a1 + 32), "associationContextQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "peek");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAssociationContext:", v20);

    if (!*(_BYTE *)(a1 + 56))
    {
      WFLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v3;
        _os_log_impl(&dword_219FC8000, v21, v22, "failed to associate to '%@', forcing current network update", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "interface");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "asyncCurrentNetwork:", 0);

    }
    v24 = *(id *)(a1 + 40);
    v25 = v24;
    if (!*(_BYTE *)(a1 + 56) && !v24)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v25)
    {
      v65 = CFSTR("error");
      v66 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "interface");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "currentNetwork");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(*(id *)(a1 + 32), "interface");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "currentNetwork");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "copy");

        v63 = CFSTR("network");
        v64 = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        WFLogForCategory(5uLL);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v39)
        {
          v41 = v39;
          if (os_log_type_enabled(v41, v40))
          {
            objc_msgSend(*(id *)(a1 + 32), "interface");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "currentNetwork");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v68 = v43;
            _os_log_impl(&dword_219FC8000, v41, v40, "notifying with network from WFInterface %@", buf, 0xCu);

          }
        }

      }
      else
      {
        v55 = *(_QWORD *)(a1 + 48);
        if (!v55)
        {
          WFLogForCategory(5uLL);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v58 && os_log_type_enabled(v58, v59))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219FC8000, v58, v59, "network to notify for WFNetworkListControllerAssociationNetworkKey is nil", buf, 2u);
          }

          v26 = 0;
          goto LABEL_51;
        }
        v61 = CFSTR("network");
        v62 = v55;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        WFLogForCategory(5uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        v56 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v38 && os_log_type_enabled(v38, v56))
        {
          v57 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          v68 = v57;
          _os_log_impl(&dword_219FC8000, v38, v56, "notifying with network from WFNetworkListController %@", buf, 0xCu);
        }
      }

    }
LABEL_51:
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "postNotificationName:object:userInfo:", CFSTR("WFNetworkListControllerAssociationDidFinishNotification"), *(_QWORD *)(a1 + 32), v26);

    if (objc_msgSend(*(id *)(a1 + 32), "associatingToOtherNetwork"))
    {
      WFLogForCategory(5uLL);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v45)
      {
        v47 = v45;
        if (os_log_type_enabled(v47, v46))
        {
          objc_msgSend(*(id *)(a1 + 32), "otherNetworkVC");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v68 = v48;
          _os_log_impl(&dword_219FC8000, v47, v46, "association originated from otherNetworkVC: %@", buf, 0xCu);

        }
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setAssociatingToOtherNetwork:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerConnectedNetwork");
    if (*(_BYTE *)(a1 + 56)
      && objc_msgSend(*(id *)(a1 + 32), "isAirPortSettings")
      && (objc_msgSend(*(id *)(a1 + 48), "iOSHotspot") & 1) == 0)
    {
      WFLogForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49 && os_log_type_enabled(v49, v50))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v68) = 5;
        _os_log_impl(&dword_219FC8000, v49, v50, "Scheduling a no internet test after successful association after %d seconds.", buf, 8u);
      }

      objc_msgSend(*(id *)(a1 + 32), "healthManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "runNoInternetDiagnosticsAfter:", 5);

    }
    objc_msgSend(*(id *)(a1 + 32), "_resumeScanning");
    if (objc_msgSend(*(id *)(a1 + 48), "iOSHotspot"))
    {
      objc_msgSend(*(id *)(a1 + 32), "wifiClient");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "interface");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "asyncCurrentNetwork:", 0);

    }
    dispatch_get_global_queue(21, 0);
    v54 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WFNetworkListController__associationDidFinish_error_network___block_invoke_223;
    block[3] = &unk_24DC348F8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v54, block);

LABEL_69:
    goto LABEL_70;
  }
  WFLogForCategory(5uLL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v27)
  {
    v29 = v27;
    if (os_log_type_enabled(v29, v28))
    {
      objc_msgSend(*(id *)(a1 + 32), "associationContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stateDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v31;
      _os_log_impl(&dword_219FC8000, v29, v28, "no association in progress, current state: <%@>", buf, 0xCu);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerConnectedNetwork");
  if (*(_BYTE *)(a1 + 56)
    && objc_msgSend(*(id *)(a1 + 32), "isAirPortSettings")
    && (objc_msgSend(*(id *)(a1 + 48), "iOSHotspot") & 1) == 0)
  {
    WFLogForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v68) = 3;
      _os_log_impl(&dword_219FC8000, v32, v33, "Scheduling a no internet test after successful association after %d seconds.", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "healthManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "runNoInternetDiagnosticsAfter:", 3);
    goto LABEL_69;
  }
LABEL_70:

}

void __63__WFNetworkListController__associationDidFinish_error_network___block_invoke_223(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "wifiClient");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAutoJoinEnabled:", 1);

}

- (void)_presentHotspotErrorContextWithDevice:(id)a3 hotspotError:(id)a4 failure:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WFErrorContext *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id from;
  id location;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v24 = *MEMORY[0x24BDD1398];
    v25[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:userInfo:", a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFErrorContext initWithAssociationError:network:diagnosticsResult:]([WFErrorContext alloc], "initWithAssociationError:network:diagnosticsResult:", v12, v8, 0);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v13);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __86__WFNetworkListController__presentHotspotErrorContextWithDevice_hotspotError_failure___block_invoke;
  v18 = &unk_24DC34D00;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  v14 = v12;
  v19 = v14;
  -[WFErrorContext setCompletionHandler:](v13, "setCompletionHandler:", &v15);
  -[WFNetworkListController _presentContext:contextType:](self, "_presentContext:contextType:", v13, 0, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __86__WFNetworkListController__presentHotspotErrorContextWithDevice_hotspotError_failure___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_dismissErrorViewControllerWithContext:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_associationDidFinish:error:network:", 0, *(_QWORD *)(a1 + 32), 0);

}

- (void)_presentContext:(id)a3 contextType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WFNetworkListController__presentContext_contextType___block_invoke;
  block[3] = &unk_24DC34F48;
  v9 = v6;
  v10 = a4;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__WFNetworkListController__presentContext_contextType___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  char v17;
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
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 1)
  {
    v5 = *(id *)(a1 + 40);
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      v33 = 136315394;
      v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: presenting lockdown mode context %@", (uint8_t *)&v33, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "viewProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "networkLockdownModeViewControllerWithContext:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setContextVC:", v19);

    }
  }
  else
  {
    if (v4)
      goto LABEL_20;
    v5 = *(id *)(a1 + 40);
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v33 = 136315394;
      v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: presenting error context %@", (uint8_t *)&v33, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "networkErrorViewControllerWithContext:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setContextVC:", v9);

    objc_msgSend(*(id *)(a1 + 32), "contextVC");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v11)
      {
        v11 = v11;
        if (os_log_type_enabled(v11, (os_log_type_t)v12))
        {
          objc_msgSend(*(id *)(a1 + 32), "viewProvider");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 136315650;
          v34 = "-[WFNetworkListController _presentContext:contextType:]_block_invoke";
          v35 = 2112;
          v36 = v13;
          v37 = 2112;
          v38 = v5;
          _os_log_impl(&dword_219FC8000, v11, (os_log_type_t)v12, "%s: provider (%@) did not return view for error %@", (uint8_t *)&v33, 0x20u);

        }
      }
      goto LABEL_35;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "contextVC");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProvider:", v20);

  objc_msgSend(*(id *)(a1 + 32), "setVisibleContext:", v5);
LABEL_20:
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "otherNetworkVC");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && (v28 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10), v27, v28))
    {
      objc_msgSend(*(id *)(a1 + 32), "otherNetworkVC");
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "credentialsContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *(void **)(a1 + 32);
      if (v30)
      {
        objc_msgSend(v31, "credentialsContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "provider");
        v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
        objc_msgSend(*(id *)(a1 + 32), "contextVC");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "presentViewController:animated:completion:", v11, 1, 0);
        goto LABEL_35;
      }
      objc_msgSend(v31, "viewController");
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v29;
    goto LABEL_34;
  }
  WFLogForCategory(0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v21)
  {
    v23 = v21;
    if (os_log_type_enabled(v23, v22))
    {
      objc_msgSend(*(id *)(a1 + 32), "contextVC");
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "visibleContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412546;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_219FC8000, v23, v22, "viewProvider will handle presentation of %@ (context %@)", (uint8_t *)&v33, 0x16u);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextVC");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentNetworkViewController:forContext:", v11, v26);

LABEL_35:
}

- (void)_scanNetworkForAssociation:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_219FC8000, v8, v9, "scanning to associate for network='%@' profile='%@'", buf, 0x16u);
  }

  objc_msgSend(v6, "ssid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController interface](self, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceScanChannels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFScanRequest scanRequestForSSID:channels:](WFScanRequest, "scanRequestForSSID:channels:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 8;
    if (v13)
    {
LABEL_7:
      objc_initWeak((id *)buf, self);
      -[WFNetworkListController interface](self, "interface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke;
      v20[3] = &unk_24DC34F70;
      objc_copyWeak(&v23, (id *)buf);
      v21 = v6;
      v22 = v7;
      objc_msgSend(v15, "asyncScanRequest:reply:", v13, v20);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
      goto LABEL_14;
    }
  }
  else
  {
    v14 = objc_msgSend(v6, "securityMode");
    if (v13)
      goto LABEL_7;
  }
  WFLogForCategory(5uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_219FC8000, v16, v17, "failed to create scan request for network='%@'", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController associationContext](self, "associationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController _handleAssociationError:network:profile:securityMode:associationContext:](self, "_handleAssociationError:network:profile:securityMode:associationContext:", v18, v6, v7, v14, v19);

LABEL_14:
}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v16[7];
  _QWORD v17[7];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  WFLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219FC8000, v8, v9, "scan completed for network='%@' results='%@'", buf, 0x16u);
  }

  objc_msgSend(WeakRetained, "associationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryScanCompleted:", 1);

  if (!v5 && v6 && objc_msgSend(v6, "count"))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_2;
    v16[3] = &unk_24DC34BC0;
    v12 = v16;
    v13 = v6;
  }
  else
  {
    WFLogForCategory(5uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_219FC8000, v14, v15, "scan error='%@' results='%@'", buf, 0x16u);
    }

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_226;
    v17[3] = &unk_24DC34BC0;
    v13 = *(void **)(a1 + 32);
    v12 = v17;
  }
  v12[4] = v13;
  v12[5] = WeakRetained;
  v12[6] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_226(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = 8;
  else
    v2 = objc_msgSend(*(id *)(a1 + 32), "securityMode");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 12);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleAssociationError:network:profile:securityMode:associationContext:", v7, v5, v4, v2, v6);

}

void __62__WFNetworkListController__scanNetworkForAssociation_profile___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_associateToScanRecord:profile:", v2, *(_QWORD *)(a1 + 48));

}

- (void)_updateViewControllerConnectedNetwork
{
  void *v3;
  id v4;

  -[WFNetworkListController interface](self, "interface");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentNetwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController _updateViewControllerConnectedNetwork:](self, "_updateViewControllerConnectedNetwork:", v3);

}

- (void)_updateViewControllerConnectedNetwork:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFNetworkListController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__WFNetworkListController__updateViewControllerConnectedNetwork___block_invoke;
  v6[3] = &unk_24DC34BE8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __65__WFNetworkListController__updateViewControllerConnectedNetwork___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      if (v2)
      {
        objc_msgSend(v2, "ssid");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = CFSTR("nil");
      }
      v6 = objc_msgSend(v2, "hash");
      objc_msgSend(*(id *)(a1 + 40), "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentNetwork");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v7;
      v9 = v6;
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "viewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "currentNetwork");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ssid");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("nil");
      }
      objc_msgSend(*(id *)(a1 + 40), "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentNetwork");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v34 = "-[WFNetworkListController _updateViewControllerConnectedNetwork:]_block_invoke";
      v35 = 2112;
      v36 = v32;
      v37 = 2048;
      v38 = v9;
      v39 = 2112;
      v40 = v10;
      v41 = 2048;
      v42 = objc_msgSend(v12, "hash");
      _os_log_impl(&dword_219FC8000, v5, v4, "%s: current network is %@ (%lu), view controller current network: %@ (%lu)", buf, 0x34u);

      if (v8)
      {

      }
      if (v2)

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentNetwork:", v2);

  WFLogForCategory(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, v15))
    {
      objc_msgSend(*(id *)(a1 + 40), "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentNetwork");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFNetworkListController _updateViewControllerConnectedNetwork:]_block_invoke";
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_219FC8000, v16, v15, "%s: view controller current network updated to %@", buf, 0x16u);

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 40), "latestLinkQuality");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if ((v20 & 1) != 0)
  {
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 40), "latestLinkQuality");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20, "scaledRssi");
    }
    else
    {
      objc_msgSend(v2, "scaledRSSI");
    }
    v25 = WFSignalBarsFromScaledRSSI();
    objc_msgSend(*(id *)(a1 + 40), "viewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCurrentNetworkSignalBars:", v25);

    if (!v22)
      goto LABEL_31;
LABEL_30:

    goto LABEL_31;
  }
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "latestLinkQuality");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20, "scaledRssi");
  }
  else
  {
    objc_msgSend(v2, "scaledRSSI");
  }
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = v24;
  objc_msgSend(v27, "setCurrentNetworkScaledRSSI:", v28);

  if (v22)
    goto LABEL_30;
LABEL_31:

  objc_msgSend(*(id *)(a1 + 40), "_updateCurrentNetworkIPState:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_updateViewControllerScanResults");
  objc_msgSend(*(id *)(a1 + 40), "_updateHealthSubtitle");

}

- (void)_ipStateDidChange:(id)a3
{
  NSObject *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WFNetworkListController interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentNetwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v3 = v8;
    if (os_log_type_enabled(v3, (os_log_type_t)v9))
    {
      objc_msgSend(v5, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController associationContext](self, "associationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v20 = "-[WFNetworkListController _ipStateDidChange:]";
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_219FC8000, v3, (os_log_type_t)v9, "%s: userInfo %@ - self.associationContext %@ - self.interface.currentNetwork %@", buf, 0x2Au);

    }
  }

  -[WFNetworkListController associationContext](self, "associationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[WFNetworkListController associationContext](self, "associationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqual:](v3, "isEqual:", v7))
    {

      goto LABEL_17;
    }
  }
  -[WFNetworkListController associationContext](self, "associationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "network");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = 1;
  else
    v15 = v7 == 0;
  v16 = !v15;

  if (!v12)
  {
    if (!v16)
      goto LABEL_18;
    goto LABEL_17;
  }

  if ((v16 & 1) != 0)
  {
LABEL_17:
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__WFNetworkListController__ipStateDidChange___block_invoke;
    v17[3] = &unk_24DC34BE8;
    v17[4] = self;
    v18 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);

  }
LABEL_18:

}

uint64_t __45__WFNetworkListController__ipStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentNetworkIPState:", *(_QWORD *)(a1 + 40));
}

- (void)_updateCurrentNetworkIPState:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  WFNetworkListController *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFNetworkListController isAssociating](self, "isAssociating"))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v5 = v5;
      if (os_log_type_enabled(v5, v6))
      {
        -[WFNetworkListController associationContext](self, "associationContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stateDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "networkName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v16 = "-[WFNetworkListController _updateCurrentNetworkIPState:]";
        v17 = 2112;
        v18 = v8;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_219FC8000, v5, v6, "%s IP state change while association state is <%@> with network %@", buf, 0x20u);

      }
    }
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke;
    v12[3] = &unk_24DC34BE8;
    v13 = v4;
    v14 = self;
    dispatch_async(v11, v12);

    v5 = v13;
  }

}

void __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  char v11;
  char v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "interface");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hasValidIPAddress");

    objc_msgSend(*(id *)(a1 + 40), "wifiClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCellularOutrankingWiFi");

    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        objc_msgSend(*(id *)(a1 + 32), "ssid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v14 = v9;
        v15 = 1024;
        v16 = v3;
        v17 = 1024;
        v18 = v5;
        _os_log_impl(&dword_219FC8000, v8, v7, "current network='%@' hasValidIP=%d wifiOutranked=%d", buf, 0x18u);

      }
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke_229;
    v10[3] = &unk_24DC34F98;
    v11 = v5;
    v10[4] = *(_QWORD *)(a1 + 40);
    v12 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }
}

void __56__WFNetworkListController__updateCurrentNetworkIPState___block_invoke_229(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v1;
    v2 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 41))
      v3 = 2;
    else
      v3 = 1;
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v1;
    v2 = v3;
  }
  objc_msgSend(v1, "setCurrentNetworkState:", v2);

}

- (BOOL)_canPromptForInstantHotspot
{
  void *v3;
  void *v4;
  char v5;

  -[WFNetworkListController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPromptWhenPersonalHotspotIsEnabled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_disablePersonalHotspot
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  const char *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v16;
  int v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WFNetworkListController _disablePersonalHotspot]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: disabling personal hotspot", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  v5 = _MISAttach(buf);
  if (v5)
  {
    v6 = v5;
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    v9 = 0;
    if (WFCurrentLogLevel() && v7)
    {
      if (os_log_type_enabled(v7, v8))
      {
        v16 = 67109120;
        v17 = v6;
        v10 = "Error: Unable to attach to MobileInternetSharing (err=%d)";
LABEL_20:
        _os_log_impl(&dword_219FC8000, v7, v8, v10, (uint8_t *)&v16, 8u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v11 = _MISSetGlobalServiceState(*(uint64_t *)buf, 1022);
    if (v11)
    {
      v12 = v11;
      WFLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = OSLogForWFLogLevel(1uLL);
      v9 = 0;
      if (WFCurrentLogLevel() && v7)
      {
        if (os_log_type_enabled(v7, v8))
        {
          v16 = 67109120;
          v17 = v12;
          v10 = "Error: Failed to turn off Personal Hotspot (err=%d)";
          goto LABEL_20;
        }
LABEL_21:
        v9 = 0;
      }
    }
    else
    {
      v13 = _MISSetGlobalServiceState(*(uint64_t *)buf, 1023);
      if (!v13)
      {
        _MISDetach(*(uint64_t *)buf);
        -[WFNetworkListController wifiClient](self, "wifiClient");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject setMISState:](v7, "setMISState:", 0);
        v9 = 1;
        goto LABEL_22;
      }
      v14 = v13;
      WFLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = OSLogForWFLogLevel(1uLL);
      v9 = 0;
      if (WFCurrentLogLevel() && v7)
      {
        if (os_log_type_enabled(v7, v8))
        {
          v16 = 67109120;
          v17 = v14;
          v10 = "Error: Failed to re-enable Personal Hotspot (err=%d)";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:

  return v9;
}

- (BOOL)_canPromptForCarPlay
{
  void *v3;
  void *v4;
  char v5;

  -[WFNetworkListController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPromptWhenCarPlaySessionIsActive");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_promptToDisableCarPlayForNetworkName:(id)a3 handler:(id)a4
{
  id v6;
  WFNetworkProfile *v7;
  void *v8;
  void *v9;
  void *v10;
  WFNetworkProfile *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = [WFNetworkProfile alloc];
  -[WFNetworkListController interface](self, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentNetwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchingKnownNetworkProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFNetworkProfile initWithCoreWiFiProfile:](v7, "initWithCoreWiFiProfile:", v10);

  if (v11)
  {
    -[WFNetworkProfile carPlayUUID](v11, "carPlayUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WFNetworkProfile carPlayUUID](v11, "carPlayUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WFGetCarNameFromCarPlayNetworkUUID(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BEC2928], "carPlayAlertControllerWithNetworkName:carName:completionHandler:", v16, v12, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);

}

- (BOOL)_isActiveCarPlaySession
{
  void *v2;
  void *v3;
  int v4;

  -[WFNetworkListController interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarPlay");

  if (v4)
    return objc_msgSend(MEMORY[0x24BDB2550], "isCarPlaySessionActive");
  else
    return 0;
}

- (void)_networkHealthIssuesDidChange:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFNetworkListController isAssociating](self, "isAssociating"))
  {
    objc_initWeak(&location, self);
    WFLogForCategory(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        -[WFNetworkListController associationContext](self, "associationContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController associationContext](self, "associationContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "networkName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v17 = "-[WFNetworkListController _networkHealthIssuesDidChange:]";
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_219FC8000, v7, v6, "%s health issues changed while association state is in progress <%@> with network %@", buf, 0x20u);

      }
    }

    v11 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__WFNetworkListController__networkHealthIssuesDidChange___block_invoke;
    block[3] = &unk_24DC34750;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WFNetworkListController _updateHealthSubtitle](self, "_updateHealthSubtitle");
  }

}

void __57__WFNetworkListController__networkHealthIssuesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_networkHealthIssuesDidChange:", *(_QWORD *)(a1 + 32));

}

- (id)_sortedHealthRecommendations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFNetworkListController healthRecommendations](self, "healthRecommendations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC2958], "healthIssueSortComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)healthRecommendations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  WFNetworkProfile *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  os_log_type_t v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  os_log_type_t v116;
  void *v117;
  id v118;
  int v120;
  const char *v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkListController isHS20Supported](self, "isHS20Supported")
    && objc_msgSend(v4, "isHotspot20"))
  {
    objc_msgSend(v4, "matchingKnownNetworkProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[WFNetworkListController gasController](self, "gasController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "profileForNetwork:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        objc_msgSend(v4, "matchingKnownNetworkProfile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = 136315394;
        v121 = "-[WFNetworkListController healthRecommendations]";
        v122 = 2112;
        v123 = v9;
        _os_log_impl(&dword_219FC8000, v8, v7, "%s: using matchingKnownNetworkProfile %@", (uint8_t *)&v120, 0x16u);

      }
    }

LABEL_11:
    v11 = [WFNetworkProfile alloc];
    objc_msgSend(v4, "matchingKnownNetworkProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFNetworkProfile initWithCoreWiFiProfile:](v11, "initWithCoreWiFiProfile:", v12);
LABEL_12:
    v14 = (void *)v13;

    goto LABEL_18;
  }
  objc_msgSend(v4, "matchingKnownNetworkProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_11;
  WFLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
  {
    v120 = 138412290;
    v121 = (const char *)v4;
    _os_log_impl(&dword_219FC8000, v15, v16, "Network='%@' is not a known network", (uint8_t *)&v120, 0xCu);
  }

  v14 = 0;
LABEL_18:
  v17 = objc_msgSend(v4, "supportsWiFiHealth");
  -[WFNetworkListController viewController](self, "viewController");
  v18 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_112;
  -[WFNetworkListController viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "supportsHealthRecommendations");

  if ((v20 & v17) != 1)
  {
    v24 = 0;
    v25 = 0;
    goto LABEL_114;
  }
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isWiFiHealthUIDisabled");

  if (v22)
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v116 = OSLogForWFLogLevel(1uLL);
    v24 = 0;
    if (!WFCurrentLogLevel() || !v18)
    {
      v25 = 0;
      goto LABEL_113;
    }
    if (os_log_type_enabled(v18, v116))
    {
      v120 = 136315138;
      v121 = "-[WFNetworkListController healthRecommendations]";
      _os_log_impl(&dword_219FC8000, v18, v116, "%s: health ui is disabled", (uint8_t *)&v120, 0xCu);
    }
LABEL_112:
    v24 = 0;
    v25 = 0;
LABEL_113:

    goto LABEL_114;
  }
  -[WFNetworkListController healthManager](self, "healthManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentNetworkIssues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v24, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v26);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    goto LABEL_78;
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hiddenNetwork");

  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "securityOverride");

  if (v31 == 1)
  {
    v32 = (void *)MEMORY[0x24BEC2958];
    v33 = v29 == 0;
    v34 = 8;
    v35 = 128;
  }
  else
  {
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "securityOverride");

    if (v37 == 2)
    {
      v32 = (void *)MEMORY[0x24BEC2958];
      v33 = v29 == 0;
      v34 = 2;
      v35 = 512;
    }
    else
    {
      -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "securityOverride");

      if (v39 != 3)
        goto LABEL_47;
      v32 = (void *)MEMORY[0x24BEC2958];
      v33 = v29 == 0;
      v34 = 4;
      v35 = 256;
    }
  }
  if (v33)
    v40 = v34;
  else
    v40 = v35;
  objc_msgSend(v32, "issueWithType:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setOverrideIssue:", 1);
  if (v41)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v25, "containsObject:", v42);

    if (v43)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v44);

    }
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v25, "containsObject:", v45);

    if (v46)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v47);

    }
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v25, "containsObject:", v48);

    if (v49)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v50);

    }
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 128);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v25, "containsObject:", v51);

    if (v52)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 128);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v53);

    }
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 512);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v25, "containsObject:", v54);

    if (v55)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 512);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v56);

    }
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 256);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v25, "containsObject:", v57);

    if (v58)
    {
      objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 256);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v59);

    }
    goto LABEL_49;
  }
LABEL_47:
  if (!v29)
    goto LABEL_50;
  objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 64);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setOverrideIssue:", 1);
LABEL_49:
  objc_msgSend(v25, "addObject:", v41);

LABEL_50:
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "noInternetConnection");

  if (v61)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v62);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "legacyPHY");

  if (v64)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 16);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v65);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "commonSSID");

  if (v67)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 32);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v68);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "carrierNetwork");

  if (v70)
  {
    objc_msgSend(MEMORY[0x24BEC2990], "carrierNetworkIssue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v71);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "dnsFiltered");

  if (v73)
  {
    objc_msgSend(MEMORY[0x24BEC2990], "dnsFilteredNetworkIssue");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v74);

  }
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "privateAddressOverride");

  if (v76)
  {
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "privateAddressOverride");

    if (v78 == 1)
    {
      objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledBySystemIssue");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "privateAddressOverride");

      if (v81 == 2)
      {
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledByCarrierIssueWithCarrierName:", CFSTR("Carrier"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v82, "privateAddressOverride");

        if (v83 != 3)
          goto LABEL_68;
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledByProfileIssueWithOrganizationName:profileName:profileUUID:", CFSTR("Organization"), CFSTR("ProfileName"), CFSTR("UUID"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v84 = v79;
    objc_msgSend(v79, "setOverrideIssue:", 1);
    objc_msgSend(v25, "addObject:", v84);

  }
LABEL_68:
  -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "cellularOutrankStateOverride");

  if (v86)
  {
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "cellularOutrankStateOverride");

    if (v88 == 1)
    {
      objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankDownload");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_77:
      v96 = v89;
      objc_msgSend(v89, "setOverrideIssue:", 1);
      objc_msgSend(v25, "addObject:", v96);

      goto LABEL_78;
    }
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "cellularOutrankStateOverride");

    if (v91 == 3)
    {
      objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankPerformance");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "cellularOutrankStateOverride");

    if (v93 == 2)
    {
      objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankSecurity");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
    -[WFNetworkListController healthRecommendationOverrides](self, "healthRecommendationOverrides");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "cellularOutrankStateOverride");

    if (v95 == 8)
    {
      objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankPrivateNetwork");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
  }
LABEL_78:
  if (objc_msgSend(v14, "canExposeIMSI"))
  {
    objc_msgSend(MEMORY[0x24BEC2990], "carrierNetworkIssue");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v97);

  }
  if (objc_msgSend(v14, "isDNSHeuristicsFiltered"))
  {
    objc_msgSend(MEMORY[0x24BEC2990], "dnsFilteredNetworkIssue");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v98);

  }
  objc_msgSend(v4, "privateAddressConfig");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v99, "disabledReason");

  if (v100)
  {
    WFLogForCategory(0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v101)
    {
      v103 = v101;
      if (os_log_type_enabled(v103, v102))
      {
        objc_msgSend(v4, "privateAddressConfig");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = 136315394;
        v121 = "-[WFNetworkListController healthRecommendations]";
        v122 = 2112;
        v123 = v104;
        _os_log_impl(&dword_219FC8000, v103, v102, "%s: network.privateAddressConfig %@", (uint8_t *)&v120, 0x16u);

      }
    }

    if (v14)
    {
      objc_msgSend(v14, "originatorName");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v105 = 0;
    }
    objc_msgSend(v4, "privateAddressConfig");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "disabledReason");

    switch(v107)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledByUserIssue");
        v108 = objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      case 2:
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledBySystemIssue");
        v108 = objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      case 3:
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledByCarrierIssueWithCarrierName:", 0);
        v108 = objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      case 4:
        if (v105)
          v109 = v105;
        else
          v109 = 0;
        objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledByProfileIssueWithOrganizationName:profileName:profileUUID:", v109, 0, 0);
        v108 = objc_claimAutoreleasedReturnValue();
LABEL_99:
        v110 = (void *)v108;
        objc_msgSend(v25, "addObject:", v108);

        break;
      default:
        break;
    }

  }
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "isCellularOutrankingWiFi");

  if (v112)
  {
    -[WFNetworkListController wifiClient](self, "wifiClient");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "cellularOutrankState");

    switch(v114)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankSecurity");
        v115 = objc_claimAutoreleasedReturnValue();
        goto LABEL_107;
      case 2:
        objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankPerformance");
        v115 = objc_claimAutoreleasedReturnValue();
        goto LABEL_107;
      case 3:
      case 4:
        objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankDownload");
        v115 = objc_claimAutoreleasedReturnValue();
        goto LABEL_107;
      case 5:
        objc_msgSend(MEMORY[0x24BEC2938], "cellularOutrankPrivateNetwork");
        v115 = objc_claimAutoreleasedReturnValue();
LABEL_107:
        v18 = v115;
        objc_msgSend(v25, "addObject:", v115);
        goto LABEL_113;
      default:
        break;
    }
  }
LABEL_114:
  if (objc_msgSend(v25, "count"))
    v117 = v25;
  else
    v117 = 0;
  v118 = v117;

  return v118;
}

- (BOOL)_shouldShowLowDataModeForProfile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void *v10;
  os_log_type_t v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCellularOutrankingWiFi");

  if (v4
    && (v6 & 1) == 0
    && (objc_msgSend(v4, "lowDataMode") == 1
     || objc_msgSend(v4, "isPersonalHotspot") && !objc_msgSend(v4, "lowDataMode")))
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(4uLL);
    v9 = 1;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      v7 = v7;
      if (os_log_type_enabled(v7, v8))
      {
        objc_msgSend(v4, "networkName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[WFNetworkListController _shouldShowLowDataModeForProfile:]";
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_219FC8000, v7, v8, "%s: Showing low data mode for: %@", (uint8_t *)&v14, 0x16u);

        v9 = 1;
      }
      goto LABEL_15;
    }
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(4uLL);
    v9 = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v7)
    {
      v7 = v7;
      if (os_log_type_enabled(v7, v11))
      {
        objc_msgSend(v4, "networkName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[WFNetworkListController _shouldShowLowDataModeForProfile:]";
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_219FC8000, v7, v11, "%s: Showing low data mode for: %@", (uint8_t *)&v14, 0x16u);

      }
      v9 = 0;
LABEL_15:

    }
  }

  return v9;
}

- (void)_updateHealthSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  os_log_type_t v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  os_log_type_t v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController healthRecommendations](self, "healthRecommendations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEC2958];
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highestPriorityIssueFromIssues:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "issueTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[WFNetworkListController viewControllerSupportsCurrentNetworkSubtitle](self, "viewControllerSupportsCurrentNetworkSubtitle"))
  {
    -[WFNetworkListController interface](self, "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentNetwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFNetworkListController interface](self, "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentKnownNetworkProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WFNetworkListController _shouldShowLowDataModeForProfile:](self, "_shouldShowLowDataModeForProfile:", v11))
    {
      v12 = v11;
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocSaveDataModeSubtitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" — %@"), v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v15;
      }
      else
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocSaveDataModeSubtitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithString:", v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v11 = v12;
    }
    WFLogForCategory(0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17)
    {
      v46 = v3;
      v19 = v11;
      v20 = v17;
      if (os_log_type_enabled(v20, v18))
      {
        -[WFNetworkListController viewController](self, "viewController");
        v45 = v9;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentNetwork");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v7;
        v49 = 2112;
        v50 = (id)objc_opt_class();
        v23 = v50;
        _os_log_impl(&dword_219FC8000, v20, v18, "subtitle: %@, currentNetwork class: %@", buf, 0x16u);

        v9 = v45;
      }

      v11 = v19;
      v3 = v46;
    }

    if (!v7)
      goto LABEL_22;
    -[WFNetworkListController viewController](self, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentNetwork");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[WFNetworkListController viewController](self, "viewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentNetworkSubtitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", v7);

      if ((v29 & 1) != 0)
      {
        WFLogForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219FC8000, v30, v31, "subtitle is equal to current one, not updating ", buf, 2u);
        }
        goto LABEL_28;
      }
      -[WFNetworkListController viewController](self, "viewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCurrentNetworkSubtitle:", v7);

      if (-[WFNetworkListController isAirPortSettings](self, "isAirPortSettings"))
      {
        if (v6)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v6, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = 0;
        }
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ssid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFHealthUIEvent subtitleEventWithIssues:ssid:securityType:](WFHealthUIEvent, "subtitleEventWithIssues:ssid:securityType:", v40, v42, objc_msgSend(v9, "securityMode"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "processEvent:", v43);

      }
      WFLogForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      v44 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v30)
        goto LABEL_28;
      v30 = v30;
      if (!os_log_type_enabled(v30, v44))
        goto LABEL_27;
      objc_msgSend(v9, "ssid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v34;
      v49 = 2112;
      v50 = v7;
      v35 = "Setting health subtitle for %@ to %@";
      v36 = v30;
      v37 = v44;
      v38 = 22;
    }
    else
    {
LABEL_22:
      -[WFNetworkListController viewController](self, "viewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setCurrentNetworkSubtitle:", 0);

      WFLogForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      v33 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v30)
        goto LABEL_28;
      v30 = v30;
      if (!os_log_type_enabled(v30, v33))
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      objc_msgSend(v9, "ssid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v34;
      v35 = "Clearing health subtitle for %@";
      v36 = v30;
      v37 = v33;
      v38 = 12;
    }
    _os_log_impl(&dword_219FC8000, v36, v37, v35, buf, v38);

    goto LABEL_27;
  }
LABEL_29:

}

- (void)networkListViewController:(id)a3 didTapRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  os_log_type_t v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  os_log_type_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  os_log_type_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (self->_shouldShowDetailTapOnCurrentNetwork)
      goto LABEL_8;
    -[WFNetworkListController associationContext](self, "associationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "networkName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ssid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
    {
LABEL_8:
      -[WFNetworkListController interface](self, "interface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentNetwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v7, "isEqual:", v19);

      if (v20)
      {
        -[WFNetworkListController interface](self, "interface");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentNetwork");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "carPlayType");

        if (v23 == 1)
        {
          WFLogForCategory(0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v24)
          {
            v26 = v24;
            if (os_log_type_enabled(v26, v25))
            {
              -[WFNetworkListController interface](self, "interface");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "currentNetwork");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = 136315394;
              v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
              v53 = 2112;
              v54 = v28;
              _os_log_impl(&dword_219FC8000, v26, v25, "%s: tapped on carplay only network %@", (uint8_t *)&v51, 0x16u);

            }
          }

        }
        else
        {
          -[WFNetworkListController wifiClient](self, "wifiClient");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isCellularOutrankingWiFi");

          if (v31)
          {
            -[WFNetworkListController wifiClient](self, "wifiClient");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "cellularOutrankState");

            WFLogForCategory(0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v34)
            {
              v36 = v34;
              if (os_log_type_enabled(v36, v35))
              {
                -[WFNetworkListController interface](self, "interface");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "currentNetwork");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 136315650;
                v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                v53 = 2112;
                v54 = v38;
                v55 = 2048;
                v56 = v33;
                _os_log_impl(&dword_219FC8000, v36, v35, "%s: tapped on current network when cellular is outranking wifi %@ - state: %lu", (uint8_t *)&v51, 0x20u);

              }
            }

            if (v33 == 4)
            {
              WFLogForCategory(0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v39)
              {
                v41 = v39;
                if (os_log_type_enabled(v41, v40))
                {
                  -[WFNetworkListController interface](self, "interface");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "currentNetwork");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = 136315394;
                  v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                  v53 = 2112;
                  v54 = v43;
                  _os_log_impl(&dword_219FC8000, v41, v40, "%s: tapped on current network when developer is outranking wifi %@", (uint8_t *)&v51, 0x16u);

                }
              }

              -[WFNetworkListController interface](self, "interface");
              v12 = objc_claimAutoreleasedReturnValue();
              -[NSObject currentNetwork](v12, "currentNetwork");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFNetworkListController _presentDeveloperOutrankAlertForNetwork:](self, "_presentDeveloperOutrankAlertForNetwork:", v44);

            }
            else
            {
              -[WFNetworkListController interface](self, "interface");
              v12 = objc_claimAutoreleasedReturnValue();
              -[NSObject currentNetwork](v12, "currentNetwork");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFNetworkListController _presentCellularOutrankAlertForNetwork:privateCellular:](self, "_presentCellularOutrankAlertForNetwork:privateCellular:", v50, v33 == 5);

            }
            goto LABEL_43;
          }
          if (-[WFNetworkListController shouldShowDetailTapOnCurrentNetwork](self, "shouldShowDetailTapOnCurrentNetwork"))
          {
            WFLogForCategory(0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v45)
            {
              v47 = v45;
              if (os_log_type_enabled(v47, v46))
              {
                -[WFNetworkListController interface](self, "interface");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "currentNetwork");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 136315394;
                v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
                v53 = 2112;
                v54 = v49;
                _os_log_impl(&dword_219FC8000, v47, v46, "%s: showing settings for current network: %@", (uint8_t *)&v51, 0x16u);

              }
            }

            -[WFNetworkListController viewController](self, "viewController");
            v12 = objc_claimAutoreleasedReturnValue();
            -[WFNetworkListController networkListViewController:showSettingsForNetwork:context:](self, "networkListViewController:showSettingsForNetwork:context:", v12, v7, 1);
            goto LABEL_43;
          }
        }
      }
      -[WFNetworkListController _associateToScanRecord:](self, "_associateToScanRecord:", v7);
      -[WFNetworkListController associationContext](self, "associationContext");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject setOriginator:](v12, "setOriginator:", 0);
      goto LABEL_43;
    }
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      LOWORD(v51) = 0;
      v14 = "Refuse repeat association request when tapping to show detail is not supported.";
      v15 = v12;
      v16 = v13;
      v17 = 2;
LABEL_21:
      _os_log_impl(&dword_219FC8000, v15, v16, v14, (uint8_t *)&v51, v17);
    }
  }
  else
  {
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v29))
    {
      v51 = 136315138;
      v52 = "-[WFNetworkListController networkListViewController:didTapRecord:]";
      v14 = "%s- called with nil list record";
      v15 = v12;
      v16 = v29;
      v17 = 12;
      goto LABEL_21;
    }
  }
LABEL_43:

}

- (void)networkListViewControllerDidTapOtherNetwork:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  WFOtherNetworkContext *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  WFOtherNetworkContext *v25;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id from;
  id location;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  WFOtherNetworkContext *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  -[WFNetworkListController isAssociating](self, "isAssociating");
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "User tapped join other network", buf, 2u);
  }

  -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
  -[WFNetworkListController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v8, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hardwareMACAddress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFOtherNetworkContext initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:]([WFOtherNetworkContext alloc], "initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:", 0, -[WFNetworkListController _defaultAuthTraits](self, "_defaultAuthTraits"), 1, 1, 0, v30);
  if ((v7 & 1) != 0)
  {
    -[WFNetworkListController viewProvider](self, "viewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "otherNetworkViewControllerWithContext:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BEC2988]);
    v14 = WFCurrentDeviceCapability();
    objc_msgSend(MEMORY[0x24BEC2918], "defaultAppearanceProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithOtherNetworkProviderContext:deviceCapability:appearanceProxy:", v10, v14, v15);

    objc_msgSend(v12, "setDelegate:", v10);
  }
  if (v12)
  {
    -[WFCredentialsContext setProvider:](v10, "setProvider:", v12);
    -[WFNetworkListController setCredentialsContext:](self, "setCredentialsContext:", v10);
    -[WFNetworkListController setVisibleContext:](self, "setVisibleContext:", v10);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v10);
    v16 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke;
    v37[3] = &unk_24DC34FC0;
    objc_copyWeak(&v38, &location);
    objc_copyWeak(&v39, &from);
    -[WFOtherNetworkContext setPrivateAddressModeChangeHandler:](v10, "setPrivateAddressModeChangeHandler:", v37);
    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_262;
    v34[3] = &unk_24DC34DA0;
    objc_copyWeak(&v35, &location);
    objc_copyWeak(&v36, &from);
    -[WFCredentialsContext setCancellationHandler:](v10, "setCancellationHandler:", v34);
    v31[0] = v16;
    v31[1] = 3221225472;
    v31[2] = __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_263;
    v31[3] = &unk_24DC34FE8;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    -[WFCredentialsContext setCompletionHandler:](v10, "setCompletionHandler:", v31);
    -[WFNetworkListController setOtherNetworkVC:](self, "setOtherNetworkVC:", v12);
    -[WFNetworkListController viewProvider](self, "viewProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      WFLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412546;
        v43 = (const char *)v12;
        v44 = 2112;
        v45 = v10;
        _os_log_impl(&dword_219FC8000, v19, v20, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
      }

      -[WFNetworkListController viewProvider](self, "viewProvider", &v38, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentNetworkViewController:forContext:", v12, v10);
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v12, &v38, v28);
      objc_msgSend(v21, "setModalPresentationStyle:", 2);
      -[WFNetworkListController viewController](self, "viewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "presentViewController:animated:completion:", v21, 1, 0);

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v27);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    WFLogForCategory(0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v22)
    {
      v24 = v22;
      if (os_log_type_enabled(v24, v23))
      {
        -[WFNetworkListController viewProvider](self, "viewProvider");
        v25 = (WFOtherNetworkContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v43 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]";
        v44 = 2112;
        v45 = v25;
        v46 = 1024;
        v47 = v7 & 1;
        _os_log_impl(&dword_219FC8000, v24, v23, "%s: otherNetworkVc is nil, view provider %@ (supportsOtherVc %d)", buf, 0x1Cu);

      }
    }

  }
}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke(id *a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t v17[8];
  id to;

  v3 = a1;
  objc_copyWeak(&to, a1 + 4);
  v3 += 5;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "network");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ssid");
  }
  else
  {
    objc_msgSend(v6, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SSID");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 == 1)
  {
    v10 = 0;
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_219FC8000, v11, v12, "Generating new private mac when join with random address mode", v17, 2u);
    }

    v13 = objc_loadWeakRetained(&to);
    objc_msgSend(v13, "wifiClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v14, "newRandomMACAddressForSSID:", v9);

  }
  v15 = objc_loadWeakRetained(&to);
  objc_msgSend(v15, "wifiClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRandomAddressModeForNetwork:mode:randomMAC:", v9, a2, v10);

  objc_destroyWeak(&to);
}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_262(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v8 = 136315138;
    v9 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]_block_invoke";
    _os_log_impl(&dword_219FC8000, v2, v3, "%s: user cancelled credentials prompt", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_associationDidFinish:error:network:", 0, v5, 0);

  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "_dismissOtherNetworkViewControllerWithContext:", v7);

}

void __71__WFNetworkListController_networkListViewControllerDidTapOtherNetwork___block_invoke_263(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v11 = 136315650;
    v12 = "-[WFNetworkListController networkListViewControllerDidTapOtherNetwork:]_block_invoke";
    v13 = 2112;
    v14 = v5;
    v15 = 1024;
    v16 = a3;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: credentials prompt complete, provider %@, shouldDismiss %d", (uint8_t *)&v11, 0x1Cu);
  }

  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "userSuppliedNetwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(WeakRetained, "_canStartAssociationToUserSuppliedNetwork:", v10))
    objc_msgSend(WeakRetained, "_associateToUserSuppliedNetwork:", v10);

}

- (void)networkListViewController:(id)a3 userDidChangePower:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  os_log_type_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = CFSTR("OFF");
    if (v4)
      v8 = CFSTR("ON");
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_219FC8000, v6, v7, "User changed power state to %@", (uint8_t *)&v12, 0xCu);
  }

  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFUserEvent eventWithType:state:](WFUserEvent, "eventWithType:state:", 1, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processEvent:", v10);

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPowered:", v4);

  -[WFNetworkListController _powerStateChanged](self, "_powerStateChanged");
}

- (void)networkListViewController:(id)a3 userDidChangePowerToggle:(unint64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      WFPowerStateToggleToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFNetworkListController networkListViewController:userDidChangePowerToggle:]";
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_219FC8000, v9, v8, "%s: User requested power state change to %@", buf, 0x16u);

    }
  }

  -[WFNetworkListController setPowerState:](self, "setPowerState:", 2);
  -[WFNetworkListController setPowerState:](self, "setPowerState:", -[WFNetworkListController powerState](self, "powerState"));
  objc_initWeak((id *)buf, self);
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__WFNetworkListController_networkListViewController_userDidChangePowerToggle___block_invoke;
  v12[3] = &unk_24DC35010;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v11, "setPoweredToggle:handler:", a4 == 1, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __78__WFNetworkListController_networkListViewController_userDidChangePowerToggle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_powerStateChanged");

}

- (void)setPowerState:(unint64_t)a3
{
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  char v14;
  os_log_type_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_powerState != a3)
  {
    WFLogForCategory(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        WFPowerStateToggleToString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WFPowerStateToggleToString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315650;
        v18 = "-[WFNetworkListController setPowerState:]";
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_219FC8000, v7, v6, "%s: power state changed from %@ to %@", (uint8_t *)&v17, 0x20u);

      }
    }

    self->_powerState = a3;
    -[WFNetworkListController viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    -[WFNetworkListController viewController](self, "viewController");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      -[NSObject powerStateDidChangeToggle:](v12, "powerStateDidChangeToggle:", self->_powerState);
    }
    else
    {
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[WFNetworkListController viewController](self, "viewController");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject powerStateDidChange:](v13, "powerStateDidChange:", self->_powerState == 1);
      }
      else
      {
        WFLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v13)
        {
          v13 = v13;
          if (os_log_type_enabled(v13, v15))
          {
            -[WFNetworkListController viewController](self, "viewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 136315394;
            v18 = "-[WFNetworkListController setPowerState:]";
            v19 = 2112;
            v20 = v16;
            _os_log_impl(&dword_219FC8000, v13, v15, "%s: viewController (%@) doesn't respond to power state change methods", (uint8_t *)&v17, 0x16u);

          }
        }
      }
    }

  }
}

- (BOOL)networkListViewControllerCurrentPowerState:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "powered");

  return v4;
}

- (void)networkListViewControllerDidAppear:(id)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      -[WFNetworkListController interface](self, "interface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentNetwork");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v8;
      v21 = 1024;
      v22 = -[WFNetworkListController isAssociating](self, "isAssociating");
      _os_log_impl(&dword_219FC8000, v6, v5, "Network list view controller did appear, current network='%@', isAssociating=%d", (uint8_t *)&v19, 0x12u);

    }
  }

  -[WFNetworkListController _refreshKnownHiddenNetworkNamesCache](self, "_refreshKnownHiddenNetworkNamesCache");
  -[WFNetworkListController _updatePowerState](self, "_updatePowerState");
  -[WFNetworkListController interface](self, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentNetwork");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_15;
  }
  v11 = (void *)v10;
  v12 = -[WFNetworkListController isAssociating](self, "isAssociating");

  if (v12)
  {
LABEL_15:
    -[WFNetworkListController _updateViewControllerScanResults](self, "_updateViewControllerScanResults");
    goto LABEL_16;
  }
  -[WFNetworkListController _updateViewControllerConnectedNetwork](self, "_updateViewControllerConnectedNetwork");
  if (-[WFNetworkListController isAirPortSettings](self, "isAirPortSettings"))
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      v19 = 67109120;
      LODWORD(v20) = 5;
      _os_log_impl(&dword_219FC8000, v13, v14, "Initial no Internet test will start after %d seconds for wifi list appearance.", (uint8_t *)&v19, 8u);
    }

    -[WFNetworkListController healthManager](self, "healthManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "runNoInternetDiagnosticsAfter:", 5);

  }
LABEL_16:
  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "processEvent:", v17);

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v18, "isNetworkRestrictionActive");

  -[WFNetworkListController setCanScanForPersonalHotspots:](self, "setCanScanForPersonalHotspots:", v17 ^ 1);
}

- (void)networkListViewControllerDidDisappear:(id)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = -[WFNetworkListController isAssociating](self, "isAssociating");
      v8 = CFSTR("NO");
      if (v7)
        v8 = CFSTR("YES");
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_219FC8000, v6, v5, "Network list view controller did disappear - associating %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
  -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
  -[WFNetworkListController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {

  }
  else
  {
    -[WFNetworkListController viewController](self, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      return;
  }
  -[WFNetworkListController scanMetricsManager](self, "scanMetricsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submit");

}

- (void)networkListViewControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v8 = -[WFNetworkListController isAssociating](self, "isAssociating");
      v9 = CFSTR("NO");
      v11 = "-[WFNetworkListController networkListViewControllerDidFinish:]";
      v10 = 136315650;
      v12 = 2112;
      v13 = v4;
      if (v8)
        v9 = CFSTR("YES");
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219FC8000, v7, v6, "%s: %@ - associating %@", (uint8_t *)&v10, 0x20u);
    }

  }
  -[WFNetworkListController _cleanUpStatesForDismissal](self, "_cleanUpStatesForDismissal");

}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4
{
  -[WFNetworkListController networkListViewController:showSettingsForNetwork:context:](self, "networkListViewController:showSettingsForNetwork:context:", a3, a4, 0);
}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5
{
  -[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:](self, "networkListViewController:showSettingsForNetwork:context:scrollToCellType:", a3, a4, a5, 0);
}

- (void)networkListViewController:(id)a3 showSettingsForNetwork:(id)a4 context:(int64_t)a5 scrollToCellType:(unint64_t)a6
{
  id v8;
  NSObject *p_super;
  os_log_type_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  os_log_type_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  WFNetworkListController *v35;
  void *v36;
  void *v37;
  void *v38;
  os_log_type_t v39;
  NSObject *v40;
  void *v41;
  os_log_type_t v42;
  NSObject *v43;
  void *v44;
  WFNetworkScanRecord *v45;
  _BOOL4 v46;
  void *v47;
  os_log_type_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  os_log_type_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  os_log_type_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  os_log_type_t v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  os_log_type_t v85;
  _BOOL4 v86;
  void *v87;
  _BOOL8 v88;
  uint64_t v89;
  WFDetailContextPrivateAddressConfig *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  WFDetailsContext *v96;
  void *v97;
  void *v98;
  void *v99;
  WFDetailsContext *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _BOOL4 v110;
  void *v112;
  os_log_type_t v113;
  NSObject *v114;
  void *v115;
  void *v116;
  os_log_type_t v117;
  NSObject *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i;
  void *v123;
  void *v124;
  os_log_type_t v125;
  NSObject *v126;
  void *v127;
  void *v128;
  int v129;
  void *v130;
  os_log_type_t v131;
  NSObject *v132;
  void *v133;
  void *v134;
  _BOOL8 v135;
  void *v136;
  void *v137;
  void *v138;
  os_log_type_t v139;
  NSObject *v140;
  void *v141;
  void *v142;
  void *v143;
  os_log_type_t v144;
  NSObject *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  char v150;
  void *v151;
  os_log_type_t v152;
  NSObject *v153;
  void *v154;
  void *v155;
  void *v156;
  BOOL v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  id *v162;
  id *v163;
  id *v164;
  id *v165;
  id *v166;
  id *v167;
  id *v168;
  id *v169;
  WFNetworkProfile *v170;
  WFDetailContextWiFiModeConfig *v171;
  WFDetailContextPrivateAddressConfig *v172;
  void *v174;
  void *v175;
  WFNetworkScanRecord *v176;
  id v177;
  WFNetworkScanRecord *v178;
  _BOOL4 v179;
  void *v181;
  id *v182;
  void *v183;
  WFNetworkListController *val;
  _QWORD v185[4];
  id *v186;
  id v187;
  id v188;
  id v189;
  id from;
  _QWORD v191[4];
  id *v192;
  id v193;
  id v194;
  _QWORD v195[4];
  id *v196;
  id v197;
  id v198;
  _QWORD v199[4];
  id *v200;
  id v201;
  id v202;
  _QWORD v203[4];
  id *v204;
  id v205;
  id v206;
  _QWORD v207[4];
  id *v208;
  id v209;
  id v210;
  _QWORD v211[4];
  id v212;
  id v213;
  _QWORD v214[4];
  id *v215;
  id v216;
  id v217[2];
  id location;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  uint8_t v223[128];
  uint8_t buf[4];
  _BYTE v225[20];
  _BYTE v226[10];
  __int16 v227;
  void *v228;
  uint64_t v229;

  v229 = *MEMORY[0x24BDAC8D0];
  v177 = a3;
  v8 = a4;
  objc_opt_class();
  v183 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      val = self;
      -[WFNetworkListController interface](self, "interface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentNetwork");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v8);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v182 = v183;
        v176 = -[WFNetworkScanRecord initWithCoreWiFiProfile:]([WFNetworkScanRecord alloc], "initWithCoreWiFiProfile:", v182);
        -[WFNetworkListController knownNetworksManager](val, "knownNetworksManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkScanRecord ssid](v176, "ssid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "privateAddressConfigForNetworkName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFNetworkScanRecord populatePrivateAddressConfig:](v176, "populatePrivateAddressConfig:", v16);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v176 = v183;
          -[WFNetworkListController gasController](val, "gasController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "resolveProfileForNetwork:handler:force:", v176, &__block_literal_global_278, 1);

          if (v13
            && (-[WFNetworkListController wifiClient](val, "wifiClient"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v18, "interface"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "associatedOnIRInterface"),
                v19,
                v18,
                v20))
          {
            WFLogForCategory(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v21)
            {
              v23 = v21;
              if (os_log_type_enabled(v23, v22))
              {
                -[WFNetworkScanRecord title](v176, "title");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
                *(_WORD *)&v225[8] = 2112;
                *(_QWORD *)&v225[10] = v24;
                _os_log_impl(&dword_219FC8000, v23, v22, "%s: Getting current network's(%@) profile from ir interface", buf, 0x16u);

              }
            }

            -[WFNetworkListController wifiClient](val, "wifiClient");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "interface");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "irInterface");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkScanRecord scanResult](v176, "scanResult");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "knownNetworkProfileMatchingScanResult:", v28);
            v182 = (id *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[WFNetworkListController wifiClient](val, "wifiClient");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "cInterface");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFNetworkScanRecord scanResult](v176, "scanResult");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "knownNetworkProfileMatchingScanResult:", v34);
            v182 = (id *)objc_claimAutoreleasedReturnValue();

          }
          v35 = val;
          if (v182)
          {
            if (!v13)
            {
LABEL_36:
              v179 = 0;
LABEL_37:
              if (v182)
              {
                v170 = -[WFNetworkProfile initWithCoreWiFiProfile:]([WFNetworkProfile alloc], "initWithCoreWiFiProfile:", v182);
              }
              else
              {
                WFLogForCategory(0);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v41)
                {
                  v43 = v41;
                  if (os_log_type_enabled(v43, v42))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context"
                                      ":scrollToCellType:]";
                    *(_WORD *)&v225[8] = 2112;
                    *(_QWORD *)&v225[10] = v176;
                    _os_log_impl(&dword_219FC8000, v43, v42, "%s: nil CWFProfile for '%@', network is not a known network", buf, 0x16u);
                  }

                }
                v170 = 0;
              }
              -[WFNetworkListController _hardwareMACAddress](val, "_hardwareMACAddress");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              if (v179)
              {
                -[WFNetworkListController interface](val, "interface");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "currentNetwork");
                v45 = (WFNetworkScanRecord *)(id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v45 = v176;
              }
              v46 = -[WFNetworkScanRecord isRandomMACAddressEnabled](v45, "isRandomMACAddressEnabled");
              WFLogForCategory(8uLL);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v47)
              {
                v49 = v47;
                if (os_log_type_enabled(v49, v48))
                {
                  -[WFNetworkScanRecord ssid](v45, "ssid");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v225 = v46;
                  *(_WORD *)&v225[4] = 2112;
                  *(_QWORD *)&v225[6] = v50;
                  _os_log_impl(&dword_219FC8000, v49, v48, "private address value=%d for '%@'", buf, 0x12u);

                }
              }

              -[WFNetworkListController randomMACManager](val, "randomMACManager");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v183, "ssid");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v51, "isSSIDinCache:", v52);

              if (v53)
              {
                -[WFNetworkListController randomMACManager](val, "randomMACManager");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "ssid");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v54, "shouldEnableRandomMACForSSID:", v55);

                WFLogForCategory(8uLL);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v57)
                {
                  v59 = v57;
                  if (os_log_type_enabled(v59, v58))
                  {
                    -[WFNetworkScanRecord ssid](v45, "ssid");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v225 = v56;
                    *(_WORD *)&v225[4] = 1024;
                    *(_DWORD *)&v225[6] = v46;
                    *(_WORD *)&v225[10] = 2112;
                    *(_QWORD *)&v225[12] = v60;
                    _os_log_impl(&dword_219FC8000, v59, v58, "overriding private address from scan cache (was=%d) value=%d for '%@'", buf, 0x18u);

                  }
                }

              }
              else
              {
                v56 = v46;
              }
              if (v179)
              {
                -[WFNetworkListController interface](val, "interface");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "currentNetwork");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "isRandomMACAddressEnabled");

                WFLogForCategory(8uLL);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v64)
                {
                  v66 = v64;
                  if (os_log_type_enabled(v66, v65))
                  {
                    -[WFNetworkScanRecord ssid](v45, "ssid");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v225 = v63;
                    *(_WORD *)&v225[4] = 1024;
                    *(_DWORD *)&v225[6] = v56;
                    *(_WORD *)&v225[10] = 2112;
                    *(_QWORD *)&v225[12] = v67;
                    _os_log_impl(&dword_219FC8000, v66, v65, "overriding private address for current network (was=%d) value=%d for '%@'", buf, 0x18u);

                  }
                }

              }
              -[WFNetworkScanRecord matchingKnownNetworkProfile](v45, "matchingKnownNetworkProfile");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "NANServiceID");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              -[WFNetworkScanRecord randomMACAddress](v45, "randomMACAddress");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend(v175, "isEqualToString:", v70);

              if (-[WFNetworkScanRecord isSupervised](v45, "isSupervised"))
                goto LABEL_80;
              -[WFNetworkScanRecord randomMACAddress](v45, "randomMACAddress");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
              {
                -[WFNetworkScanRecord randomMACAddress](v45, "randomMACAddress");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend(v175, "isEqualToString:", v73);

              }
              else
              {
                v74 = 1;
              }

              if ((v74 & (v69 == 0)) != 1)
              {
LABEL_80:
                WFLogForCategory(8uLL);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = OSLogForWFLogLevel(1uLL);
                if (!WFCurrentLogLevel() || !v81)
                {
                  v178 = v45;
                  goto LABEL_87;
                }
                v82 = v81;
                if (os_log_type_enabled(v82, v85))
                {
                  v86 = -[WFNetworkScanRecord isSupervised](v45, "isSupervised");
                  -[WFNetworkScanRecord randomMACAddress](v45, "randomMACAddress");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136316162;
                  *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:s"
                                    "crollToCellType:]";
                  *(_WORD *)&v225[8] = 1024;
                  *(_DWORD *)&v225[10] = v69 == 0;
                  *(_WORD *)&v225[14] = 1024;
                  *(_DWORD *)&v225[16] = v86;
                  *(_WORD *)v226 = 2112;
                  *(_QWORD *)&v226[2] = v87;
                  v227 = 2112;
                  v228 = v175;
                  _os_log_impl(&dword_219FC8000, v82, v85, "%s: privateAddressSupported: %d, networkissupervised: %d, network random address from scan: %@, hardwareMac: %@", buf, 0x2Cu);

                }
                v81 = v82;
                v178 = v45;
              }
              else
              {
                WFLogForCategory(8uLL);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v75)
                {
                  v77 = v75;
                  if (os_log_type_enabled(v77, v76))
                  {
                    -[WFNetworkScanRecord ssid](v45, "ssid");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFNetworkScanRecord randomMACAddress](v45, "randomMACAddress");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)v225 = v78;
                    *(_WORD *)&v225[8] = 2112;
                    *(_QWORD *)&v225[10] = v79;
                    *(_WORD *)&v225[18] = 1024;
                    *(_DWORD *)v226 = v71;
                    _os_log_impl(&dword_219FC8000, v77, v76, "generating private address for '%@' (currentAddress=%@, usingHWAddress=%d)", buf, 0x1Cu);

                  }
                }

                -[WFNetworkListController randomMACManager](val, "randomMACManager");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v178 = (WFNetworkScanRecord *)objc_msgSend(v80, "newScanRecordWithRandomMACFromScanRecord:", v45);

                if (val->_isRandomMACManageFeatureEnabled)
                {
LABEL_88:
                  v88 = v69 == 0;
                  v89 = -[WFNetworkScanRecord privateAddressMode](v176, "privateAddressMode");
                  v90 = [WFDetailContextPrivateAddressConfig alloc];
                  -[WFNetworkScanRecord randomMACAddress](v178, "randomMACAddress");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v172 = -[WFDetailContextPrivateAddressConfig initWithRandomMACAddress:hardwareMACAddress:privateAddressMode:connectedWithHardwareAddress:privateAddressSupported:](v90, "initWithRandomMACAddress:hardwareMACAddress:privateAddressMode:connectedWithHardwareAddress:privateAddressSupported:", v91, v175, v89, v71, v88);

                  -[WFNetworkListController interface](val, "interface");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "cInterface");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = objc_msgSend(v93, "deviceSupports6E");

                  if (v182)
                    v95 = objc_msgSend(v182, "wifiModeConfigurable") & v94;
                  else
                    v95 = 0;
                  v171 = -[WFDetailContextWiFiModeConfig initWithConfigurable:wifiMode:]([WFDetailContextWiFiModeConfig alloc], "initWithConfigurable:wifiMode:", v95, objc_msgSend(v182, "disable6EMode"));
                  v96 = [WFDetailsContext alloc];
                  -[WFNetworkListController interface](val, "interface");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "ipMonitor");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFNetworkListController interface](val, "interface");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = -[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:](v96, "initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:", v178, v182, v98, v99, v172, v171);

                  -[WFDetailsContext setEntryContext:](v100, "setEntryContext:", a5);
                  -[WFDetailsContext setJoinable:](v100, "setJoinable:", a5 != 2);
                  -[WFNetworkListController wifiClient](val, "wifiClient");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFDetailsContext setDiagnosable:](v100, "setDiagnosable:", objc_msgSend(v101, "isDiagnosticsEnabled"));

                  if (v179)
                  {
                    -[WFNetworkListController _sortedHealthRecommendations](val, "_sortedHealthRecommendations");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "displayableHealthRecommendations");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFDetailsContext setRecommendations:](v100, "setRecommendations:", v103);

                    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFNetworkListController healthRecommendations](val, "healthRecommendations");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFNetworkScanRecord ssid](v178, "ssid");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    +[WFHealthUIEvent detailEventWithIssues:ssid:securityType:](WFHealthUIEvent, "detailEventWithIssues:ssid:securityType:", v105, v106, -[WFNetworkScanRecord securityMode](v178, "securityMode"));
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "processEvent:", v107);

                  }
                  objc_msgSend(MEMORY[0x24BEC2990], "privateAddressDisabledBySystemIssue");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "issueRecommendation");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFDetailsContext setStaticPrivateMACFooterText:](v100, "setStaticPrivateMACFooterText:", v109);

                  -[WFDetailsContext setCurrent:](v100, "setCurrent:", v179);
                  objc_msgSend(v182, "accessoryIdentifier");
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  if (_os_feature_enabled_impl())
                  {
                    v110 = -[WFNetworkListController isAirPortSettings](val, "isAirPortSettings");
                    if (v181 && v110)
                    {
                      WFLogForCategory(0);
                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                      v113 = OSLogForWFLogLevel(1uLL);
                      if (WFCurrentLogLevel() && v112)
                      {
                        v114 = v112;
                        if (os_log_type_enabled(v114, v113))
                        {
                          *(_DWORD *)buf = 136315394;
                          *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:c"
                                            "ontext:scrollToCellType:]";
                          *(_WORD *)&v225[8] = 2114;
                          *(_QWORD *)&v225[10] = v181;
                          _os_log_impl(&dword_219FC8000, v114, v113, "%s: looking up device for accessory identifier = '%{public}@'", buf, 0x16u);
                        }

                      }
                      v169 = (id *)objc_alloc_init(MEMORY[0x24BE2BEF8]);
                      objc_msgSend(MEMORY[0x24BE2BEF8], "getDevicesWithFlags:session:error:", 8, v169, 0);
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      WFLogForCategory(0);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = OSLogForWFLogLevel(4uLL);
                      if ((unint64_t)WFCurrentLogLevel() >= 4 && v116)
                      {
                        v118 = v116;
                        if (os_log_type_enabled(v118, v117))
                        {
                          *(_DWORD *)buf = 136315394;
                          *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:c"
                                            "ontext:scrollToCellType:]";
                          *(_WORD *)&v225[8] = 2112;
                          *(_QWORD *)&v225[10] = v115;
                          _os_log_impl(&dword_219FC8000, v118, v117, "%s: devices found = '%@'", buf, 0x16u);
                        }

                      }
                      v221 = 0u;
                      v222 = 0u;
                      v219 = 0u;
                      v220 = 0u;
                      v119 = v115;
                      v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v219, v223, 16);
                      if (v120)
                      {
                        v121 = *(_QWORD *)v220;
                        while (2)
                        {
                          for (i = 0; i != v120; ++i)
                          {
                            if (*(_QWORD *)v220 != v121)
                              objc_enumerationMutation(v119);
                            v123 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * i);
                            WFLogForCategory(0);
                            v124 = (void *)objc_claimAutoreleasedReturnValue();
                            v125 = OSLogForWFLogLevel(4uLL);
                            if ((unint64_t)WFCurrentLogLevel() >= 4 && v124)
                            {
                              v126 = v124;
                              if (os_log_type_enabled(v126, v125))
                              {
                                objc_msgSend(v123, "SSID");
                                v127 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 136315650;
                                *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNet"
                                                  "work:context:scrollToCellType:]";
                                *(_WORD *)&v225[8] = 2112;
                                *(_QWORD *)&v225[10] = v123;
                                *(_WORD *)&v225[18] = 2112;
                                *(_QWORD *)v226 = v127;
                                _os_log_impl(&dword_219FC8000, v126, v125, "%s: device='%@' SSID='%@'", buf, 0x20u);

                              }
                            }

                            objc_msgSend(v123, "identifier");
                            v128 = (void *)objc_claimAutoreleasedReturnValue();
                            v129 = objc_msgSend(v128, "isEqualToString:", v181);

                            if (v129)
                            {
                              WFLogForCategory(0);
                              v130 = (void *)objc_claimAutoreleasedReturnValue();
                              v131 = OSLogForWFLogLevel(4uLL);
                              if ((unint64_t)WFCurrentLogLevel() >= 4 && v130)
                              {
                                v132 = v130;
                                if (os_log_type_enabled(v132, v131))
                                {
                                  *(_DWORD *)buf = 136315394;
                                  *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForN"
                                                    "etwork:context:scrollToCellType:]";
                                  *(_WORD *)&v225[8] = 2112;
                                  *(_QWORD *)&v225[10] = v123;
                                  _os_log_impl(&dword_219FC8000, v132, v131, "%s: device found = '%@', setting device to detail context", buf, 0x16u);
                                }

                              }
                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                -[WFDetailsContext setDaDevice:](v100, "setDaDevice:", v123);
                              goto LABEL_129;
                            }
                          }
                          v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v219, v223, 16);
                          if (v120)
                            continue;
                          break;
                        }
                      }
LABEL_129:

                    }
                  }
                  -[WFNetworkListController viewController](val, "viewController");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  -[WFDetailsContext setSupportsAirportManagement:](v100, "setSupportsAirportManagement:", (objc_opt_isKindOfClass() & 1) == 0);

                  -[WFDetailsContext setPrivacyProxyTierStatus:](v100, "setPrivacyProxyTierStatus:", -[WFNetworkListController privacyProxyFeatureTier](val, "privacyProxyFeatureTier"));
                  -[WFNetworkListController wifiClient](val, "wifiClient");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  v135 = objc_msgSend(v134, "cellularOutrankState") != 0;
                  -[WFNetworkListController wifiClient](val, "wifiClient");
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFDetailsContext setWiFiOutranked:privateCellular:](v100, "setWiFiOutranked:privateCellular:", v135, objc_msgSend(v136, "cellularOutrankState") == 5);

                  -[WFNetworkListController wifiClient](val, "wifiClient");
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFDetailsContext setWiFiOutrankedDev:](v100, "setWiFiOutrankedDev:", objc_msgSend(v137, "cellularOutrankState") == 4);

                  -[WFDetailsContext setCredentialsVisible:](v100, "setCredentialsVisible:", a5 == 2);
                  if (-[WFDetailsContext shouldHideCredentials](v100, "shouldHideCredentials"))
                  {
                    WFLogForCategory(0);
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    v139 = OSLogForWFLogLevel(1uLL);
                    if (!WFCurrentLogLevel() || !v138)
                    {
LABEL_138:

                      -[WFDetailsContext setScrollToCellType:](v100, "setScrollToCellType:", a6);
                      WFLogForCategory(0);
                      v143 = (void *)objc_claimAutoreleasedReturnValue();
                      v144 = OSLogForWFLogLevel(1uLL);
                      if (WFCurrentLogLevel() && v143)
                      {
                        v145 = v143;
                        if (os_log_type_enabled(v145, v144))
                        {
                          -[WFDetailsContext network](v100, "network");
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          v147 = objc_msgSend(v146, "signalBars");
                          *(_DWORD *)buf = 136315650;
                          *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:c"
                                            "ontext:scrollToCellType:]";
                          *(_WORD *)&v225[8] = 2112;
                          *(_QWORD *)&v225[10] = v100;
                          *(_WORD *)&v225[18] = 2048;
                          *(_QWORD *)v226 = v147;
                          _os_log_impl(&dword_219FC8000, v145, v144, "%s: details context='%@' signalBars=%lu", buf, 0x20u);

                        }
                      }

                      -[WFNetworkListController viewProvider](val, "viewProvider");
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v148, "networkDetailsViewControllerWithContext:", v100);
                      v174 = (void *)objc_claimAutoreleasedReturnValue();

                      -[WFNetworkListController viewProvider](val, "viewProvider");
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      v150 = objc_opt_respondsToSelector();

                      if ((v150 & 1) != 0)
                      {
                        WFLogForCategory(0);
                        v151 = (void *)objc_claimAutoreleasedReturnValue();
                        v152 = OSLogForWFLogLevel(1uLL);
                        if (WFCurrentLogLevel() && v151)
                        {
                          v153 = v151;
                          if (os_log_type_enabled(v153, v152))
                          {
                            *(_DWORD *)buf = 138412546;
                            *(_QWORD *)v225 = v174;
                            *(_WORD *)&v225[8] = 2112;
                            *(_QWORD *)&v225[10] = v100;
                            _os_log_impl(&dword_219FC8000, v153, v152, "viewProvider will handle presentation of %@ (context %@)", buf, 0x16u);
                          }

                        }
                        -[WFNetworkListController viewProvider](val, "viewProvider");
                        v154 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v154, "presentNetworkViewController:forContext:", v174, v100);
                      }
                      else
                      {
                        -[WFNetworkListController viewController](val, "viewController");
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v155, "navigationController");
                        v156 = (void *)objc_claimAutoreleasedReturnValue();
                        v157 = v156 == 0;

                        if (v157)
                        {
LABEL_153:
                          -[WFDetailsContext setProvider:](v100, "setProvider:", v174);
                          +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
                          v159 = (void *)objc_claimAutoreleasedReturnValue();
                          +[WFUserEvent eventWithType:state:](WFUserEvent, "eventWithType:state:", 3, v179);
                          v160 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "processEvent:", v160);

                          objc_initWeak((id *)buf, v100);
                          objc_initWeak(&location, val);
                          v161 = MEMORY[0x24BDAC760];
                          v214[0] = MEMORY[0x24BDAC760];
                          v214[1] = 3221225472;
                          v214[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_287;
                          v214[3] = &unk_24DC35080;
                          objc_copyWeak(&v216, &location);
                          objc_copyWeak(v217, (id *)buf);
                          v162 = v182;
                          v215 = v162;
                          v217[1] = (id)a5;
                          -[WFDetailsContext setActionHandler:](v100, "setActionHandler:", v214);
                          v211[0] = v161;
                          v211[1] = 3221225472;
                          v211[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_339;
                          v211[3] = &unk_24DC34FC0;
                          objc_copyWeak(&v212, (id *)buf);
                          objc_copyWeak(&v213, &location);
                          -[WFDetailsContext setPrivateMACHandler:](v100, "setPrivateMACHandler:", v211);
                          v207[0] = v161;
                          v207[1] = 3221225472;
                          v207[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_340;
                          v207[3] = &unk_24DC350A8;
                          objc_copyWeak(&v209, (id *)buf);
                          v163 = v162;
                          v208 = v163;
                          objc_copyWeak(&v210, &location);
                          -[WFDetailsContext setAutoJoinHandler:](v100, "setAutoJoinHandler:", v207);
                          v203[0] = v161;
                          v203[1] = 3221225472;
                          v203[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_341;
                          v203[3] = &unk_24DC350A8;
                          objc_copyWeak(&v205, (id *)buf);
                          v164 = v163;
                          v204 = v164;
                          objc_copyWeak(&v206, &location);
                          -[WFDetailsContext setAutoLoginHandler:](v100, "setAutoLoginHandler:", v203);
                          v199[0] = v161;
                          v199[1] = 3221225472;
                          v199[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_342;
                          v199[3] = &unk_24DC350A8;
                          objc_copyWeak(&v201, (id *)buf);
                          v165 = v164;
                          v200 = v165;
                          objc_copyWeak(&v202, &location);
                          -[WFDetailsContext setLowDataModeHandler:](v100, "setLowDataModeHandler:", v199);
                          v195[0] = v161;
                          v195[1] = 3221225472;
                          v195[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_343;
                          v195[3] = &unk_24DC350A8;
                          objc_copyWeak(&v197, (id *)buf);
                          v166 = v165;
                          v196 = v166;
                          objc_copyWeak(&v198, &location);
                          -[WFDetailsContext setPrivacyProxyHandler:](v100, "setPrivacyProxyHandler:", v195);
                          v191[0] = v161;
                          v191[1] = 3221225472;
                          v191[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_347;
                          v191[3] = &unk_24DC350F8;
                          objc_copyWeak(&v193, (id *)buf);
                          v167 = v166;
                          v192 = v167;
                          objc_copyWeak(&v194, &location);
                          -[WFDetailsContext setNetworkQualityHandler:](v100, "setNetworkQualityHandler:", v191);
                          objc_initWeak(&from, v100);
                          v185[0] = v161;
                          v185[1] = 3221225472;
                          v185[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_349;
                          v185[3] = &unk_24DC35120;
                          v168 = v167;
                          v186 = v168;
                          objc_copyWeak(&v188, &from);
                          objc_copyWeak(&v189, &location);
                          v187 = v183;
                          -[WFDetailsContext setWiFiModeChangedHandler:](v100, "setWiFiModeChangedHandler:", v185);
                          -[WFNetworkListController setDetailsContext:](val, "setDetailsContext:", v100);
                          -[WFNetworkListController setVisibleContext:](val, "setVisibleContext:", v100);

                          objc_destroyWeak(&v189);
                          objc_destroyWeak(&v188);

                          objc_destroyWeak(&from);
                          objc_destroyWeak(&v194);

                          objc_destroyWeak(&v193);
                          objc_destroyWeak(&v198);

                          objc_destroyWeak(&v197);
                          objc_destroyWeak(&v202);

                          objc_destroyWeak(&v201);
                          objc_destroyWeak(&v206);

                          objc_destroyWeak(&v205);
                          objc_destroyWeak(&v210);

                          objc_destroyWeak(&v209);
                          objc_destroyWeak(&v213);
                          objc_destroyWeak(&v212);

                          objc_destroyWeak(v217);
                          objc_destroyWeak(&v216);
                          objc_destroyWeak(&location);
                          objc_destroyWeak((id *)buf);

                          p_super = &v176->super;
                          goto LABEL_154;
                        }
                        -[WFNetworkListController viewController](val, "viewController");
                        v154 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v154, "navigationController");
                        v158 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v158, "pushViewController:animated:", v174, 1);

                      }
                      goto LABEL_153;
                    }
                    v140 = v138;
                    if (os_log_type_enabled(v140, v139))
                    {
                      -[WFNetworkScanRecord ssid](v178, "ssid");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:conte"
                                        "xt:scrollToCellType:]";
                      *(_WORD *)&v225[8] = 2112;
                      *(_QWORD *)&v225[10] = v141;
                      _os_log_impl(&dword_219FC8000, v140, v139, "%s: Not setting credentials for network: %@ to keep it hidden", buf, 0x16u);

                    }
                    v138 = v140;
                  }
                  else
                  {
                    -[WFNetworkProfile username](v170, "username");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFDetailsContext setUsername:](v100, "setUsername:", v142);

                    -[WFNetworkScanRecord ssid](v178, "ssid");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFNetworkListController passwordToDisplayForSSID:](val, "passwordToDisplayForSSID:", v138);
                    v140 = objc_claimAutoreleasedReturnValue();
                    -[WFDetailsContext setPassword:](v100, "setPassword:", v140);
                  }

                  goto LABEL_138;
                }
                -[WFNetworkListController wifiClient](val, "wifiClient");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFNetworkScanRecord ssid](v178, "ssid");
                v82 = objc_claimAutoreleasedReturnValue();
                v83 = -[WFNetworkScanRecord isRandomMACAddressEnabled](v178, "isRandomMACAddressEnabled");
                -[WFNetworkScanRecord randomMACAddress](v178, "randomMACAddress");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "setEnableRandomMACForNetwork:enable:randomMAC:", v82, v83, v84);

              }
LABEL_87:

              goto LABEL_88;
            }
LABEL_28:
            -[WFNetworkListController interface](v35, "interface");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "currentNetwork");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v179 = objc_msgSend(v37, "carPlayType") != 1;

            goto LABEL_37;
          }
          WFLogForCategory(0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v38)
          {
            v40 = v38;
            if (os_log_type_enabled(v40, v39))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v40, v39, "cwProfile not found in known networks list", buf, 2u);
            }

          }
          -[WFNetworkScanRecord matchingKnownNetworkProfile](v176, "matchingKnownNetworkProfile");
          v182 = (id *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          WFLogForCategory(0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v29)
          {
            v31 = v29;
            if (os_log_type_enabled(v31, v30))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
              *(_WORD *)&v225[8] = 2112;
              *(_QWORD *)&v225[10] = 0;
              _os_log_impl(&dword_219FC8000, v31, v30, "%s: unknown class type for network='%@'", buf, 0x16u);
            }

          }
          v182 = 0;
          v176 = 0;
        }
      }
      v35 = val;
      if (!v13)
        goto LABEL_36;
      goto LABEL_28;
    }
  }
  WFLogForCategory(0);
  p_super = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v10))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v225 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]";
    *(_WORD *)&v225[8] = 2112;
    *(_QWORD *)&v225[10] = v183;
    _os_log_impl(&dword_219FC8000, p_super, v10, "%s: not showing settings for in progress hotspot join %@", buf, 0x16u);
  }
LABEL_154:

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  WFLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_287(uint64_t a1, NSObject *a2)
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  os_log_type_t v43;
  id *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  os_log_type_t v63;
  id v64;
  void *v65;
  char *v66;
  id v67;
  void *v68;
  char isKindOfClass;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  BOOL v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  NSObject *v96;
  os_log_type_t v97;
  id v98;
  void *v99;
  NSObject *v100;
  os_log_type_t v101;
  id v102;
  int v103;
  NSObject *v104;
  os_log_type_t v105;
  void *v106;
  id v107;
  void *v108;
  int v109;
  NSObject *v110;
  os_log_type_t v111;
  id v112;
  void *v113;
  int v114;
  int v115;
  _QWORD block[4];
  id v117;
  NSObject *v118;
  id v119;
  id to;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  NSObject *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  objc_copyWeak(&to, (id *)(a1 + 40));
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    v123 = 2048;
    v124 = a2;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: performing details action=%lu", buf, 0x16u);
  }

  switch((unint64_t)a2)
  {
    case 0uLL:
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processEvent:", v7);

      v8 = objc_loadWeakRetained(&to);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v8, "_dismissDetailsViewControllerWithContext:", WeakRetained);

      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v10, "network");
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = objc_loadWeakRetained(&to);
      objc_msgSend(v12, "interface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentNetwork");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject isEqual:](v11, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        v115 = 1;
LABEL_44:
        v86 = -[NSObject carPlayType](v11, "carPlayType");
        v87 = v86 == 2;
        if (v86 != 2 && ((v115 ^ 1) & 1) == 0)
        {
          v88 = objc_loadWeakRetained(&to);
          objc_msgSend(v88, "interface");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "currentNetwork");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v90, "carPlayType") == 2;

        }
        v91 = objc_loadWeakRetained(&to);
        objc_msgSend(v91, "networks");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)objc_msgSend(v92, "mutableCopy");

        objc_msgSend(v93, "removeObject:", v11);
        -[NSObject setKnown:](v11, "setKnown:", 0);
        v94 = objc_loadWeakRetained(&to);
        objc_msgSend(v94, "setNetworks:", v93);

        dispatch_get_global_queue(21, 0);
        v95 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_289;
        block[3] = &unk_24DC35058;
        objc_copyWeak(&v119, &to);
        v117 = *(id *)(a1 + 32);
        v18 = v11;
        v118 = v18;
        dispatch_async(v95, block);

        if (v115)
        {
          if (v87)
          {
            WFLogForCategory(0);
            v96 = objc_claimAutoreleasedReturnValue();
            v97 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v96 && os_log_type_enabled(v96, v97))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v96, v97, "Network is CarPlayUserConfigured- not disassociating, changing current network type == CarPlayOnly", buf, 2u);
            }

            v98 = objc_loadWeakRetained(&to);
            objc_msgSend(v98, "interface");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "disassociateFromCarPlayUserConfiguredNetwork");
          }
          else
          {
            v98 = objc_loadWeakRetained(&to);
            objc_msgSend(v98, "interface");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "disassociateFromCurrentNetwork");
          }
        }
        else
        {
          if (!v18)
            goto LABEL_62;
          WFLogForCategory(0);
          v100 = objc_claimAutoreleasedReturnValue();
          v101 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v100 && os_log_type_enabled(v100, v101))
          {
            *(_DWORD *)buf = 136315394;
            v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
            v123 = 2112;
            v124 = v18;
            _os_log_impl(&dword_219FC8000, v100, v101, "%s: updating view for %@", buf, 0x16u);
          }

          -[NSObject setHotspot20Name:](v18, "setHotspot20Name:", 0);
          -[NSObject setHotspotPluginLabel:](v18, "setHotspotPluginLabel:", 0);
          v98 = objc_loadWeakRetained(&to);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "_updateViewsForNetworks:", v99);
        }

LABEL_62:
        v102 = objc_loadWeakRetained(&to);
        if (objc_msgSend(v102, "isHS20Supported"))
        {
          v103 = -[NSObject isHotspot20](v18, "isHotspot20");

          if (!v103)
            goto LABEL_70;
          WFLogForCategory(0);
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v104 && os_log_type_enabled(v104, v105))
          {
            *(_DWORD *)buf = 136315138;
            v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
            _os_log_impl(&dword_219FC8000, v104, v105, "%s: network is hotspot 20", buf, 0xCu);
          }

          v102 = objc_loadWeakRetained(&to);
          objc_msgSend(v102, "gasController");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "removeProfileForNetwork:", v18);

        }
LABEL_70:
        if (*(_QWORD *)(a1 + 56) == 2)
        {
          v107 = objc_loadWeakRetained(&to);
          objc_msgSend(v107, "viewController");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "conformsToProtocol:", &unk_2550F2360);

          if (v109)
          {
            WFLogForCategory(0);
            v110 = objc_claimAutoreleasedReturnValue();
            v111 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v110 && os_log_type_enabled(v110, v111))
            {
              *(_DWORD *)buf = 136315138;
              v122 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
              _os_log_impl(&dword_219FC8000, v110, v111, "%s: refreshing view controller after forget network", buf, 0xCu);
            }

            v112 = objc_loadWeakRetained(&to);
            objc_msgSend(v112, "viewController");
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v113, "refreshKnownNetworksUpdateTableView:", 1);
          }
        }

        objc_destroyWeak(&v119);
        goto LABEL_78;
      }
      -[NSObject ssid](v11, "ssid");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_loadWeakRetained(&to);
      -[NSObject interface](v56, "interface");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "currentNetwork");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ssid");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v55, "isEqualToString:", v59);
      if (v115)
      {
        v60 = objc_loadWeakRetained(&to);
        objc_msgSend(v60, "interface");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "currentNetwork");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = -[NSObject isNetworkSecurityModeMatch:](v11, "isNetworkSecurityModeMatch:", objc_msgSend(v62, "securityModeExt"));

        if (!v114)
        {
          v115 = 0;
          goto LABEL_44;
        }
        WFLogForCategory(0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v55)
          goto LABEL_42;
        v56 = v55;
        if (os_log_type_enabled(v56, v63))
        {
          v64 = objc_loadWeakRetained(&to);
          objc_msgSend(v64, "interface");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "currentNetwork");
          v66 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v122 = v66;
          v123 = 2112;
          v124 = v11;
          _os_log_impl(&dword_219FC8000, v56, v63, "current network %@ isNotEqual to network to be forgotten %@, but ssid + security type match", buf, 0x16u);

        }
        v55 = v56;
      }
      else
      {

      }
LABEL_42:

      goto LABEL_44;
    case 1uLL:
      v16 = (id *)(a1 + 48);
      v17 = objc_loadWeakRetained(v16);
      objc_msgSend(v17, "network");
      v18 = objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        v122 = (const char *)v18;
        _os_log_impl(&dword_219FC8000, v19, v20, "Launching AirPort Utility for network %@", buf, 0xCu);
      }

      if (v18)
      {
        +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "processEvent:", v22);

        v23 = (void *)MEMORY[0x24BE03950];
        -[NSObject ssid](v18, "ssid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bssid](v18, "bssid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_loadWeakRetained(&to);
        objc_msgSend(v26, "viewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "launchAUForNetwork:withMacAddress:getAUFromAppStore:viewController:", v24, v25, 1, v27);

      }
      v28 = objc_loadWeakRetained(&to);
      v29 = objc_loadWeakRetained(v16);
      objc_msgSend(v28, "_dismissDetailsViewControllerWithContext:", v29);

      goto LABEL_78;
    case 2uLL:
      v30 = objc_loadWeakRetained(&to);
      v31 = (id *)(a1 + 48);
      v32 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v30, "_dismissDetailsViewControllerWithContext:", v32);

      v33 = objc_loadWeakRetained(v31);
      objc_msgSend(v33, "network");
      v18 = objc_claimAutoreleasedReturnValue();

      v34 = objc_loadWeakRetained(&to);
      objc_msgSend(v34, "_associateToScanRecord:", v18);

      v35 = objc_loadWeakRetained(&to);
      objc_msgSend(v35, "associationContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setOriginator:", 2);

      goto LABEL_78;
    case 3uLL:
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 6);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "processEvent:", v38);

      v39 = objc_loadWeakRetained(&to);
      objc_msgSend(v39, "interface");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "ipMonitor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "renewLease");

      if ((v42 & 1) != 0)
        goto LABEL_79;
      WFLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v43 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v43))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v18, v43, "Renew lease failed", buf, 2u);
      }
LABEL_78:

LABEL_79:
      objc_destroyWeak(&to);
      return;
    case 4uLL:
      v44 = (id *)(a1 + 48);
      v45 = objc_loadWeakRetained(v44);
      objc_msgSend(v45, "recommendations");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v47 = (void *)MEMORY[0x24BDBCF20];
        v48 = objc_loadWeakRetained(v44);
        objc_msgSend(v48, "recommendations");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setWithArray:", v49);
        v18 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

      v67 = objc_loadWeakRetained(v44);
      objc_msgSend(v67, "network");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v70 = objc_loadWeakRetained(v44);
        objc_msgSend(v70, "network");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "securityMode");

      }
      else
      {
        v72 = 0;
      }
      +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_loadWeakRetained(v44);
      objc_msgSend(v74, "network");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "ssid");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFHealthUIEvent tapLinkEventWithIssues:ssid:securityType:](WFHealthUIEvent, "tapLinkEventWithIssues:ssid:securityType:", v18, v76, v72);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "processEvent:", v77);

      v78 = (void *)MEMORY[0x24BDD1488];
      v79 = objc_loadWeakRetained(&to);
      objc_msgSend(v78, "bundleForClass:", objc_opt_class());
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsRecommendationLinkURL"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "openURL:options:completionHandler:", v83, MEMORY[0x24BDBD1B8], 0);

      }
      v84 = objc_loadWeakRetained(&to);
      v85 = objc_loadWeakRetained(v44);
      objc_msgSend(v84, "_dismissDetailsViewControllerWithContext:", v85);

      goto LABEL_78;
    case 5uLL:
      v50 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v50, "network");
      v18 = objc_claimAutoreleasedReturnValue();

      v51 = objc_loadWeakRetained(&to);
      objc_msgSend(v51, "_associateToScanRecord:", v18);

      goto LABEL_78;
    case 6uLL:
      v52 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v52, "portalURL");
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "openURL:options:completionHandler:", v54, MEMORY[0x24BDBD1B8], 0);

      }
      goto LABEL_78;
    default:
      goto LABEL_79;
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_289(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "wifiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v6 = objc_msgSend(v4, "removeKnownNetworkProfile:reason:error:", v5, 2, &v18);
  v7 = v18;

  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if ((v6 & 1) != 0)
  {
    if (v11 && os_log_type_enabled(v8, v9))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      v13 = "Removed network='%@'";
      v14 = v8;
      v15 = v9;
      v16 = 12;
LABEL_14:
      _os_log_impl(&dword_219FC8000, v14, v15, v13, buf, v16);
    }
  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v7;
    v13 = "Failed to remove network='%@' error='%@'";
    v14 = v8;
    v15 = v9;
    v16 = 22;
    goto LABEL_14;
  }

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_339(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[8];
  id to;

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "privateAddressMode");

  if (v6 != a2)
  {
    objc_copyWeak(&to, (id *)(a1 + 40));
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "network");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "randomMACAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "randomMACAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = objc_loadWeakRetained(v4);
      objc_msgSend(v11, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "randomMACAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v6 == 1)
    {
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v13, v14, "Generating new private mac when switched out of off mode", buf, 2u);
      }

      v15 = objc_loadWeakRetained(&to);
      objc_msgSend(v15, "wifiClient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ssid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "newRandomMACAddressForSSID:", v17);

      v10 = (void *)v18;
    }
    v19 = objc_loadWeakRetained(&to);
    objc_msgSend(v19, "wifiClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ssid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRandomAddressModeForNetwork:mode:randomMAC:", v21, a2, v10);

    v22 = objc_loadWeakRetained(v4);
    LODWORD(v19) = objc_msgSend(v22, "isCurrent");

    if ((_DWORD)v19)
    {
      if (a2 == 3 && v6 == 2 || a2 == 2 && v6 == 3)
      {
        WFLogForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_219FC8000, v23, v24, "Do not disassociate for current network when transit between static and rotating", v29, 2u);
        }
      }
      else
      {
        WFLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_219FC8000, v25, v26, "Disassociate for current network when private addres mode changes", v28, 2u);
        }

        v23 = objc_loadWeakRetained(&to);
        -[NSObject interface](v23, "interface");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "disassociateFromCurrentNetwork");

      }
    }

    objc_destroyWeak(&to);
  }
}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_340(id *a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  os_log_type_t v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  char *v18;
  os_log_type_t v19;
  NSObject *v20;
  char *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "network");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = a1[4];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setAutoJoinDisabled:", a2 ^ 1u);
    v8 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v8, "wifiClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v11 = objc_msgSend(v10, "updateKnownNetworkProfile:properties:error:", v7, 0, &v22);
    v12 = v22;

    WFLogForCategory(0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v15 = v13 == 0;
    else
      v15 = 1;
    v16 = !v15;
    if ((v11 & 1) != 0)
    {
      if (v16)
      {
        v17 = v13;
        if (os_log_type_enabled(v17, v14))
        {
          -[NSObject ssid](v5, "ssid");
          v18 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v18;
          v25 = 1024;
          LODWORD(v26) = a2;
          _os_log_impl(&dword_219FC8000, v17, v14, "Auto join changed for '%@' set to '%d'", buf, 0x12u);

        }
LABEL_19:

      }
    }
    else if (v16)
    {
      v20 = v13;
      if (os_log_type_enabled(v20, v14))
      {
        -[NSObject ssid](v5, "ssid");
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_219FC8000, v20, v14, "failed saving auto join state for '%@' error='%@'", buf, 0x16u);

      }
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v19))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_219FC8000, v12, v19, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_21:

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_341(id *a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  os_log_type_t v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  os_log_type_t v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  _BYTE v28[24];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = a1[4];
  if (v6)
  {
    if (a2)
      v7 = MEMORY[0x24BDBD1C0];
    else
      v7 = MEMORY[0x24BDBD1C8];
    v29 = *MEMORY[0x24BE67D38];
    v30[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCaptiveProfile:", v8);
    v9 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v9, "wifiClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v12 = objc_msgSend(v11, "updateKnownNetworkProfile:properties:error:", v6, 0, &v26);
    v13 = v26;

    WFLogForCategory(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v16 = v14 == 0;
    else
      v16 = 1;
    v17 = !v16;
    if ((v12 & 1) != 0)
    {
      if (v17)
      {
        v18 = v14;
        if (os_log_type_enabled(v18, v15))
        {
          objc_msgSend(v5, "ssid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v28 = a2;
          *(_WORD *)&v28[4] = 2112;
          *(_QWORD *)&v28[6] = v19;
          v20 = "Set auto login='%d' for '%@'";
          v21 = v18;
          v22 = v15;
          v23 = 18;
LABEL_22:
          _os_log_impl(&dword_219FC8000, v21, v22, v20, buf, v23);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v17)
    {
      v25 = v14;
      if (os_log_type_enabled(v25, v15))
      {
        objc_msgSend(v5, "ssid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = a2;
        *(_WORD *)&v28[4] = 2112;
        *(_QWORD *)&v28[6] = v19;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = v13;
        v20 = "failed setting auto login='%d' for '%@' error='%@'";
        v21 = v25;
        v22 = v15;
        v23 = 28;
        goto LABEL_22;
      }
LABEL_23:

    }
    goto LABEL_25;
  }
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v24))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v28 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    *(_WORD *)&v28[8] = 2112;
    *(_QWORD *)&v28[10] = v5;
    _os_log_impl(&dword_219FC8000, v8, v24, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_25:

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_342(id *a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  os_log_type_t v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  char *v19;
  os_log_type_t v20;
  NSObject *v21;
  char *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "network");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = a1[4];
  v7 = v6;
  if (v6)
  {
    if (a2)
      v8 = 1;
    else
      v8 = 2;
    objc_msgSend(v6, "setLowDataMode:", v8);
    v9 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v9, "wifiClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v12 = objc_msgSend(v11, "updateKnownNetworkProfile:properties:error:", v7, 0, &v23);
    v13 = v23;

    WFLogForCategory(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v16 = v14 == 0;
    else
      v16 = 1;
    v17 = !v16;
    if ((v12 & 1) != 0)
    {
      if (v17)
      {
        v18 = v14;
        if (os_log_type_enabled(v18, v15))
        {
          -[NSObject ssid](v5, "ssid");
          v19 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v19;
          v26 = 1024;
          LODWORD(v27) = a2;
          _os_log_impl(&dword_219FC8000, v18, v15, "Low data mode changed for '%@' set to '%d'", buf, 0x12u);

        }
LABEL_22:

      }
    }
    else if (v17)
    {
      v21 = v14;
      if (os_log_type_enabled(v21, v15))
      {
        -[NSObject ssid](v5, "ssid");
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v22;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_219FC8000, v21, v15, "failed saving low data mode state for '%@' error='%@'", buf, 0x16u);

      }
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  WFLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v20 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v20))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_219FC8000, v13, v20, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_24:

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_343(id *a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  void *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v29 = a2;
    _os_log_impl(&dword_219FC8000, v6, v7, "Setting privacy proxy %d", buf, 8u);
  }

  v8 = a1[4];
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setPrivacyProxyEnabled:", a2);
    v10 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v10, "wifiClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v13 = objc_msgSend(v12, "updateKnownNetworkProfile:properties:error:", v9, 0, &v27);
    v14 = v27;

    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v17 = v15 == 0;
    else
      v17 = 1;
    v18 = !v17;
    if ((v13 & 1) != 0)
    {
      if (v18)
      {
        v19 = v15;
        if (os_log_type_enabled(v19, v16))
        {
          objc_msgSend(v5, "ssid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v29 = v20;
          *(_WORD *)&v29[8] = 1024;
          *(_DWORD *)&v29[10] = a2;
          _os_log_impl(&dword_219FC8000, v19, v16, "Privacy proxy changed for '%@' set to '%d'", buf, 0x12u);

        }
      }
    }
    else if (v18 && os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)v29 = a2;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v5;
      *(_WORD *)&v29[14] = 2112;
      *(_QWORD *)&v29[16] = v14;
      _os_log_impl(&dword_219FC8000, v15, v16, "Failed to set privacy proxy to=%{public}d for network='%@' error='%@'", buf, 0x1Cu);
    }

  }
  else
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v21))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v29 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellTy"
                       "pe:]_block_invoke";
      *(_WORD *)&v29[8] = 2112;
      *(_QWORD *)&v29[10] = v5;
      _os_log_impl(&dword_219FC8000, v14, v21, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
    }
  }

  v22 = (void *)MEMORY[0x24BE6B748];
  objc_msgSend(v5, "ssid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_345;
  v25[3] = &unk_24DC350D0;
  v26 = v5;
  v24 = v5;
  objc_msgSend(v22, "reportWiFiNetworkStatus:networkName:queue:completionHandler:", a2, v23, MEMORY[0x24BDAC9B8], v25);

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_345(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(*(id *)(a1 + 32), "ssid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315650;
      v9 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_219FC8000, v6, v5, "%s: reporting privacy proxy status for '%@' - error %@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_347(id *a1, void *a2, double a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  os_log_type_t v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  char *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  os_log_type_t v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1[4];
  if (v8)
  {
    v9 = *MEMORY[0x24BE67E10];
    v34[0] = *MEMORY[0x24BE67E08];
    v34[1] = v9;
    v35[0] = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v12, "wifiClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v15 = objc_msgSend(v14, "updateKnownNetworkProfile:OSSpecificAttributes:error:", v8, v11, &v29);
    v16 = v29;

    WFLogForCategory(0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v19 = v17 == 0;
    else
      v19 = 1;
    v20 = !v19;
    if ((v15 & 1) != 0)
    {
      if (v20)
      {
        v21 = v17;
        if (os_log_type_enabled(v21, v18))
        {
          objc_msgSend(v7, "ssid");
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v22;
          v23 = "Set network responsiveness for '%@'";
          v24 = v21;
          v25 = v18;
          v26 = 12;
LABEL_19:
          _os_log_impl(&dword_219FC8000, v24, v25, v23, buf, v26);

          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else if (v20)
    {
      v28 = v17;
      if (os_log_type_enabled(v28, v18))
      {
        objc_msgSend(v7, "ssid");
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v22;
        v32 = 2112;
        v33 = v16;
        v23 = "failed setting network responsiveness for '%@' error='%@'";
        v24 = v28;
        v25 = v18;
        v26 = 22;
        goto LABEL_19;
      }
LABEL_20:

    }
    goto LABEL_22;
  }
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v27 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v27))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:]_block_invoke";
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_219FC8000, v11, v27, "%s: nil CWFNetworkProfile for network '%@'", buf, 0x16u);
  }
LABEL_22:

}

void __101__WFNetworkListController_networkListViewController_showSettingsForNetwork_context_scrollToCellType___block_invoke_349(id *a1, void *a2)
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a1[4];
  if (!v4)
  {
    WFLogForCategory(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        WeakRetained = objc_loadWeakRetained(a1 + 6);
        objc_msgSend(WeakRetained, "network");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ssid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_219FC8000, v7, v6, "Trying to set wifi mode for empty profile for network: %@", buf, 0xCu);

      }
    }

  }
  objc_msgSend(v4, "setDisable6EMode:", a2);
  v11 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v11, "wifiClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24DC5D378);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v15 = objc_msgSend(v13, "updateKnownNetworkProfile:properties:error:", v4, v14, &v24);
  v16 = v24;

  WFLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v19 = v17 == 0;
  else
    v19 = 1;
  v20 = !v19;
  if ((v15 & 1) != 0)
  {
    if (v20)
    {
      v21 = v17;
      if (os_log_type_enabled(v21, v18))
      {
        objc_msgSend(a1[5], "ssid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v22;
        v27 = 2048;
        v28 = a2;
        _os_log_impl(&dword_219FC8000, v21, v18, "disable 6e mode changed for '%@' set to '%ld'", buf, 0x16u);

      }
    }
  }
  else if (v20 && os_log_type_enabled(v17, v18))
  {
    v23 = a1[5];
    *(_DWORD *)buf = 134218498;
    v26 = a2;
    v27 = 2112;
    v28 = v23;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_219FC8000, v17, v18, "Failed to set disable 6e mode to=%ld for network='%@' error='%@'", buf, 0x20u);
  }

}

- (BOOL)networkListViewControllerWAPIEnabled:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWAPIEnabled");

  return v4;
}

- (void)networkListViewController:(id)a3 setWAPIEnabled:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_219FC8000, v6, v7, "User changed WAPI enabled %d", (uint8_t *)v9, 8u);
  }

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWAPIEnabled:", v4);

}

- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNetworkRestrictionActive");

  return v4;
}

- (BOOL)networkListViewControllerLockdownModeActive:(id)a3
{
  return self->_lockdownModeEnabled;
}

- (void)setShouldShowDetailTapOnCurrentNetwork:(BOOL)a3
{
  self->_shouldShowDetailTapOnCurrentNetwork = a3;
}

- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPowerModificationDisabled");

  return v4;
}

- (id)airportSettingsViewController:(id)a3 unconfiguredAccessoriesGroupHeaderTitle:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v20 = v5;
    v7 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v13, "isUnconfiguredAccessory"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "unconfiguredAccessoryType"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      if (!objc_msgSend(v7, "countForObject:", &unk_24DC5D390)
        || objc_msgSend(v7, "countForObject:", &unk_24DC5D3A8)
        || objc_msgSend(v7, "countForObject:", &unk_24DC5D3C0)
        || objc_msgSend(v7, "countForObject:", &unk_24DC5D3D8))
      {
        v5 = v20;
        if (objc_msgSend(v7, "countForObject:", &unk_24DC5D390)
          && objc_msgSend(v7, "countForObject:", &unk_24DC5D3A8)
          && !objc_msgSend(v7, "countForObject:", &unk_24DC5D3C0)
          && !objc_msgSend(v7, "countForObject:", &unk_24DC5D3D8))
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("kWFUnconfiguredAirportAndAirPlaySectionTitle");
        }
        else if (objc_msgSend(v7, "countForObject:", &unk_24DC5D390)
               || !objc_msgSend(v7, "countForObject:", &unk_24DC5D3A8)
               || objc_msgSend(v7, "countForObject:", &unk_24DC5D3C0)
               || objc_msgSend(v7, "countForObject:", &unk_24DC5D3D8))
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("kWFUnconfiguredDevicesSectionTitle");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("kWFUnconfiguredAirPlaySectionTitle");
        }
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFUnconfiguredAirportSectionTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v20;
      }

    }
    else
    {
      v18 = 0;
      v5 = v20;
    }
  }
  else
  {
    v7 = 0;
    v18 = 0;
  }

  return v18;
}

- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoInstantHotspotJoinOption");

  return v4;
}

- (void)networkListViewController:(id)a3 setAutoInstantOption:(int64_t)a4
{
  id v5;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoInstantHotspotJoinOption:", a4);

}

- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  return v4;
}

- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE900E0], "autoUnlockEnabled", a3);
}

- (int64_t)airportSettingsViewControllerAskToJoinMode:(id)a3
{
  void *v4;
  char v5;
  void *v7;
  int64_t v8;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkRestrictionActive");

  if ((v5 & 1) != 0)
    return -1;
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "askToJoinMode");

  return v8;
}

- (void)airportSettingsViewController:(id)a3 setAskToJoinMode:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFUserEvent eventWithType:stateEnum:](WFUserEvent, "eventWithType:stateEnum:", 2, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processEvent:", v7);

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAskToJoinMode:", a4);

}

- (BOOL)airportSettingsViewControllerShouldShowDiagnosticsMode:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDiagnosticsModeEnabled");

  return v4;
}

- (BOOL)airportSettingsViewControllerShouldShowNANUI:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isNANUIEnabled"))
    v4 = MGGetBoolAnswer();
  else
    v4 = 0;

  return v4;
}

- (BOOL)airportSettingsViewControllerShouldShowKnownNetworks:(id)a3
{
  void *v3;
  char v4;

  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isKnownNetworkUIEnabled");

  return v4;
}

- (void)airportSettingsViewControllerDidTapDiagnosticsMode:(id)a3 showNANUI:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  id buf[2];

  v4 = a4;
  v6 = a3;
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_219FC8000, v7, v8, "User tapped diagnostic cell", (uint8_t *)buf, 2u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2948]), "initWithNANUI:", v4);
  objc_initWeak(buf, self);
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__WFNetworkListController_airportSettingsViewControllerDidTapDiagnosticsMode_showNANUI___block_invoke;
  v11[3] = &unk_24DC35148;
  objc_copyWeak(&v12, buf);
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "setSaveHandler:", v11);
  -[WFNetworkListing navigationController](self->_viewController, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);

}

void __88__WFNetworkListController_airportSettingsViewControllerDidTapDiagnosticsMode_showNANUI___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_saveLogsWithComment:diagnosticsViewController:", v4, v5);

}

- (BOOL)airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  -[WFNetworkListController healthRecommendations](self, "healthRecommendations", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[WFNetworkListController healthRecommendations](self, "healthRecommendations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 0x8000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    v6 = v9 ^ 1;
  }

  -[WFNetworkListController interface](self, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentNetwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  if (v11 && (v6 & 1) == 0)
  {
    -[WFNetworkListController interface](self, "interface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentNetwork");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "supportsWiFiHealth"))
    {
      -[WFNetworkListController wifiClient](self, "wifiClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isWiFiHealthUIDisabled") ^ 1;

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  return v12;
}

- (void)airportSettingsViewControllerDidTapDataUsage:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t v6[16];

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v4, v5, "User tapped data usage cell", v6, 2u);
  }

  -[WFNetworkListController pushDataUsageViewController](self, "pushDataUsageViewController");
}

- (id)editableKnownNetworks
{
  void *v2;
  void *v3;

  -[WFNetworkListController knownNetworksManager](self, "knownNetworksManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allEditableNetworkProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)managedKnownNetworks
{
  void *v2;
  void *v3;

  -[WFNetworkListController knownNetworksManager](self, "knownNetworksManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allNonEditableNetworkProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)removeKnownNetworks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v8), "ssid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController interface](self, "interface");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentNetwork");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ssid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  -[WFNetworkListController knownNetworksManager](self, "knownNetworksManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "removeNetworks:", v4);

  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFUserEvent eventWithType:stateEnum:](WFUserEvent, "eventWithType:stateEnum:", 11, objc_msgSend(v4, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processEvent:", v18);

  if (v14)
  {
    -[WFNetworkListController interface](self, "interface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disassociateFromCurrentNetwork");

    WFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_219FC8000, v20, v21, "Disconnect from current network because user deleted it from known networks list", v23, 2u);
    }

  }
  return v16;
}

- (id)passwordToDisplayForSSID:(id)a3
{
  id v4;
  WFKnownNetworksManager *v5;
  void *v6;
  void *v7;
  WFKnownNetworksManager *v8;
  void *v9;

  v4 = a3;
  v5 = [WFKnownNetworksManager alloc];
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFKnownNetworksManager initWithInterface:](v5, "initWithInterface:", v7);

  -[WFKnownNetworksManager passwordForNetworksWithSSID:](v8, "passwordForNetworksWithSSID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)airportSettingsViewControllerDidStartEditingKnownNetworks:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v9 = 136315394;
    v10 = "-[WFNetworkListController airportSettingsViewControllerDidStartEditingKnownNetworks:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s airportVC='%@'", (uint8_t *)&v9, 0x16u);
  }

  -[WFNetworkListController _pauseScanning](self, "_pauseScanning");
  +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processEvent:", v8);

}

- (void)airportSettingsViewControllerDidFinishEditingKnownNetworks:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 136315394;
    v8 = "-[WFNetworkListController airportSettingsViewControllerDidFinishEditingKnownNetworks:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s airportVC='%@'", (uint8_t *)&v7, 0x16u);
  }

  -[WFNetworkListController _resumeScanning](self, "_resumeScanning");
}

- (void)pushDataUsageViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BE856E0]);
  objc_msgSend(v6, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", CFSTR("com.apple.wifi"), *MEMORY[0x24BE75AC0]);

  -[WFNetworkListController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_saveLogsWithComment:(id)a3 diagnosticsViewController:(id)a4
{
  id v6;
  id v7;
  WFSaveLogsOperation *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  WFNetworkListController *v19;
  id v20;
  id v21;
  id from;
  id location;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setSaving:", 1);
  v8 = -[WFSaveLogsOperation initWithComments:]([WFSaveLogsOperation alloc], "initWithComments:", v6);
  v9 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke;
  v24[3] = &unk_24DC348F8;
  v10 = v7;
  v25 = v10;
  -[WFSaveLogsOperation setCompletionBlock:](v8, "setCompletionBlock:", v24);
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  v11 = (void *)MEMORY[0x24BDD1478];
  v15 = v9;
  v16 = 3221225472;
  v17 = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_3;
  v18 = &unk_24DC35198;
  objc_copyWeak(&v20, &location);
  v19 = self;
  objc_copyWeak(&v21, &from);
  objc_msgSend(v11, "blockOperationWithBlock:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDependency:", v8, v15, v16, v17, v18, v19);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v12);

  -[WFNetworkListController backgroundQueue](self, "backgroundQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v8);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_2;
  block[3] = &unk_24DC348F8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSaving:", 0);
}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int IsChinaDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  _QWORD v25[4];
  id v26;
  BOOL v27;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3 == 0;

  objc_msgSend(a1[4], "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceCapability");
  IsChinaDevice = WFCapabilityIsChinaDevice();

  v6 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAlertFailureTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("kWFLocDiagnosticsAlertFailureMessage");
    v13 = CFSTR("kWFLocDiagnosticsAlertFailureMessage_CH");
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAlertSuccessTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("kWFLocDiagnosticsAlertSuccessMessage");
    v13 = CFSTR("kWFLocDiagnosticsAlertSuccessMessage_CH");
  }
  if (IsChinaDevice)
    v14 = v13;
  else
    v14 = v12;
  objc_msgSend(v10, "localizedStringForKey:value:table:", v14, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v9, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAlertOkTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_4;
  v25[3] = &unk_24DC35170;
  v20 = a1 + 6;
  objc_copyWeak(&v26, a1 + 6);
  v27 = v24;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v21);
  v22 = objc_loadWeakRetained(v20);
  objc_msgSend(v22, "viewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentViewController:animated:completion:", v16, 1, 0);

  objc_destroyWeak(&v26);
}

void __74__WFNetworkListController__saveLogsWithComment_diagnosticsViewController___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    WeakRetained = v10;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

      WeakRetained = v10;
    }
  }

}

- (void)_networkDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  _BYTE v39[18];
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFInterfaceNetworkKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("WFInterfacePreviousNetworkKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("WFInterfaceNetworkChangeReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
  {
    v38 = 136315906;
    *(_QWORD *)v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
    *(_WORD *)&v39[8] = 2048;
    *(_QWORD *)&v39[10] = v11;
    v40 = 2112;
    v41 = v6;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_219FC8000, v12, v13, "%s: reason %lu network %@ previous %@", (uint8_t *)&v38, 0x2Au);
  }

  if (v11 == 1)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      v38 = 136315138;
      *(_QWORD *)v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: network changed due to captive network detection", (uint8_t *)&v38, 0xCu);
    }

  }
  -[WFNetworkListController detailsContext](self, "detailsContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WFNetworkListController detailsContext](self, "detailsContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "network");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEquivalentRecord:", v6);

    -[WFNetworkListController detailsContext](self, "detailsContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCurrent:", v19);

    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      v38 = 67109120;
      *(_DWORD *)v39 = v19;
      _os_log_impl(&dword_219FC8000, v21, v22, "updating details context currentNetwork %d", (uint8_t *)&v38, 8u);
    }

    if ((_DWORD)v19)
    {
      -[WFNetworkListController _sortedHealthRecommendations](self, "_sortedHealthRecommendations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    -[WFNetworkListController detailsContext](self, "detailsContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRecommendations:", v23);

    if ((_DWORD)v19)
  }
  WFLogForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
  {
    v38 = 138412290;
    *(_QWORD *)v39 = v6;
    _os_log_impl(&dword_219FC8000, v25, v26, "network changed: %@", (uint8_t *)&v38, 0xCu);
  }

  WFLogForCategory(0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v27)
  {
    v29 = v27;
    if (os_log_type_enabled(v29, v28))
    {
      v30 = -[WFNetworkListController isAssociating](self, "isAssociating");
      -[WFNetworkListController associationContext](self, "associationContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "network");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 67109378;
      *(_DWORD *)v39 = v30;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v32;
      _os_log_impl(&dword_219FC8000, v29, v28, "isAssociating: %d associating network %@", (uint8_t *)&v38, 0x12u);

    }
  }

  if (-[WFNetworkListController isAssociating](self, "isAssociating"))
  {
    WFLogForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v33 && os_log_type_enabled(v33, v34))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_219FC8000, v33, v34, "networkChanged callback during association with nil network", (uint8_t *)&v38, 2u);
    }
LABEL_44:

    goto LABEL_45;
  }
  -[WFNetworkListController _updateViewControllerConnectedNetwork:](self, "_updateViewControllerConnectedNetwork:", v6);
  if (-[WFNetworkListController isHS20Supported](self, "isHS20Supported"))
  {
    if (v6)
    {
      if (objc_msgSend(v6, "isHotspot20"))
      {
        objc_msgSend(v6, "matchingKnownNetworkProfile");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          WFLogForCategory(0);
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
          {
            v38 = 136315138;
            *(_QWORD *)v39 = "-[WFNetworkListController _networkDidChangeNotification:]";
            _os_log_impl(&dword_219FC8000, v36, v37, "%s: new network is HS20, resolving profile", (uint8_t *)&v38, 0xCu);
          }

          -[WFNetworkListController gasController](self, "gasController");
          v33 = objc_claimAutoreleasedReturnValue();
          -[NSObject resolveProfileForNetwork:handler:force:](v33, "resolveProfileForNetwork:handler:force:", v6, &__block_literal_global_390, 1);
          goto LABEL_44;
        }
      }
    }
  }
LABEL_45:

}

void __57__WFNetworkListController__networkDidChangeNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  WFLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "resolved profile %@ error %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_networkLinkQualityDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  float v11;
  double v12;
  void *v13;
  char v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFInterfaceLinkQualityKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFNetworkListController setLatestLinkQuality:](self, "setLatestLinkQuality:", v5);
    -[WFNetworkListController viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentNetwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      WFLogForCategory(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          objc_msgSend(v5, "scaledRssi");
          v12 = v11;
          objc_msgSend(v5, "scaledRssi");
          v24 = 136315650;
          v25 = "-[WFNetworkListController _networkLinkQualityDidChangeNotification:]";
          v26 = 2048;
          v27 = v12;
          v28 = 2048;
          v29 = WFSignalBarsFromScaledRSSI();
          _os_log_impl(&dword_219FC8000, v10, v9, "%s: linkQuality.scaledRssi %f bars %ld", (uint8_t *)&v24, 0x20u);
        }

      }
      -[WFNetworkListController viewController](self, "viewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      objc_msgSend(v5, "scaledRssi");
      v16 = v15;
      if ((v14 & 1) != 0)
      {
        v17 = WFSignalBarsFromScaledRSSI();
        -[WFNetworkListController viewController](self, "viewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCurrentNetworkSignalBars:", v17);
      }
      else
      {
        -[WFNetworkListController viewController](self, "viewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = v16;
        objc_msgSend(v18, "setCurrentNetworkScaledRSSI:", v19);
      }

    }
    -[WFNetworkListController viewController](self, "viewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "currentNetworkState") == 1)
    {
      -[WFNetworkListController interface](self, "interface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "ipv4SelfAssigned");

      if ((v22 & 1) != 0)
      {
LABEL_16:

        goto LABEL_17;
      }
      -[WFNetworkListController interface](self, "interface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentNetwork");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController _updateCurrentNetworkIPState:](self, "_updateCurrentNetworkIPState:", v23);

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)_interfaceDidBecomeAvailable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController wifiClient](self, "wifiClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v11 || !os_log_type_enabled(v11, v12))
      goto LABEL_14;
    v14 = 136315138;
    v15 = "-[WFNetworkListController _interfaceDidBecomeAvailable:]";
    v13 = "%s: nil interface provided by WFClient";
    goto LABEL_13;
  }
  -[WFNetworkListController interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[WFNetworkListController _setupWithInterface:](self, "_setupWithInterface:", v5);
  -[WFNetworkListController setInterface:](self, "setInterface:", v5);
  -[WFNetworkListController _updateViewControllerDisabled](self, "_updateViewControllerDisabled");
  -[WFNetworkListController _updatePowerState](self, "_updatePowerState");
  if (-[WFNetworkListController isSetup](self, "isSetup"))
  {
    -[WFNetworkListController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[WFNetworkListController viewController](self, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "networkListVisible");

      if ((v10 & 1) == 0)
      {
        WFLogForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v11 || !os_log_type_enabled(v11, v12))
          goto LABEL_14;
        v14 = 136315138;
        v15 = "-[WFNetworkListController _interfaceDidBecomeAvailable:]";
        v13 = "%s: Skipping scanning for setup until wifi page is visible";
LABEL_13:
        _os_log_impl(&dword_219FC8000, v11, v12, v13, (uint8_t *)&v14, 0xCu);
LABEL_14:

        goto LABEL_8;
      }
    }
  }
  -[WFNetworkListController startScanning](self, "startScanning");
LABEL_8:

}

- (void)_clientRestartedNotification:(id)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = 136315394;
      v8 = "-[WFNetworkListController _clientRestartedNotification:]";
      v9 = 2048;
      v10 = -[WFNetworkListController powerState](self, "powerState");
      _os_log_impl(&dword_219FC8000, v6, v5, "%s: power state %lu", (uint8_t *)&v7, 0x16u);
    }

  }
  -[WFNetworkListController _updatePowerState](self, "_updatePowerState");
}

- (void)_wifiPropertyDidChanged:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  __int128 v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = a3;
  objc_msgSend(v26, "userInfo");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v28;
    *(_QWORD *)&v5 = 134217984;
    v24 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("kWFClientUserInterfacePropertyATJKey"), v24))
        {
          objc_msgSend(v26, "userInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("kWFClientUserInterfacePropertyATJKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "integerValue");
          -[WFNetworkListController viewController](self, "viewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            WFLogForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
            {
              *(_DWORD *)buf = v24;
              v32 = v12;
              _os_log_impl(&dword_219FC8000, v15, v16, "setting ask to join mode to %ld", buf, 0xCu);
            }

            -[WFNetworkListController viewController](self, "viewController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAskToJoinMode:", v12);
LABEL_20:

          }
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("kWFClientUserInterfacePropertyHotspotAJKey")))
            continue;
          objc_msgSend(v26, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("kWFClientUserInterfacePropertyHotspotAJKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v11, "integerValue");
          -[WFNetworkListController viewController](self, "viewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_opt_respondsToSelector();

          if ((v21 & 1) != 0)
          {
            WFLogForCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
            {
              *(_DWORD *)buf = v24;
              v32 = v19;
              _os_log_impl(&dword_219FC8000, v22, v23, "setting auto hotspot join option to %ld", buf, 0xCu);
            }

            -[WFNetworkListController viewController](self, "viewController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAutoInstantHotspotJoinOption:", v19);
            goto LABEL_20;
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

}

- (void)_preferredNetworksDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  int v20;
  os_log_type_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  BOOL v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE29EE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE29EE0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (-[WFNetworkListController viewControllerSupportsCurrentNetworkSubtitle](self, "viewControllerSupportsCurrentNetworkSubtitle"))
  {
    -[WFNetworkListController interface](self, "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentNetwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (-[WFNetworkListController isAssociating](self, "isAssociating")
        || (unint64_t)(v9 - 3) < 0xFFFFFFFFFFFFFFFELL)
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        v21 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v21))
        {
          v33 = 136315138;
          v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
          _os_log_impl(&dword_219FC8000, v14, v21, "%s: preferred network change, do not update health subtitle while associating", (uint8_t *)&v33, 0xCu);
        }
      }
      else
      {
        -[WFNetworkListController interface](self, "interface");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentNetwork");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ssid");
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "networkName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v14);

        WFLogForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel())
          v19 = v17 == 0;
        else
          v19 = 1;
        v20 = !v19;
        if (v16)
        {
          if (v20 && os_log_type_enabled(v17, v18))
          {
            v33 = 136315138;
            v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
            _os_log_impl(&dword_219FC8000, v17, v18, "%s: preferred network modified, updating health subtitle", (uint8_t *)&v33, 0xCu);
          }

          -[WFNetworkListController _updateHealthSubtitle](self, "_updateHealthSubtitle");
        }
        else
        {
          if (v20 && os_log_type_enabled(v17, v18))
          {
            v33 = 136315138;
            v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
            _os_log_impl(&dword_219FC8000, v17, v18, "%s: preferred network modified, will not update health subtitle ", (uint8_t *)&v33, 0xCu);
          }

        }
      }

    }
  }
  objc_msgSend(v6, "accessoryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = v9 == 2;
  else
    v23 = 0;
  if (v23)
  {
    -[WFNetworkListController networks](self, "networks");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scanRecordWithSSID:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v29 = v27 == 0;
    else
      v29 = 1;
    v30 = !v29;
    if (v26)
    {
      if (v30)
      {
        v31 = v27;
        if (os_log_type_enabled(v31, v28))
        {
          objc_msgSend(v6, "displayFriendlyName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 136315650;
          v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
          v35 = 2112;
          v36 = v32;
          v37 = 2112;
          v38 = v6;
          _os_log_impl(&dword_219FC8000, v31, v28, "%s found matching scan result, displayName='%@' profile='%@'", (uint8_t *)&v33, 0x20u);

        }
      }

      objc_msgSend(v26, "setMatchingKnownNetworkProfile:", v6);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      -[WFNetworkListController _updateViewsForNetworks:](self, "_updateViewsForNetworks:", v27);
    }
    else if (v30 && os_log_type_enabled(v27, v28))
    {
      v33 = 136315394;
      v34 = "-[WFNetworkListController _preferredNetworksDidChange:]";
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_219FC8000, v27, v28, "%s updated network was an accessory but was not found in the scan results profile='%@'", (uint8_t *)&v33, 0x16u);
    }

  }
}

- (void)hotspotInterfaceDidUpdateNetworks:(id)a3
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
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[WFNetworkListController scanForPersonalHotspots](self, "scanForPersonalHotspots", a3)
    && -[WFNetworkListController canScanForPersonalHotspots](self, "canScanForPersonalHotspots"))
  {
    -[WFNetworkListController _updateViewControllerScanResults](self, "_updateViewControllerScanResults");
  }
  else
  {
    WFLogForCategory(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        v7 = 136315650;
        v8 = "-[WFNetworkListController hotspotInterfaceDidUpdateNetworks:]";
        v9 = 1024;
        v10 = -[WFNetworkListController scanForPersonalHotspots](self, "scanForPersonalHotspots");
        v11 = 1024;
        v12 = -[WFNetworkListController canScanForPersonalHotspots](self, "canScanForPersonalHotspots");
        _os_log_impl(&dword_219FC8000, v6, v5, "%s: hotspot scanning disabled (scan %d, canScan %d)", (uint8_t *)&v7, 0x18u);
      }

    }
    -[WFNetworkListController _stopHotspotScan](self, "_stopHotspotScan");
  }
}

- (BOOL)isAirPortSettings
{
  void *v2;
  char isKindOfClass;

  -[WFNetworkListController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSetup
{
  void *v2;
  char isKindOfClass;

  -[WFNetworkListController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_useLegacySettingsUI
{
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WiFiDisableNewSettingsUI"), CFSTR("com.apple.settings.airport"), &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat && AppBooleanValue == 0;
}

- (void)_updateViewControllerDisabled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFNetworkListController interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        -[WFNetworkListController viewController](self, "viewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[WFNetworkListController _updateViewControllerDisabled]";
        v16 = 2112;
        v17 = v9;
        v18 = 1024;
        v19 = v5 == 0;
        _os_log_impl(&dword_219FC8000, v8, v7, "%s: setting view controller %@ disabled %d", (uint8_t *)&v14, 0x1Cu);

      }
    }
    v10 = v5 == 0;

    -[WFNetworkListController viewController](self, "viewController");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDisabled:](v11, "setDisabled:", v10);
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v11 = v11;
      if (os_log_type_enabled(v11, v12))
      {
        -[WFNetworkListController viewController](self, "viewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[WFNetworkListController _updateViewControllerDisabled]";
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_219FC8000, v11, v12, "%s: view controller %@ doesn't support disabled state", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

- (void)_updateViewsForNetworks:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      v9 = 136315138;
      v10 = "-[WFNetworkListController _updateViewsForNetworks:]";
      _os_log_impl(&dword_219FC8000, v7, v8, "%s: nil networks", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_4;
  }
  -[WFNetworkListController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateViewsForNetworks:](v7, "updateViewsForNetworks:", v4);
LABEL_4:

  }
}

- (void)gasQueryController:(id)a3 didUpdateProfiles:(id)a4 networkNames:(id)a5
{
  -[WFNetworkListController _updateHS20NetworksWithProfiles:names:](self, "_updateHS20NetworksWithProfiles:names:", a4, a5);
}

- (void)_updateHS20NetworksWithProfiles:(id)a3 names:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke;
  v13[3] = &unk_24DC35208;
  v13[4] = self;
  v12 = v6;
  v14 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  -[WFNetworkListController viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadCellsForNetworkNames:", v11);

  }
}

void __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "networks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke_2;
  v8[3] = &unk_24DC351E0;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v11 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __65__WFNetworkListController__updateHS20NetworksWithProfiles_names___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "HS20Badge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHotspot20Name:", v6);

  }
}

- (void)_stateMonitorChangedStates:(int64_t)a3 oldState:(int64_t)a4
{
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      WFWiFiStateMonitorStringForState(a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WFWiFiStateMonitorStringForState(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[WFNetworkListController _stateMonitorChangedStates:oldState:]";
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_219FC8000, v9, v8, "%s: %@ to %@", (uint8_t *)&v21, 0x20u);

    }
  }

  -[WFNetworkListController viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[WFNetworkListController interface](self, "interface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentNetwork");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "carPlayType") == 1)
    {

    }
    else
    {
      -[WFNetworkListController wifiClient](self, "wifiClient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isCellularOutrankingWiFi");

      if ((v17 & 1) == 0)
      {
        -[WFNetworkListController viewController](self, "viewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = a3 != 2;
        goto LABEL_12;
      }
    }
    -[WFNetworkListController viewController](self, "viewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 1;
LABEL_12:
    objc_msgSend(v18, "setUserAutoJoinEnabled:", v20);

  }
}

- (void)_dismissCredentialsViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Dismissing credentials view controller %@", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
  -[WFNetworkListController setCredentialsContext:](self, "setCredentialsContext:", 0);

}

- (void)_dismissTrustViewControllerWithContext:(id)a3
{
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "Dismissing trust view controller %@", (uint8_t *)&v9, 0xCu);
  }

  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[WFNetworkListController _dismissTrustViewControllerWithContext:]";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: presentingVc %@ credentialsVc %@", (uint8_t *)&v9, 0x20u);
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
  -[WFNetworkListController setCertificateContext:](self, "setCertificateContext:", 0);

}

- (void)_dismissDetailsViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Dismissing details view controller %@", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
  -[WFNetworkListController setDetailsContext:](self, "setDetailsContext:", 0);

}

- (void)_dismissErrorViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Dismissing error view controller %@", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
}

- (void)_dismissLockdownModeViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Dismissing lockdown mode view controller %@", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
}

- (void)_dismissOtherNetworkViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Dismissing other network view controller %@", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v4);
  -[WFNetworkListController _resumeScanning](self, "_resumeScanning");
  -[WFNetworkListController setCredentialsContext:](self, "setCredentialsContext:", 0);

}

- (void)_dismissViewControllerForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  os_log_type_t v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  char *v24;
  void *v25;
  void *v26;
  os_log_type_t v27;
  NSObject *v28;
  char *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  os_log_type_t v39;
  NSObject *v40;
  char *v41;
  NSObject *v42;
  char *v43;
  int v44;
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNetworkListController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    WFLogForCategory(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        -[WFNetworkListController viewProvider](self, "viewProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 136315394;
        v45 = "-[WFNetworkListController _dismissViewControllerForContext:]";
        v46 = 2112;
        v47 = v10;
        _os_log_impl(&dword_219FC8000, v9, v8, "%s: provider (%@) handling dismissal", (uint8_t *)&v44, 0x16u);

      }
    }

    -[WFNetworkListController viewProvider](self, "viewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissNetworkViewController:forContext:", v12, v4);
  }
  else
  {
    if (!objc_msgSend(v4, "needsDismissal"))
      goto LABEL_31;
    objc_msgSend(v4, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v4, "provider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "wantsModalPresentation");

      if (v16)
      {
        objc_msgSend(v4, "provider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        WFLogForCategory(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel())
          v21 = v19 == 0;
        else
          v21 = 1;
        v22 = !v21;
        if ((v18 & 1) != 0)
        {
          if (v22)
          {
            v23 = v19;
            if (os_log_type_enabled(v23, v20))
            {
              objc_msgSend(v4, "provider");
              v24 = (char *)objc_claimAutoreleasedReturnValue();
              v44 = 138412290;
              v45 = v24;
              _os_log_impl(&dword_219FC8000, v23, v20, "dismissing provider: %@", (uint8_t *)&v44, 0xCu);

            }
          }

          objc_msgSend(v4, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v22)
          {
            v42 = v19;
            if (os_log_type_enabled(v42, v20))
            {
              -[WFNetworkListController viewController](self, "viewController");
              v43 = (char *)objc_claimAutoreleasedReturnValue();
              v44 = 138412290;
              v45 = v43;
              _os_log_impl(&dword_219FC8000, v42, v20, "dismissing view controller: %@", (uint8_t *)&v44, 0xCu);

            }
          }

          -[WFNetworkListController viewController](self, "viewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v11 = v25;
        objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 1, 0);
        goto LABEL_30;
      }
    }
    WFLogForCategory(0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v26)
    {
      v28 = v26;
      if (os_log_type_enabled(v28, v27))
      {
        objc_msgSend(v4, "provider");
        v29 = (char *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController viewController](self, "viewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "navigationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138412546;
        v45 = v29;
        v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_219FC8000, v28, v27, "dismissing non-modal: %@ (navigationController: %@)", (uint8_t *)&v44, 0x16u);

      }
    }

    -[WFNetworkListController viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);
  }

LABEL_30:
LABEL_31:
  -[WFNetworkListController viewProvider](self, "viewProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_respondsToSelector();

  if ((v34 & 1) != 0)
  {
    -[WFNetworkListController viewProvider](self, "viewProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "didDismissNetworkViewController:forContext:", v36, v4);

  }
  -[WFNetworkListController setVisibleContext:](self, "setVisibleContext:", 0);
  -[WFNetworkListController detailsContext](self, "detailsContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    WFLogForCategory(0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v38)
    {
      v40 = v38;
      if (os_log_type_enabled(v40, v39))
      {
        -[WFNetworkListController detailsContext](self, "detailsContext");
        v41 = (char *)objc_claimAutoreleasedReturnValue();
        v44 = 138412290;
        v45 = v41;
        _os_log_impl(&dword_219FC8000, v40, v39, "clearing detailsContext='%@'", (uint8_t *)&v44, 0xCu);

      }
    }

    -[WFNetworkListController setDetailsContext:](self, "setDetailsContext:", 0);
  }

}

- (void)_dismissVisibleContext
{
  void *v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkListController visibleContext](self, "visibleContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WFLogForCategory(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        -[WFNetworkListController visibleContext](self, "visibleContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[WFNetworkListController _dismissVisibleContext]";
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_219FC8000, v6, v5, "%s: dismissing context %@", (uint8_t *)&v9, 0x16u);

      }
    }

    -[WFNetworkListController visibleContext](self, "visibleContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController _dismissViewControllerForContext:](self, "_dismissViewControllerForContext:", v8);

  }
}

- (BOOL)handleURL:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  WFNetworkListController *v14;
  void *v15;
  char v16;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  WFNetworkScanRecord *v32;
  WFNetworkProfile *v33;
  NSObject *v34;
  WFNetworkScanRecord *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  WFNetworkScanRecord *v46;
  WFNetworkScanRecord *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  NSObject *v55;
  os_log_type_t v56;
  os_log_type_t v57;
  const char *v58;
  NSObject *v59;
  os_log_type_t v60;
  NSObject *v61;
  os_log_type_t v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  NSObject *v67;
  os_log_type_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *cf;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  NSObject *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[WFNetworkListController handleURL:]";
    v79 = 2112;
    v80 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: handling URL %@", buf, 0x16u);
  }

  -[WFNetworkListController keyValueDictionaryForURL:](self, "keyValueDictionaryForURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v57 = OSLogForWFLogLevel(1uLL);
    v16 = 0;
    if (!WFCurrentLogLevel() || !v10)
      goto LABEL_13;
    if (!os_log_type_enabled(v10, v57))
      goto LABEL_57;
    *(_DWORD *)buf = 136315394;
    v78 = "-[WFNetworkListController handleURL:]";
    v79 = 2112;
    v80 = v4;
    v58 = "%s: missing path items (url %@)";
LABEL_66:
    _os_log_impl(&dword_219FC8000, v10, v57, v58, buf, 0x16u);
    goto LABEL_57;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("path"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v57 = OSLogForWFLogLevel(1uLL);
    v16 = 0;
    if (!WFCurrentLogLevel() || !v10)
      goto LABEL_13;
    if (!os_log_type_enabled(v10, v57))
      goto LABEL_57;
    *(_DWORD *)buf = 136315394;
    v78 = "-[WFNetworkListController handleURL:]";
    v79 = 2112;
    v80 = v4;
    v58 = "%s: missing path param (url %@)";
    goto LABEL_66;
  }
  v10 = v9;
  -[NSObject componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR("#"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("NetworkDetails")) && v13)
  {
    v14 = self;
    v15 = v13;
LABEL_12:
    v16 = -[WFNetworkListController _handleCurrentNetworkDetailsURL:](v14, "_handleCurrentNetworkDetailsURL:", v15);

    goto LABEL_13;
  }
  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("NetworkDetails")))
  {
    v14 = self;
    v15 = 0;
    goto LABEL_12;
  }
  v75 = v4;
  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("WiFiPower")))
  {
    -[WFNetworkListController viewController](self, "viewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[WFNetworkListController viewController](self, "viewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scrollToAirportCell:", 1);

    }
  }
  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("AskToJoin")))
  {
    -[WFNetworkListController viewController](self, "viewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      -[WFNetworkListController viewController](self, "viewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scrollToAirportCell:", 2);

    }
  }
  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("AutoJoinHotspot")))
  {
    -[WFNetworkListController viewController](self, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[WFNetworkListController viewController](self, "viewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scrollToAirportCell:", 3);

    }
  }
  if ((-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("Credentials")) & 1) != 0
    || -[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("TrustEnterprise")))
  {
    v76 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", CFSTR("/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist"), 0, &v76);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v76;
    v29 = v28;
    if (v27)
    {
      v73 = v28;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v27, 0, 0, 0);
      v74 = objc_claimAutoreleasedReturnValue();
      v30 = WiFiNetworkCreate();
      if (v30)
      {
        v31 = v30;
        v32 = -[WFNetworkScanRecord initWithNetworkRef:]([WFNetworkScanRecord alloc], "initWithNetworkRef:", v30);
        v33 = [WFNetworkProfile alloc];
        cf = v31;
        v34 = v31;
        v35 = v32;
        v36 = -[WFNetworkProfile initWithNetworkRef:](v33, "initWithNetworkRef:", v34);
        v70 = v12;
        v71 = v27;
        if (!v32)
        {
          v47 = 0;
          v48 = (void *)v36;
          WFLogForCategory(0);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v63 && os_log_type_enabled(v63, (os_log_type_t)v64))
          {
            *(_DWORD *)buf = 136315394;
            v78 = "-[WFNetworkListController handleURL:]";
            v79 = 2112;
            v80 = cf;
            _os_log_impl(&dword_219FC8000, v63, (os_log_type_t)v64, "%s: unable to create scan record for enterprise networkRef %@", buf, 0x16u);
          }

          v38 = 0;
          v16 = 0;
          goto LABEL_51;
        }
        v69 = v36;
        if (v36)
        {
          -[WFNetworkListController networks](self, "networks");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v37, "mutableCopy");

          if (!v38)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v38, "addObject:", v35, v69, v12, v71);
          -[WFNetworkListController setNetworks:](self, "setNetworks:", v38);
          -[WFNetworkListController _updateViewControllerScanResults](self, "_updateViewControllerScanResults");
          -[WFNetworkListController viewController](self, "viewController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_opt_respondsToSelector();

          -[WFNetworkListController viewController](self, "viewController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if ((v40 & 1) != 0)
            objc_msgSend(v41, "setCurrentNetwork:previousNetwork:reason:", v35, 0, 0);
          else
            objc_msgSend(v41, "setCurrentNetwork:", v35);

          if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("Credentials")))
          {
            -[WFNetworkListController credentialsContext](self, "credentialsContext");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              -[WFNetworkListController credentialsContext](self, "credentialsContext");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "cancel");

            }
            -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v35);
            -[WFNetworkListController associationContext](self, "associationContext");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setState:", 2);

            v46 = v35;
            v47 = v35;
            v48 = v69;
            -[WFNetworkListController _promptCredentialsForNetwork:profile:](self, "_promptCredentialsForNetwork:profile:", v46, v69);
            v16 = 1;
            goto LABEL_41;
          }
          v47 = v35;
          if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("TrustEnterprise")))
          {
            v48 = v69;
            -[NSObject certificateChain](v69, "certificateChain");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              -[WFNetworkListController _associationWillStart:](self, "_associationWillStart:", v47);
              -[WFNetworkListController associationContext](self, "associationContext");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setState:", 2);

              -[NSObject certificateChain](v69, "certificateChain");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = 1;
              -[WFNetworkListController _promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:](self, "_promptTrustCertificateForNetwork:certificateChain:profile:autoJoin:", v47, v51, v69, 1);

LABEL_41:
              v4 = v75;
LABEL_51:
              CFRelease(cf);

              goto LABEL_13;
            }
            WFLogForCategory(0);
            v67 = objc_claimAutoreleasedReturnValue();
            v68 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v67 && os_log_type_enabled(v67, v68))
            {
              *(_DWORD *)buf = 136315394;
              v78 = "-[WFNetworkListController handleURL:]";
              v79 = 2112;
              v80 = v69;
              _os_log_impl(&dword_219FC8000, v67, v68, "%s: certificate chain is nil for profile %@", buf, 0x16u);
            }

            v16 = 0;
          }
          else
          {
            v16 = 1;
          }
          v4 = v75;
        }
        else
        {
          v47 = v32;
          WFLogForCategory(0);
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v65 && os_log_type_enabled(v65, v66))
          {
            *(_DWORD *)buf = 136315394;
            v78 = "-[WFNetworkListController handleURL:]";
            v79 = 2112;
            v80 = cf;
            _os_log_impl(&dword_219FC8000, v65, v66, "%s: unable to create network profile for enterprise networkRef %@", buf, 0x16u);
          }

          v38 = 0;
          v16 = 0;
        }
        v48 = v69;
        goto LABEL_51;
      }
      WFLogForCategory(0);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v61 && os_log_type_enabled(v61, v62))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "-[WFNetworkListController handleURL:]";
        v79 = 2112;
        v80 = v74;
        _os_log_impl(&dword_219FC8000, v61, v62, "%s: unable to create WiFiNetworkRef from scan dictionary: %@", buf, 0x16u);
      }

    }
    else
    {
      WFLogForCategory(0);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v59 && os_log_type_enabled(v59, v60))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "-[WFNetworkListController handleURL:]";
        v79 = 2112;
        v80 = v29;
        _os_log_impl(&dword_219FC8000, v59, v60, "%s: Unable to serialize LastEnterpriseNetwork.plist (error %@)", buf, 0x16u);
      }

    }
LABEL_57:
    v16 = 0;
    goto LABEL_13;
  }
  if (!-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("AccessoryDetails")))
  {
    WFLogForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v55 && os_log_type_enabled(v55, v56))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[WFNetworkListController handleURL:]";
      v79 = 2112;
      v80 = v10;
      _os_log_impl(&dword_219FC8000, v55, v56, "%s: unknown path param %@", buf, 0x16u);
    }

    goto LABEL_57;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
  v52 = (char *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v53 && os_log_type_enabled(v53, v54))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v52;
    _os_log_impl(&dword_219FC8000, v53, v54, "Trying to open Detail settings for accessory: %@", buf, 0xCu);
  }

  -[WFNetworkListController _handleAccessoryDetailURL:](self, "_handleAccessoryDetailURL:", v52);
  v16 = 1;
LABEL_13:

  return v16;
}

- (BOOL)_handleAccessoryDetailURL:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  os_log_type_t v22;
  BOOL v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  char *v27;
  id v28;
  void *v29;
  os_log_type_t v30;
  NSObject *v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  char *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[WFNetworkListController knownNetworksManager](self, "knownNetworksManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allEditableNetworkProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController knownNetworksManager](self, "knownNetworksManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allNonEditableNetworkProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        *(_DWORD *)buf = 134217984;
        v42 = (const char *)objc_msgSend(v10, "count");
        _os_log_impl(&dword_219FC8000, v13, v12, "All profile count: %lu", buf, 0xCu);
      }

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v10;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
LABEL_9:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
        objc_msgSend(v19, "accessoryIdentifier", (_QWORD)v37);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v4);

        if (v21)
          break;
        if (v16 == ++v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v16)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
      WFLogForCategory(0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v24)
      {
        v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          objc_msgSend(v19, "networkName");
          v27 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v4;
          v43 = 2112;
          v44 = v27;
          _os_log_impl(&dword_219FC8000, v26, v25, "Found matching accessory network profile for %@, network name: %@", buf, 0x16u);

        }
      }

      v28 = v19;
      if (v28)
      {
        WFLogForCategory(0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v29)
        {
          v31 = v29;
          if (os_log_type_enabled(v31, v30))
          {
            objc_msgSend(v28, "networkName");
            v32 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v42 = "-[WFNetworkListController _handleAccessoryDetailURL:]";
            v43 = 2112;
            v44 = v32;
            v45 = 2112;
            v46 = v4;
            _os_log_impl(&dword_219FC8000, v31, v30, "%s: successfully opened network detail for %@:  id:%@", buf, 0x20u);

          }
        }

        -[WFNetworkListController viewController](self, "viewController");
        v33 = objc_claimAutoreleasedReturnValue();
        -[WFNetworkListController networkListViewController:showSettingsForNetwork:](self, "networkListViewController:showSettingsForNetwork:", v33, v28);
        v23 = 1;
        goto LABEL_38;
      }
    }
    else
    {
LABEL_15:

    }
    WFLogForCategory(0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v34 = OSLogForWFLogLevel(1uLL);
    v23 = 0;
    if (WFCurrentLogLevel() && v28)
    {
      v33 = v28;
      if (os_log_type_enabled(v33, v34))
      {
        v35 = -[NSObject count](v14, "count");
        *(_DWORD *)buf = 136315650;
        v42 = "-[WFNetworkListController _handleAccessoryDetailURL:]";
        v43 = 2112;
        v44 = v4;
        v45 = 2048;
        v46 = (char *)v35;
        _os_log_impl(&dword_219FC8000, v33, v34, "%s: Not found matching profile for %@ in all known %lu profiles, unable to show detail page", buf, 0x20u);
      }
      v23 = 0;
      v28 = v33;
LABEL_38:

    }
  }
  else
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    v23 = 0;
    if (WFCurrentLogLevel() && v14)
    {
      if (os_log_type_enabled(v14, v22))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v14, v22, "failed to open accessoryView url: DeviceAccess FF in AccessorySetupKit is not enabled", buf, 2u);
      }
      v23 = 0;
    }
  }

  return v23;
}

- (BOOL)_handleCurrentNetworkDetailsURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  os_log_type_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AutoJoin")) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("LowDataMode")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PrivateWiFiAddress")) & 1) != 0)
  {
    v5 = 6;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("LimitIPAddress")))
  {
    v5 = 7;
  }
  else
  {
    v5 = 0;
  }
  -[WFNetworkListController interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentNetwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFNetworkListController viewController](self, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController interface](self, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentNetwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListController networkListViewController:showSettingsForNetwork:context:scrollToCellType:](self, "networkListViewController:showSettingsForNetwork:context:scrollToCellType:", v8, v10, 0, v5);

    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v11 = v11;
      if (os_log_type_enabled(v11, v12))
      {
        -[WFNetworkListController interface](self, "interface");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentNetwork");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315394;
        v18 = "-[WFNetworkListController _handleCurrentNetworkDetailsURL:]";
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_219FC8000, v11, v12, "%s: handling URL for current network (%@) details", (uint8_t *)&v17, 0x16u);

      }
    }
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v16))
    {
      v17 = 136315138;
      v18 = "-[WFNetworkListController _handleCurrentNetworkDetailsURL:]";
      _os_log_impl(&dword_219FC8000, v11, v16, "%s: current network is nil", (uint8_t *)&v17, 0xCu);
    }
  }

  return v7 != 0;
}

- (id)keyValueDictionaryForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByRemovingPercentEncoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v14, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)_hardwareMACAddress
{
  void *v2;
  void *v3;

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareMACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_cellularOutrankNotification:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v9 = 136315394;
    v10 = "-[WFNetworkListController _cellularOutrankNotification:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: received cellular outrank notification %@", (uint8_t *)&v9, 0x16u);
  }

  -[WFNetworkListController _updateHealthSubtitle](self, "_updateHealthSubtitle");
  -[WFNetworkListController interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController _updateCurrentNetworkIPState:](self, "_updateCurrentNetworkIPState:", v8);

}

- (void)_presentCellularOutrankAlertForNetwork:(id)a3 privateCellular:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__WFNetworkListController__presentCellularOutrankAlertForNetwork_privateCellular___block_invoke;
  aBlock[3] = &unk_24DC34A50;
  objc_copyWeak(&v18, &location);
  v7 = v6;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  WFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFNetworkListController _presentCellularOutrankAlertForNetwork:privateCellular:]";
    _os_log_impl(&dword_219FC8000, v9, v10, "%s: showing cellular outrank prompt", buf, 0xCu);
  }

  v11 = (void *)MEMORY[0x24BEC2930];
  objc_msgSend(v7, "ssid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListController viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceCapability");
  objc_msgSend(v11, "cellularOutrankAlertControllerWithNetworkName:chinaDevice:privateCellular:completionHandler:", v12, WFCapabilityIsChinaDevice(), v4, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __82__WFNetworkListController__presentCellularOutrankAlertForNetwork_privateCellular___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  uint8_t v9[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (a2)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "User accepted cellular outrank prompt", buf, 2u);
    }

    objc_msgSend(WeakRetained, "_associateToScanRecord:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219FC8000, v5, v6, "User declined cellular outrank prompt", v9, 2u);
    }

  }
}

- (void)_presentDeveloperOutrankAlertForNetwork:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v12 = 136315138;
    v13 = "-[WFNetworkListController _presentDeveloperOutrankAlertForNetwork:]";
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: showing developer outrank prompt", (uint8_t *)&v12, 0xCu);
  }

  v7 = (void *)MEMORY[0x24BEC2940];
  objc_msgSend(v4, "ssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceCapability");
  objc_msgSend(v7, "developerOutrankAlertControllerWithNetworkName:chinaDevice:completionHandler:", v8, WFCapabilityIsChinaDevice(), &__block_literal_global_454);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNetworkListController viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

}

void __67__WFNetworkListController__presentDeveloperOutrankAlertForNetwork___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE75620], "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=DEVELOPER_SETTINGS&path=NCO"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processURL:animated:fromSearch:withCompletion:", v2, 1, 0, &__block_literal_global_458);

  }
  else
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "User bypassed option to go to developer settings", buf, 2u);
    }

  }
}

void __67__WFNetworkListController__presentDeveloperOutrankAlertForNetwork___block_invoke_2()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t v2[16];

  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219FC8000, v0, v1, "User taken to developer settings", v2, 2u);
  }

}

- (int64_t)_defaultAuthTraits
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v11;
  unsigned int v12;

  -[WFNetworkListController wifiClient](self, "wifiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWPA3PersonalEnabled");

  if (v4)
    v5 = 2;
  else
    v5 = 0;
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWPA3EnterpriseEnabled");

  if (v7)
    v5 |= 4uLL;
  -[WFNetworkListController wifiClient](self, "wifiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMfpCapable");

  if (v9)
    v10 = v5 | 8;
  else
    v10 = v5;
  if (WFHasWAPICapability())
  {
    -[WFNetworkListController wifiClient](self, "wifiClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isWAPIEnabled");

    return v10 | v12;
  }
  return v10;
}

- (void)_updatePrivacyProxyFeatureEnabled
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _QWORD block[6];
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (void *)MEMORY[0x24BE6B748];
  dispatch_get_global_queue(33, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2;
  v18[3] = &unk_24DC35290;
  v20 = &v21;
  v6 = v2;
  v19 = v6;
  objc_msgSend(v3, "getStatus:completionHandler:", v4, v18);

  v7 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v6, v7);
  if (*((_DWORD *)v22 + 6))
  {
    v8 = (void *)MEMORY[0x24BE6B748];
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2_461;
    v14[3] = &unk_24DC352B8;
    v16 = &v21;
    v9 = v6;
    v15 = v9;
    objc_msgSend(v8, "getUserTier:completionHandler:", v4, v14);

    v10 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v9, v10);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_463;
    block[3] = &unk_24DC352E0;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = &v21;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke";
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: privacy proxy feature is disabled", buf, 0xCu);
    }

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_460;
    v17[3] = &unk_24DC348F8;
    v17[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
  }

  _Block_object_dispose(&v21, 8);
}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 136315650;
    v9 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke_2";
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: privacy proxy status=%d (error=%@)", (uint8_t *)&v8, 0x1Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_460(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPrivacyProxyFeatureTier:", 0);
}

void __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_2_461(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 == 1)
  {
    v6 = 1;
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    v6 = 2;
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[WFNetworkListController _updatePrivacyProxyFeatureEnabled]_block_invoke_2";
    v11 = 2048;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: privacy proxy user tier=%ld (error=%@)", (uint8_t *)&v9, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __60__WFNetworkListController__updatePrivacyProxyFeatureEnabled__block_invoke_463(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPrivacyProxyFeatureTier:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_refreshKnownHiddenNetworkNamesCache
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "wifiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24DC5D390, &unk_24DC5D3F0, &unk_24DC5D3A8, &unk_24DC5D408, &unk_24DC5D420, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "knownNetworkProfilesWithProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219FC8000, v7, v8, "refreshing known hidden network name cache", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke_467;
  block[3] = &unk_24DC34BC0;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v9;
  v15 = v2;
  v10 = v2;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__WFNetworkListController__refreshKnownHiddenNetworkNamesCache__block_invoke_467(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    *(_QWORD *)&v4 = 136315394;
    v25 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v9, "hiddenState", v25, (_QWORD)v26) == 1)
        {
          objc_msgSend(v9, "networkName");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            v12 = objc_msgSend(*(id *)(a1 + 40), "_canScanForHiddenNetwork:", v9);

            if (v12)
            {
              WFLogForCategory(0);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
              {
                *(_DWORD *)buf = v25;
                v31 = "-[WFNetworkListController _refreshKnownHiddenNetworkNamesCache]_block_invoke";
                v32 = 2112;
                v33 = v9;
                _os_log_impl(&dword_219FC8000, v13, v14, "%s: hidden network profile='%@'", buf, 0x16u);
              }

              v15 = *(void **)(a1 + 48);
              objc_msgSend(v9, "networkName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v16);

            }
          }
        }
        if (objc_msgSend(v9, "isPasspoint"))
        {
          WFLogForCategory(0);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v17 && os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = v25;
            v31 = "-[WFNetworkListController _refreshKnownHiddenNetworkNamesCache]_block_invoke";
            v32 = 2112;
            v33 = v9;
            _os_log_impl(&dword_219FC8000, v17, v18, "%s: passpoint network profile='%@'", buf, 0x16u);
          }

          v6 = 1;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  WFLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
  {
    v21 = *(const char **)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v31 = v21;
    v32 = 1024;
    LODWORD(v33) = v6 & 1;
    _os_log_impl(&dword_219FC8000, v19, v20, "hidden known network names='%@' HS20NetworksFound='%d'", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 48));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 240);
  *(_QWORD *)(v23 + 240) = v22;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = v6 & 1;
}

- (WFKnownNetworksProvider)knownNetworksManager
{
  WFKnownNetworksProvider *knownNetworksManager;
  WFKnownNetworksManager *v4;
  void *v5;
  void *v6;
  WFKnownNetworksProvider *v7;
  WFKnownNetworksProvider *v8;

  knownNetworksManager = self->_knownNetworksManager;
  if (!knownNetworksManager)
  {
    v4 = [WFKnownNetworksManager alloc];
    -[WFNetworkListController wifiClient](self, "wifiClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFKnownNetworksManager initWithInterface:](v4, "initWithInterface:", v6);
    v8 = self->_knownNetworksManager;
    self->_knownNetworksManager = v7;

    knownNetworksManager = self->_knownNetworksManager;
  }
  return knownNetworksManager;
}

- (WFNetworkListing)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (BOOL)scanForPersonalHotspots
{
  return self->_scanForPersonalHotspots;
}

- (void)setScanForPersonalHotspots:(BOOL)a3
{
  self->_scanForPersonalHotspots = a3;
}

- (BOOL)isScanning
{
  return self->_scanning;
}

- (WFHotspotInterface)hotspotInterface
{
  return self->_hotspotInterface;
}

- (void)setHotspotInterface:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotInterface, a3);
}

- (NSSet)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (BOOL)associatingToOtherNetwork
{
  return self->_associatingToOtherNetwork;
}

- (void)setAssociatingToOtherNetwork:(BOOL)a3
{
  self->_associatingToOtherNetwork = a3;
}

- (WFOtherNetworkProvider)otherNetworkVC
{
  return self->_otherNetworkVC;
}

- (void)setOtherNetworkVC:(id)a3
{
  objc_storeStrong((id *)&self->_otherNetworkVC, a3);
}

- (NSOperationQueue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (WFHealthIssueOverrides)healthRecommendationOverrides
{
  return self->_healthRecommendationOverrides;
}

- (void)setHealthRecommendationOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_healthRecommendationOverrides, a3);
}

- (WFScanManager)scanManager
{
  return self->_scanManager;
}

- (void)setScanManager:(id)a3
{
  objc_storeStrong((id *)&self->_scanManager, a3);
}

- (WFLinkQuality)latestLinkQuality
{
  return self->_latestLinkQuality;
}

- (void)setLatestLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_latestLinkQuality, a3);
}

- (WFHealthManager)healthManager
{
  return self->_healthManager;
}

- (void)setHealthManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthManager, a3);
}

- (BOOL)viewControllerSupportsCurrentNetworkSubtitle
{
  return self->_viewControllerSupportsCurrentNetworkSubtitle;
}

- (void)setViewControllerSupportsCurrentNetworkSubtitle:(BOOL)a3
{
  self->_viewControllerSupportsCurrentNetworkSubtitle = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (BOOL)canScanForPersonalHotspots
{
  return self->_canScanForPersonalHotspots;
}

- (void)setCanScanForPersonalHotspots:(BOOL)a3
{
  self->_canScanForPersonalHotspots = a3;
}

- (WFGasQueryController)gasController
{
  return self->_gasController;
}

- (void)setGasController:(id)a3
{
  objc_storeStrong((id *)&self->_gasController, a3);
}

- (WFWiFiStateMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_stateMonitor, a3);
}

- (WFClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(id)a3
{
  objc_storeStrong((id *)&self->_wifiClient, a3);
}

- (WFNetworkViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_viewProvider, a3);
}

- (WFDetailsContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
  objc_storeStrong((id *)&self->_detailsContext, a3);
}

- (WFCredentialsContext)credentialsContext
{
  return self->_credentialsContext;
}

- (void)setCredentialsContext:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsContext, a3);
}

- (WFCertificateContext)certificateContext
{
  return self->_certificateContext;
}

- (void)setCertificateContext:(id)a3
{
  objc_storeStrong((id *)&self->_certificateContext, a3);
}

- (WFNetworkView)contextVC
{
  return self->_contextVC;
}

- (void)setContextVC:(id)a3
{
  objc_storeStrong((id *)&self->_contextVC, a3);
}

- (WFContextPresenting)visibleContext
{
  return self->_visibleContext;
}

- (void)setVisibleContext:(id)a3
{
  objc_storeStrong((id *)&self->_visibleContext, a3);
}

- (WFAssociationContext)associationContext
{
  return self->_associationContext;
}

- (void)setAssociationContext:(id)a3
{
  objc_storeStrong((id *)&self->_associationContext, a3);
}

- (WFAssociationContextQueue)associationContextQueue
{
  return self->_associationContextQueue;
}

- (void)setAssociationContextQueue:(id)a3
{
  objc_storeStrong((id *)&self->_associationContextQueue, a3);
}

- (WFScanMetricsManager)scanMetricsManager
{
  return self->_scanMetricsManager;
}

- (void)setScanMetricsManager:(id)a3
{
  objc_storeStrong((id *)&self->_scanMetricsManager, a3);
}

- (BOOL)isHS20Supported
{
  return self->_HS20Supported;
}

- (void)setHS20Supported:(BOOL)a3
{
  self->_HS20Supported = a3;
}

- (WFNetworkListRandomMACManager)randomMACManager
{
  return self->_randomMACManager;
}

- (void)setRandomMACManager:(id)a3
{
  objc_storeStrong((id *)&self->_randomMACManager, a3);
}

- (WFDiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsManager, a3);
}

- (BOOL)firstScanFinished
{
  return self->_firstScanFinished;
}

- (void)setFirstScanFinished:(BOOL)a3
{
  self->_firstScanFinished = a3;
}

- (void)setKnownNetworksManager:(id)a3
{
  objc_storeStrong((id *)&self->_knownNetworksManager, a3);
}

- (int64_t)privacyProxyFeatureTier
{
  return self->_privacyProxyFeatureTier;
}

- (void)setPrivacyProxyFeatureTier:(int64_t)a3
{
  self->_privacyProxyFeatureTier = a3;
}

- (BOOL)privacyProxyFeatureEnabled
{
  return self->_privacyProxyFeatureEnabled;
}

- (void)setPrivacyProxyFeatureEnabled:(BOOL)a3
{
  self->_privacyProxyFeatureEnabled = a3;
}

- (NSSet)knownHiddenNetworkNames
{
  return self->_knownHiddenNetworkNames;
}

- (void)setKnownHiddenNetworkNames:(id)a3
{
  objc_storeStrong((id *)&self->_knownHiddenNetworkNames, a3);
}

- (BOOL)knownNetworksContainsHS20Networks
{
  return self->_knownNetworksContainsHS20Networks;
}

- (void)setKnownNetworksContainsHS20Networks:(BOOL)a3
{
  self->_knownNetworksContainsHS20Networks = a3;
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (BOOL)shouldShowDetailTapOnCurrentNetwork
{
  return self->_shouldShowDetailTapOnCurrentNetwork;
}

- (BOOL)isRandomMACManageFeatureEnabled
{
  return self->_isRandomMACManageFeatureEnabled;
}

- (void)setIsRandomMACManageFeatureEnabled:(BOOL)a3
{
  self->_isRandomMACManageFeatureEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownHiddenNetworkNames, 0);
  objc_storeStrong((id *)&self->_knownNetworksManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_randomMACManager, 0);
  objc_storeStrong((id *)&self->_scanMetricsManager, 0);
  objc_storeStrong((id *)&self->_associationContextQueue, 0);
  objc_storeStrong((id *)&self->_associationContext, 0);
  objc_storeStrong((id *)&self->_visibleContext, 0);
  objc_storeStrong((id *)&self->_contextVC, 0);
  objc_storeStrong((id *)&self->_certificateContext, 0);
  objc_storeStrong((id *)&self->_credentialsContext, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_wifiClient, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_gasController, 0);
  objc_storeStrong((id *)&self->_healthManager, 0);
  objc_storeStrong((id *)&self->_latestLinkQuality, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_healthRecommendationOverrides, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_otherNetworkVC, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_hotspotInterface, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
