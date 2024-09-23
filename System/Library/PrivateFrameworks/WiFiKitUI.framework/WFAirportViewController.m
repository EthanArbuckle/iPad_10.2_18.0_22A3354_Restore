@implementation WFAirportViewController

- (WFAirportViewController)init
{
  uint64_t v3;
  WFAirportViewController *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  uint64_t v7;
  NSOrderedSet *sections;
  void *v9;
  void *v10;
  uint64_t v11;
  WFNetworkRowConfig *currentNetworkRowConfig;
  objc_super v14;

  if (WFShouldUseInsetTableView())
    v3 = 2;
  else
    v3 = 1;
  v14.receiver = self;
  v14.super_class = (Class)WFAirportViewController;
  v4 = -[WFAirportViewController initWithStyle:](&v14, sel_initWithStyle_, v3);
  if (v4
    && (v5 = dispatch_queue_create(0, 0),
        internalQueue = v4->_internalQueue,
        v4->_internalQueue = (OS_dispatch_queue *)v5,
        internalQueue,
        v4->_internalQueue))
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v7 = objc_claimAutoreleasedReturnValue();
    sections = v4->_sections;
    v4->_sections = (NSOrderedSet *)v7;

    v4->_showOtherNetwork = 1;
    v4->_userAutoJoinEnabled = 1;
    v4->_currentNetworkScaledRSSI = 1.0;
    v4->_askToJoinShown = -[WFAirportViewController _askToJoinShouldBeVisible](v4, "_askToJoinShouldBeVisible");
    -[WFAirportViewController listDelegate](v4, "listDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_disablePowerModification = objc_msgSend(v9, "networkListViewControllerPowerModificationDisabled:", v4);

    -[WFAirportViewController listDelegate](v4, "listDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_isManagedAppleID = objc_msgSend(v10, "networkListViewControllerIsManagedAppleID:", v4);

    v4->_isInEditingMode = 0;
    v4->_tableViewIsUpdating = 0;
    v4->_networkResultsChangedWhileUIUpdates = 0;
    +[WFNetworkRowConfig settingsNetworkRowConfig](WFNetworkRowConfig, "settingsNetworkRowConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    currentNetworkRowConfig = v4->_currentNetworkRowConfig;
    v4->_currentNetworkRowConfig = (WFNetworkRowConfig *)v11;

    v4->_isUsingSwiftList = 0;
    v4->_isAuthenticating = 0;
    v4->_usePlacardCell = _os_feature_enabled_impl();
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)loadView
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
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)WFAirportViewController;
  -[WFInsetTableViewController loadView](&v33, sel_loadView);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD7B0], "nibWithNibName:bundle:", CFSTR("WFNetworkListCell"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerNib:forCellReuseIdentifier:", v4, CFSTR("WFNetworkCell"));

  objc_msgSend(MEMORY[0x24BEBD7B0], "nibWithNibName:bundle:", CFSTR("WFHotspotCell"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerNib:forCellReuseIdentifier:", v6, CFSTR("WFHotspotCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFWiFiPlacardCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFOtherNetworkCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFPowerCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFUnconfiguredNetworkCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFDiagnosticsCell"));

  -[WFAirportViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkDataUsageCellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkWAPICellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFNetworkKnownNetworksCellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkEditableNetworksListCellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkProfileNetworksListCellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkAlternativeCellIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableKnownHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableInfraHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTablePopularHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableAdhocHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableEditableHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableManagedHeaderIdentifier"));

  -[WFAirportViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("kWFTableUnconfiguredHeaderIdentifier"));

  v26 = *MEMORY[0x24BEBE770];
  -[WFAirportViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRowHeight:", v26);

  -[WFAirportViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEstimatedRowHeight:", v26);

  -[WFAirportViewController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setEstimatedSectionFooterHeight:", 0.0);

  -[WFAirportViewController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEstimatedSectionHeaderHeight:", 0.0);

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WFAirportViewController_loadView__block_invoke;
  block[3] = &unk_24DB373C8;
  block[4] = self;
  dispatch_sync(internalQueue, block);

}

void __35__WFAirportViewController_loadView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "listDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setShowDiagnostics:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowDiagnosticsMode:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowKnownNetworks:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowKnownNetworks:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowNANUI:", objc_msgSend(v9, "airportSettingsViewControllerShouldShowNANUI:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "_defaultSectionsForPowerState:", objc_msgSend(*(id *)(a1 + 32), "powered"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSections:", v2);

  if (objc_msgSend(*(id *)(a1 + 32), "showKnownNetworks"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "addObject:", &unk_24DB595F0);
    objc_msgSend(*(id *)(a1 + 32), "setSections:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "listDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "listDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = objc_msgSend(v7, "networkListViewControllerOverrideDeviceCapability:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = WFCurrentDeviceCapability();
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadEditButton");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAirportViewController;
  -[WFAirportViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[WFAirportViewController refresh](self, "refresh");
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkListViewControllerDidAppear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAirportViewController;
  -[WFAirportViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkListViewControllerDidDisappear:", self);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAirportViewController;
  -[WFAirportViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WFAirportViewController _updateNetworkRestrictionHeader](self, "_updateNetworkRestrictionHeader");
}

- (void)setDeviceCapability:(int64_t)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  self->_deviceCapability = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      WFStringFromDeviceCapability(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2196CC000, v6, v5, "Device Capability: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (BOOL)showDiagnosticsCell
{
  return -[WFAirportViewController showDiagnostics](self, "showDiagnostics")
      || -[WFAirportViewController showNANUI](self, "showNANUI");
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v5, v6, "Not setting current network state for current network in edit mode", buf, 2u);
    }
  }
  else
  {
    if (self->_currentNetworkState == a3)
      return;
    self->_currentNetworkState = a3;
    -[WFAirportViewController listDelegate](self, "listDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:", self);

    -[WFAirportViewController currentNetworkRowConfig](self, "currentNetworkRowConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConnectionState:", a3);

    -[WFAirportViewController currentNetworkRowConfig](self, "currentNetworkRowConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProblematicConnection:", v8);

    -[WFAirportViewController joiningHotspot](self, "joiningHotspot");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFAirportViewController setCurrentNetworkState:]";
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_2196CC000, v11, v12, "%s: joining hotspot %@", buf, 0x16u);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__WFAirportViewController_setCurrentNetworkState___block_invoke;
      block[3] = &unk_24DB373C8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    -[WFAirportViewController _currentNetworkCell](self, "_currentNetworkCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "setConnectionError:", v8);
      objc_msgSend(v14, "setState:", self->_currentNetworkState);
    }
    else
    {
      WFLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFAirportViewController setCurrentNetworkState:]";
        _os_log_impl(&dword_2196CC000, v15, v16, "%s: nil currentNetwork cell", buf, 0xCu);
      }

    }
  }

}

uint64_t __50__WFAirportViewController_setCurrentNetworkState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSectionForHotspotChange");
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2196CC000, v5, v6, "Not setting RSSI for current network in edit mode", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    if (self->_currentNetworkScaledRSSI == a3)
      return;
    self->_currentNetworkScaledRSSI = a3;
    -[WFAirportViewController listDelegate](self, "listDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:", self);

    v9 = WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI);
    -[WFAirportViewController currentNetworkRowConfig](self, "currentNetworkRowConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSignalBars:", v9);

    -[WFAirportViewController currentNetworkRowConfig](self, "currentNetworkRowConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProblematicConnection:", v8);

    -[WFAirportViewController _currentNetworkCell](self, "_currentNetworkCell");
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v12)
    {
      if ((_DWORD)v8)
      {
        -[NSObject setConnectionError:](v12, "setConnectionError:", 1);
      }
      else
      {
        -[NSObject setConnectionError:](v12, "setConnectionError:", 0);
        -[NSObject setBars:](v5, "setBars:", WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI));
      }
    }
    else
    {
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        v15 = 136315138;
        v16 = "-[WFAirportViewController setCurrentNetworkScaledRSSI:]";
        _os_log_impl(&dword_2196CC000, v13, v14, "%s: nil currentNetwork cell", (uint8_t *)&v15, 0xCu);
      }

    }
  }

}

- (void)setCurrentNetwork:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2196CC000, v5, v6, "Not updating current network in edit mode", v7, 2u);
    }

  }
  else
  {
    -[WFAirportViewController setCurrentNetwork:previousNetwork:reason:](self, "setCurrentNetwork:previousNetwork:reason:", v4, 0, 0);
  }

}

- (void)setCurrentNetwork:(id)a3 previousNetwork:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WFAirportViewController_setCurrentNetwork_previousNetwork_reason___block_invoke;
  block[3] = &unk_24DB373F0;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);

}

void __68__WFAirportViewController_setCurrentNetwork_previousNetwork_reason___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  int v21;
  int v22;
  void *v23;
  os_log_type_t v24;
  BOOL v25;
  int v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  WFPendingNetworkUpdate *v30;
  uint64_t v31;
  void *v32;
  os_log_type_t v33;
  uint64_t v34;
  os_log_type_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  os_log_type_t v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  os_log_type_t v64;
  BOOL v65;
  int v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  os_log_type_t v71;
  int v72;
  NSObject *v73;
  uint64_t v74;
  int v75;
  void *v76;
  os_log_type_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  os_log_type_t v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  os_log_type_t v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  os_log_type_t v104;
  BOOL v105;
  int v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  unint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  os_log_type_t v123;
  NSObject *v124;
  int v125;
  id v126;
  NSObject *v127;
  os_log_type_t v128;
  NSObject *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  os_log_type_t v136;
  NSObject *v137;
  int v138;
  void *v139;
  os_log_type_t v140;
  NSObject *v141;
  os_log_type_t v142;
  void *v143;
  uint64_t v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  os_log_type_t v150;
  BOOL v151;
  int v152;
  NSObject *v153;
  int v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  os_log_type_t v169;
  NSObject *v170;
  int v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  NSObject *v179;
  void *v180;
  void *v181;
  os_log_type_t v182;
  NSObject *v183;
  int v184;
  _BYTE *v185;
  int v186;
  void *v187;
  void *v188;
  unint64_t v189;
  unint64_t v190;
  void *v191;
  os_log_type_t v192;
  NSObject *v193;
  void *v194;
  NSObject *v195;
  _BYTE *v196;
  void *v197;
  unint64_t v198;
  void *v199;
  unint64_t v200;
  void *v201;
  os_log_type_t v202;
  NSObject *v203;
  os_log_type_t v204;
  void *v205;
  os_log_type_t v206;
  NSObject *v207;
  void *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  os_log_type_t v212;
  NSObject *v213;
  void *v214;
  uint64_t v215;
  int v216;
  int v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  uint8_t buf[4];
  const char *v223;
  __int16 v224;
  _BYTE v225[10];
  uint64_t v226;
  __int16 v227;
  _WORD v228[15];

  *(_QWORD *)&v228[11] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "joiningHotspot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setJoiningHotspot:", 0);
    WFLogForCategory(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (void *)OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v2 = v5;
      if (os_log_type_enabled(v2, (os_log_type_t)v1))
      {
        *(_DWORD *)buf = 136315394;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v4;
        _os_log_impl(&dword_2196CC000, v2, (os_log_type_t)v1, "%s: joining hotspot %@, clearing and resetting state", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_reloadSectionForHotspotChange");
  }
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "isEqual:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
      v2 = objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject canBeDisplayedAsCurrent](v2, "canBeDisplayedAsCurrent");
      if (v7 == objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent"))
      {

        goto LABEL_46;
      }
      v8 = 1;
      v9 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 1;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 0;
  else
    v11 = *(_QWORD *)(a1 + 40) == 0;

  if (v8)
  {

    if ((v9 & 1) == 0)
      goto LABEL_20;
    goto LABEL_23;
  }
  if (v9)
  {
LABEL_23:

    if (!v11)
      goto LABEL_24;
LABEL_46:
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v35 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      v15 = v15;
      if (os_log_type_enabled(v15, v35))
      {
        objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "hash");
        *(_DWORD *)buf = 136315650;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v36;
        *(_WORD *)&v225[8] = 2048;
        v226 = v38;
        _os_log_impl(&dword_2196CC000, v15, v35, "%s: no change to current network (%@ - %lu)", buf, 0x20u);

      }
    }
    goto LABEL_51;
  }
LABEL_20:

  if (v11)
    goto LABEL_46;
LABEL_24:
  v12 = objc_msgSend(*(id *)(a1 + 32), "_refreshATJShownStateIfChanged");
  v13 = objc_msgSend(*(id *)(a1 + 32), "powered");
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v14 + 1034))
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v16))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v17 = "Trying to set current network in editing mode, discard operation.";
    v18 = v15;
    v19 = v16;
    v20 = 2;
LABEL_44:
    _os_log_impl(&dword_2196CC000, v18, v19, v17, buf, v20);
LABEL_51:

    goto LABEL_52;
  }
  v21 = v13;
  v22 = *(unsigned __int8 *)(v14 + 1032);
  WFLogForCategory(0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v25 = v23 == 0;
  else
    v25 = 1;
  v26 = !v25;
  if (v22)
  {
    if (v26)
    {
      v27 = v23;
      if (os_log_type_enabled(v27, v24))
      {
        v28 = *(const char **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v223 = v28;
        v224 = 2112;
        *(_QWORD *)v225 = v29;
        _os_log_impl(&dword_2196CC000, v27, v24, "table view update in progress, pending network update to '%@' current network='%@'", buf, 0x16u);

      }
    }

    v30 = -[WFPendingNetworkUpdate initWithNetwork:]([WFPendingNetworkUpdate alloc], "initWithNetwork:", *(_QWORD *)(a1 + 40));
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(void **)(v31 + 1192);
    *(_QWORD *)(v31 + 1192) = v30;

    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v33 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v33))
      goto LABEL_51;
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1192);
    *(_DWORD *)buf = 136315394;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v224 = 2112;
    *(_QWORD *)v225 = v34;
    v17 = "%s: pending network update initialized %@";
    v18 = v15;
    v19 = v33;
    v20 = 22;
    goto LABEL_44;
  }
  if (v26)
  {
    v39 = v23;
    if (os_log_type_enabled(v39, v24))
    {
      objc_msgSend(*(id *)(a1 + 48), "ssid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ssid");
      v216 = v12;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      __WFNetworkListNetworkChangeReasonToString(*(_QWORD *)(a1 + 56));
      v42 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      v224 = 2112;
      *(_QWORD *)v225 = v40;
      *(_WORD *)&v225[8] = 2112;
      v226 = (uint64_t)v41;
      v227 = 1024;
      *(_DWORD *)v228 = v21;
      v228[2] = 2112;
      *(_QWORD *)&v228[3] = v42;
      _os_log_impl(&dword_2196CC000, v39, v24, "%s: old: %@ new: %@ powered: %d reason: %@", buf, 0x30u);

      v12 = v216;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "beginUpdates");

  v44 = *(void **)(a1 + 40);
  if (!v44)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v50 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v50))
      goto LABEL_66;
    *(_DWORD *)buf = 136315138;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v51 = "%s: current network is nil";
    goto LABEL_65;
  }
  if (objc_msgSend(v44, "isAdhoc"))
  {
    objc_msgSend(*(id *)(a1 + 32), "adhocNetworks");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(*(id *)(a1 + 32), "adhocNetworks");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v46, "indexOfObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "sections");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = &unk_24DB59608;
      goto LABEL_78;
    }
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v50 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v50))
    {
LABEL_66:

      goto LABEL_140;
    }
    *(_DWORD *)buf = 136315138;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v51 = "%s: no adhoc networks";
LABEL_65:
    _os_log_impl(&dword_2196CC000, v15, v50, v51, buf, 0xCu);
    goto LABEL_66;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isUnconfiguredAccessory"))
  {
    objc_msgSend(*(id *)(a1 + 32), "unconfiguredNetworks");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
      WFLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v50))
        goto LABEL_66;
      *(_DWORD *)buf = 136315138;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      v51 = "%s: no unconfigured networks";
      goto LABEL_65;
    }
    objc_msgSend(*(id *)(a1 + 32), "unconfiguredNetworks");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v53, "indexOfObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "sections");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    v49 = &unk_24DB59620;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isPopular"))
  {
    objc_msgSend(*(id *)(a1 + 32), "popularNetworks");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      WFLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v50))
        goto LABEL_66;
      *(_DWORD *)buf = 136315138;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      v51 = "%s: no popular networks";
      goto LABEL_65;
    }
    objc_msgSend(*(id *)(a1 + 32), "popularNetworks");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v55, "indexOfObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "sections");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    v49 = &unk_24DB59638;
  }
  else
  {
    v56 = objc_msgSend(*(id *)(a1 + 40), "isKnown");
    v57 = *(void **)(a1 + 32);
    if (v56)
    {
      objc_msgSend(v57, "knownNetworks");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v58)
      {
        WFLogForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        v50 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v50))
          goto LABEL_66;
        *(_DWORD *)buf = 136315138;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v51 = "%s: no known networks";
        goto LABEL_65;
      }
      objc_msgSend(*(id *)(a1 + 32), "knownNetworks");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v59, "indexOfObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "sections");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = &unk_24DB59650;
    }
    else
    {
      objc_msgSend(v57, "infraNetworks");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
      {
        WFLogForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        v50 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v15 || !os_log_type_enabled(v15, v50))
          goto LABEL_66;
        *(_DWORD *)buf = 136315138;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v51 = "%s: no infrastructure networks";
        goto LABEL_65;
      }
      objc_msgSend(*(id *)(a1 + 32), "infraNetworks");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v61, "indexOfObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "sections");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = &unk_24DB59668;
    }
  }
LABEL_78:
  v62 = objc_msgSend(v47, "indexOfObject:", v49);

  WFLogForCategory(0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v65 = v63 == 0;
  else
    v65 = 1;
  v66 = !v65;
  if (v62 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v66)
    {
      v72 = v12;
      v73 = v63;
      if (os_log_type_enabled(v73, v64))
      {
        v74 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2114;
        *(_QWORD *)v225 = v74;
        *(_WORD *)&v225[8] = 2050;
        v226 = v62;
        v227 = 2050;
        *(_QWORD *)v228 = v15;
        _os_log_impl(&dword_2196CC000, v73, v64, "%s: can't find new current network in data %{public}@ (%{public}lu,%{public}lu)", buf, 0x2Au);
      }

      v12 = v72;
    }

    objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
  }
  else
  {
    if (v66)
    {
      v217 = v12;
      v67 = v63;
      if (os_log_type_enabled(v67, v64))
      {
        objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", v62);
        v68 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v68;
        *(_WORD *)&v225[8] = 2048;
        v226 = v62;
        v227 = 2048;
        *(_QWORD *)v228 = v15;
        _os_log_impl(&dword_2196CC000, v67, v64, "%s: removing from section %@ (%lu) at row %lu", buf, 0x2Au);

      }
      v12 = v217;
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingNetworks");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v69, "mutableCopy");

    -[NSObject removeObject:](v15, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1200), v15);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032))
    {
      WFLogForCategory(0);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v70 && os_log_type_enabled(v70, v71))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2196CC000, v70, v71, "table is updating while setting the current network", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
      goto LABEL_51;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isAdhoc"))
    {
      v75 = v12;
      WFLogForCategory(0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v76)
      {
        v78 = v76;
        if (os_log_type_enabled(v78, v77))
        {
          *(_DWORD *)buf = 136315138;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v78, v77, "%s: removing from adhoc", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "adhocNetworks");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend(v79, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 32), "adhocNetworks");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v81, "mutableCopy");

      objc_msgSend(v80, "removeObject:", *(_QWORD *)(a1 + 40));
      v83 = *(void **)(a1 + 32);
      objc_msgSend(v83, "sections");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "indexOfObject:", &unk_24DB59608);
      v86 = v83;
      v87 = v80;
      v88 = v82;
      v89 = 4;
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isUnconfiguredAccessory"))
    {
      v75 = v12;
      WFLogForCategory(0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v90)
      {
        v92 = v90;
        if (os_log_type_enabled(v92, v91))
        {
          *(_DWORD *)buf = 136315138;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v92, v91, "%s: removing from accessory", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "unconfiguredNetworks");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend(v93, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 32), "unconfiguredNetworks");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v94, "mutableCopy");

      objc_msgSend(v80, "removeObject:", *(_QWORD *)(a1 + 40));
      v95 = *(void **)(a1 + 32);
      objc_msgSend(v95, "sections");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "indexOfObject:", &unk_24DB59620);
      v86 = v95;
      v87 = v80;
      v88 = v82;
      v89 = 5;
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isPopular"))
    {
      v75 = v12;
      WFLogForCategory(0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v96)
      {
        v98 = v96;
        if (os_log_type_enabled(v98, v97))
        {
          *(_DWORD *)buf = 136315138;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v98, v97, "%s: removing from popular", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "popularNetworks");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend(v99, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 32), "popularNetworks");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v100, "mutableCopy");

      objc_msgSend(v80, "removeObject:", *(_QWORD *)(a1 + 40));
      v101 = *(void **)(a1 + 32);
      objc_msgSend(v101, "sections");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "indexOfObject:", &unk_24DB59638);
      v86 = v101;
      v87 = v80;
      v88 = v82;
      v89 = 2;
    }
    else
    {
      v102 = objc_msgSend(*(id *)(a1 + 40), "isKnown");
      WFLogForCategory(0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel())
        v105 = v103 == 0;
      else
        v105 = 1;
      v106 = !v105;
      v75 = v12;
      if (v102)
      {
        if (v106)
        {
          v107 = v103;
          if (os_log_type_enabled(v107, v104))
          {
            *(_DWORD *)buf = 136315138;
            v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            _os_log_impl(&dword_2196CC000, v107, v104, "%s: removing from known", buf, 0xCu);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "knownNetworks");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)objc_msgSend(v108, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 32), "knownNetworks");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v109, "mutableCopy");

        objc_msgSend(v80, "removeObject:", *(_QWORD *)(a1 + 40));
        v110 = *(void **)(a1 + 32);
        objc_msgSend(v110, "sections");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "indexOfObject:", &unk_24DB59650);
        v86 = v110;
        v87 = v80;
        v88 = v82;
        v89 = 1;
      }
      else
      {
        if (v106)
        {
          v111 = v103;
          if (os_log_type_enabled(v111, v104))
          {
            *(_DWORD *)buf = 136315138;
            v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            _os_log_impl(&dword_2196CC000, v111, v104, "%s: removing from infra", buf, 0xCu);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "infraNetworks");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)objc_msgSend(v112, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 32), "infraNetworks");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v113, "mutableCopy");

        objc_msgSend(v80, "removeObject:", *(_QWORD *)(a1 + 40));
        v114 = *(void **)(a1 + 32);
        objc_msgSend(v114, "sections");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "indexOfObject:", &unk_24DB59668);
        v86 = v114;
        v87 = v80;
        v88 = v82;
        v89 = 3;
      }
    }
    objc_msgSend(v86, "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v87, v88, v85, 0, v89);

    v12 = v75;
  }
LABEL_140:
  v115 = *(_QWORD *)(a1 + 32);
  v116 = 0x255092000uLL;
  if (!v21)
  {
    if (*(_BYTE *)(v115 + 1035))
      goto LABEL_232;
    if (*(_QWORD *)(a1 + 40))
      goto LABEL_232;
    v130 = *(void **)(v115 + 1048);
    if (!v130 || !objc_msgSend(v130, "canBeDisplayedAsCurrent"))
      goto LABEL_232;
    if (objc_msgSend(*(id *)(a1 + 32), "showDiagnosticsCell"))
      v131 = 2;
    else
      v131 = 1;
    v132 = objc_msgSend(*(id *)(a1 + 32), "rowCountWithPlacardCell:", v131);
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v133, "indexOfObject:", &unk_24DB59680);

    WFLogForCategory(0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v135)
    {
      v137 = v135;
      if (os_log_type_enabled(v137, v136))
      {
        objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", v134);
        v138 = v12;
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v139;
        *(_WORD *)&v225[8] = 2048;
        v226 = v134;
        v227 = 2048;
        *(_QWORD *)v228 = v132;
        _os_log_impl(&dword_2196CC000, v137, v136, "%s: not powered, removing current network cell at section: %@ (%lu) row: %lu", buf, 0x2Au);

        v12 = v138;
      }

      v116 = 0x255092000uLL;
    }

    if (v134 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v132, v134);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "cellForRowAtIndexPath:", v176);
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      if (v178)
      {
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v179 = objc_claimAutoreleasedReturnValue();
        v218 = v176;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v218, 1);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject deleteRowsAtIndexPaths:withRowAnimation:](v179, "deleteRowsAtIndexPaths:withRowAnimation:", v180, 100);

      }
      else
      {
        WFLogForCategory(0);
        v179 = objc_claimAutoreleasedReturnValue();
        v215 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v179 && os_log_type_enabled(v179, (os_log_type_t)v215))
        {
          *(_DWORD *)buf = 136315138;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v179, (os_log_type_t)v215, "%s: Tried to delete current network row when not it wasn't visible", buf, 0xCu);
        }
      }

      goto LABEL_232;
    }
    WFLogForCategory(0);
    v127 = objc_claimAutoreleasedReturnValue();
    v140 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v127 || !os_log_type_enabled(v127, v140))
      goto LABEL_227;
    *(_DWORD *)buf = 136315138;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v141 = v127;
    v142 = v140;
LABEL_196:
    _os_log_impl(&dword_2196CC000, v141, v142, "%s: WFAirportSectionPower section not found", buf, 0xCu);
LABEL_227:

    objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
    goto LABEL_232;
  }
  if (*(_BYTE *)(v115 + 1035))
    goto LABEL_142;
  objc_msgSend((id)v115, "currentNetwork");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v143 && (objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent") & 1) != 0)
    goto LABEL_307;
  objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
  v15 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject canBeDisplayedAsCurrent](v15, "canBeDisplayedAsCurrent"))
  {

    goto LABEL_142;
  }
  v145 = objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent");

  if (v145)
  {
LABEL_307:
    if (objc_msgSend(*(id *)(a1 + 32), "showDiagnosticsCell"))
      v146 = 2;
    else
      v146 = 1;
    v147 = objc_msgSend(*(id *)(a1 + 32), "rowCountWithPlacardCell:", v146);
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "indexOfObject:", &unk_24DB59680);

    WFLogForCategory(0);
    v127 = objc_claimAutoreleasedReturnValue();
    v150 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v151 = v127 == 0;
    else
      v151 = 1;
    v152 = !v151;
    if (v149 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v152)
      {
        v153 = v127;
        if (os_log_type_enabled(v153, v150))
        {
          objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", v149);
          v154 = v12;
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          v224 = 2112;
          *(_QWORD *)v225 = v155;
          *(_WORD *)&v225[8] = 2048;
          v226 = v149;
          v227 = 2048;
          *(_QWORD *)v228 = v147;
          _os_log_impl(&dword_2196CC000, v153, v150, "%s: inserting into section: %@ (%lu) row: %lu", buf, 0x2Au);

          v12 = v154;
        }

        v116 = 0x255092000;
      }

      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v147, v149);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = v157;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v221, 1);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "insertRowsAtIndexPaths:withRowAnimation:", v158, 3);

LABEL_205:
      objc_msgSend(*(id *)(a1 + 32), "setUserAutoJoinEnabled:", 1);
      goto LABEL_232;
    }
    if (!v152 || !os_log_type_enabled(v127, v150))
      goto LABEL_227;
    *(_DWORD *)buf = 136315138;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
    v141 = v127;
    v142 = v150;
    goto LABEL_196;
  }
LABEL_142:
  v117 = *(_BYTE **)(a1 + 32);
  if (!v117[1035])
  {
    v144 = *(_QWORD *)(a1 + 40);
    if (v144)
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent") & 1) != 0)
        goto LABEL_143;
    }
    else
    {
      objc_msgSend(v117, "currentNetwork");
      v15 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject canBeDisplayedAsCurrent](v15, "canBeDisplayedAsCurrent"))
      {

        goto LABEL_212;
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent") & 1) != 0)
      {

        goto LABEL_143;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend(v162, "canBeDisplayedAsCurrent");

    if (v144)
    {
      if (!v163)
        goto LABEL_143;
    }
    else
    {

      if ((v163 & 1) == 0)
        goto LABEL_143;
    }
LABEL_212:
    if (objc_msgSend(*(id *)(a1 + 32), "showDiagnosticsCell"))
      v164 = 2;
    else
      v164 = 1;
    v165 = objc_msgSend(*(id *)(a1 + 32), "rowCountWithPlacardCell:", v164);
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v166, "indexOfObject:", &unk_24DB59680);

    WFLogForCategory(0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v168)
    {
      v170 = v168;
      if (os_log_type_enabled(v170, v169))
      {
        objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", v167);
        v171 = v12;
        v172 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v172;
        *(_WORD *)&v225[8] = 2048;
        v226 = v167;
        v227 = 2048;
        *(_QWORD *)v228 = v165;
        _os_log_impl(&dword_2196CC000, v170, v169, "%s: removing from section: %@ (%lu) row: %lu", buf, 0x2Au);

        v12 = v171;
      }

      v116 = 0x255092000;
    }

    if (v167 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v165, v167);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = v174;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v220, 1);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "deleteRowsAtIndexPaths:withRowAnimation:", v175, 100);

      goto LABEL_232;
    }
    WFLogForCategory(0);
    v127 = objc_claimAutoreleasedReturnValue();
    v128 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v127)
      goto LABEL_227;
    v129 = v127;
    if (!os_log_type_enabled(v129, v128))
      goto LABEL_226;
    *(_DWORD *)buf = 136315138;
    v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
LABEL_225:
    _os_log_impl(&dword_2196CC000, v129, v128, "%s: WFAirportSectionPower section not found", buf, 0xCu);
LABEL_226:

    goto LABEL_227;
  }
LABEL_143:
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1035)
    && objc_msgSend(*(id *)(a1 + 40), "canBeDisplayedAsCurrent"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "showDiagnosticsCell"))
      v118 = 2;
    else
      v118 = 1;
    v119 = objc_msgSend(*(id *)(a1 + 32), "rowCountWithPlacardCell:", v118);
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "indexOfObject:", &unk_24DB59680);

    WFLogForCategory(0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v122)
    {
      v124 = v122;
      if (os_log_type_enabled(v124, v123))
      {
        objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", v121);
        v125 = v12;
        v126 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
        v224 = 2112;
        *(_QWORD *)v225 = v126;
        *(_WORD *)&v225[8] = 2048;
        v226 = v121;
        v227 = 2048;
        *(_QWORD *)v228 = v119;
        _os_log_impl(&dword_2196CC000, v124, v123, "%s: reloading at section: %@ (%lu) row: %lu", buf, 0x2Au);

        v12 = v125;
      }

      v116 = 0x255092000;
    }

    if (v121 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WFLogForCategory(0);
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v127)
        goto LABEL_227;
      v129 = v127;
      if (!os_log_type_enabled(v129, v128))
        goto LABEL_226;
      *(_DWORD *)buf = 136315138;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      goto LABEL_225;
    }
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v119, v121);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = v160;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v219, 1);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "reloadRowsAtIndexPaths:withRowAnimation:", v161, 100);

    goto LABEL_205;
  }
LABEL_232:
  WFLogForCategory(0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v181)
  {
    v183 = v181;
    if (os_log_type_enabled(v183, v182))
    {
      v184 = objc_msgSend(*(id *)(a1 + 32), "askToJoinShown");
      *(_DWORD *)buf = 136315650;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      v224 = 1024;
      *(_DWORD *)v225 = v12;
      *(_WORD *)&v225[4] = 1024;
      *(_DWORD *)&v225[6] = v184;
      _os_log_impl(&dword_2196CC000, v183, v182, "%s: atjShownStateDidChange %d askToJoinShown %d", buf, 0x18u);
    }

  }
  v185 = *(_BYTE **)(a1 + 32);
  if (v185[1035])
    v186 = 0;
  else
    v186 = v12;
  if (v186 == 1)
  {
    objc_msgSend(v185, "sections");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = (void *)objc_msgSend(v187, "mutableCopy");

    if (objc_msgSend(*(id *)(a1 + 32), "askToJoinShown"))
    {
      objc_msgSend(v188, "addObject:", &unk_24DB59698);
      objc_msgSend(*(id *)(a1 + 32), "setSections:", v188);
      v189 = objc_msgSend(v188, "indexOfObject:", &unk_24DB59698);
      if (v189 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_266;
      v190 = v189;
      if (v189 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "count"))
        goto LABEL_266;
      WFLogForCategory(0);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v191)
      {
        v193 = v191;
        if (os_log_type_enabled(v193, v192))
        {
          *(_DWORD *)buf = 136315394;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          v224 = 2048;
          *(_QWORD *)v225 = v190;
          _os_log_impl(&dword_2196CC000, v193, v192, "%s: inserting section at %lu", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v190);
      v195 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "insertSections:withRowAnimation:", v195, 3);
    }
    else
    {
      v196 = *(_BYTE **)(a1 + 32);
      if (v196[1035])
      {
LABEL_266:

        v185 = *(_BYTE **)(a1 + 32);
        goto LABEL_267;
      }
      objc_msgSend(v196, "sections");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = objc_msgSend(v197, "indexOfObject:", &unk_24DB59698);

      objc_msgSend(v188, "removeObject:", &unk_24DB59698);
      objc_msgSend(*(id *)(a1 + 32), "setSections:", v188);
      if (v198 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend(*(id *)(a1 + 32), "sections"),
            v199 = (void *)objc_claimAutoreleasedReturnValue(),
            v200 = objc_msgSend(v199, "count"),
            v199,
            v198 >= v200))
      {
        WFLogForCategory(0);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() < 4 || !v194)
          goto LABEL_265;
        v195 = v194;
        if (os_log_type_enabled(v195, v204))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2196CC000, v195, v204, "ATJ seciton is already deleted", buf, 2u);
        }
        v194 = v195;
      }
      else
      {
        WFLogForCategory(0);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v202 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v201)
        {
          v203 = v201;
          if (os_log_type_enabled(v203, v202))
          {
            *(_DWORD *)buf = 136315394;
            v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
            v224 = 2048;
            *(_QWORD *)v225 = v198;
            _os_log_impl(&dword_2196CC000, v203, v202, "%s: removing section at %lu", buf, 0x16u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v198);
        v195 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "deleteSections:withRowAnimation:", v195, 0);
      }
    }

LABEL_265:
    goto LABEL_266;
  }
LABEL_267:
  objc_storeStrong((id *)&v185[*(int *)(v116 + 3560)], *(id *)(a1 + 40));
  WFLogForCategory(0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v205)
  {
    v207 = v205;
    if (os_log_type_enabled(v207, v206))
    {
      v208 = *(void **)(a1 + 40);
      v209 = objc_msgSend(v208, "hash");
      *(_DWORD *)buf = 136315650;
      v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
      v224 = 2112;
      *(_QWORD *)v225 = v208;
      *(_WORD *)&v225[8] = 2048;
      v226 = v209;
      _os_log_impl(&dword_2196CC000, v207, v206, "%s: currentNetwork %@ (%lu)", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "endUpdates");

  if (*(_QWORD *)(a1 + 56) == 1)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1035))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v15, "postNotificationName:object:", CFSTR("networkListScrollToTopNotification"), 0);
    }
    else
    {
      WFLogForCategory(0);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v211)
      {
        v213 = v211;
        if (os_log_type_enabled(v213, v212))
        {
          *(_DWORD *)buf = 136315138;
          v223 = "-[WFAirportViewController setCurrentNetwork:previousNetwork:reason:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v213, v212, "%s: scrolling to top", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject scrollToRowAtIndexPath:atScrollPosition:animated:](v15, "scrollToRowAtIndexPath:atScrollPosition:animated:", v214, 1, 1);

    }
    goto LABEL_51;
  }
LABEL_52:

}

- (void)setCurrentNetworkSubtitle:(id)a3
{
  NSString *v4;
  NSObject *v5;
  os_log_type_t v6;
  NSString *currentNetworkSubtitle;
  NSString *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2196CC000, v5, v6, "Not setting current network subtitle in edit mode", (uint8_t *)&v19, 2u);
    }
LABEL_26:

    goto LABEL_27;
  }
  currentNetworkSubtitle = self->_currentNetworkSubtitle;
  if (currentNetworkSubtitle != v4)
  {
    if (v4)
    {
      v8 = (NSString *)-[NSString copy](v4, "copy");
      currentNetworkSubtitle = self->_currentNetworkSubtitle;
    }
    else
    {
      v8 = 0;
    }
    self->_currentNetworkSubtitle = v8;

    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v19 = 138412290;
      v20 = (const char *)v4;
      _os_log_impl(&dword_2196CC000, v9, v10, "Setting current network subtitle: %@", (uint8_t *)&v19, 0xCu);
    }

    -[WFAirportViewController currentNetworkRowConfig](self, "currentNetworkRowConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubtitle:", v4);

    -[WFAirportViewController _currentNetworkCell](self, "_currentNetworkCell");
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v12)
    {
      if (self->_currentNetworkSubtitle)
      {
        -[NSObject setSubtitle:](v12, "setSubtitle:");
      }
      else
      {
        -[WFAirportViewController currentNetwork](self, "currentNetwork");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "subtitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSubtitle:](v5, "setSubtitle:", v16);

      }
      -[WFAirportViewController listDelegate](self, "listDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:", self);

      if (v18)
      {
        -[NSObject setConnectionError:](v5, "setConnectionError:", 1);
      }
      else
      {
        -[NSObject setConnectionError:](v5, "setConnectionError:", 0);
        -[NSObject setBars:](v5, "setBars:", WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI));
      }
    }
    else
    {
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        v19 = 136315138;
        v20 = "-[WFAirportViewController setCurrentNetworkSubtitle:]";
        _os_log_impl(&dword_2196CC000, v13, v14, "%s: nil currentNetwork cell", (uint8_t *)&v19, 0xCu);
      }

    }
    goto LABEL_26;
  }
LABEL_27:

}

- (void)setScanning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[WFAirportViewController chooseNetworkHeader](self, "chooseNetworkHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "animating");

  if (v6 != v3)
  {
    -[WFAirportViewController chooseNetworkHeader](self, "chooseNetworkHeader");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimating:", v3);

  }
}

- (BOOL)_refreshATJShownStateIfChanged
{
  void *v3;
  int v4;
  int askToJoinShown;

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "airportSettingsViewControllerAskToJoinMode:", self) != -1;
  askToJoinShown = self->_askToJoinShown;
  if (askToJoinShown != v4)
    self->_askToJoinShown = objc_msgSend(v3, "airportSettingsViewControllerAskToJoinMode:", self) != -1;

  return askToJoinShown != v4;
}

- (void)setNetworks:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFAirportViewController_setNetworks___block_invoke;
  block[3] = &unk_24DB37418;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __39__WFAirportViewController_setNetworks___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  const char *v4;
  id v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  os_log_type_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  os_log_type_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  os_log_type_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  os_log_type_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  os_log_type_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  os_log_type_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  os_log_type_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  os_log_type_t v90;
  NSObject *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  os_log_type_t v97;
  unint64_t i;
  void *v99;
  _BYTE *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  void *v106;
  void *v107;
  os_log_type_t v108;
  NSObject *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  os_log_type_t v120;
  NSObject *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  os_log_type_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  os_log_type_t v134;
  void *v135;
  NSObject *v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  os_log_type_t v140;
  void *v141;
  int v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  os_log_type_t v152;
  void *v153;
  NSObject *v154;
  uint64_t v155;
  os_log_type_t v156;
  void *v157;
  void *v158;
  os_log_type_t v159;
  void *v160;
  NSObject *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  NSObject *v167;
  os_log_type_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  os_log_type_t v174;
  void *v175;
  NSObject *v176;
  uint64_t v177;
  os_log_type_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  uint64_t v185;
  int v186;
  void *v187;
  os_log_type_t v188;
  uint64_t v189;
  int v190;
  void *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  os_log_type_t v199;
  NSObject *v200;
  uint64_t v201;
  os_log_type_t v202;
  void *v203;
  void *v204;
  int v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  os_log_type_t v210;
  void *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  os_log_type_t v216;
  void *v217;
  NSObject *v218;
  os_log_type_t v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  NSObject *v225;
  NSObject *log;
  int loga;
  NSObject *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  int v240;
  void *v241;
  uint8_t buf[4];
  const char *v243;
  __int16 v244;
  uint64_t v245;
  __int16 v246;
  uint64_t v247;
  uint64_t v248;

  v248 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "powered") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isInEditingMode"))
    {
      WFLogForCategory(0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v2 || !os_log_type_enabled(v2, v3))
        goto LABEL_217;
      *(_WORD *)buf = 0;
      v4 = "In Editing mode, not updating table";
      goto LABEL_11;
    }
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_setNetworks_, *(_QWORD *)(a1 + 40), 0);
      return;
    }
    v2 = *(id *)(a1 + 40);
    v5 = -[NSObject copy](v2, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setAllNetworks:", v5);

    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
        v244 = 2112;
        v245 = (uint64_t)v9;
        _os_log_impl(&dword_2196CC000, v8, v7, "%s: current network: %@", buf, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "canBeDisplayedAsCurrent");

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v2);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentNetwork");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v14, "addObject:", v15);

        v2 = v14;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1200), v2);
    -[NSObject knownNetworks](v2, "knownNetworks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      WFLogForCategory(0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v17)
      {
        v19 = v17;
        if (os_log_type_enabled(v19, v18))
        {
          v20 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 136315394;
          v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
          v244 = 2048;
          v245 = v20;
          _os_log_impl(&dword_2196CC000, v19, v18, "%s: known network count: %lu", buf, 0x16u);
        }

      }
      objc_msgSend(v16, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      WFScanRecordAlphaSortCompartor();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sortedArrayUsingComparator:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v23, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144)) & 1) == 0)
      {
        v36 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v36 + 1032))
        {
          objc_storeStrong((id *)(v36 + 1200), v2);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
        }
        else
        {
          WFLogForCategory(0);
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v64 && os_log_type_enabled(v64, v65))
          {
            *(_DWORD *)buf = 136315394;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v16;
            _os_log_impl(&dword_2196CC000, v64, v65, "%s: known networks %@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 32), "sections");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "containsObject:", &unk_24DB59650);

          if ((v67 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "sections");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)objc_msgSend(v68, "mutableCopy");

            v70 = objc_msgSend(v69, "indexOfObject:", &unk_24DB59680);
            if (v70 == 0x7FFFFFFFFFFFFFFFLL)
              v71 = 0;
            else
              v71 = v70 + 1;
            objc_msgSend(v69, "insertObject:atIndex:", &unk_24DB59650, v71);
            objc_msgSend(*(id *)(a1 + 32), "setSections:", v69);
            WFLogForCategory(0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v72)
            {
              v234 = v23;
              v74 = v16;
              v75 = v72;
              if (os_log_type_enabled(v75, v73))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 1);
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = (uint64_t)v237;
                v246 = 2048;
                v247 = v71;
                _os_log_impl(&dword_2196CC000, v75, v73, "%s: inserting section %@ (at index %lu)", buf, 0x20u);

              }
              v16 = v74;
              v23 = v234;
            }

          }
          v76 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "copy");
          v77 = *(void **)(a1 + 32);
          objc_msgSend(v77, "sections");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v23, v76, objc_msgSend(v78, "indexOfObject:", &unk_24DB59650), v67 ^ 1u, 1);

        }
        goto LABEL_216;
      }
      WFLogForCategory(0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v24)
      {
        v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          v27 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "count");
          *(_DWORD *)buf = 136315394;
          v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
          v244 = 2048;
          v245 = v27;
          _os_log_impl(&dword_2196CC000, v26, v25, "%s: no change to known (count: %lu)", buf, 0x16u);
        }

      }
    }
    else
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(void **)(v28 + 1144);
      if (!v29)
        goto LABEL_52;
      *(_QWORD *)(v28 + 1144) = 0;

      objc_msgSend(*(id *)(a1 + 32), "sections");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v30, "mutableCopy");

      v31 = objc_msgSend(v23, "indexOfObject:", &unk_24DB59650);
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        WFLogForCategory(0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v32)
        {
          v34 = v32;
          if (os_log_type_enabled(v34, v33))
          {
            objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v35;
            _os_log_impl(&dword_2196CC000, v34, v33, "%s: %@ section does not exist in sections", buf, 0x16u);

          }
        }

        objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
      }
      else
      {
        v37 = v31;
        objc_msgSend(v23, "removeObject:", &unk_24DB59650);
        objc_msgSend(*(id *)(a1 + 32), "setSections:", v23);
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "deleteSections:withRowAnimation:", v39, 0);

        WFLogForCategory(0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v40)
        {
          v42 = v40;
          if (os_log_type_enabled(v42, v41))
          {
            objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v43;
            v246 = 2048;
            v247 = v37;
            _os_log_impl(&dword_2196CC000, v42, v41, "%s: removing section %@ (index %lu)", buf, 0x20u);

          }
        }

      }
    }

LABEL_52:
    -[NSObject popularNetworks](v2, "popularNetworks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      WFLogForCategory(0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v44)
      {
        v46 = v44;
        if (os_log_type_enabled(v46, v45))
        {
          v47 = objc_msgSend(v23, "count");
          *(_DWORD *)buf = 136315394;
          v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
          v244 = 2048;
          v245 = v47;
          _os_log_impl(&dword_2196CC000, v46, v45, "%s: popular network count: %lu", buf, 0x16u);
        }

      }
      objc_msgSend(v23, "allObjects");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      WFScanRecordAlphaSortCompartor();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "sortedArrayUsingComparator:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v50, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136)) & 1) == 0)
      {
        v63 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v63 + 1032))
        {
          objc_storeStrong((id *)(v63 + 1200), v2);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
        }
        else
        {
          WFLogForCategory(0);
          v139 = objc_claimAutoreleasedReturnValue();
          v140 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v139 && os_log_type_enabled(v139, v140))
          {
            *(_DWORD *)buf = 136315394;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v23;
            _os_log_impl(&dword_2196CC000, v139, v140, "%s: popular networks %@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 32), "sections");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = objc_msgSend(v141, "containsObject:", &unk_24DB59638);

          if ((v142 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "sections");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = (void *)objc_msgSend(v143, "mutableCopy");

            v145 = objc_msgSend(v144, "indexOfObject:", &unk_24DB59650);
            if (v145 == 0x7FFFFFFFFFFFFFFFLL)
              v146 = objc_msgSend(v144, "indexOfObject:", &unk_24DB59668);
            else
              v146 = v145 + 1;
            v240 = v146;
            objc_msgSend(v144, "insertObject:atIndex:", &unk_24DB59638, v146);
            objc_msgSend(*(id *)(a1 + 32), "setSections:", v144);
            WFLogForCategory(0);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v215)
            {
              v233 = v50;
              v236 = v23;
              v217 = v16;
              v218 = v215;
              v219 = v216;
              if (os_log_type_enabled(v218, v216))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 2);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = (uint64_t)v220;
                v246 = 1024;
                LODWORD(v247) = v240;
                _os_log_impl(&dword_2196CC000, v218, v219, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);

              }
              v16 = v217;
              v50 = v233;
              v23 = v236;
            }

          }
          v221 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "copy");
          v222 = *(void **)(a1 + 32);
          objc_msgSend(v222, "sections");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v50, v221, objc_msgSend(v223, "indexOfObject:", &unk_24DB59638), v142 ^ 1u, 2);

        }
        goto LABEL_215;
      }
      WFLogForCategory(0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v51)
      {
        v53 = v51;
        if (os_log_type_enabled(v53, v52))
        {
          v54 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "count");
          *(_DWORD *)buf = 136315394;
          v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
          v244 = 2048;
          v245 = v54;
          _os_log_impl(&dword_2196CC000, v53, v52, "%s: no change to popular (count: %lu)", buf, 0x16u);
        }

      }
    }
    else
    {
      v55 = *(_QWORD *)(a1 + 32);
      v56 = *(void **)(v55 + 1136);
      if (!v56)
        goto LABEL_97;
      *(_QWORD *)(v55 + 1136) = 0;

      objc_msgSend(*(id *)(a1 + 32), "sections");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v57, "mutableCopy");

      v58 = objc_msgSend(v50, "indexOfObject:", &unk_24DB59638);
      if (v58 == 0x7FFFFFFFFFFFFFFFLL)
      {
        WFLogForCategory(0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v59)
        {
          v61 = v59;
          if (os_log_type_enabled(v61, v60))
          {
            objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 2);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v62;
            _os_log_impl(&dword_2196CC000, v61, v60, "%s: %@ section does not exist in sections", buf, 0x16u);

          }
        }

        objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
      }
      else
      {
        v79 = v58;
        objc_msgSend(v50, "removeObject:", &unk_24DB59638);
        objc_msgSend(*(id *)(a1 + 32), "setSections:", v50);
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "deleteSections:withRowAnimation:", v81, 0);

        WFLogForCategory(0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v82)
        {
          v84 = v82;
          if (os_log_type_enabled(v84, v83))
          {
            objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 2);
            v85 = v16;
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
            v244 = 2112;
            v245 = (uint64_t)v86;
            v246 = 1024;
            LODWORD(v247) = v79;
            _os_log_impl(&dword_2196CC000, v84, v83, "%s: removing section %@ (index %d)", buf, 0x1Cu);

            v16 = v85;
          }

        }
      }
    }

LABEL_97:
    -[NSObject infrastructureNetworks](v2, "infrastructureNetworks");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "indexOfObject:", &unk_24DB59668);

    v235 = v23;
    if (objc_msgSend(v50, "count"))
    {
      WFLogForCategory(0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v89)
      {
        v91 = v89;
        if (os_log_type_enabled(v91, v90))
        {
          v92 = objc_msgSend(v50, "count");
          *(_DWORD *)buf = 136315394;
          v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
          v244 = 2048;
          v245 = v92;
          _os_log_impl(&dword_2196CC000, v91, v90, "%s: infraNetworks network count: %lu", buf, 0x16u);
        }

      }
      objc_msgSend(v50, "allObjects");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      WFScanRecordAlphaSortCompartor();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "sortedArrayUsingComparator:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v95, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128)) & 1) == 0)
      {
        v128 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v128 + 1032))
        {
          objc_storeStrong((id *)(v128 + 1200), v2);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
        }
        else
        {
          v147 = (void *)objc_msgSend(*(id *)(v128 + 1128), "copy");
          objc_msgSend(*(id *)(a1 + 32), "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v95, v147, v88, 0, 3);

        }
        goto LABEL_214;
      }
      WFLogForCategory(0);
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v96 && os_log_type_enabled(v96, v97))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2196CC000, v96, v97, "No change to infra section", buf, 2u);
      }
    }
    else
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128))
      {
LABEL_122:
        v114 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v114 + 1024))
        {
          v115 = objc_msgSend(*(id *)(v114 + 1128), "count");
          if (v88 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v115, v88);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "tableView");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v241 = v116;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v241, 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "reloadRowsAtIndexPaths:withRowAnimation:", v118, 5);

          }
        }
        -[NSObject adhocNetworks](v2, "adhocNetworks");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v95, "count"))
        {
          WFLogForCategory(0);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v119)
          {
            v121 = v119;
            if (os_log_type_enabled(v121, v120))
            {
              v122 = objc_msgSend(v95, "count");
              *(_DWORD *)buf = 136315394;
              v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
              v244 = 2048;
              v245 = v122;
              _os_log_impl(&dword_2196CC000, v121, v120, "%s: adhoc network count: %lu", buf, 0x16u);
            }

          }
          objc_msgSend(v95, "allObjects");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          WFScanRecordAlphaSortCompartor();
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "sortedArrayUsingComparator:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v125, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152)) & 1) == 0)
          {
            v138 = *(_QWORD *)(a1 + 32);
            if (*(_BYTE *)(v138 + 1032))
            {
              objc_storeStrong((id *)(v138 + 1200), v2);
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
            }
            else
            {
              v238 = (void *)objc_msgSend(*(id *)(v138 + 1152), "copy");
              objc_msgSend(*(id *)(a1 + 32), "sections");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              v182 = objc_msgSend(v181, "containsObject:", &unk_24DB59608);

              if ((v182 & 1) == 0)
              {
                v230 = v16;
                objc_msgSend(*(id *)(a1 + 32), "sections");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                v184 = (void *)objc_msgSend(v183, "mutableCopy");

                v185 = objc_msgSend(v184, "indexOfObject:", &unk_24DB59668);
                v186 = v185;
                objc_msgSend(v184, "insertObject:atIndex:", &unk_24DB59608, v185 + 1);
                objc_msgSend(*(id *)(a1 + 32), "setSections:", v184);
                WFLogForCategory(0);
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                v188 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v187)
                {
                  log = v187;
                  if (os_log_type_enabled(log, v188))
                  {
                    objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 4);
                    v189 = objc_claimAutoreleasedReturnValue();
                    v190 = v186;
                    v191 = (void *)v189;
                    *(_DWORD *)buf = 136315650;
                    v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                    v244 = 2112;
                    v245 = v189;
                    v246 = 1024;
                    LODWORD(v247) = v190 + 1;
                    _os_log_impl(&dword_2196CC000, log, v188, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);

                  }
                }

                v16 = v230;
                v23 = v235;
              }
              v192 = v182 ^ 1u;
              objc_msgSend(*(id *)(a1 + 32), "sections");
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              v194 = objc_msgSend(v193, "indexOfObject:", &unk_24DB59608);

              objc_msgSend(*(id *)(a1 + 32), "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v125, v238, v194, v192, 4);
            }
            goto LABEL_213;
          }
          WFLogForCategory(0);
          v126 = objc_claimAutoreleasedReturnValue();
          v127 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v126 && os_log_type_enabled(v126, v127))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2196CC000, v126, v127, "No change to adhoc section", buf, 2u);
          }

        }
        else
        {
          v129 = *(_QWORD *)(a1 + 32);
          v130 = *(void **)(v129 + 1152);
          if (!v130)
            goto LABEL_164;
          *(_QWORD *)(v129 + 1152) = 0;

          objc_msgSend(*(id *)(a1 + 32), "sections");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = (void *)objc_msgSend(v131, "mutableCopy");

          v132 = objc_msgSend(v125, "indexOfObject:", &unk_24DB59608);
          if (v132 == 0x7FFFFFFFFFFFFFFFLL)
          {
            WFLogForCategory(0);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v133)
            {
              v135 = v16;
              v136 = v133;
              if (os_log_type_enabled(v136, v134))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 4);
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = (uint64_t)v137;
                _os_log_impl(&dword_2196CC000, v136, v134, "%s: %@ section does not exist in sections", buf, 0x16u);

              }
              v16 = v135;
              v23 = v235;
            }

            objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
          }
          else
          {
            v148 = v132;
            objc_msgSend(v125, "removeObject:", &unk_24DB59608);
            objc_msgSend(*(id *)(a1 + 32), "setSections:", v125);
            objc_msgSend(*(id *)(a1 + 32), "tableView");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v148);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "deleteSections:withRowAnimation:", v150, 0);

            WFLogForCategory(0);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v151)
            {
              v153 = v16;
              v154 = v151;
              if (os_log_type_enabled(v154, v152))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 4);
                v155 = objc_claimAutoreleasedReturnValue();
                v156 = v152;
                v157 = (void *)v155;
                *(_DWORD *)buf = 136315650;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = v155;
                v246 = 1024;
                LODWORD(v247) = v148;
                _os_log_impl(&dword_2196CC000, v154, v156, "%s: removing section %@ (index %d)", buf, 0x1Cu);

              }
              v16 = v153;
              v23 = v235;
            }

          }
        }

LABEL_164:
        -[NSObject unconfiguredNetworks](v2, "unconfiguredNetworks");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v125, "count"))
        {
          WFLogForCategory(0);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v158)
          {
            v160 = v16;
            v161 = v158;
            if (os_log_type_enabled(v161, v159))
            {
              v162 = objc_msgSend(v125, "count");
              *(_DWORD *)buf = 136315394;
              v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
              v244 = 2048;
              v245 = v162;
              _os_log_impl(&dword_2196CC000, v161, v159, "%s: unconfigured network count: %lu", buf, 0x16u);
            }

            v16 = v160;
          }

          objc_msgSend(v125, "allObjects");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          WFScanRecordAlphaSortCompartor();
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "sortedArrayUsingComparator:", v164);
          v165 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v165, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160)) & 1) == 0)
          {
            v180 = *(_QWORD *)(a1 + 32);
            if (*(_BYTE *)(v180 + 1032))
            {
              objc_storeStrong((id *)(v180 + 1200), v2);
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
            }
            else
            {
              v232 = v16;
              v239 = (void *)objc_msgSend(*(id *)(v180 + 1160), "copy");
              objc_msgSend(*(id *)(a1 + 32), "sections");
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              v205 = objc_msgSend(v204, "containsObject:", &unk_24DB59620);

              if ((v205 & 1) == 0)
              {
                loga = v205;
                objc_msgSend(*(id *)(a1 + 32), "sections");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = (void *)objc_msgSend(v206, "mutableCopy");

                v208 = objc_msgSend(v207, "indexOfObject:", &unk_24DB59608);
                if (v208 == 0x7FFFFFFFFFFFFFFFLL)
                  v208 = objc_msgSend(v207, "indexOfObject:", &unk_24DB59668);
                objc_msgSend(v207, "insertObject:atIndex:", &unk_24DB59620, v208 + 1);
                objc_msgSend(*(id *)(a1 + 32), "setSections:", v207);
                WFLogForCategory(0);
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                v210 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v209)
                {
                  v225 = v209;
                  if (os_log_type_enabled(v225, v210))
                  {
                    objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 5);
                    v224 = v209;
                    v211 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315650;
                    v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                    v244 = 2112;
                    v245 = (uint64_t)v211;
                    v246 = 1024;
                    LODWORD(v247) = v208;
                    _os_log_impl(&dword_2196CC000, v225, v210, "%s: inserting section %@ (at index %d)", buf, 0x1Cu);

                    v209 = v224;
                  }

                }
                v205 = loga;
              }
              v212 = v205 ^ 1u;
              objc_msgSend(*(id *)(a1 + 32), "sections", v224);
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              v214 = objc_msgSend(v213, "indexOfObject:", &unk_24DB59620);

              objc_msgSend(*(id *)(a1 + 32), "_updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:", v165, v239, v214, v212, 5);
              v16 = v232;
              v23 = v235;
            }

            goto LABEL_213;
          }
          v166 = v16;
          WFLogForCategory(0);
          v167 = objc_claimAutoreleasedReturnValue();
          v168 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v167 && os_log_type_enabled(v167, v168))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2196CC000, v167, v168, "No change to unconfigured section", buf, 2u);
          }

          v16 = v166;
        }
        else
        {
          v169 = *(_QWORD *)(a1 + 32);
          v170 = *(void **)(v169 + 1160);
          if (!v170)
          {
LABEL_201:
            objc_msgSend(*(id *)(a1 + 32), "_processPendingCurrentNetworkUpdate");
LABEL_213:

LABEL_214:
LABEL_215:

LABEL_216:
            goto LABEL_217;
          }
          *(_QWORD *)(v169 + 1160) = 0;

          objc_msgSend(*(id *)(a1 + 32), "sections");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = (void *)objc_msgSend(v171, "mutableCopy");

          v172 = objc_msgSend(v165, "indexOfObject:", &unk_24DB59620);
          if (v172 == 0x7FFFFFFFFFFFFFFFLL)
          {
            WFLogForCategory(0);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v173)
            {
              v175 = v16;
              v176 = v173;
              if (os_log_type_enabled(v176, v174))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 5);
                v177 = objc_claimAutoreleasedReturnValue();
                v178 = v174;
                v179 = (void *)v177;
                *(_DWORD *)buf = 136315394;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = v177;
                _os_log_impl(&dword_2196CC000, v176, v178, "%s: %@ section does not exist in sections", buf, 0x16u);

              }
              v16 = v175;
              v23 = v235;
            }

            objc_msgSend(*(id *)(a1 + 32), "_dumpSections");
          }
          else
          {
            v195 = v172;
            v231 = v16;
            objc_msgSend(v165, "removeObject:", &unk_24DB59620);
            objc_msgSend(*(id *)(a1 + 32), "setSections:", v165);
            objc_msgSend(*(id *)(a1 + 32), "tableView");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v195);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "deleteSections:withRowAnimation:", v197, 0);

            WFLogForCategory(0);
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            v199 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v198)
            {
              v200 = v198;
              if (os_log_type_enabled(v200, v199))
              {
                objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 5);
                v201 = objc_claimAutoreleasedReturnValue();
                v202 = v199;
                v203 = (void *)v201;
                *(_DWORD *)buf = 136315650;
                v243 = "-[WFAirportViewController setNetworks:]_block_invoke";
                v244 = 2112;
                v245 = v201;
                v246 = 1024;
                LODWORD(v247) = v195;
                _os_log_impl(&dword_2196CC000, v200, v202, "%s: removing section %@ (index %d)", buf, 0x1Cu);

              }
            }

            v16 = v231;
            v23 = v235;
          }
        }

        goto LABEL_201;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "count"); ++i)
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, v88);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "addObject:", v99);

      }
      v100 = *(_BYTE **)(a1 + 32);
      if (!v100[1024])
      {
        objc_msgSend(v100, "tableView");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v228 = v2;
        v102 = v16;
        v103 = objc_msgSend(v101, "numberOfRowsInSection:", v88);
        v104 = objc_msgSend(v95, "count");

        v105 = v103 <= v104;
        v16 = v102;
        v2 = v228;
        if (!v105)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, v88);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "addObject:", v106);

        }
      }
      WFLogForCategory(0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v107)
      {
        v229 = v16;
        v109 = v107;
        if (os_log_type_enabled(v109, v108))
        {
          objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", 3);
          v110 = (char *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v95, "count");
          *(_DWORD *)buf = 138412546;
          v243 = v110;
          v244 = 2048;
          v245 = v111;
          _os_log_impl(&dword_2196CC000, v109, v108, "Section %@- Deleting %lu rows", buf, 0x16u);

        }
        v16 = v229;
      }

      v112 = *(_QWORD *)(a1 + 32);
      v113 = *(void **)(v112 + 1128);
      *(_QWORD *)(v112 + 1128) = 0;

      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v96 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteRowsAtIndexPaths:withRowAnimation:](v96, "deleteRowsAtIndexPaths:withRowAnimation:", v95, 0);
    }

    goto LABEL_122;
  }
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(2uLL);
  if ((unint64_t)WFCurrentLogLevel() < 2 || !v2 || !os_log_type_enabled(v2, v3))
    goto LABEL_217;
  *(_WORD *)buf = 0;
  v4 = "Tried to set networks while powered off...";
LABEL_11:
  _os_log_impl(&dword_2196CC000, v2, v3, v4, buf, 2u);
LABEL_217:

}

- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(unint64_t)a5 insertSection:(BOOL)a6 datasourceSection:(unint64_t)a7
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v55;
  void *v58;
  id obj;
  _QWORD v60[6];
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  unint64_t v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  unint64_t v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  __CFString *v87;
  _QWORD v88[5];
  uint8_t v89[4];
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  _BYTE buf[24];
  unint64_t v98;
  void (*v99)(uint64_t);
  __CFString *v100;
  uint64_t v101;

  v7 = a6;
  v101 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        -[WFAirportViewController _sectionNameAtIndex:](self, "_sectionNameAtIndex:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2048;
        v98 = a5;
        _os_log_impl(&dword_2196CC000, v13, v12, "%s: inserting section %@ at index %lu", buf, 0x20u);

      }
    }

    -[WFAirportViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSections:withRowAnimation:", v16, 0);

  }
  v58 = (void *)objc_msgSend(v10, "mutableCopy", a7);
  obj = (id)objc_msgSend(v9, "mutableCopy");
  if ((unint64_t)objc_msgSend(v10, "count") >= 2 && (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ssid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18 - 1;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v18 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ssid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "isEqualToString:", v23);

      if (v24)
        objc_msgSend(v58, "removeObjectAtIndex:", v18 - v17++);
      ++v18;
    }
    while (objc_msgSend(v10, "count") > (unint64_t)(v21 + 2));
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2 && (unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v25 = 0;
    v26 = 1;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ssid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v26 - 1;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v26 - 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "ssid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v28, "isEqualToString:", v31);

      if (v32)
        objc_msgSend(obj, "removeObjectAtIndex:", v26 - v25++);
      ++v26;
    }
    while (objc_msgSend(v9, "count") > (unint64_t)(v29 + 2));
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v98 = (unint64_t)__Block_byref_object_copy__0;
  v99 = __Block_byref_object_dispose__0;
  v33 = MEMORY[0x24BDAC760];
  v100 = &stru_24DB39F78;
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke;
  v88[3] = &unk_24DB37440;
  v88[4] = buf;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v88);
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__0;
  v86 = __Block_byref_object_dispose__0;
  v87 = &stru_24DB39F78;
  v81[0] = v33;
  v81[1] = 3221225472;
  v81[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2;
  v81[3] = &unk_24DB37440;
  v81[4] = &v82;
  objc_msgSend(obj, "enumerateObjectsUsingBlock:", v81);
  v34 = v33;
  WFLogForCategory(0);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v35 && os_log_type_enabled(v35, v36))
  {
    v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v38 = v83[5];
    *(_DWORD *)v89 = 138412546;
    v90 = v37;
    v91 = 2112;
    v92 = v38;
    _os_log_impl(&dword_2196CC000, v35, v36, "Old filtered networks: %@\n New filtered networks: %@", v89, 0x16u);
  }

  WFLogForCategory(0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v39)
  {
    v41 = v39;
    if (os_log_type_enabled(v41, v40))
    {
      v42 = objc_msgSend(v10, "count");
      v43 = objc_msgSend(v58, "count");
      v44 = objc_msgSend(v9, "count");
      v45 = objc_msgSend(obj, "count");
      *(_DWORD *)v89 = 134218752;
      v90 = v42;
      v91 = 2048;
      v92 = v43;
      v93 = 2048;
      v94 = v44;
      v95 = 2048;
      v96 = v45;
      _os_log_impl(&dword_2196CC000, v41, v40, "Old Network count: %lu, old filtered network count: %lu, new network count: %lu, new filtered network count: %lu", v89, 0x2Au);
    }

  }
  v46 = (void *)objc_opt_new();
  v47 = (void *)objc_opt_new();
  v48 = (void *)objc_opt_new();
  v79[0] = v34;
  v79[1] = 3221225472;
  v79[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_94;
  v79[3] = &unk_24DB37468;
  v49 = (id)objc_opt_new();
  v80 = v49;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v79);
  v74[0] = v34;
  v74[1] = 3221225472;
  v74[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_98;
  v74[3] = &unk_24DB37490;
  v50 = v49;
  v75 = v50;
  v78 = a5;
  v51 = v48;
  v76 = v51;
  v52 = v47;
  v77 = v52;
  objc_msgSend(obj, "enumerateObjectsUsingBlock:", v74);
  if (objc_msgSend(v50, "count"))
  {
    v70[0] = v34;
    v70[1] = 3221225472;
    v70[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_3;
    v70[3] = &unk_24DB374B8;
    v71 = v50;
    v72 = v46;
    v73 = a5;
    objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v70);

  }
  if (objc_msgSend(v46, "count") || objc_msgSend(v52, "count") || objc_msgSend(v51, "count"))
  {
    -[WFAirportViewController tableView](self, "tableView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v34;
    v61[1] = 3221225472;
    v61[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_4;
    v61[3] = &unk_24DB374E0;
    v61[4] = self;
    v68 = v55;
    v62 = v52;
    v63 = v51;
    v64 = v46;
    v65 = obj;
    v69 = a5;
    v66 = v10;
    v67 = v9;
    v60[0] = v34;
    v60[1] = 3221225472;
    v60[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_103;
    v60[3] = &unk_24DB37508;
    v60[4] = self;
    v60[5] = v55;
    objc_msgSend(v53, "performBatchUpdates:completion:", v61, v60);

  }
  else
  {
    switch(v55)
    {
      case 1:
        objc_storeStrong((id *)&self->_knownNetworks, obj);
        break;
      case 2:
        objc_storeStrong((id *)&self->_popularNetworks, obj);
        break;
      case 3:
        objc_storeStrong((id *)&self->_infraNetworks, obj);
        break;
      case 4:
        objc_storeStrong((id *)&self->_adhocNetworks, obj);
        break;
      case 5:
        objc_storeStrong((id *)&self->_unconfiguredNetworks, obj);
        break;
      default:
        break;
    }
  }

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(buf, 8);

}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke(uint64_t a1, void *a2)
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

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2(uint64_t a1, void *a2)
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

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_94(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a2, "uniqueIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, v7);

}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_98(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a2, "uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "integerValue"), *(_QWORD *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v17[0] = v11;
      v17[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);
  }
  else
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v5, "integerValue"), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_4(uint64_t a1)
{
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  void *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  os_log_type_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  os_log_type_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BYTE *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  os_log_type_t v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  __CFString *v83;
  _QWORD v84[5];
  void *v85;
  uint8_t v86[4];
  const char *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint8_t v92[128];
  _BYTE buf[24];
  uint64_t (*v94)(uint64_t, uint64_t);
  _BYTE v95[20];
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", *(_QWORD *)(a1 + 88));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 88);
      v7 = objc_msgSend(*(id *)(a1 + 40), "count");
      v8 = objc_msgSend(*(id *)(a1 + 48), "count");
      v9 = objc_msgSend(*(id *)(a1 + 56), "count");
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceS"
                           "ection:]_block_invoke_4";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      v94 = v6;
      *(_WORD *)v95 = 2048;
      *(_QWORD *)&v95[2] = v7;
      *(_WORD *)&v95[10] = 2048;
      *(_QWORD *)&v95[12] = v8;
      v96 = 2048;
      v97 = v9;
      _os_log_impl(&dword_2196CC000, v4, v3, "%s: tableView updating started for section %@ (%lu) - insert %lu move %lu delete %lu", buf, 0x3Eu);

    }
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 1;
  switch(*(_QWORD *)(a1 + 88))
  {
    case 1:
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1144), *(id *)(a1 + 64));
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tableView:viewForHeaderInSection:", v11, objc_msgSend(v12, "indexOfObject:", &unk_24DB59650));
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject title](v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "isEqualToString:", v14);
      if ((v15 & 1) == 0)
      {
        v16 = objc_msgSend(v14, "copy");
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 1208);
        *(_QWORD *)(v17 + 1208) = v16;

      }
      goto LABEL_23;
    case 2:
      v21 = *(void **)(a1 + 64);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = 1136;
      goto LABEL_20;
    case 3:
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1128), *(id *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "chooseNetworkHeader");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject title](v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "isEqualToString:", v14);
      if ((v15 & 1) == 0)
      {
        v24 = objc_msgSend(v14, "copy");
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 1216);
        *(_QWORD *)(v25 + 1216) = v24;

        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", *(_QWORD *)(a1 + 96));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_reloadSectionHeaderFooters:withRowAnimation:", v28, 100);

      }
      goto LABEL_23;
    case 4:
      v21 = *(void **)(a1 + 64);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = 1152;
LABEL_20:
      v29 = v21;
      v20 = 0;
      v13 = *(NSObject **)(v22 + v23);
      *(_QWORD *)(v22 + v23) = v29;
      break;
    case 5:
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1160), *(id *)(a1 + 64));
      v30 = *(void **)(a1 + 32);
      objc_msgSend(v30, "tableView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sections");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "tableView:viewForHeaderInSection:", v31, objc_msgSend(v32, "indexOfObject:", &unk_24DB59620));
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject title](v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "isEqualToString:", v14);
      if ((v15 & 1) == 0)
      {
        v33 = objc_msgSend(v14, "copy");
        v34 = *(_QWORD *)(a1 + 32);
        v35 = *(void **)(v34 + 1224);
        *(_QWORD *)(v34 + 1224) = v33;

      }
LABEL_23:

      v20 = v15 ^ 1;
      break;
    default:
      WFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v19 = OSLogForWFLogLevel(1uLL);
      v20 = 0;
      if (WFCurrentLogLevel() && v13)
      {
        if (os_log_type_enabled(v13, v19))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasou"
                               "rceSection:]_block_invoke";
          _os_log_impl(&dword_2196CC000, v13, v19, "%s: unexpected section update", buf, 0xCu);
        }
        v20 = 0;
      }
      break;
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v94 = __Block_byref_object_copy__0;
  *(_QWORD *)v95 = __Block_byref_object_dispose__0;
  *(_QWORD *)&v95[8] = &stru_24DB39F78;
  v36 = MEMORY[0x24BDAC760];
  v37 = *(void **)(a1 + 72);
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_101;
  v84[3] = &unk_24DB37440;
  v84[4] = buf;
  objc_msgSend(v37, "enumerateObjectsUsingBlock:", v84);
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__0;
  v82 = __Block_byref_object_dispose__0;
  v83 = &stru_24DB39F78;
  v38 = *(void **)(a1 + 80);
  v77[0] = v36;
  v77[1] = 3221225472;
  v77[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_102;
  v77[3] = &unk_24DB37440;
  v77[4] = &v78;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v77);
  WFLogForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v39 && os_log_type_enabled(v39, v40))
  {
    v41 = *(const char **)(*(_QWORD *)&buf[8] + 40);
    v42 = v79[5];
    *(_DWORD *)v86 = 138412546;
    v87 = v41;
    v88 = 2112;
    v89 = v42;
    _os_log_impl(&dword_2196CC000, v39, v40, "Old networks: %@\n New networks: %@", v86, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "deleteRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 56), 0);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "insertRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 40), 0);

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v45 = *(id *)(a1 + 48);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v74 != v47)
          objc_enumerationMutation(v45);
        v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v49, "objectAtIndexedSubscript:", 0, (_QWORD)v73);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "moveRowAtIndexPath:toIndexPath:", v50, v51);

      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
    }
    while (v46);
  }

  v53 = *(_BYTE **)(a1 + 32);
  if (!v53[1024])
  {
    v54 = *(_QWORD *)(a1 + 96);
    objc_msgSend(v53, "sections");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54 == objc_msgSend(v55, "indexOfObject:", &unk_24DB59668))
    {
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "numberOfRowsInSection:", *(_QWORD *)(a1 + 96));
      LODWORD(v57) = v57 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "count");

      if (!(_DWORD)v57)
        goto LABEL_44;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "numberOfRowsInSection:", *(_QWORD *)(a1 + 96));

      WFLogForCategory(0);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = OSLogForWFLogLevel(1uLL);
      v62 = v59 - 1;
      if (WFCurrentLogLevel() && v60 && os_log_type_enabled(v60, v61))
      {
        v63 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)v86 = 136315650;
        v87 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
        v88 = 2048;
        v89 = v62;
        v90 = 2048;
        v91 = v63;
        _os_log_impl(&dword_2196CC000, v60, v61, "%s: deleting other network row at row: %lu section: %lu", v86, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v62, *(_QWORD *)(a1 + 96));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v64;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "deleteRowsAtIndexPaths:withRowAnimation:", v65, 0);

    }
  }
LABEL_44:
  if (v20)
  {
    WFLogForCategory(0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v66)
    {
      v68 = v66;
      if (os_log_type_enabled(v68, v67))
      {
        objc_msgSend(*(id *)(a1 + 32), "_sectionNameAtIndex:", *(_QWORD *)(a1 + 96));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)v86 = 136315650;
        v87 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
        v88 = 2112;
        v89 = (uint64_t)v69;
        v90 = 2048;
        v91 = v70;
        _os_log_impl(&dword_2196CC000, v68, v67, "%s: reloading header at section %@ (%lu)", v86, 0x20u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", *(_QWORD *)(a1 + 96));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "_reloadSectionHeaderFooters:withRowAnimation:", v72, 100);

  }
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(buf, 8);
}

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_101(uint64_t a1, void *a2)
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

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_2_102(uint64_t a1, void *a2)
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

void __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_103(uint64_t a1)
{
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "_nameOfSection:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v21 = "-[WFAirportViewController _updateCellsWithNewData:oldData:inSection:insertSection:datasourceSection:]_block_invoke";
      v22 = 2112;
      v23 = v5;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_2196CC000, v4, v3, "%s: tableView updating finished for section %@ (%lu)", buf, 0x20u);

    }
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_shouldContinueUpdateNetworkList");
  v8 = *(id **)(a1 + 32);
  if (v7)
  {
    v9 = (void *)objc_msgSend(v8[150], "copy");
    v10 = objc_opt_new();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 1200);
    *(_QWORD *)(v11 + 1200) = v10;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 0;
    WFLogForCategory(0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v13)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        v16 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134217984;
        v21 = (const char *)v16;
        _os_log_impl(&dword_2196CC000, v15, v14, "continuing with pending network update (count %lu)", buf, 0xCu);
      }

    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_105;
    v18[3] = &unk_24DB37418;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    v17 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

  }
  else
  {
    objc_msgSend(v8, "_processPendingCurrentNetworkUpdate");
  }
}

uint64_t __101__WFAirportViewController__updateCellsWithNewData_oldData_inSection_insertSection_datasourceSection___block_invoke_105(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNetworks:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldContinueUpdateNetworkList
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  int v7;
  NSUInteger v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  BOOL result;

  -[WFAirportViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", &unk_24DB59650);
  v5 = v4 ^ (-[NSArray count](self->_knownNetworks, "count") != 0);

  -[WFAirportViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", &unk_24DB59638);
  v8 = -[NSArray count](self->_popularNetworks, "count");

  -[WFAirportViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", &unk_24DB59668);
  v11 = -[NSArray count](self->_infraNetworks, "count") != 0;

  -[WFAirportViewController sections](self, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", &unk_24DB59608);
  v14 = -[NSArray count](self->_unconfiguredNetworks, "count") != 0;

  result = 1;
  if ((v5 & 1) == 0 && ((v7 ^ (v8 != 0)) & 1) == 0 && ((v10 ^ v11) & 1) == 0 && ((v13 ^ v14) & 1) == 0)
    return self->_networkResultsChangedWhileUIUpdates;
  return result;
}

- (void)refresh
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (!-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__WFAirportViewController_refresh__block_invoke;
    block[3] = &unk_24DB373C8;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

void __34__WFAirportViewController_refresh__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "listDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setShowDiagnostics:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowDiagnosticsMode:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowNANUI:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowNANUI:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setShowKnownNetworks:", objc_msgSend(v14, "airportSettingsViewControllerShouldShowKnownNetworks:", *(_QWORD *)(a1 + 32)));
  if ((objc_msgSend(*(id *)(a1 + 32), "isInEditingMode") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "showKnownNetworks"))
    {
      objc_msgSend(*(id *)(a1 + 32), "sections");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "containsObject:", &unk_24DB595F0);

      if ((v3 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "sections");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v7, "addObject:", &unk_24DB595F0);
        goto LABEL_8;
      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "showKnownNetworks") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24DB595F0);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "sections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v7, "removeObject:", &unk_24DB59620);
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "setSections:", v7);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_refreshATJShownStateIfChanged"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(*(id *)(a1 + 32), "askToJoinShown"))
      objc_msgSend(v10, "addObject:", &unk_24DB59698);
    else
      objc_msgSend(v10, "removeObject:", &unk_24DB59698);
    objc_msgSend(*(id *)(a1 + 32), "setSections:", v10);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ((objc_msgSend(v14, "networkListViewControllerNetworkRestrictionActive:", *(_QWORD *)(a1 + 32)) & 1) != 0
     || objc_msgSend(v14, "networkListViewControllerIsManagedAppleID:", *(_QWORD *)(a1 + 32))))
  {
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "removeObject:", &unk_24DB596B0);
    objc_msgSend(*(id *)(a1 + 32), "setSections:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel__updateNetworkRestrictionHeader, 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)powerStateDidChange:(BOOL)a3
{
  void *v5;
  NSArray *infraNetworks;
  NSArray *adhocNetworks;
  NSArray *unconfiguredNetworks;
  NSArray *popularNetworks;
  NSArray *knownNetworks;
  WFNetworkListRecord *currentNetwork;
  NSString *currentNetworkSubtitle;

  -[WFAirportViewController _defaultSectionsForPowerState:](self, "_defaultSectionsForPowerState:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController setSections:](self, "setSections:", v5);

  if (!a3)
  {
    infraNetworks = self->_infraNetworks;
    self->_infraNetworks = 0;

    adhocNetworks = self->_adhocNetworks;
    self->_adhocNetworks = 0;

    unconfiguredNetworks = self->_unconfiguredNetworks;
    self->_unconfiguredNetworks = 0;

    popularNetworks = self->_popularNetworks;
    self->_popularNetworks = 0;

    knownNetworks = self->_knownNetworks;
    self->_knownNetworks = 0;

    currentNetwork = self->_currentNetwork;
    self->_currentNetwork = 0;

    self->_currentNetworkState = 0;
    currentNetworkSubtitle = self->_currentNetworkSubtitle;
    self->_currentNetworkSubtitle = 0;

  }
  -[WFAirportViewController refresh](self, "refresh");
}

- (void)powerStateDidChangeToggle:(unint64_t)a3
{
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  NSArray *infraNetworks;
  NSArray *adhocNetworks;
  NSArray *unconfiguredNetworks;
  NSArray *popularNetworks;
  NSArray *knownNetworks;
  WFNetworkListRecord *currentNetwork;
  NSString *currentNetworkSubtitle;
  NSSet *pendingNetworks;
  WFPendingNetworkUpdate *pendingCurrentNetworkUpdate;
  WFNetworkRowConfig *v19;
  WFNetworkRowConfig *currentNetworkRowConfig;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController _defaultSectionsForPowerState:](self, "_defaultSectionsForPowerState:", a3 == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController setSections:](self, "setSections:", v5);

  WFLogForCategory(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6)
  {
    v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      WFPowerStateToggleToString(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[WFAirportViewController powerStateDidChangeToggle:]";
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_2196CC000, v8, v7, "%s: power state is now %@", (uint8_t *)&v21, 0x16u);

    }
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    infraNetworks = self->_infraNetworks;
    self->_infraNetworks = 0;

    adhocNetworks = self->_adhocNetworks;
    self->_adhocNetworks = 0;

    unconfiguredNetworks = self->_unconfiguredNetworks;
    self->_unconfiguredNetworks = 0;

    popularNetworks = self->_popularNetworks;
    self->_popularNetworks = 0;

    knownNetworks = self->_knownNetworks;
    self->_knownNetworks = 0;

    currentNetwork = self->_currentNetwork;
    self->_currentNetwork = 0;

    self->_currentNetworkState = 0;
    currentNetworkSubtitle = self->_currentNetworkSubtitle;
    self->_currentNetworkSubtitle = 0;

    pendingNetworks = self->_pendingNetworks;
    self->_pendingNetworks = 0;

    pendingCurrentNetworkUpdate = self->_pendingCurrentNetworkUpdate;
    self->_pendingCurrentNetworkUpdate = 0;

    +[WFNetworkRowConfig settingsNetworkRowConfig](WFNetworkRowConfig, "settingsNetworkRowConfig");
    v19 = (WFNetworkRowConfig *)objc_claimAutoreleasedReturnValue();
    currentNetworkRowConfig = self->_currentNetworkRowConfig;
    self->_currentNetworkRowConfig = v19;

    -[WFNetworkRowConfig setSubtitle:](self->_currentNetworkRowConfig, "setSubtitle:", 0);
  }
  -[WFAirportViewController refresh](self, "refresh");
}

- (BOOL)powered
{
  return -[WFAirportViewController powerState](self, "powerState") == 1;
}

- (unint64_t)powerState
{
  void *v3;
  unint64_t v4;

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkListViewControllerCurrentPowerStateToggle:", self);

  return v4;
}

- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled
{
  return 1;
}

- (BOOL)shouldPromptWhenCarPlaySessionIsActive
{
  return 1;
}

- (BOOL)supportsWiFiPasswordSharing
{
  return 1;
}

- (BOOL)supportsHealthRecommendations
{
  return 1;
}

- (void)powerModificationStateDidChange:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_disablePowerModification == a3)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      v5 = 136315138;
      v6 = "-[WFAirportViewController powerModificationStateDidChange:]";
      _os_log_impl(&dword_2196CC000, v3, v4, "%s: No change", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    self->_disablePowerModification = a3;
    -[WFAirportViewController _reloadPowerSection](self, "_reloadPowerSection");
  }
}

- (void)managedAppleIDStateChange:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_isManagedAppleID == a3)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      v5 = 136315138;
      v6 = "-[WFAirportViewController managedAppleIDStateChange:]";
      _os_log_impl(&dword_2196CC000, v3, v4, "%s: No change", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    self->_isManagedAppleID = a3;
    -[WFAirportViewController refresh](self, "refresh");
  }
}

- (void)reloadCellsForNetworkNames:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__WFAirportViewController_reloadCellsForNetworkNames___block_invoke;
  v10[3] = &unk_24DB37530;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  -[WFAirportViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);

}

void __54__WFAirportViewController_reloadCellsForNetworkNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForNetworkName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "Cannot find indexpath for network: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)scrollToAirportCell:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  switch(a3)
  {
    case 3uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFAirportViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB596B0;
      break;
    case 2uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFAirportViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB59698;
      break;
    case 1uLL:
      v4 = (void *)MEMORY[0x24BDD15D8];
      -[WFAirportViewController sections](self, "sections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &unk_24DB59680;
      break;
    default:
      return;
  }
  objc_msgSend(v4, "indexPathForRow:inSection:", 0, objc_msgSend(v5, "indexOfObject:", v7));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[WFAirportViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 1, 1);

}

- (id)_indexPathForNetworkName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t);
  void *v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  -[WFAirportViewController currentNetwork](self, "currentNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    -[WFAirportViewController sections](self, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", &unk_24DB59680);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0x7FFFFFFFFFFFFFFFLL;
    -[WFAirportViewController knownNetworks](self, "knownNetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __52__WFAirportViewController__indexPathForNetworkName___block_invoke;
    v33[3] = &unk_24DB37558;
    v13 = v4;
    v34 = v13;
    v35 = &v36;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v33);

    if (v37[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[WFAirportViewController popularNetworks](self, "popularNetworks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v12;
      v30[1] = 3221225472;
      v30[2] = __52__WFAirportViewController__indexPathForNetworkName___block_invoke_2;
      v30[3] = &unk_24DB37558;
      v15 = v13;
      v31 = v15;
      v32 = &v36;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);

      if (v37[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[WFAirportViewController infraNetworks](self, "infraNetworks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v12;
        v25 = 3221225472;
        v26 = __52__WFAirportViewController__indexPathForNetworkName___block_invoke_3;
        v27 = &unk_24DB37558;
        v28 = v15;
        v29 = &v36;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v24);

        if (v37[3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = 0;
        }
        else
        {
          -[WFAirportViewController sections](self, "sections", v24, v25, v26, v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "indexOfObject:", &unk_24DB59668);

          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v37[3], v22);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        -[WFAirportViewController sections](self, "sections");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "indexOfObject:", &unk_24DB59638);

        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v37[3], v20);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[WFAirportViewController sections](self, "sections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "indexOfObject:", &unk_24DB59650);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v37[3], v18);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v36, 8);
  }

  return v10;
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
}

void __52__WFAirportViewController__indexPathForNetworkName___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
}

- (void)updateViewsForNetworks:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *internalQueue;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD v10[4];
  id v11;
  WFAirportViewController *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFAirportViewController updateViewsForNetworks:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: updating views for %@", buf, 0x16u);
    }

    if (v4)
    {
      internalQueue = self->_internalQueue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __50__WFAirportViewController_updateViewsForNetworks___block_invoke;
      v10[3] = &unk_24DB37418;
      v11 = v4;
      v12 = self;
      dispatch_sync(internalQueue, v10);

    }
    else
    {
      WFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFAirportViewController updateViewsForNetworks:]";
        _os_log_impl(&dword_2196CC000, v8, v9, "%s: nil networks", buf, 0xCu);
      }

    }
  }
  else
  {
    -[WFAirportViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_updateViewsForNetworks_, v4, 0);
  }

}

void __50__WFAirportViewController_updateViewsForNetworks___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  NSObject *v48;
  os_log_type_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  os_log_type_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "infrastructureNetworks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", &unk_24DB59668);

  objc_msgSend(*(id *)(a1 + 40), "infraNetworks");
  v5 = objc_claimAutoreleasedReturnValue();
  v70 = a1;
  v68 = v2;
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v2, "count"), v6, v7))
  {
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
        _os_log_impl(&dword_2196CC000, v8, v9, "%s: infra section is not found", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_dumpSections");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "infraNetworks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v14 = v2;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v81 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "infraNetworks");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "indexOfObject:", v19);

            if (v21 == 0x7FFFFFFFFFFFFFFFLL)
            {
              WFLogForCategory(0);
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
              {
                *(_DWORD *)buf = 136315394;
                v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                v86 = 2112;
                v87 = v19;
                _os_log_impl(&dword_2196CC000, v22, v23, "%s: unknown row for record %@", buf, 0x16u);
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v21, v4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "addObject:", v24);

              objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v21, v19);
            }
            a1 = v70;
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
        }
        while (v16);
      }

      objc_msgSend(*(id *)(a1 + 40), "setInfraNetworks:", v13);
    }
  }
  else
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      _os_log_impl(&dword_2196CC000, v10, v11, "%s: no infra networks", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "knownNetworks");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "indexOfObject:", &unk_24DB59650);

  objc_msgSend(*(id *)(a1 + 40), "knownNetworks");
  v28 = objc_claimAutoreleasedReturnValue();
  v66 = v25;
  if (v28 && (v29 = (void *)v28, v30 = objc_msgSend(v25, "count", v25, v68), v29, v30))
  {
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WFLogForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v31 && os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
        _os_log_impl(&dword_2196CC000, v31, v32, "%s: known section is not found", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_dumpSections");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "knownNetworks");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "mutableCopy");

      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v37 = v25;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v77 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
            objc_msgSend(*(id *)(v70 + 40), "knownNetworks");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "indexOfObject:", v42);

            if (v44 == 0x7FFFFFFFFFFFFFFFLL)
            {
              WFLogForCategory(0);
              v45 = objc_claimAutoreleasedReturnValue();
              v46 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v45 && os_log_type_enabled(v45, v46))
              {
                *(_DWORD *)buf = 136315394;
                v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                v86 = 2112;
                v87 = v42;
                _os_log_impl(&dword_2196CC000, v45, v46, "%s: unknown row for record %@", buf, 0x16u);
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v44, v27);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "addObject:", v47);

              objc_msgSend(v36, "replaceObjectAtIndex:withObject:", v44, v42);
            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
        }
        while (v39);
      }

      a1 = v70;
      objc_msgSend(*(id *)(v70 + 40), "setKnownNetworks:", v36);

    }
  }
  else
  {
    WFLogForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v33 && os_log_type_enabled(v33, v34))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      _os_log_impl(&dword_2196CC000, v33, v34, "%s: no knownNetworks networks", buf, 0xCu);
    }

  }
  if (objc_msgSend(v69, "count", v66))
  {
    WFLogForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v48 && os_log_type_enabled(v48, v49))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
      v86 = 2112;
      v87 = v69;
      _os_log_impl(&dword_2196CC000, v48, v49, "%s: updating paths='%@'", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "reloadRowsAtIndexPaths:withRowAnimation:", v69, 5);

  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = *(id *)(a1 + 32);
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v73 != v53)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 40), "currentNetwork");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v55, "isEqual:", v56) & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "title");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "title");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v57, "isEqualToString:", v58);

          if ((v59 & 1) == 0)
          {
            WFLogForCategory(0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v60)
            {
              v62 = v60;
              if (os_log_type_enabled(v62, v61))
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "title");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "title");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v85 = "-[WFAirportViewController updateViewsForNetworks:]_block_invoke";
                v86 = 2112;
                v87 = v63;
                v88 = 2112;
                v89 = v64;
                v90 = 2112;
                v91 = v55;
                _os_log_impl(&dword_2196CC000, v62, v61, "%s: updating current network view (title='%@' -> '%@' with ='%@'", buf, 0x2Au);

                a1 = v70;
              }

            }
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1048), v55);
            objc_msgSend(*(id *)(a1 + 40), "currentNetworkRowConfig");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setNetwork:", v55);

            objc_msgSend(*(id *)(a1 + 40), "_reloadCurrentNetworkCell");
          }
        }
        else
        {

        }
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
    }
    while (v52);
  }

}

- (void)setAskToJoinMode:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v18 = 136315394;
    v19 = "-[WFAirportViewController setAskToJoinMode:]";
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: setting atj mode to %ld", (uint8_t *)&v18, 0x16u);
  }

  -[WFAirportViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB59698);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v18 = 136315138;
      v19 = "-[WFAirportViewController setAskToJoinMode:]";
      _os_log_impl(&dword_2196CC000, v9, v10, "%s: unable to find WFAirportSectionAskToJoin in sections", (uint8_t *)&v18, 0xCu);
    }

    -[WFAirportViewController _dumpSections](self, "_dumpSections");
  }
  else
  {
    -[WFAirportViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[WFAirportViewController _askToJoinStateStringForATJMode:](self, "_askToJoinStateStringForATJMode:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "detailTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

    }
    -[WFAirportViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_reloadSectionHeaderFooters:withRowAnimation:", v17, 5);

  }
}

- (void)setAutoInstantHotspotJoinOption:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v20 = 136315394;
    v21 = "-[WFAirportViewController setAutoInstantHotspotJoinOption:]";
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: setting auto hotspot option to %ld", (uint8_t *)&v20, 0x16u);
  }

  -[WFAirportViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB596B0);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v20 = 136315138;
      v21 = "-[WFAirportViewController setAutoInstantHotspotJoinOption:]";
      _os_log_impl(&dword_2196CC000, v9, v10, "%s: unable to find WFAirportSectionAutoInstantHotspot in sections", (uint8_t *)&v20, 0xCu);
    }

    -[WFAirportViewController _dumpSections](self, "_dumpSections");
  }
  else
  {
    -[WFAirportViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirportViewController _getAutoHotspotOptionText:](self, "_getAutoHotspotOptionText:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "detailTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

    }
    -[WFAirportViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_reloadSectionHeaderFooters:withRowAnimation:", v19, 5);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFAirportViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t showOtherNetwork;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t result;

  switch(-[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4))
  {
    case 0uLL:
      showOtherNetwork = -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", 1);
      -[WFAirportViewController currentNetwork](self, "currentNetwork");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[WFAirportViewController currentNetwork](self, "currentNetwork");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "canBeDisplayedAsCurrent") & 1) != 0)
        {
          v9 = -[WFAirportViewController powered](self, "powered");

          showOtherNetwork += v9;
        }
        else
        {

        }
      }
      if (-[WFAirportViewController showDiagnosticsCell](self, "showDiagnosticsCell"))
        showOtherNetwork += -[WFAirportViewController powered](self, "powered");
      goto LABEL_22;
    case 1uLL:
      v10 = 1144;
      goto LABEL_17;
    case 2uLL:
      v10 = 1136;
      goto LABEL_17;
    case 3uLL:
      showOtherNetwork = self->_showOtherNetwork;
      if (-[NSArray count](self->_infraNetworks, "count"))
        showOtherNetwork += -[NSArray count](self->_infraNetworks, "count");
      goto LABEL_22;
    case 4uLL:
      v11 = 1152;
      goto LABEL_12;
    case 5uLL:
      v11 = 1160;
LABEL_12:
      if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "count"))
        goto LABEL_14;
      v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
      goto LABEL_18;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 10uLL:
      showOtherNetwork = 1;
      goto LABEL_22;
    case 11uLL:
      v10 = 1232;
      goto LABEL_17;
    case 12uLL:
      v10 = 1240;
LABEL_17:
      v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
LABEL_18:
      result = objc_msgSend(v12, "count");
      break;
    default:
LABEL_14:
      showOtherNetwork = 0;
LABEL_22:
      result = showOtherNetwork;
      break;
  }
  return result;
}

- (int64_t)rowCountWithPlacardCell:(int64_t)a3
{
  return a3 + -[WFAirportViewController usePlacardCell](self, "usePlacardCell");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *infraNetworks;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  int64_t v60;
  uint64_t v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v8, "section"));
  v10 = objc_msgSend(v8, "row");
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v9)
  {
    case 0uLL:
      v12 = 0;
      if (-[WFAirportViewController usePlacardCell](self, "usePlacardCell") && !v10)
      {
        objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFWiFiPlacardCell"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAirportViewController parentViewController](self, "parentViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNavigationItem:", v13);

      }
      if (v10 != -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", 0))
      {
        if (v10 == -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", 1)
          && -[WFAirportViewController showDiagnosticsCell](self, "showDiagnosticsCell"))
        {
          objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFDiagnosticsCell"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          v38 = CFSTR("kWFLocWiFiDiagnosticsTitle");
          goto LABEL_40;
        }
        v60 = -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", 1);
        if (v10 == v60)
        {
          -[WFAirportViewController currentNetwork](self, "currentNetwork");
          v61 = objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            v74 = (void *)v61;
            -[WFAirportViewController currentNetwork](self, "currentNetwork");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v4, "canBeDisplayedAsCurrent")
              && !-[WFAirportViewController showDiagnosticsCell](self, "showDiagnosticsCell"))
            {

              goto LABEL_80;
            }
            v62 = 1;
          }
          else
          {
            v62 = 0;
            v74 = 0;
          }
        }
        else
        {
          v62 = 0;
        }
        if (v10 == -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", 2))
        {
          v73 = v62;
          -[WFAirportViewController currentNetwork](self, "currentNetwork");
          v64 = objc_claimAutoreleasedReturnValue();
          if (v64)
          {
            v65 = (void *)v64;
            v72 = v4;
            -[WFAirportViewController currentNetwork](self, "currentNetwork");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v66, "canBeDisplayedAsCurrent"))
            {
              v67 = -[WFAirportViewController showDiagnosticsCell](self, "showDiagnosticsCell");

            }
            else
            {

              v67 = 0;
            }
            v4 = v72;
          }
          else
          {
            v67 = 0;
          }
          if ((v73 & 1) == 0)
            goto LABEL_69;
        }
        else
        {
          v67 = 0;
          if (!v62)
          {
LABEL_69:
            if (v10 == v60)
            {

              if (v67)
                goto LABEL_80;
LABEL_73:
              v14 = v12;
              goto LABEL_47;
            }
            if (!v67)
              goto LABEL_73;
LABEL_80:
            -[WFAirportViewController currentNetwork](self, "currentNetwork");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
              v68 = objc_msgSend(v11, "airportSettingsViewControllerCurrentNetworkConnectionIsProblematic:", self);
            else
              v68 = 0;
            -[WFAirportViewController currentNetworkSubtitle](self, "currentNetworkSubtitle");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
              -[WFAirportViewController currentNetworkSubtitle](self, "currentNetworkSubtitle");
            else
              objc_msgSend(v59, "subtitle");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFNetworkCell"), v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "title");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setTitle:", v71);

            objc_msgSend(v14, "setSubtitle:", v70);
            objc_msgSend(v14, "setSecure:", objc_msgSend(v59, "isSecure"));
            objc_msgSend(v14, "setConnectionError:", v68);
            if ((v68 & 1) == 0)
              objc_msgSend(v14, "setBars:", WFSignalBarsFromScaledRSSI(self->_currentNetworkScaledRSSI));
            objc_msgSend(v14, "setState:", self->_currentNetworkState);
            objc_msgSend(v14, "setPersonalHotspot:", objc_msgSend(v59, "iOSHotspot"));
            objc_msgSend(v14, "setAccessoryType:", 4);

            goto LABEL_49;
          }
        }

        goto LABEL_69;
      }
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFPowerCell"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
        v16 = CFSTR("kWFLocWiFiPowerTitleCH");
      else
        v16 = CFSTR("kWFLocWiFiPowerTitle");
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      v19 = objc_alloc(MEMORY[0x24BEBD9B8]);
      v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__powerSwitchChanged_, 4096);
      v21 = -[WFAirportViewController powerState](self, "powerState");
      WFLogForCategory(0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v22)
      {
        v24 = v22;
        if (os_log_type_enabled(v24, v23))
        {
          WFPowerStateToggleToString(v21);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v77 = "-[WFAirportViewController tableView:cellForRowAtIndexPath:]";
          v78 = 2112;
          v79 = v75;
          _os_log_impl(&dword_2196CC000, v24, v23, "%s: set power state UI to %@", buf, 0x16u);

        }
      }

      if (v21 == 3)
      {
        objc_msgSend(v20, "setEnabled:", 0);
        v25 = v20;
        v26 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v20, "setEnabled:", -[WFAirportViewController disablePowerModification](self, "disablePowerModification") ^ 1);
      objc_msgSend(v20, "setOn:", -[WFAirportViewController powered](self, "powered"));
      if (v21 == 2)
      {
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v63, "startAnimating");
        objc_msgSend(v14, "setAccessoryView:", v63);

        goto LABEL_33;
      }
LABEL_32:
      objc_msgSend(v14, "setAccessoryView:", v20);
LABEL_33:
      objc_msgSend(v14, "setSelectionStyle:", 0);
LABEL_46:

LABEL_47:
      return v14;
    case 1uLL:
      v27 = 1144;
      goto LABEL_24;
    case 2uLL:
      v27 = 1136;
      goto LABEL_24;
    case 3uLL:
      infraNetworks = self->_infraNetworks;
      if (!infraNetworks || v10 == -[NSArray count](infraNetworks, "count") && self->_showOtherNetwork)
      {
        objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFOtherNetworkCell"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("kWFLocOtherNetworkTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setText:", v30);

LABEL_37:
LABEL_38:

        goto LABEL_47;
      }
      v32 = self->_infraNetworks;
LABEL_25:
      -[NSArray objectAtIndex:](v32, "objectAtIndex:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirportViewController _tableCellForNetwork:tableView:indexPath:](self, "_tableCellForNetwork:tableView:indexPath:", v20, v7, v8);
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_45:
      v14 = (void *)v33;
      goto LABEL_46;
    case 4uLL:
      v27 = 1152;
LABEL_24:
      v32 = *(NSArray **)((char *)&self->super.super.super.super.super.isa + v27);
      goto LABEL_25;
    case 5uLL:
      -[NSArray objectAtIndex:](self->_unconfiguredNetworks, "objectAtIndex:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFUnconfiguredNetworkCell"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setText:", v34);

      objc_msgSend(v14, "setAccessoryType:", 1);
      goto LABEL_38;
    case 6uLL:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("kWFNetworkDataUsageCellIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = CFSTR("kWFLocDataUsageTitle");
      goto LABEL_40;
    case 7uLL:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("kWFNetworkWAPICellIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("kWFLocEnableWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v40);

      objc_msgSend(v14, "textLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setNumberOfLines:", 0);

      v43 = objc_alloc(MEMORY[0x24BEBD9B8]);
      v20 = (void *)objc_msgSend(v43, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__enableWAPISwitchChanged_, 4096);
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v26 = objc_msgSend(v11, "networkListViewControllerWAPIEnabled:", self);
        v25 = v20;
LABEL_31:
        objc_msgSend(v25, "setOn:", v26);
      }
      goto LABEL_32;
    case 8uLL:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFAskToJoinCell"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFAskToJoinCell"));
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setText:", v45);

      objc_msgSend(v14, "setAccessoryType:", 1);
      -[WFAirportViewController _askToJoinStateStringForATJMode:](self, "_askToJoinStateStringForATJMode:", -[WFAirportViewController _askToJoinMode](self, "_askToJoinMode"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailTextLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v29);
      goto LABEL_37;
    case 9uLL:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFNetworkKnownNetworksCellIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = CFSTR("kWFLocKnownNetworksTitle");
LABEL_40:
      objc_msgSend(v36, "localizedStringForKey:value:table:", v38, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setText:", v47);

      objc_msgSend(v14, "setAccessoryType:", 1);
      goto LABEL_47;
    case 0xAuLL:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFAutoInstantHotspotCell"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFAutoInstantHotspotCell"));
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setText:", v50);

      objc_msgSend(v14, "setAccessoryType:", 1);
      v52 = objc_msgSend(v11, "networkListViewControllerAutoInstantHotspotOption:", self);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirportViewController _getAutoHotspotOptionText:](self, "_getAutoHotspotOptionText:", v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedStringForKey:value:table:", v54, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailTextLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setText:", v55);

      goto LABEL_47;
    case 0xBuLL:
      -[NSMutableArray objectAtIndex:](self->_editableKnownNetworks, "objectAtIndex:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirportViewController _tableCellForKnownNetwork:tableView:indexPath:extraLeadingPadding:](self, "_tableCellForKnownNetwork:tableView:indexPath:extraLeadingPadding:", v20, v7, v8, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 0xCuLL:
      -[WFAirportViewController managedKnownNetworks](self, "managedKnownNetworks");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndex:", v10);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAirportViewController _tableCellForKnownNetwork:tableView:indexPath:extraLeadingPadding:](self, "_tableCellForKnownNetwork:tableView:indexPath:extraLeadingPadding:", v59, v7, v8, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:

      goto LABEL_47;
    default:
      v14 = 0;
      goto LABEL_47;
  }
}

- (id)_tableCellForKnownNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5 extraLeadingPadding:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  os_log_type_t v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (v6)
    v11 = CFSTR("kWFNetworkProfileNetworksListCellIdentifier");
  else
    v11 = CFSTR("kWFNetworkEditableNetworksListCellIdentifier");
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18))
      goto LABEL_17;
    v24 = 138543618;
    v25 = v10;
    v26 = 2114;
    v27 = v9;
    v19 = "Unable to create cell at indexPath %{public}@ for network %{public}@";
    v20 = v17;
    v21 = v18;
    v22 = 22;
    goto LABEL_16;
  }
  if (!v9)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v23))
      goto LABEL_17;
    v24 = 138543362;
    v25 = v10;
    v19 = "nil network for indexPath %{public}@";
    v20 = v17;
    v21 = v23;
    v22 = 12;
LABEL_16:
    _os_log_impl(&dword_2196CC000, v20, v21, v19, (uint8_t *)&v24, v22);
LABEL_17:

    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v12, "setHasLeadingPadding:", v6);
  objc_msgSend(v9, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNetworkName:", v14);

  objc_msgSend(v13, "setShowLock:", objc_msgSend(v9, "isSecure"));
  objc_msgSend(v13, "setAccessoryType:", 4);
  objc_msgSend(v13, "setEditingAccessoryType:", 4);
  v15 = v13;
LABEL_7:

  return v15;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(a4, "section", a3))- 13 < 0xFFFFFFFFFFFFFFFELL;
}

- (id)_tableCellForNetwork:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WFHotspotDetails *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  os_log_type_t v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  if (objc_msgSend(v7, "isInstantHotspot"))
  {
    objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFHotspotCell"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v7)
      {
        objc_msgSend(v7, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitle:", v11);

        objc_msgSend(v10, "hotspotDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = objc_alloc_init(WFHotspotDetails);
          objc_msgSend(v7, "hotspotBatteryLife");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHotspotDetails setBatteryLife:](v13, "setBatteryLife:", v14);

          objc_msgSend(v7, "hotspotCellularProtocol");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHotspotDetails setCellularProtocolString:](v13, "setCellularProtocolString:", v15);

          objc_msgSend(v7, "hotspotSignalStrength");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHotspotDetails setSignalStrength:](v13, "setSignalStrength:", v16);

          objc_msgSend(v10, "setHotspotDetails:", v13);
        }
        v17 = v10;
        v18 = 0;
        goto LABEL_10;
      }
      WFLogForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      v29 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v29))
      {
LABEL_30:

        v10 = 0;
        goto LABEL_11;
      }
      v30 = 138543362;
      v31 = v8;
      v25 = "nil network for indexPath %{public}@";
      goto LABEL_28;
    }
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_30;
LABEL_19:
    v30 = 138543618;
    v31 = v8;
    v32 = 2114;
    v33 = v7;
    v25 = "Unable to create cell at indexPath %{public}@ for network %{public}@";
    v26 = v23;
    v27 = v24;
    v28 = 22;
LABEL_29:
    _os_log_impl(&dword_2196CC000, v26, v27, v25, (uint8_t *)&v30, v28);
    goto LABEL_30;
  }
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFNetworkCell"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_30;
    goto LABEL_19;
  }
  if (!v7)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v29))
      goto LABEL_30;
    v30 = 138543362;
    v31 = v8;
    v25 = "nil network for indexPath %{public}@";
LABEL_28:
    v26 = v23;
    v27 = v29;
    v28 = 12;
    goto LABEL_29;
  }
  objc_msgSend(v7, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v19);

  objc_msgSend(v7, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubtitle:", v20);

  objc_msgSend(v10, "setSecure:", objc_msgSend(v7, "isSecure"));
  objc_msgSend(v7, "scaledRSSI");
  objc_msgSend(v10, "setBars:", WFSignalBarsFromScaledRSSI(v21));
  objc_msgSend(v10, "setPersonalHotspot:", objc_msgSend(v7, "iOSHotspot"));
  v17 = v10;
  v18 = 4;
LABEL_10:
  objc_msgSend(v17, "setAccessoryType:", v18);
  objc_msgSend(v10, "setSeparatorInset:", 0.0, 40.0, 0.0, 0.0);
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  _BOOL4 v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;

  v5 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4);
  if (v5 == 10)
  {
    v7 = -[WFAirportViewController _isChinaDevice](self, "_isChinaDevice");
    v8 = CFSTR("kWFLocAutoInstantHotspotFooter");
    if (v7)
      v8 = CFSTR("kWFLocAutoInstantHotspotFooterCH");
    v9 = (void *)MEMORY[0x24BDD1488];
    v10 = v8;
    objc_msgSend(v9, "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  if (v5 == 8)
  {
    v13 = -[WFAirportViewController _askToJoinShouldBeVisible](self, "_askToJoinShouldBeVisible");
    v12 = 0;
    if (!-[WFAirportViewController userAutoJoinEnabled](self, "userAutoJoinEnabled") || !v13)
      return v12;
    -[WFAirportViewController _askToJoinFooterString](self, "_askToJoinFooterString");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      return 0;
    if (-[WFAirportViewController powered](self, "powered"))
    {
      if (-[WFAirportViewController userAutoJoinEnabled](self, "userAutoJoinEnabled"))
        return 0;
      -[WFAirportViewController userAutoJoinDisabledWarning](self, "userAutoJoinDisabledWarning");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFAirportViewController powerOffLocationWarning](self, "powerOffLocationWarning");
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v14;
  return v12;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  switch(-[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a3))
  {
    case 1uLL:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = self->_knownNetworks;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        v9 = 1;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v5);
            v9 &= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isInstantHotspot", (_QWORD)v20);
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v7);

        if ((v9 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("kWFLocMyNetworksSectionTitle");
          goto LABEL_26;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("kWFLocHotspotsSectionTitle");
      goto LABEL_26;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("kWFLocPublicSectionTitle");
      goto LABEL_26;
    case 3uLL:
      -[WFAirportViewController sections](self, "sections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObject:", &unk_24DB59650);

      -[WFAirportViewController sections](self, "sections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "indexOfObject:", &unk_24DB59638);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL && v17 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = CFSTR("kWFLocChooseNetworkSectionSingleTitle");
      else
        v13 = CFSTR("kWFLocChooseNetworkSectionTitle");
      goto LABEL_26;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("kWFLocAdhocSectionTitle");
      goto LABEL_26;
    case 5uLL:
      -[WFAirportViewController listDelegate](self, "listDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v18, "airportSettingsViewController:unconfiguredAccessoriesGroupHeaderTitle:", self, self->_unconfiguredNetworks);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

      return v4;
    case 11uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("kWFLocAllEditableKnownSectionTitle");
      goto LABEL_26;
    case 12uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("kFWLocAllProfileKnownSectionTitle");
LABEL_26:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"), (_QWORD)v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v4;
  }
  return v4;
}

- (id)headerIdentifierForSectionType:(unint64_t)a3
{
  if (a3 - 1 > 0xB)
    return 0;
  else
    return off_24DB37720[a3 - 1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", a4);
  -[WFAirportViewController headerIdentifierForSectionType:](self, "headerIdentifierForSectionType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (v7 == 3)
    -[WFAirportViewController setChooseNetworkHeader:](self, "setChooseNetworkHeader:", v9);
  -[WFAirportViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "setTitle:", v10);

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 || (v7 = 0.0, -[WFAirportViewController isInEditingMode](self, "isInEditingMode")))
  {
    v16[0] = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v16[1] = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAirportViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeWithAttributes:", v10);
    v13 = v12;
    objc_msgSend(CFSTR("A"), "sizeWithAttributes:", v10);
    v7 = ceil(v13 + v14 * 2.0);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  WFAirportViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  char *v24;
  unint64_t v25;
  char *v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  os_log_type_t v38;
  char *v39;
  uint64_t v40;
  void *v41;
  WFAirportViewController *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  WFAirportViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  os_log_type_t v51;
  NSObject *v52;
  int v53;
  void *v54;
  WFAirportViewController *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  os_log_type_t v60;
  const char *v61;
  NSObject *v62;
  os_log_type_t v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  void *v68;
  NSObject *v69;
  os_log_type_t v70;
  void *v71;
  NSObject *v72;
  os_log_type_t v73;
  void *v74;
  WFAirportViewController *v75;
  NSObject *v76;
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  os_log_type_t v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  unint64_t v92;
  void *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  void *v100;
  os_log_type_t v101;
  NSObject *v102;
  char *v103;
  void *v104;
  void *v105;
  char *v106;
  id obj;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  char *v116;
  __int16 v117;
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (char *)a4;
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
    v115 = 2112;
    v116 = v6;
    _os_log_impl(&dword_2196CC000, v7, v8, "%s: indexPath %@", buf, 0x16u);
  }
  v105 = v5;
  v106 = v6;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v9 = self;
  -[WFAirportViewController sections](self, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v110;
    v13 = &stru_24DB39F78;
    do
    {
      v14 = 0;
      v15 = v13;
      do
      {
        if (*(_QWORD *)v110 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v14);
        v17 = (void *)MEMORY[0x24BDD17C8];
        -[WFAirportViewController _nameOfSection:](v9, "_nameOfSection:", (int)objc_msgSend(v16, "intValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAirportViewController tableView](v9, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAirportViewController sections](v9, "sections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("section: %@ has %ld items"), v18, objc_msgSend(v19, "numberOfRowsInSection:", objc_msgSend(v20, "indexOfObject:", v16)));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v21);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v9 = self;
        ++v14;
        v15 = v13;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
    }
    while (v11);
  }
  else
  {
    v13 = &stru_24DB39F78;
  }

  WFLogForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v22 && os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 138412290;
    v114 = (const char *)v13;
    _os_log_impl(&dword_2196CC000, v22, v23, "%@", buf, 0xCu);
  }

  v24 = v106;
  v25 = objc_msgSend(v106, "row");
  -[WFAirportViewController joiningHotspot](v9, "joiningHotspot");
  v26 = (char *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController listDelegate](v9, "listDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    WFLogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
      v115 = 2112;
      v116 = v26;
      _os_log_impl(&dword_2196CC000, v28, v29, "%s: hotspot joining in progress %@", buf, 0x16u);
    }

    -[WFAirportViewController knownNetworks](v9, "knownNetworks");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "indexOfObject:", v26);

    -[WFAirportViewController sections](v9, "sections");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "indexOfObject:", &unk_24DB59650);

    if (v31 == 0x7FFFFFFFFFFFFFFFLL || v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_39:
        -[WFAirportViewController setJoiningHotspot:](v9, "setJoiningHotspot:", 0);
        goto LABEL_40;
      }
      WFLogForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      v38 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v35)
      {
        v35 = v35;
        if (os_log_type_enabled(v35, v38))
        {
          -[WFAirportViewController knownNetworks](v9, "knownNetworks");
          v39 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v114 = v26;
          v115 = 2114;
          v116 = v39;
          _os_log_impl(&dword_2196CC000, v35, v38, "Joining hotspot %{public}@ can't be found in set %{public}@", buf, 0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "cellForRowAtIndexPath:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        v115 = 2112;
        v116 = (char *)v35;
        _os_log_impl(&dword_2196CC000, v36, v37, "%s: updating state for cell %@", buf, 0x16u);
      }

      if (v35)
        -[NSObject setState:](v35, "setState:", 0);
      v24 = v106;
    }

    goto LABEL_39;
  }
LABEL_40:
  switch(-[WFAirportViewController _sectionTypeAtSection:](v9, "_sectionTypeAtSection:", objc_msgSend(v24, "section")))
  {
    case 0uLL:
      if (-[WFAirportViewController showDiagnosticsCell](v9, "showDiagnosticsCell"))
      {
        v40 = objc_msgSend(v24, "row");
        if (v40 == -[WFAirportViewController rowCountWithPlacardCell:](v9, "rowCountWithPlacardCell:", 1))
        {
          objc_msgSend(v27, "airportSettingsViewControllerDidTapDiagnosticsMode:showNANUI:", v9, -[WFAirportViewController showNANUI](v9, "showNANUI"));
          goto LABEL_112;
        }
      }
      -[WFAirportViewController currentNetwork](v9, "currentNetwork");
      v80 = objc_claimAutoreleasedReturnValue();
      if (!v80)
        goto LABEL_112;
      v81 = (void *)v80;
      v82 = objc_msgSend(v24, "row");
      if (v82 == -[WFAirportViewController rowCountWithPlacardCell:](v9, "rowCountWithPlacardCell:", 1))
      {

      }
      else
      {
        v97 = objc_msgSend(v24, "row");
        v98 = -[WFAirportViewController rowCountWithPlacardCell:](v9, "rowCountWithPlacardCell:", 2);

        v99 = v97 == v98;
        v9 = self;
        if (!v99)
          goto LABEL_112;
      }
      WFLogForCategory(0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v100)
      {
        v102 = v100;
        if (os_log_type_enabled(v102, v101))
        {
          -[WFAirportViewController currentNetwork](v9, "currentNetwork");
          v103 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          v115 = 2112;
          v116 = v103;
          _os_log_impl(&dword_2196CC000, v102, v101, "%s: tapped on current network %@", buf, 0x16u);

        }
      }

      -[WFAirportViewController currentNetwork](v9, "currentNetwork");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "networkListViewController:didTapRecord:", v9, v104);

LABEL_112:
      objc_msgSend(v105, "deselectRowAtIndexPath:animated:", v24, 1);

      return;
    case 1uLL:
      -[WFAirportViewController knownNetworks](v9, "knownNetworks");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v9;
      v43 = objc_msgSend(v41, "count");

      if (v25 >= v43)
      {
        WFLogForCategory(0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v58)
          goto LABEL_111;
        v84 = v58;
        if (!os_log_type_enabled(v84, v83))
          goto LABEL_110;
        v85 = objc_msgSend(v24, "row");
        -[WFAirportViewController knownNetworks](self, "knownNetworks");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "count");
        *(_DWORD *)buf = 136315650;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        v115 = 2050;
        v116 = (char *)v85;
        v117 = 2050;
        v118 = v87;
        v88 = "%s: cannot find known network at index %{public}lu networks %{public}lu";
        goto LABEL_109;
      }
      -[WFAirportViewController knownNetworks](v42, "knownNetworks");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndex:", v25);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v42;
      if (objc_msgSend(v45, "isInstantHotspot"))
      {
        -[WFAirportViewController knownNetworks](v42, "knownNetworks");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndex:", v25);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeWeak((id *)&self->_joiningHotspot, v48);
        objc_msgSend(v105, "cellForRowAtIndexPath:", v24);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setState:", 1);

        v46 = self;
      }
      WFLogForCategory(0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v50)
      {
        v52 = v50;
        if (os_log_type_enabled(v52, v51))
        {
          v53 = objc_msgSend(v45, "isInstantHotspot");
          *(_DWORD *)buf = 136315650;
          v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          v115 = 2112;
          v116 = (char *)v45;
          v117 = 1024;
          LODWORD(v118) = v53;
          _os_log_impl(&dword_2196CC000, v52, v51, "%s: tapped on known record %@ (hotspot %d)", buf, 0x1Cu);
        }

        v24 = v106;
      }

      objc_msgSend(v27, "networkListViewController:didTapRecord:", v46, v45);
      goto LABEL_112;
    case 2uLL:
      -[WFAirportViewController popularNetworks](v9, "popularNetworks");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v9;
      v56 = objc_msgSend(v54, "count");

      if (v25 < v56)
      {
        -[WFAirportViewController popularNetworks](v55, "popularNetworks");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndex:", v25);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        WFLogForCategory(0);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v59 && os_log_type_enabled(v59, v60))
        {
          *(_DWORD *)buf = 136315394;
          v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          v115 = 2112;
          v116 = (char *)v58;
          v61 = "%s: tapped on popular record %@";
          v62 = v59;
          v63 = v60;
          goto LABEL_102;
        }
        goto LABEL_103;
      }
      WFLogForCategory(0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v58)
        goto LABEL_111;
      v84 = v58;
      if (!os_log_type_enabled(v84, v83))
        goto LABEL_110;
      v89 = objc_msgSend(v24, "row");
      -[WFAirportViewController popularNetworks](self, "popularNetworks");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v86, "count");
      *(_DWORD *)buf = 136315650;
      v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
      v115 = 2050;
      v116 = (char *)v89;
      v117 = 2050;
      v118 = v90;
      v88 = "%s: cannot find popular network at index %{public}lu networks %{public}lu";
      goto LABEL_109;
    case 3uLL:
      -[WFAirportViewController infraNetworks](v9, "infraNetworks");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v9;
      v65 = objc_msgSend(v64, "count");

      if (v25 == v65)
      {
        WFLogForCategory(0);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v66 && os_log_type_enabled(v66, v67))
        {
          *(_DWORD *)buf = 136315394;
          v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
          v115 = 2112;
          v116 = v24;
          _os_log_impl(&dword_2196CC000, v66, v67, "%s: tapped other network cell %@", buf, 0x16u);
        }

        objc_msgSend(v105, "deselectRowAtIndexPath:animated:", v24, 1);
        objc_msgSend(v27, "networkListViewControllerDidTapOtherNetwork:", self);
      }
      else
      {
        -[WFAirportViewController infraNetworks](v55, "infraNetworks");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "count");

        if (v25 >= v92)
        {
          WFLogForCategory(0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v58)
          {
            v84 = v58;
            if (os_log_type_enabled(v84, v83))
            {
              v95 = objc_msgSend(v24, "row");
              -[WFAirportViewController infraNetworks](self, "infraNetworks");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend(v86, "count");
              *(_DWORD *)buf = 136315650;
              v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
              v115 = 2050;
              v116 = (char *)v95;
              v117 = 2050;
              v118 = v96;
              v88 = "%s: cannot find infra network at index %{public}lu networks %{public}lu";
LABEL_109:
              _os_log_impl(&dword_2196CC000, v84, v83, v88, buf, 0x20u);

            }
LABEL_110:

          }
        }
        else
        {
          -[WFAirportViewController infraNetworks](v55, "infraNetworks");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "objectAtIndex:", v25);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          WFLogForCategory(0);
          v59 = objc_claimAutoreleasedReturnValue();
          v94 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v59 && os_log_type_enabled(v59, v94))
          {
            *(_DWORD *)buf = 136315394;
            v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
            v115 = 2112;
            v116 = (char *)v58;
            v61 = "%s: tapped on infra record %@";
            v62 = v59;
            v63 = v94;
LABEL_102:
            _os_log_impl(&dword_2196CC000, v62, v63, v61, buf, 0x16u);
          }
LABEL_103:

          v74 = v27;
          v75 = v55;
LABEL_104:
          objc_msgSend(v74, "networkListViewController:didTapRecord:", v75, v58);
        }
LABEL_111:

      }
      goto LABEL_112;
    case 4uLL:
      -[WFAirportViewController adhocNetworks](v9, "adhocNetworks");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectAtIndex:", v25);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v69 && os_log_type_enabled(v69, v70))
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        v115 = 2112;
        v116 = (char *)v58;
        _os_log_impl(&dword_2196CC000, v69, v70, "%s: tapped on adhoc record %@", buf, 0x16u);
      }

      -[WFAirportViewController _promptToJoinAdhoc:](v9, "_promptToJoinAdhoc:", v58);
      goto LABEL_111;
    case 5uLL:
      -[WFAirportViewController unconfiguredNetworks](v9, "unconfiguredNetworks");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndex:", v25);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      WFLogForCategory(0);
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v72 && os_log_type_enabled(v72, v73))
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        v115 = 2112;
        v116 = (char *)v58;
        _os_log_impl(&dword_2196CC000, v72, v73, "%s: tapped on unconfigured record %@", buf, 0x16u);
      }

      v74 = v27;
      v75 = v9;
      goto LABEL_104;
    case 6uLL:
      objc_msgSend(v27, "airportSettingsViewControllerDidTapDataUsage:", v9);
      goto LABEL_112;
    case 8uLL:
      WFLogForCategory(0);
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v76 && os_log_type_enabled(v76, v77))
      {
        *(_DWORD *)buf = 136315138;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_2196CC000, v76, v77, "%s: tapped on ask to join row", buf, 0xCu);
      }

      -[WFAirportViewController _pushAskToJoinModeSelectionViewController](v9, "_pushAskToJoinModeSelectionViewController");
      goto LABEL_112;
    case 9uLL:
      objc_msgSend(v27, "airportSettingsViewControllerDidTapKnownNetworks:", v9);
      goto LABEL_112;
    case 10uLL:
      WFLogForCategory(0);
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v78 && os_log_type_enabled(v78, v79))
      {
        *(_DWORD *)buf = 136315138;
        v114 = "-[WFAirportViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_2196CC000, v78, v79, "%s: tapped on auto hotspot row", buf, 0xCu);
      }

      -[WFAirportViewController _pushAutoInstantHotspotOptionSelectionViewController](v9, "_pushAutoInstantHotspotOptionSelectionViewController");
      goto LABEL_112;
    default:
      goto LABEL_112;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  -[WFAirportViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", &unk_24DB596C8);

  v8 = objc_msgSend(v5, "section");
  return v8 == v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)MEMORY[0x24BDBCEB8];
  if (v9)
  {
    -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)objc_opt_new();
  }

  if (a4 == 1)
  {
    v13 = objc_msgSend(v7, "section");
    -[WFAirportViewController sections](self, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", &unk_24DB596C8);

    if (v13 == v15)
    {
      -[NSMutableArray objectAtIndex:](self->_editableKnownNetworks, "objectAtIndex:", objc_msgSend(v7, "row"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

      -[NSMutableArray removeObjectAtIndex:](self->_editableKnownNetworks, "removeObjectAtIndex:", objc_msgSend(v7, "row"));
      -[WFAirportViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deleteRowsAtIndexPaths:withRowAnimation:", v18, 0);

    }
    -[WFAirportViewController setNetworksToBeDeleted:](self, "setNetworksToBeDeleted:", v12);
    -[WFAirportViewController _updateKnownNetworksDoneButtonForEditability](self, "_updateKnownNetworksDoneButtonForEditability");
  }

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  os_log_type_t v27;
  int v28;
  const char *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[WFAirportViewController _sectionTypeAtSection:](self, "_sectionTypeAtSection:", objc_msgSend(v5, "section"));
  v7 = objc_msgSend(v5, "row");
  switch(v6)
  {
    case 0uLL:
      -[WFAirportViewController currentNetwork](self, "currentNetwork");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1uLL:
      -[WFAirportViewController knownNetworks](self, "knownNetworks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v7 >= v10)
        goto LABEL_25;
      -[WFAirportViewController knownNetworks](self, "knownNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[WFAirportViewController popularNetworks](self, "popularNetworks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v7 >= v15)
        goto LABEL_25;
      -[WFAirportViewController popularNetworks](self, "popularNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[WFAirportViewController infraNetworks](self, "infraNetworks");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v7 >= v17)
        goto LABEL_25;
      -[WFAirportViewController infraNetworks](self, "infraNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[WFAirportViewController adhocNetworks](self, "adhocNetworks");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v7 >= v19)
        goto LABEL_25;
      -[WFAirportViewController adhocNetworks](self, "adhocNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBuLL:
      -[WFAirportViewController editableKnownNetworks](self, "editableKnownNetworks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v7 >= v13)
        goto LABEL_25;
      -[WFAirportViewController editableKnownNetworks](self, "editableKnownNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCuLL:
      -[WFAirportViewController managedKnownNetworks](self, "managedKnownNetworks");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v7 >= v21)
        goto LABEL_25;
      -[WFAirportViewController managedKnownNetworks](self, "managedKnownNetworks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_25;
  }
  v22 = v11;
  objc_msgSend(v11, "objectAtIndex:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

LABEL_16:
  if (v6 - 11 >= 2)
    v23 = 1;
  else
    v23 = 2;
  if (v8)
  {
    WFLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v24 && os_log_type_enabled(v24, v25))
    {
      v28 = 136315906;
      v29 = "-[WFAirportViewController tableView:accessoryButtonTappedForRowWithIndexPath:]";
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v5;
      v34 = 2048;
      v35 = v23;
      _os_log_impl(&dword_2196CC000, v24, v25, "%s: tapped on accessory for record %@ at indexPath %@, context: %ld", (uint8_t *)&v28, 0x2Au);
    }

    -[WFAirportViewController listDelegate](self, "listDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkListViewController:showSettingsForNetwork:context:", self, v8, v23);

  }
  else
  {
LABEL_25:
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v27))
    {
      v28 = 138543362;
      v29 = (const char *)v5;
      _os_log_impl(&dword_2196CC000, v8, v27, "Accessory button tapped nil record at indexPath %{public}@", (uint8_t *)&v28, 0xCu);
    }
  }

}

- (void)_promptToJoinAdhoc:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocAdhocJoinTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocAdhocJoinBody"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocAdhocJoinConfirmButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__WFAirportViewController__promptToJoinAdhoc___block_invoke;
  v23[3] = &unk_24DB37580;
  v23[4] = self;
  v24 = v4;
  v17 = v4;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocAdhocJoinCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v22);

  -[WFAirportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

void __46__WFAirportViewController__promptToJoinAdhoc___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "listDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkListViewController:didTapRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v3, 1, 1);

}

- (id)_defaultSectionsForPowerState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  id WeakRetained;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24DB59680, &unk_24DB59668, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
  {
    if (-[WFAirportViewController deviceCapability](self, "deviceCapability") == 3)
      objc_msgSend(v5, "addObjectsFromArray:", &unk_24DB59DE8);
    if (-[WFAirportViewController deviceCapability](self, "deviceCapability") != 4)
      objc_msgSend(v5, "addObjectsFromArray:", &unk_24DB59E00);
  }
  if (-[WFAirportViewController _askToJoinShouldBeVisible](self, "_askToJoinShouldBeVisible"))
  {
    objc_msgSend(v5, "addObject:", &unk_24DB59698);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  self->_askToJoinShown = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  v8 = objc_msgSend(WeakRetained, "networkListViewControllerNetworkRestrictionActive:", self);

  if ((v8 & 1) == 0)
    objc_msgSend(v5, "addObject:", &unk_24DB596B0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24DB59680, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
  {
    if (-[WFAirportViewController deviceCapability](self, "deviceCapability") == 3)
      objc_msgSend(v9, "addObjectsFromArray:", &unk_24DB59E18);
    if (-[WFAirportViewController deviceCapability](self, "deviceCapability") != 4)
      objc_msgSend(v9, "addObjectsFromArray:", &unk_24DB59E30);
  }
  if (v3)
    v10 = v5;
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)_sectionTypeAtSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = 136315394;
      v14 = "-[WFAirportViewController _sectionTypeAtSection:]";
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_2196CC000, v11, v12, "%s: invalid section index %d", (uint8_t *)&v13, 0x12u);
    }

    -[WFAirportViewController _dumpSections](self, "_dumpSections");
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[WFAirportViewController sections](self, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    return v9;
  }
}

- (void)_powerSwitchChanged:(id)a3
{
  unint64_t v4;
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
  v4 = objc_msgSend(a3, "isOn");
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      WFPowerStateToggleToString(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFAirportViewController _powerSwitchChanged:]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2196CC000, v7, v6, "%s: user toggled power to %@", (uint8_t *)&v10, 0x16u);

    }
  }

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "networkListViewController:userDidChangePowerToggle:", self, v4);

}

- (void)_updateAskToJoinMode:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v12 = 136315394;
    v13 = "-[WFAirportViewController _updateAskToJoinMode:]";
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: ask to join state changed %d", (uint8_t *)&v12, 0x12u);
  }

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "airportSettingsViewController:setAskToJoinMode:", self, a3);

  -[WFAirportViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", &unk_24DB59698);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WFAirportViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_reloadSectionHeaderFooters:withRowAnimation:", v11, 100);

  }
}

- (void)_enableWAPISwitchChanged:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v9 = 136315394;
      v10 = "-[WFAirportViewController _enableWAPISwitchChanged:]";
      v11 = 1024;
      v12 = objc_msgSend(v4, "isOn");
      _os_log_impl(&dword_2196CC000, v7, v6, "%s: wapi state changed %d", (uint8_t *)&v9, 0x12u);
    }

  }
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "networkListViewController:setWAPIEnabled:", self, objc_msgSend(v4, "isOn"));

}

- (id)_sectionNameAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;

  -[WFAirportViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFAirportViewController _nameOfSection:](self, "_nameOfSection:", objc_msgSend(v6, "unsignedIntegerValue"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("Unknown section");
  }

  return v7;
}

- (id)_nameOfSection:(unint64_t)a3
{
  if (a3 > 0xC)
    return CFSTR("<unknown>");
  else
    return off_24DB37780[a3];
}

- (void)_dumpSections
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFAirportViewController sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        WFLogForCategory(0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v9)
        {
          v11 = v9;
          if (os_log_type_enabled(v11, v10))
          {
            -[WFAirportViewController _nameOfSection:](self, "_nameOfSection:", objc_msgSend(v8, "integerValue"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v19 = v5 + i;
            v20 = 2114;
            v21 = v12;
            _os_log_impl(&dword_2196CC000, v11, v10, "%lu- %{public}@", buf, 0x16u);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      v5 += i;
    }
    while (v4);
  }

}

- (BOOL)_isChinaDevice
{
  return WFCapabilityIsChinaDevice(-[WFAirportViewController deviceCapability](self, "deviceCapability"));
}

- (void)_pushAutoInstantHotspotOptionSelectionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFValueListViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinNeverTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinAskTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinAutoTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFValueListViewController initWithTitles:switchTitle:]([WFValueListViewController alloc], "initWithTitles:switchTitle:", v10, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFValueListViewController navigationItem](v11, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController _getAutoHotspotOptionText:](self, "_getAutoHotspotOptionText:", objc_msgSend(v15, "networkListViewControllerAutoInstantHotspotOption:", self));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFValueListViewController setSelectedTitle:](v11, "setSelectedTitle:", v16);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__WFAirportViewController__pushAutoInstantHotspotOptionSelectionViewController__block_invoke;
  v18[3] = &unk_24DB375A8;
  v18[4] = self;
  -[WFValueListViewController setCompletionHandler:](v11, "setCompletionHandler:", v18);
  -[WFAirportViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushViewController:animated:", v11, 1);

}

void __79__WFAirportViewController__pushAutoInstantHotspotOptionSelectionViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinAutoTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 2;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "updateAutoInstantHotspotSetting:", v6);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinAskTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v13, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocAutoInstantHotspotJoinNeverTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v13, "isEqualToString:", v11);

  if (v12)
  {
    v6 = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_pushAskToJoinModeSelectionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFValueListViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailOff"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailNotify"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailAsk"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFValueListViewController initWithTitles:switchTitle:]([WFValueListViewController alloc], "initWithTitles:switchTitle:", v10, 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFValueListViewController navigationItem](v11, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  -[WFAirportViewController _askToJoinStateStringForATJMode:](self, "_askToJoinStateStringForATJMode:", -[WFAirportViewController _askToJoinMode](self, "_askToJoinMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFValueListViewController setSelectedTitle:](v11, "setSelectedTitle:", v15);

  v16 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke;
  v19[3] = &unk_24DB375A8;
  v19[4] = self;
  -[WFValueListViewController setCompletionHandler:](v11, "setCompletionHandler:", v19);
  v18[0] = v16;
  v18[1] = 3221225472;
  v18[2] = __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke_2;
  v18[3] = &unk_24DB375D0;
  v18[4] = self;
  -[WFValueListViewController setFooterHandler:](v11, "setFooterHandler:", v18);
  -[WFAirportViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushViewController:animated:", v11, 1);

}

uint64_t __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAskToJoinMode:", objc_msgSend(*(id *)(a1 + 32), "_askToJoinModeFromString:", a2));
}

uint64_t __68__WFAirportViewController__pushAskToJoinModeSelectionViewController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_askToJoinFooterStringForMode:", objc_msgSend(*(id *)(a1 + 32), "_askToJoinModeFromString:", a2));
}

- (void)_updateNetworkRestrictionHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  __CFString *v11;
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
  double v22;
  double v23;
  void *v24;
  id v25;

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "networkListViewControllerNetworkRestrictionActive:", self) & 1) != 0
    || (-[WFAirportViewController tableView](self, "tableView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "tableHeaderView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if (objc_msgSend(v25, "networkListViewControllerNetworkRestrictionActive:", self)
      && !-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
    {
      -[WFAirportViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v8, 0.0);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, v8, 100.0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.427450985, 0.427450985, 0.447058827, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v10);

      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "setNumberOfLines:", 0);
      objc_msgSend(v9, "setTextAlignment:", 1);
      if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
      {
        objc_msgSend(CFSTR("kWFLocNetworkRestrictionActive"), "stringByAppendingString:", CFSTR("_CH"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("kWFLocNetworkRestrictionActive");
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v14);

      objc_msgSend(v9, "setText:", v13);
      objc_msgSend(v5, "addSubview:", v9);
      v15 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("headerLabel"), v9, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-20-[headerLabel]-20-|"), 0, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addConstraints:", v17);

      v18 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("headerLabel"), v9, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-40-[headerLabel]-40-|"), 0, 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addConstraints:", v20);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, 0, 0, 1.0, v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addConstraint:", v21);
      objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
      v23 = v22 + 40.0;
      objc_msgSend(v5, "removeConstraint:", v21);
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, v8, v23);
      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(v9, "setPreferredMaxLayoutWidth:", v8);
      -[WFAirportViewController tableView](self, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTableHeaderView:", v5);

    }
    else
    {
      -[WFAirportViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTableHeaderView:", 0);
    }

  }
}

- (id)_askToJoinStateStringForATJMode:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinDetailAsk");
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinDetailNotify");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinDetailOff");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_askToJoinFooterString
{
  return -[WFAirportViewController _askToJoinFooterStringForMode:](self, "_askToJoinFooterStringForMode:", -[WFAirportViewController _askToJoinMode](self, "_askToJoinMode"));
}

- (id)_askToJoinFooterStringForMode:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinAskFooter");
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinNotifyFooter");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAskToJoinOffFooter");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_askToJoinMode
{
  void *v3;
  int64_t v4;

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "airportSettingsViewControllerAskToJoinMode:", self);

  return v4;
}

- (BOOL)_askToJoinShouldBeVisible
{
  return -[WFAirportViewController _askToJoinMode](self, "_askToJoinMode") != -1;
}

- (void)_reloadCurrentNetworkCell
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController _currentNetworkCellIndexPath](self, "_currentNetworkCellIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFAirportViewController _reloadCurrentNetworkCell]";
      _os_log_impl(&dword_2196CC000, v4, v5, "%s: reloading current network index path", buf, 0xCu);
    }

    -[WFAirportViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

  }
}

- (id)_currentNetworkCellIndexPath
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[WFAirportViewController showDiagnosticsCell](self, "showDiagnosticsCell"))
    v3 = 2;
  else
    v3 = 1;
  v4 = -[WFAirportViewController rowCountWithPlacardCell:](self, "rowCountWithPlacardCell:", v3);
  -[WFAirportViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", &unk_24DB59680);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        -[WFAirportViewController _nameOfSection:](self, "_nameOfSection:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[WFAirportViewController _currentNetworkCellIndexPath]";
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_2196CC000, v10, v9, "%s: index for %{public}@ not found in sections", (uint8_t *)&v12, 0x16u);

      }
    }

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v4, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_currentNetworkCell
{
  void *v3;
  void *v4;
  void *v5;

  -[WFAirportViewController _currentNetworkCellIndexPath](self, "_currentNetworkCellIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFAirportViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForRowAtIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_reloadSectionForHotspotChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginUpdates");

  -[WFAirportViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", &unk_24DB59650);

  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v11 = 136315138;
      v12 = "-[WFAirportViewController _reloadSectionForHotspotChange]";
      _os_log_impl(&dword_2196CC000, v6, v7, "%s: hotspot section not found", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v8 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v8))
    {
      v11 = 136315394;
      v12 = "-[WFAirportViewController _reloadSectionForHotspotChange]";
      v13 = 1024;
      v14 = v5;
      _os_log_impl(&dword_2196CC000, v6, v8, "%s: reloading hotspot in section %d", (uint8_t *)&v11, 0x12u);
    }

    -[WFAirportViewController tableView](self, "tableView");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject reloadSections:withRowAnimation:](v6, "reloadSections:withRowAnimation:", v9, 5);

  }
  -[WFAirportViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endUpdates");

}

- (void)_reloadPowerSection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFAirportViewController__reloadPowerSection__block_invoke;
  block[3] = &unk_24DB373C8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__WFAirportViewController__reloadPowerSection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", &unk_24DB59680);

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFAirportViewController _reloadPowerSection]_block_invoke";
      _os_log_impl(&dword_2196CC000, v4, v5, "%s: power section not found", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSections:withRowAnimation:", v6, 5);

  }
}

- (void)setUserAutoJoinEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_userAutoJoinEnabled != a3)
  {
    v3 = a3;
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v18 = 136315394;
      v19 = "-[WFAirportViewController setUserAutoJoinEnabled:]";
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: userAutoJoinEnabled %d", (uint8_t *)&v18, 0x12u);
    }

    self->_userAutoJoinEnabled = v3;
    -[WFAirportViewController sections](self, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", &unk_24DB59680);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
      {
        v18 = 136315138;
        v19 = "-[WFAirportViewController setUserAutoJoinEnabled:]";
        _os_log_impl(&dword_2196CC000, v9, v10, "%s: power section not found", (uint8_t *)&v18, 0xCu);
      }

      -[WFAirportViewController _dumpSections](self, "_dumpSections");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", v8);
      -[WFAirportViewController sections](self, "sections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", &unk_24DB59698);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[WFAirportViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAirportViewController sections](self, "sections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "numberOfRowsInSection:", objc_msgSend(v15, "indexOfObject:", &unk_24DB59698));

        if (v16)
          objc_msgSend(v11, "addIndex:", v13);
      }
      -[WFAirportViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_reloadSectionHeaderFooters:withRowAnimation:", v11, 100);

    }
  }
}

- (void)updateAutoInstantHotspotSetting:(int64_t)a3
{
  id v5;

  -[WFAirportViewController listDelegate](self, "listDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkListViewController:setAutoInstantOption:", self, a3);

}

- (id)_getAutoHotspotOptionText:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("kWFLocAutoInstantHotspotJoinAutoTitle");
    }
    else
    {
      if (a3 != 1)
      {
        v6 = 0;
        return v6;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("kWFLocAutoInstantHotspotJoinAskTitle");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocAutoInstantHotspotJoinNeverTitle");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)userAutoJoinDisabledWarning
{
  NSString *userAutoJoinDisabledWarning;
  void *v4;
  const __CFString *v5;
  NSString *v6;
  NSString *v7;

  userAutoJoinDisabledWarning = self->_userAutoJoinDisabledWarning;
  if (!userAutoJoinDisabledWarning)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
      v5 = CFSTR("kWFLocUserAutoJoinDisabledWarningCH");
    else
      v5 = CFSTR("kWFLocUserAutoJoinDisabledWarning");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userAutoJoinDisabledWarning;
    self->_userAutoJoinDisabledWarning = v6;

    userAutoJoinDisabledWarning = self->_userAutoJoinDisabledWarning;
  }
  return userAutoJoinDisabledWarning;
}

- (NSString)powerOffLocationWarning
{
  NSString *powerOffLocationWarning;
  _BOOL4 v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  int v19;
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  powerOffLocationWarning = self->_powerOffLocationWarning;
  if (!powerOffLocationWarning)
  {
    v4 = -[WFAirportViewController _isChinaDevice](self, "_isChinaDevice");
    v5 = MGGetBoolAnswer();
    -[WFAirportViewController listDelegate](self, "listDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "networkListViewControllerIsAutoUnlockEnabled:", self);

    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      v19 = 136315906;
      v20 = "-[WFAirportViewController powerOffLocationWarning]";
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = v5;
      v25 = 1024;
      v26 = v7;
      _os_log_impl(&dword_2196CC000, v8, v9, "%s: chinaDevice: %d, cellularDevice: %d, autoUnlockEnabled: %d", (uint8_t *)&v19, 0x1Eu);
    }

    v10 = CFSTR("kWFLocLocationServicesWarning");
    if (v4)
      v10 = CFSTR("kWFLocLocationServicesWarningCH");
    v11 = CFSTR("kWFLocLocationServicesCellularWarning");
    if (v4)
      v11 = CFSTR("kWFLocLocationServicesCellularWarningCH");
    v12 = CFSTR("kWFLocAutoUnlockLocationServicesWarning");
    if (v5)
      v10 = (__CFString *)v11;
    v13 = CFSTR("kWFLocAutoUnlockLocationServicesCellularWarning");
    if (v4)
    {
      v12 = CFSTR("kWFLocAutoUnlockLocationServicesWarningCH");
      v13 = CFSTR("kWFLocAutoUnlockLocationServicesCellularWarningCH");
    }
    if (!v5)
      v13 = v12;
    if (v7)
      v10 = (__CFString *)v13;
    v14 = v10;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = self->_powerOffLocationWarning;
    self->_powerOffLocationWarning = v16;

    powerOffLocationWarning = self->_powerOffLocationWarning;
  }
  return powerOffLocationWarning;
}

- (int64_t)_askToJoinModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailOff"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailNotify"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocAskToJoinDetailAsk"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if (v13)
        v7 = 2;
      else
        v7 = 0;
    }
  }

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)WFAirportViewController;
  v7 = a4;
  -[WFAirportViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24DB375F8;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_24DB375F8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

void __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

uint64_t __78__WFAirportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPowerSection");
}

- (void)_processPendingCurrentNetworkUpdate
{
  NSObject *v3;
  os_log_type_t v4;
  WFPendingNetworkUpdate *pendingCurrentNetworkUpdate;
  void *v6;
  void *v7;
  WFPendingNetworkUpdate *v8;
  _QWORD v9[6];
  _BYTE buf[24];
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_pendingCurrentNetworkUpdate)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      pendingCurrentNetworkUpdate = self->_pendingCurrentNetworkUpdate;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFAirportViewController _processPendingCurrentNetworkUpdate]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = pendingCurrentNetworkUpdate;
      _os_log_impl(&dword_2196CC000, v3, v4, "%s: pending update='%@'", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v11 = __Block_byref_object_copy__0;
    v12 = __Block_byref_object_dispose__0;
    -[WFPendingNetworkUpdate network](self->_pendingCurrentNetworkUpdate, "network");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[WFPendingNetworkUpdate network](self->_pendingCurrentNetworkUpdate, "network");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v7, "copyWithZone:", 0);

    }
    else
    {
      v13 = 0;
    }

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__WFAirportViewController__processPendingCurrentNetworkUpdate__block_invoke;
    v9[3] = &unk_24DB37620;
    v9[4] = self;
    v9[5] = buf;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    v8 = self->_pendingCurrentNetworkUpdate;
    self->_pendingCurrentNetworkUpdate = 0;

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __62__WFAirportViewController__processPendingCurrentNetworkUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)knownNetworksWillResignActive
{
  WFLockView *screenProtector;
  WFLockView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFLockView *v10;
  WFLockView *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    screenProtector = self->_screenProtector;
    if (!screenProtector)
    {
      v4 = [WFLockView alloc];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocKnownNetworksLockTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirportViewController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFLockView initWithTitle:viewToCover:](v4, "initWithTitle:viewToCover:", v6, v9);
      v11 = self->_screenProtector;
      self->_screenProtector = v10;

      -[WFAirportViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLockView setBelongedNavigationController:](self->_screenProtector, "setBelongedNavigationController:", v12);

      screenProtector = self->_screenProtector;
    }
    -[WFLockView superview](screenProtector, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirportViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      WFLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2196CC000, v16, v17, "Showing screen protector when preferences resign active in edit mode.", v21, 2u);
      }

      -[WFAirportViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "topViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", self->_screenProtector);

    }
  }
}

- (void)knownNetworksDidBecomeActive
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2196CC000, v3, v4, "Trying to prompt authentication to remove screen protector.", v5, 2u);
    }

    -[WFAirportViewController _promptAuthToViewKnownNetworkList](self, "_promptAuthToViewKnownNetworkList");
  }
}

- (void)knownNetworksWillEnterForeground
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2196CC000, v3, v4, "Trying to prompt authentication to remove screen protector.", v5, 2u);
    }

    -[WFAirportViewController _promptAuthToViewKnownNetworkList](self, "_promptAuthToViewKnownNetworkList");
  }
}

- (void)_promptAuthToViewKnownNetworkList
{
  NSObject *v2;
  os_log_type_t v3;
  const char *v4;
  WFLockView *screenProtector;
  os_log_type_t v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  _QWORD v15[5];
  id v16;
  id buf[2];

  if (self->_isAuthenticating)
  {
    WFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      LOWORD(buf[0]) = 0;
      v4 = "Authentication in progress, do not prompt again.";
LABEL_26:
      v13 = v2;
      v14 = v3;
LABEL_27:
      _os_log_impl(&dword_2196CC000, v13, v14, v4, (uint8_t *)buf, 2u);
    }
  }
  else if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    screenProtector = self->_screenProtector;
    WFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v8 = v2 == 0;
    else
      v8 = 1;
    v9 = !v8;
    if (screenProtector)
    {
      if (v9 && os_log_type_enabled(v2, v7))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2196CC000, v2, v7, "Start Authentication process for known network list.", (uint8_t *)buf, 2u);
      }

      self->_isAuthenticating = 1;
      WFLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2196CC000, v10, v11, "Showing auth to unlock known network list.", (uint8_t *)buf, 2u);
      }

      v2 = objc_alloc_init(MEMORY[0x24BDDA930]);
      objc_initWeak(buf, self);
      -[WFAirportViewController _wifiKnownNetworkContextOptionsIsChinaDevice:](self, "_wifiKnownNetworkContextOptionsIsChinaDevice:", -[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke;
      v15[3] = &unk_24DB37670;
      objc_copyWeak(&v16, buf);
      v15[4] = self;
      -[NSObject evaluatePolicy:options:reply:](v2, "evaluatePolicy:options:reply:", 2, v12, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
    else if (v9 && os_log_type_enabled(v2, v7))
    {
      LOWORD(buf[0]) = 0;
      v4 = "Screen protector is empty, no need to authenticate to remove.";
      v13 = v2;
      v14 = v7;
      goto LABEL_27;
    }
  }
  else
  {
    WFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      LOWORD(buf[0]) = 0;
      v4 = "Not in editing mode, do not prompt authentication.";
      goto LABEL_26;
    }
  }

}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_2;
  block[3] = &unk_24DB37648;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v10);
}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_2(id *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2196CC000, v2, v3, "Finishing Authentication process for known network list.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setIsAuthenticating:", 0);

  if (!a1[4])
  {
LABEL_14:
    objc_msgSend(a1[5], "_removeScreenProtector");
    return;
  }
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = a1[4];
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_2196CC000, v5, v6, "Authentication Error: %@", buf, 0xCu);
  }

  if (objc_msgSend(a1[4], "code") != -9)
  {
    if (objc_msgSend(a1[4], "code") == -2 || objc_msgSend(a1[4], "code") == -4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_291;
      block[3] = &unk_24DB373C8;
      block[4] = a1[5];
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      return;
    }
    goto LABEL_14;
  }
}

void __60__WFAirportViewController__promptAuthToViewKnownNetworkList__block_invoke_291(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "belongedNavigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_transitionToScanList");
  objc_msgSend(*(id *)(a1 + 32), "_removeScreenProtector");

}

- (void)_removeScreenProtector
{
  NSObject *v3;
  os_log_type_t v4;
  WFLockView *screenProtector;
  uint8_t v6[16];

  if (self->_screenProtector)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2196CC000, v3, v4, "Removing screen protector", v6, 2u);
    }

    -[WFLockView removeFromSuperview](self->_screenProtector, "removeFromSuperview");
    screenProtector = self->_screenProtector;
    self->_screenProtector = 0;

  }
}

- (void)_loadEditButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocEditListButtonTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v7, 0, self, sel_editKnownNetworks);
    -[WFAirportViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v4);

    objc_msgSend(v4, "setEnabled:", 1);
  }
}

- (void)editKnownNetworks
{
  id v3;
  void *v4;
  _QWORD v5[5];

  -[WFAirportViewController setNetworksToBeDeleted:](self, "setNetworksToBeDeleted:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDDA930]);
  -[WFAirportViewController _wifiKnownNetworkContextOptionsIsChinaDevice:](self, "_wifiKnownNetworkContextOptionsIsChinaDevice:", -[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WFAirportViewController_editKnownNetworks__block_invoke;
  v5[3] = &unk_24DB37698;
  v5[4] = self;
  objc_msgSend(v3, "evaluatePolicy:options:reply:", 2, v4, v5);

}

void __44__WFAirportViewController_editKnownNetworks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFAirportViewController_editKnownNetworks__block_invoke_2;
  v7[3] = &unk_24DB37418;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __44__WFAirportViewController_editKnownNetworks__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    WFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_2196CC000, v2, v3, "Authentication Error: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = *(void **)(a1 + 32);
    result = objc_msgSend(v5, "code");
    if (result != -5)
    {
      if (v5)
        return result;
      return objc_msgSend(*(id *)(a1 + 40), "_transitionToKnownNetworksList");
    }
    goto LABEL_10;
  }
  if (objc_msgSend(0, "code") == -5)
  {
LABEL_10:
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2196CC000, v7, v8, "User turned off passcode", (uint8_t *)&v9, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "_transitionToKnownNetworksList");
}

- (void)_transitionToKnownNetworksList
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[WFAirportViewController setIsInEditingMode:](self, "setIsInEditingMode:", 1);
  -[WFAirportViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

  -[WFAirportViewController refreshKnownNetworksUpdateTableView:](self, "refreshKnownNetworksUpdateTableView:", 0);
  -[WFAirportViewController _adjustNavigationItemsForEditingMode](self, "_adjustNavigationItemsForEditingMode");
  -[WFAirportViewController _updateNetworkRestrictionHeader](self, "_updateNetworkRestrictionHeader");
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFAirportViewController listDelegate](self, "listDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airportSettingsViewControllerDidStartEditingKnownNetworks:", self);

  }
  -[WFAirportViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditing:", 1);

  -[WFAirportViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WFAirportViewController__transitionToKnownNetworksList__block_invoke;
  v9[3] = &unk_24DB373C8;
  v9[4] = self;
  objc_msgSend(v8, "performBatchUpdates:completion:", v9, 0);

}

void __57__WFAirportViewController__transitionToKnownNetworksList__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_defaultSectionsForEditing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreviousSections:", v2);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteSections:withRowAnimation:", v4, 0);

  objc_msgSend(*(id *)(a1 + 32), "setSections:", v7);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSections:withRowAnimation:", v6, 4);

}

- (id)_sortedProfilesFromSet:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFScanRecordAlphaSortCompartor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultSectionsForEditing
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_managedKnownNetworks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_editableKnownNetworks, "count"))
      objc_msgSend(v3, "addObject:", &unk_24DB596C8);
    if (-[NSArray count](self->_managedKnownNetworks, "count"))
      objc_msgSend(v3, "addObject:", &unk_24DB59710);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24DB596C8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_adjustNavigationItemsForEditingMode
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

  -[WFAirportViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController setOriginalBackButtonItem:](self, "setOriginalBackButtonItem:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelEditing);
  -[WFAirportViewController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v6);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_finishEditing);
  -[WFAirportViewController parentViewController](self, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v9);

  -[WFAirportViewController _updateKnownNetworksDoneButtonForEditability](self, "_updateKnownNetworksDoneButtonForEditability");
}

- (void)finishEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    WFLogForCategory(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 134217984;
        v12 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_2196CC000, v7, v6, "Deleting %lu known networks,", (uint8_t *)&v11, 0xCu);

      }
    }

    -[WFAirportViewController promptConfirmAlert](self, "promptConfirmAlert");
  }
  else
  {
    -[WFAirportViewController _transitionToScanList](self, "_transitionToScanList");
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2196CC000, v9, v10, "No change to known network lists, bring back network list.", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)cancelEditing
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2196CC000, v3, v4, "cancel known networks editing", v5, 2u);
  }

  -[WFAirportViewController _transitionToScanList](self, "_transitionToScanList");
  -[WFAirportViewController _updateKnownNetworksDoneButtonForEditability](self, "_updateKnownNetworksDoneButtonForEditability");
}

- (void)promptConfirmAlert
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
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  objc_initWeak(&location, self);
  if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptAlertTitle_CH"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFAirportViewController _isChinaDevice](self, "_isChinaDevice"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptAlertMessage_CH"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptAlertMessage"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptRemoveTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __45__WFAirportViewController_promptConfirmAlert__block_invoke;
  v18 = &unk_24DB376C0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v9, 0, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11, v15, v16, v17, v18);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocDeleteConfirmPromptCancelTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);
  -[WFAirportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __45__WFAirportViewController_promptConfirmAlert__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t v6[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_submitDeletion");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_transitionToScanList");

  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2196CC000, v4, v5, "user tapped on confirm in the removal prompt", v6, 2u);
  }

}

void __45__WFAirportViewController_promptConfirmAlert__block_invoke_319()
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
    _os_log_impl(&dword_2196CC000, v0, v1, "User tapped cancel in confirmation prompt.", v2, 2u);
  }

}

- (void)_transitionToScanList
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[WFAirportViewController originalBackButtonItem](self, "originalBackButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController parentViewController](self, "parentViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v3);

  -[WFAirportViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsSelectionDuringEditing:", 0);

  -[WFAirportViewController _loadEditButton](self, "_loadEditButton");
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFAirportViewController listDelegate](self, "listDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "airportSettingsViewControllerDidFinishEditingKnownNetworks:", self);

  }
  -[WFAirportViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__WFAirportViewController__transitionToScanList__block_invoke;
  v11[3] = &unk_24DB373C8;
  v11[4] = self;
  objc_msgSend(v9, "performBatchUpdates:completion:", v11, 0);

  -[WFAirportViewController setIsInEditingMode:](self, "setIsInEditingMode:", 0);
  -[WFAirportViewController _updateNetworkRestrictionHeader](self, "_updateNetworkRestrictionHeader");
  -[WFAirportViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditing:", 0);

  -[WFAirportViewController setNetworksToBeDeleted:](self, "setNetworksToBeDeleted:", 0);
}

void __48__WFAirportViewController__transitionToScanList__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "previousSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "previousSections");
  else
    objc_msgSend(*(id *)(a1 + 32), "_defaultSectionsForPowerState:", objc_msgSend(*(id *)(a1 + 32), "powered"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSections:withRowAnimation:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "setSections:", v8);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSections:withRowAnimation:", v7, 4);

}

- (void)_submitDeletion
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  os_log_type_t v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
    -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(WeakRetained, "removeKnownNetworks:", v6);

    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v10 = v8 == 0;
    else
      v10 = 1;
    v11 = !v10;
    if (v7)
    {
      if (v11)
      {
        v12 = v8;
        if (os_log_type_enabled(v12, v9))
        {
          -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = (uint64_t)v13;
          v14 = "Error occurred when trying to delete networks:%@";
LABEL_15:
          _os_log_impl(&dword_2196CC000, v12, v9, v14, (uint8_t *)&v15, 0xCu);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v11)
    {
      v12 = v8;
      if (os_log_type_enabled(v12, v9))
      {
        -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134217984;
        v16 = objc_msgSend(v13, "count");
        v14 = "User deleted %lu networks successfully";
        goto LABEL_15;
      }
LABEL_16:

    }
  }
}

- (void)_updateKnownNetworksDoneButtonForEditability
{
  void *v3;
  _BOOL8 v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[WFAirportViewController isInEditingMode](self, "isInEditingMode"))
  {
    -[WFAirportViewController networksToBeDeleted](self, "networksToBeDeleted");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    v4 = 1;
  }
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v10 = 136315394;
    v11 = "-[WFAirportViewController _updateKnownNetworksDoneButtonForEditability]";
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: done button enabled=%d", (uint8_t *)&v10, 0x12u);
  }

  -[WFAirportViewController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v4);

}

- (id)_wifiKnownNetworkContextOptionsIsChinaDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = &unk_24DB59728;
  -[WFAirportViewController _passcodePromptForViewingKnownNetworksIsChinaDevice:](self, "_passcodePromptForViewingKnownNetworksIsChinaDevice:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = &unk_24DB59740;
  v10[0] = v5;
  -[WFAirportViewController _touchIDPromptForKnownNetworksIsChinaDevice:](self, "_touchIDPromptForKnownNetworksIsChinaDevice:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_touchIDPromptForKnownNetworksIsChinaDevice:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("kWFLocTouchIDConfirmationKnownNetworks_CH");
  else
    v6 = CFSTR("kWFLocTouchIDConfirmationKnownNetworks");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_passcodePromptForViewingKnownNetworksIsChinaDevice:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(CFSTR("kWFLocPasswordConfirmationKnownNetworks"), "stringByAppendingString:", CFSTR("_CH"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("kWFLocPasswordConfirmationKnownNetworks");
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)refreshKnownNetworksUpdateTableView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedKnownNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController _sortedProfilesFromSet:](self, "_sortedProfilesFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController setManagedKnownNetworks:](self, "setManagedKnownNetworks:", v7);

  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[WFAirportViewController listDelegate](self, "listDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editableKnownNetworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController _sortedProfilesFromSet:](self, "_sortedProfilesFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController setEditableKnownNetworks:](self, "setEditableKnownNetworks:", v12);

  WFLogForCategory(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      -[WFAirportViewController managedKnownNetworks](self, "managedKnownNetworks");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      -[WFAirportViewController editableKnownNetworks](self, "editableKnownNetworks");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218240;
      v21 = v17;
      v22 = 2048;
      v23 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_2196CC000, v15, v14, "managed networks=%lu editable networks=%lu", (uint8_t *)&v20, 0x16u);

    }
  }

  if (v3)
  {
    -[WFAirportViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadData");

  }
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1048, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (WFAirportViewControllerDelegate)listDelegate
{
  return (WFAirportViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (BOOL)showOtherNetwork
{
  return self->_showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->_showOtherNetwork = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (NSString)currentNetworkSubtitle
{
  return self->_currentNetworkSubtitle;
}

- (BOOL)userAutoJoinEnabled
{
  return self->_userAutoJoinEnabled;
}

- (BOOL)askToJoinShown
{
  return self->_askToJoinShown;
}

- (void)setAskToJoinShown:(BOOL)a3
{
  self->_askToJoinShown = a3;
}

- (BOOL)disablePowerModification
{
  return self->_disablePowerModification;
}

- (void)setDisablePowerModification:(BOOL)a3
{
  self->_disablePowerModification = a3;
}

- (BOOL)isManagedAppleID
{
  return self->_isManagedAppleID;
}

- (void)setIsManagedAppleID:(BOOL)a3
{
  self->_isManagedAppleID = a3;
}

- (void)setPowerOffLocationWarning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void)setUserAutoJoinDisabledWarning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (BOOL)showDiagnostics
{
  return self->_showDiagnostics;
}

- (void)setShowDiagnostics:(BOOL)a3
{
  self->_showDiagnostics = a3;
}

- (BOOL)showNANUI
{
  return self->_showNANUI;
}

- (void)setShowNANUI:(BOOL)a3
{
  self->_showNANUI = a3;
}

- (BOOL)showKnownNetworks
{
  return self->_showKnownNetworks;
}

- (void)setShowKnownNetworks:(BOOL)a3
{
  self->_showKnownNetworks = a3;
}

- (NSOrderedSet)sections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSOrderedSet)previousSections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPreviousSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSSet)allNetworks
{
  return self->_allNetworks;
}

- (void)setAllNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_allNetworks, a3);
}

- (NSArray)infraNetworks
{
  return self->_infraNetworks;
}

- (void)setInfraNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_infraNetworks, a3);
}

- (NSArray)popularNetworks
{
  return self->_popularNetworks;
}

- (void)setPopularNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_popularNetworks, a3);
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_knownNetworks, a3);
}

- (NSArray)adhocNetworks
{
  return self->_adhocNetworks;
}

- (void)setAdhocNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_adhocNetworks, a3);
}

- (NSArray)unconfiguredNetworks
{
  return self->_unconfiguredNetworks;
}

- (void)setUnconfiguredNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_unconfiguredNetworks, a3);
}

- (WFTableViewHeaderView)chooseNetworkHeader
{
  return self->_chooseNetworkHeader;
}

- (void)setChooseNetworkHeader:(id)a3
{
  objc_storeStrong((id *)&self->_chooseNetworkHeader, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (WFNetworkListRecord)joiningHotspot
{
  return (WFNetworkListRecord *)objc_loadWeakRetained((id *)&self->_joiningHotspot);
}

- (void)setJoiningHotspot:(id)a3
{
  objc_storeWeak((id *)&self->_joiningHotspot, a3);
}

- (WFPendingNetworkUpdate)pendingCurrentNetworkUpdate
{
  return self->_pendingCurrentNetworkUpdate;
}

- (void)setPendingCurrentNetworkUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCurrentNetworkUpdate, a3);
}

- (BOOL)tableViewIsUpdating
{
  return self->_tableViewIsUpdating;
}

- (void)setTableViewIsUpdating:(BOOL)a3
{
  self->_tableViewIsUpdating = a3;
}

- (BOOL)networkResultsChangedWhileUIUpdates
{
  return self->_networkResultsChangedWhileUIUpdates;
}

- (void)setNetworkResultsChangedWhileUIUpdates:(BOOL)a3
{
  self->_networkResultsChangedWhileUIUpdates = a3;
}

- (NSSet)pendingNetworks
{
  return self->_pendingNetworks;
}

- (void)setPendingNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNetworks, a3);
}

- (NSString)currentKnownHeaderText
{
  return self->_currentKnownHeaderText;
}

- (void)setCurrentKnownHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (NSString)currentInfraHeaderText
{
  return self->_currentInfraHeaderText;
}

- (void)setCurrentInfraHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (NSString)currentUnconfiguredHeaderText
{
  return self->_currentUnconfiguredHeaderText;
}

- (void)setCurrentUnconfiguredHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (NSMutableArray)editableKnownNetworks
{
  return self->_editableKnownNetworks;
}

- (void)setEditableKnownNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_editableKnownNetworks, a3);
}

- (NSArray)managedKnownNetworks
{
  return self->_managedKnownNetworks;
}

- (void)setManagedKnownNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_managedKnownNetworks, a3);
}

- (NSArray)networksToBeDeleted
{
  return self->_networksToBeDeleted;
}

- (void)setNetworksToBeDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_networksToBeDeleted, a3);
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  self->_isInEditingMode = a3;
}

- (UIBarButtonItem)originalBackButtonItem
{
  return self->_originalBackButtonItem;
}

- (void)setOriginalBackButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalBackButtonItem, a3);
}

- (WFLockView)screenProtector
{
  return self->_screenProtector;
}

- (void)setScreenProtector:(id)a3
{
  objc_storeStrong((id *)&self->_screenProtector, a3);
}

- (WFNetworkRowConfig)currentNetworkRowConfig
{
  return self->_currentNetworkRowConfig;
}

- (void)setCurrentNetworkRowConfig:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkRowConfig, a3);
}

- (BOOL)isUsingSwiftList
{
  return self->_isUsingSwiftList;
}

- (void)setIsUsingSwiftList:(BOOL)a3
{
  self->_isUsingSwiftList = a3;
}

- (BOOL)usePlacardCell
{
  return self->_usePlacardCell;
}

- (void)setUsePlacardCell:(BOOL)a3
{
  self->_usePlacardCell = a3;
}

- (BOOL)isAuthenticating
{
  return self->_isAuthenticating;
}

- (void)setIsAuthenticating:(BOOL)a3
{
  self->_isAuthenticating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkRowConfig, 0);
  objc_storeStrong((id *)&self->_screenProtector, 0);
  objc_storeStrong((id *)&self->_originalBackButtonItem, 0);
  objc_storeStrong((id *)&self->_networksToBeDeleted, 0);
  objc_storeStrong((id *)&self->_managedKnownNetworks, 0);
  objc_storeStrong((id *)&self->_editableKnownNetworks, 0);
  objc_storeStrong((id *)&self->_currentUnconfiguredHeaderText, 0);
  objc_storeStrong((id *)&self->_currentInfraHeaderText, 0);
  objc_storeStrong((id *)&self->_currentKnownHeaderText, 0);
  objc_storeStrong((id *)&self->_pendingNetworks, 0);
  objc_storeStrong((id *)&self->_pendingCurrentNetworkUpdate, 0);
  objc_destroyWeak((id *)&self->_joiningHotspot);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_chooseNetworkHeader, 0);
  objc_storeStrong((id *)&self->_unconfiguredNetworks, 0);
  objc_storeStrong((id *)&self->_adhocNetworks, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_popularNetworks, 0);
  objc_storeStrong((id *)&self->_infraNetworks, 0);
  objc_storeStrong((id *)&self->_allNetworks, 0);
  objc_storeStrong((id *)&self->_previousSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userAutoJoinDisabledWarning, 0);
  objc_storeStrong((id *)&self->_powerOffLocationWarning, 0);
  objc_storeStrong((id *)&self->_currentNetworkSubtitle, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end
