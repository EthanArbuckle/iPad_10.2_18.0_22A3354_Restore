@implementation WFBuddyViewController

- (WFBuddyViewController)init
{
  int64_t v3;
  _BOOL4 IsChinaDevice;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  WFBuddyViewController *v9;
  objc_super v11;

  v3 = WFCurrentDeviceCapability();
  self->_deviceCapability = v3;
  IsChinaDevice = WFCapabilityIsChinaDevice(v3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (IsChinaDevice)
    v7 = CFSTR("kWFLocBuddyHeaderViewTitleCH");
  else
    v7 = CFSTR("kWFLocBuddyHeaderViewTitle");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)WFBuddyViewController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v11, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v8, 0, 0, 1);

  return v9;
}

- (void)viewDidLoad
{
  NSOrderedSet *v3;
  NSOrderedSet *sections;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[8];
  objc_super v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)WFBuddyViewController;
  -[OBTableWelcomeController viewDidLoad](&v36, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", &unk_24DB59BD8, 0);
  v3 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  sections = self->_sections;
  self->_sections = v3;

  self->_tableViewIsUpdating = 0;
  self->_networkResultsChangedWhileUIUpdates = 0;
  self->_tableReloadRequestQueued = 0;
  v5 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nibWithNibName:bundle:", CFSTR("WFBuddyNetworkListCell"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v10, v11, "Missing WFBuddyNetworkListCell nib!", buf, 2u);
    }

  }
  objc_msgSend(v6, "registerNib:forCellReuseIdentifier:", v9, CFSTR("WFBuddyNetworkListCell"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFBuddyOtherNetworkCell"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFBuddyWAPICell"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kWFNetworkAlternativeCellIdentifier"));
  v12 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nibWithNibName:bundle:", CFSTR("WFAdditionalSetupTableViewCell"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196CC000, v15, v16, "Missing WFAdditionalSetupTableViewCell nib!", buf, 2u);
    }

  }
  objc_msgSend(v6, "registerNib:forCellReuseIdentifier:", v14, CFSTR("WFBuddyAdditionalSetupCell"));
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "_setDrawsSeparatorAtTopOfSections:", 1);
  -[WFBuddyViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v6);

  -[OBTableWelcomeController setTableView:](self, "setTableView:", v6);
  -[WFBuddyViewController buttonTray](self, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 1);

  -[WFBuddyViewController setSupportsCellularActivation:](self, "setSupportsCellularActivation:", 0);
  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[WFBuddyViewController listDelegate](self, "listDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShouldShowDetailTapOnCurrentNetwork:", 0);

  }
  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[WFBuddyViewController listDelegate](self, "listDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self->_deviceCapability = objc_msgSend(v24, "networkListViewControllerOverrideDeviceCapability:", self);

  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E3D8]), "initWithStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), 0.01, 1.0);
  v37[0] = v25;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E3D8]), "initWithStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), 1.0, 0.5);
  v37[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "URLForResource:withExtension:", CFSTR("WIFI"), CFSTR("ca"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc(MEMORY[0x24BE6E3D0]);
  -[WFBuddyViewController headerView](self, "headerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "animationView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v30, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v29, v32, v27, v33);
  -[WFBuddyViewController setAnimationController:](self, "setAnimationController:", v34);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFBuddyViewController;
  -[OBTableWelcomeController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFBuddyViewController listDelegate](self, "listDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldShowDetailTapOnCurrentNetwork:", 0);

  }
  -[WFBuddyViewController _refreshSections](self, "_refreshSections");
  -[WFBuddyViewController refresh](self, "refresh");
  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkListViewControllerDidAppear:", self);

  -[WFBuddyViewController animationController](self, "animationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startAnimation");

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFBuddyViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  self->_networkListVisible = 1;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2196CC000, v4, v5, "Network list appears on screen", v7, 2u);
  }

  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkListViewControllerDidAppear:", self);

  -[WFBuddyViewController _notifyBuddyWiFiPickerIsVisble:](self, "_notifyBuddyWiFiPickerIsVisble:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFBuddyViewController;
  -[WFBuddyViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  self->_networkListVisible = 0;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2196CC000, v4, v5, "Network list disappears from screen", v7, 2u);
  }

  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkListViewControllerDidDisappear:", self);

  -[WFBuddyViewController _notifyBuddyWiFiPickerIsVisble:](self, "_notifyBuddyWiFiPickerIsVisble:", 0);
}

- (void)setShowNetworkSettings:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_showNetworkSettings != a3)
  {
    v3 = a3;
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v9 = 136315394;
      v10 = "-[WFBuddyViewController setShowNetworkSettings:]";
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: showNetworkSettings %d", (uint8_t *)&v9, 0x12u);
    }

    self->_showNetworkSettings = v3;
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      v9 = 136315138;
      v10 = "-[WFBuddyViewController setShowNetworkSettings:]";
      _os_log_impl(&dword_2196CC000, v7, v8, "%s: Calling [self refresh]", (uint8_t *)&v9, 0xCu);
    }

    -[WFBuddyViewController refresh](self, "refresh");
  }
}

- (void)setSupportsCellularActivation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 IsChinaDevice;
  _BOOL4 supportsCellularActivation;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_supportsCellularActivation != a3 || !self->_alternateSetupTitle || !self->_alternateSetupFooter)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v16 = 136315394;
      v17 = "-[WFBuddyViewController setSupportsCellularActivation:]";
      v18 = 1024;
      v19 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: supports %d", (uint8_t *)&v16, 0x12u);
    }

    self->_supportsCellularActivation = v3;
    IsChinaDevice = WFCapabilityIsChinaDevice(-[WFBuddyViewController deviceCapability](self, "deviceCapability"));
    supportsCellularActivation = self->_supportsCellularActivation;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("kWFLocBuddyUseCellularConnection");
    if (IsChinaDevice)
      v11 = CFSTR("kWFLocBuddyUseCellularConnection_CH");
    if (supportsCellularActivation)
      v12 = v11;
    else
      v12 = CFSTR("kWFLocBuddyConnectToTunes");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v12, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBuddyViewController setAlternateSetupTitle:](self, "setAlternateSetupTitle:", v13);
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      v16 = 136315138;
      v17 = "-[WFBuddyViewController setSupportsCellularActivation:]";
      _os_log_impl(&dword_2196CC000, v14, v15, "%s: Calling [self refresh]", (uint8_t *)&v16, 0xCu);
    }

    -[WFBuddyViewController refresh](self, "refresh");
  }
}

- (void)setNetworks:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFBuddyViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__WFBuddyViewController_setNetworks___block_invoke;
  v6[3] = &unk_24DB37418;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __37__WFBuddyViewController_setNetworks___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  __CFString *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  __CFString *v50;
  uint8_t v51[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__2;
  v49 = __Block_byref_object_dispose__2;
  v50 = &stru_24DB39F78;
  v2 = *(void **)(a1 + 32);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __37__WFBuddyViewController_setNetworks___block_invoke_55;
  v44[3] = &unk_24DB381F0;
  v44[4] = &v45;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v44);
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = v46[5];
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_2196CC000, v3, v4, "networks to be set: %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "currentNetwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentNetwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(v6, "adhocNetworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
    objc_msgSend(v6, "minusSet:", v10);
  objc_msgSend(v6, "unconfiguredNetworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
    objc_msgSend(v6, "minusSet:", v12);
  WFScanRecordDefaultSortCompartor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1272), "copy");
  WFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v14 && os_log_type_enabled(v14, v15))
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1229);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    _os_log_impl(&dword_2196CC000, v14, v15, "TableView is currently updating %d", buf, 8u);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1229))
  {
    objc_msgSend(v6, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingComparator:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(v19 + 1328);
    *(_QWORD *)(v19 + 1328) = v18;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1230) = 1;
  }
  else
  {
    objc_msgSend(v6, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingComparator:", v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v22)
    {
      v24 = v22;
      if (os_log_type_enabled(v24, v23))
      {
        v25 = objc_msgSend(v35, "count");
        v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1272), "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_2196CC000, v24, v23, "Set Networks from %lu to %lu", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "_isInAWindow");

    if (v28)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v56 = __Block_byref_object_copy__2;
      v57 = __Block_byref_object_dispose__2;
      v58 = &stru_24DB39F78;
      v29 = MEMORY[0x24BDAC760];
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __37__WFBuddyViewController_setNetworks___block_invoke_60;
      v43[3] = &unk_24DB37440;
      v43[4] = buf;
      objc_msgSend(v35, "enumerateObjectsUsingBlock:", v43);
      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__2;
      v41 = __Block_byref_object_dispose__2;
      v42 = &stru_24DB39F78;
      v36[0] = v29;
      v36[1] = 3221225472;
      v36[2] = __37__WFBuddyViewController_setNetworks___block_invoke_2;
      v36[3] = &unk_24DB37440;
      v36[4] = &v37;
      objc_msgSend(v34, "enumerateObjectsUsingBlock:", v36);
      WFLogForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v30 && os_log_type_enabled(v30, v31))
      {
        v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v33 = v38[5];
        *(_DWORD *)v51 = 138412546;
        v52 = v32;
        v53 = 2112;
        v54 = v33;
        _os_log_impl(&dword_2196CC000, v30, v31, "Old networks: %@\n New networks: %@", v51, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_updateCellsWithNewData:oldData:inSection:", v34, v35, 0);
      _Block_object_dispose(&v37, 8);

      _Block_object_dispose(buf, 8);
    }

  }
  _Block_object_dispose(&v45, 8);

}

void __37__WFBuddyViewController_setNetworks___block_invoke_55(uint64_t a1, void *a2)
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

void __37__WFBuddyViewController_setNetworks___block_invoke_60(uint64_t a1, void *a2)
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

void __37__WFBuddyViewController_setNetworks___block_invoke_2(uint64_t a1, void *a2)
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

- (void)_updateCellsWithNewData:(id)a3 oldData:(id)a4 inSection:(int64_t)a5
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  os_log_type_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  WFBuddyViewController *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  int64_t v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  int64_t v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  __CFString *v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  __CFString *v81;
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v47 = (void *)objc_opt_new();
  v43 = (void *)objc_opt_new();
  v41 = objc_opt_new();
  v44 = (void *)objc_opt_new();
  v48 = (void *)objc_msgSend(v7, "mutableCopy");
  v49 = (void *)objc_msgSend(v6, "mutableCopy");
  if ((unint64_t)objc_msgSend(v7, "count") >= 2 && (unint64_t)objc_msgSend(v7, "count", v41, v43) >= 2)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ssid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9 - 1;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ssid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "isEqualToString:", v14);

      if (v15)
        objc_msgSend(v48, "removeObjectAtIndex:", v9 - v8++);
      ++v9;
    }
    while (objc_msgSend(v7, "count") > (unint64_t)(v12 + 2));
  }
  if ((unint64_t)objc_msgSend(v6, "count", v41) >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v16 = 0;
    v17 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ssid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17 - 1;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v17 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ssid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "isEqualToString:", v22);

      if (v23)
        objc_msgSend(v49, "removeObjectAtIndex:", v17 - v16++);
      ++v17;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)(v20 + 2));
  }
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__2;
  v80 = __Block_byref_object_dispose__2;
  v24 = MEMORY[0x24BDAC760];
  v81 = &stru_24DB39F78;
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke;
  v75[3] = &unk_24DB37440;
  v75[4] = &v76;
  objc_msgSend(v48, "enumerateObjectsUsingBlock:", v75);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2;
  v73 = __Block_byref_object_dispose__2;
  v74 = &stru_24DB39F78;
  v68[0] = v24;
  v68[1] = 3221225472;
  v68[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2;
  v68[3] = &unk_24DB37440;
  v68[4] = &v69;
  objc_msgSend(v49, "enumerateObjectsUsingBlock:", v68);
  WFLogForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
  {
    v27 = v77[5];
    v28 = v70[5];
    *(_DWORD *)buf = 138412546;
    v83 = v27;
    v84 = 2112;
    v85 = v28;
    _os_log_impl(&dword_2196CC000, v25, v26, "Old filtered networks: %@\n New filtered networks: %@", buf, 0x16u);
  }

  WFLogForCategory(0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v29)
  {
    v31 = v29;
    if (os_log_type_enabled(v31, v30))
    {
      v32 = objc_msgSend(v7, "count");
      v33 = objc_msgSend(v48, "count");
      v34 = objc_msgSend(v6, "count");
      v35 = objc_msgSend(v49, "count");
      *(_DWORD *)buf = 134218752;
      v83 = v32;
      v84 = 2048;
      v85 = v33;
      v86 = 2048;
      v87 = v34;
      v88 = 2048;
      v89 = v35;
      _os_log_impl(&dword_2196CC000, v31, v30, "Old Network count: %lu, old filtered network count: %lu, new network count: %lu, new filtered network count: %lu", buf, 0x2Au);
    }

  }
  v66[0] = v24;
  v66[1] = 3221225472;
  v66[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_65;
  v66[3] = &unk_24DB37468;
  v36 = v44;
  v67 = v36;
  objc_msgSend(v48, "enumerateObjectsUsingBlock:", v66);
  v61[0] = v24;
  v61[1] = 3221225472;
  v61[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2_67;
  v61[3] = &unk_24DB37490;
  v37 = v36;
  v62 = v37;
  v65 = a5;
  v38 = v42;
  v63 = v38;
  v39 = v43;
  v64 = v39;
  objc_msgSend(v49, "enumerateObjectsUsingBlock:", v61);
  if (objc_msgSend(v37, "count"))
  {
    v57[0] = v24;
    v57[1] = 3221225472;
    v57[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_69;
    v57[3] = &unk_24DB374B8;
    v58 = v37;
    v59 = v47;
    v60 = a5;
    objc_msgSend(v58, "enumerateKeysAndObjectsUsingBlock:", v57);

  }
  if (objc_msgSend(v47, "count") || objc_msgSend(v39, "count") || objc_msgSend(v38, "count"))
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v24;
    v51[1] = 3221225472;
    v51[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_71;
    v51[3] = &unk_24DB38218;
    v52 = v39;
    v53 = v38;
    v54 = v47;
    v55 = self;
    v56 = v49;
    v50[0] = v24;
    v50[1] = 3221225472;
    v50[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_72;
    v50[3] = &unk_24DB38240;
    v50[4] = self;
    objc_msgSend(v40, "performBatchUpdates:completion:", v51, v50);

  }
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v76, 8);
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke(uint64_t a1, void *a2)
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

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2(uint64_t a1, void *a2)
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

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_65(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "ssid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, v7);

}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_2_67(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v11, "integerValue"), *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v24[0] = v12;
      v24[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v6);
  }
  else
  {
    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      v20 = 138412546;
      v21 = v5;
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_2196CC000, v16, v17, "inserting %@ at indexpath:%lu, ", (uint8_t *)&v20, 0x16u);
    }

    v18 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

  }
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v10 = 138412546;
      v11 = v3;
      v12 = 2048;
      v13 = objc_msgSend(v4, "longValue");
      _os_log_impl(&dword_2196CC000, v7, v6, "deleting %@ at indexpath:%lu", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v4, "integerValue"), *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_71(id *a1)
{
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      v5 = objc_msgSend(a1[4], "count");
      v6 = objc_msgSend(a1[5], "count");
      v7 = objc_msgSend(a1[6], "count");
      *(_DWORD *)buf = 136315906;
      v25 = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
      v26 = 2048;
      v27 = v5;
      v28 = 2048;
      v29 = v6;
      v30 = 2048;
      v31 = v7;
      _os_log_impl(&dword_2196CC000, v4, v3, "%s: tableView updating started - insert %lu move %lu delete %lu", buf, 0x2Au);
    }

  }
  *((_BYTE *)a1[7] + 1229) = 1;
  objc_msgSend(a1[7], "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", a1[6], 0);

  objc_msgSend(a1[7], "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertRowsAtIndexPaths:withRowAnimation:", a1[4], 0);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = a1[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "tableView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "moveRowAtIndexPath:toIndexPath:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  objc_storeStrong((id *)a1[7] + 159, a1[8]);
}

void __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  uint8_t v17[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
    _os_log_impl(&dword_2196CC000, v2, v3, "%s: tableView updating finished", (uint8_t *)&buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1229) = 0;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateIntrinsicContentSize");

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateConstraintsIfNeeded");

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 1230))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = (void *)objc_msgSend(*(id *)(v7 + 1328), "copy");
    objc_msgSend(v8, "setWithArray:", v9);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 1328);
    *(_QWORD *)(v10 + 1328) = MEMORY[0x24BDBD1A8];

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1230) = 0;
    WFLogForCategory(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v12)
    {
      v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
        *(_DWORD *)v17 = 136315394;
        v18 = "-[WFBuddyViewController _updateCellsWithNewData:oldData:inSection:]_block_invoke";
        v19 = 2048;
        v20 = v15;
        _os_log_impl(&dword_2196CC000, v14, v13, "%s: continuing with pending network update (count %lu)", v17, 0x16u);
      }

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_75;
    v16[3] = &unk_24DB37620;
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = &buf;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
    _Block_object_dispose(&buf, 8);

  }
}

uint64_t __67__WFBuddyViewController__updateCellsWithNewData_oldData_inSection___block_invoke_75(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNetworks:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_currentNetworkScaledRSSI = a3;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315138;
    v7 = "-[WFBuddyViewController setCurrentNetworkScaledRSSI:]";
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: Calling [self refresh]", (uint8_t *)&v6, 0xCu);
  }

  -[WFBuddyViewController refresh](self, "refresh");
}

- (void)setCurrentNetwork:(id)a3
{
  id v5;
  float v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentNetwork, a3);
  objc_msgSend(v5, "scaledRSSI");
  self->_currentNetworkScaledRSSI = v6;
  self->_currentNetworkState = 0;
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v9 = 136315138;
    v10 = "-[WFBuddyViewController setCurrentNetwork:]";
    _os_log_impl(&dword_2196CC000, v7, v8, "%s: Calling [self refresh]", (uint8_t *)&v9, 0xCu);
  }

  -[WFBuddyViewController refresh](self, "refresh");
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_currentNetworkState = a3;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315138;
    v7 = "-[WFBuddyViewController setCurrentNetworkState:]";
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: Calling [self refresh]", (uint8_t *)&v6, 0xCu);
  }

  -[WFBuddyViewController refresh](self, "refresh");
}

- (void)setDeviceCapability:(int64_t)a3
{
  NSString *alternateSetupTitle;
  NSString *alternateSetupFooter;

  if (self->_deviceCapability != a3)
  {
    self->_deviceCapability = a3;
    -[WFBuddyViewController _refreshSections](self, "_refreshSections");
    alternateSetupTitle = self->_alternateSetupTitle;
    self->_alternateSetupTitle = 0;

    alternateSetupFooter = self->_alternateSetupFooter;
    self->_alternateSetupFooter = 0;

    -[WFBuddyViewController setSupportsCellularActivation:](self, "setSupportsCellularActivation:", self->_supportsCellularActivation);
  }
}

- (void)setShowAdditionalSetupInfo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_showAdditionalSetupInfo != a3)
  {
    v3 = a3;
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v7 = 136315394;
      v8 = "-[WFBuddyViewController setShowAdditionalSetupInfo:]";
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_2196CC000, v5, v6, "%s: showAdditionalSetupInfo %d", (uint8_t *)&v7, 0x12u);
    }

    self->_showAdditionalSetupInfo = v3;
    -[WFBuddyViewController _refreshSections](self, "_refreshSections");
  }
}

- (void)refresh
{
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 tableViewIsUpdating;
  _BOOL4 tableReloadRequestQueued;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      tableViewIsUpdating = self->_tableViewIsUpdating;
      tableReloadRequestQueued = self->_tableReloadRequestQueued;
      *(_DWORD *)buf = 136315650;
      v14 = "-[WFBuddyViewController refresh]";
      v15 = 1024;
      v16 = tableViewIsUpdating;
      v17 = 1024;
      v18 = tableReloadRequestQueued;
      _os_log_impl(&dword_2196CC000, v3, v4, "%s: _tableViewIsUpdating: %d _tableReloadRequestQueued: %d", buf, 0x18u);
    }

    if (self->_tableViewIsUpdating)
    {
      if (!self->_tableReloadRequestQueued)
      {
        WFLogForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "-[WFBuddyViewController refresh]";
          _os_log_impl(&dword_2196CC000, v7, v8, "%s: Queueing a table reload request.", buf, 0xCu);
        }

        self->_tableReloadRequestQueued = 1;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __32__WFBuddyViewController_refresh__block_invoke;
        block[3] = &unk_24DB373C8;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
    else
    {
      -[OBTableWelcomeController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadData");

      -[OBTableWelcomeController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

      -[OBTableWelcomeController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");

    }
  }
  else
  {
    -[WFBuddyViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_refresh, 0, 0);
  }
}

uint64_t __32__WFBuddyViewController_refresh__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "refresh");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1231) = 0;
  return result;
}

- (void)_refreshSections
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_tableViewIsUpdating)
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFBuddyViewController _refreshSections]";
      _os_log_impl(&dword_2196CC000, v3, v4, "%s: tried to refresh settings while table update is in progress, deferring until update is finished", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__WFBuddyViewController__refreshSections__block_invoke;
    block[3] = &unk_24DB373C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithObject:", &unk_24DB59BD8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (WFCapabilityIsChinaDevice(-[WFBuddyViewController deviceCapability](self, "deviceCapability"))
      && -[WFBuddyViewController deviceCapability](self, "deviceCapability") != 4)
    {
      objc_msgSend(v5, "addObject:", &unk_24DB59BF0);
    }
    if (-[WFBuddyViewController showAdditionalSetupInfo](self, "showAdditionalSetupInfo"))
      objc_msgSend(v5, "addObject:", &unk_24DB59C08);
    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        -[WFBuddyViewController sections](self, "sections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBuddyViewController _debugSectionStringFromSections:](self, "_debugSectionStringFromSections:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBuddyViewController _debugSectionStringFromSections:](self, "_debugSectionStringFromSections:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v15 = "-[WFBuddyViewController _refreshSections]";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_2196CC000, v8, v7, "%s: old sections [%@], new sections [%@]", buf, 0x20u);

      }
    }

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithOrderedSet:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBuddyViewController setSections:](self, "setSections:", v12);

    -[WFBuddyViewController refresh](self, "refresh");
  }
}

uint64_t __41__WFBuddyViewController__refreshSections__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshSections");
}

- (void)powerStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 136315394;
    v8 = "-[WFBuddyViewController powerStateDidChange:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: state %d", (uint8_t *)&v7, 0x12u);
  }

  -[WFBuddyViewController refresh](self, "refresh");
}

- (void)networkListDelegateWillPresentAccessoryViewController:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "defaultBgColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFBuddyViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;

  -[WFBuddyViewController sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      v9 = v11 + -[WFBuddyViewController showOtherNetwork](self, "showOtherNetwork");
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  WFAdditionalSetupTableViewCell *v17;
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
  void *v28;
  os_log_type_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  WFAdditionalSetupTableViewCell *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[WFBuddyViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    -[WFBuddyViewController sections](self, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "integerValue");
    if (v13 == 2)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WFBuddyAdditionalSetupCell"));
      v17 = (WFAdditionalSetupTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        v17 = -[WFAdditionalSetupTableViewCell initWithStyle:reuseIdentifier:]([WFAdditionalSetupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WFBuddyAdditionalSetupCell"));
      -[WFBuddyViewController alternateSetupTitle](self, "alternateSetupTitle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell label](v17, "label");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v35);
    }
    else
    {
      if (v13 != 1)
      {
        if (v13)
        {
          v17 = 0;
LABEL_28:
          v34 = v17;

          goto LABEL_29;
        }
        v14 = objc_msgSend(v7, "row");
        -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == objc_msgSend(v15, "count"))
        {
          v16 = -[WFBuddyViewController showOtherNetwork](self, "showOtherNetwork");

          if (v16)
          {
            objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WFBuddyOtherNetworkCell"));
            v17 = (WFAdditionalSetupTableViewCell *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              v17 = (WFAdditionalSetupTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WFBuddyOtherNetworkCell"));
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocBuddyFooterViewTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setText:", v19);

            objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x24BEBB520];
            objc_msgSend(v21, "pointSize");
            objc_msgSend(v22, "boldSystemFontOfSize:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setFont:", v23);

            objc_msgSend(MEMORY[0x24BEBD4B8], "defaultButtonColor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setTextColor:", v25);

            -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setNumberOfLines:", 0);

            goto LABEL_26;
          }
        }
        else
        {

        }
        -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v7, "row"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFBuddyViewController _cellForNetworkRecord:tableView:indexPath:](self, "_cellForNetworkRecord:tableView:indexPath:", v21, v6, v7);
        v17 = (WFAdditionalSetupTableViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_26:

        -[WFAdditionalSetupTableViewCell setSeparatorInset:](v17, "setSeparatorInset:", 0.0, 40.0, 0.0, 0.0);
        objc_msgSend(MEMORY[0x24BEBD4B8], "listPlatterBgColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAdditionalSetupTableViewCell setBackgroundColor:](v17, "setBackgroundColor:", v35);
        goto LABEL_27;
      }
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WFBuddyWAPICell"));
      v17 = (WFAdditionalSetupTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        v17 = (WFAdditionalSetupTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WFBuddyWAPICell"));
      -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setNumberOfLines:", 0);

      -[WFBuddyViewController alternateSetupTitle](self, "alternateSetupTitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setText:", v38);

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v35, "pointSize");
      objc_msgSend(v40, "boldSystemFontOfSize:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setFont:", v41);

      objc_msgSend(MEMORY[0x24BEBD4B8], "defaultButtonColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTextColor:", v43);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("kWFLocEnableWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell textLabel](v17, "textLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setText:", v46);

      -[WFBuddyViewController enableWAPISwitch](self, "enableWAPISwitch");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell setAccessoryView:](v17, "setAccessoryView:", v48);

      -[WFBuddyViewController listDelegate](self, "listDelegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "networkListViewControllerWAPIEnabled:", self);
      -[WFBuddyViewController enableWAPISwitch](self, "enableWAPISwitch");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setOn:", v50);

      objc_msgSend(MEMORY[0x24BEBD4B8], "listPlatterBgColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAdditionalSetupTableViewCell setBackgroundColor:](v17, "setBackgroundColor:", v36);
    }

LABEL_27:
    goto LABEL_28;
  }
  WFLogForCategory(0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v28)
  {
    v30 = v28;
    if (os_log_type_enabled(v30, v29))
    {
      v31 = objc_msgSend(v7, "section");
      -[WFBuddyViewController sections](self, "sections");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFBuddyViewController _debugSectionStringFromSections:](self, "_debugSectionStringFromSections:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 136315650;
      v55 = "-[WFBuddyViewController tableView:cellForRowAtIndexPath:]";
      v56 = 2048;
      v57 = v31;
      v58 = 2112;
      v59 = v33;
      _os_log_impl(&dword_2196CC000, v30, v29, "%s: requested section (%lu) is not in expected sections [%@], returning default cell", (uint8_t *)&v54, 0x20u);

    }
  }

  v34 = (WFAdditionalSetupTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
LABEL_29:

  return v34;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFBuddyViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v8)
  {
    if (v8 == 2)
    {
      -[WFBuddyViewController alternateSetupTitle](self, "alternateSetupTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocEnableWAPITitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
LABEL_12:
    v26[0] = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v26[1] = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sizeWithAttributes:", v21);
    v23 = v22;
    objc_msgSend(CFSTR("A"), "sizeWithAttributes:", v21);
    v18 = ceil(v23 + v24 * 2.0);

    goto LABEL_13;
  }
  v11 = objc_msgSend(v5, "row");
  -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 == v13)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocBuddyFooterViewTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v15 = objc_msgSend(v5, "row");
  -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v15 >= v17)
    goto LABEL_12;
  v18 = *MEMORY[0x24BEBE770];
LABEL_13:

  return v18;
}

- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  float v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFBuddyNetworkListCell"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  objc_msgSend(v9, "setSubtitle:", 0);
  objc_msgSend(v9, "setPersonalHotspot:", objc_msgSend(v8, "iOSHotspot"));
  objc_msgSend(v9, "setSecure:", objc_msgSend(v8, "isSecure"));
  objc_msgSend(v8, "scaledRSSI");
  objc_msgSend(v9, "setBars:", WFSignalBarsFromScaledRSSI(v11));
  objc_msgSend(v8, "ssid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFBuddyViewController currentNetwork](self, "currentNetwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ssid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if (v15)
  {
    -[WFBuddyViewController currentNetworkScaledRSSI](self, "currentNetworkScaledRSSI");
    objc_msgSend(v9, "setBars:", WFSignalBarsFromScaledRSSI(v16));
    objc_msgSend(v9, "setState:", self->_currentNetworkState);
  }
  if (-[WFBuddyViewController showNetworkSettings](self, "showNetworkSettings"))
    v17 = 4;
  else
    v17 = 0;
  objc_msgSend(v9, "setAccessoryType:", v17);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v18, "pointSize");
  objc_msgSend(v19, "boldSystemFontOfSize:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v22);

  v24 = v9;
  return v24;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!objc_msgSend(v8, "section"))
  {
    -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v8, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBuddyViewController listDelegate](self, "listDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkListViewController:showSettingsForNetwork:context:", self, v6, 1);

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;

  if (a4 == 1)
  {
    -[WFBuddyViewController alternateSetupFooter](self, "alternateSetupFooter", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = -[WFBuddyViewController showAdditionalSetupInfo](self, "showAdditionalSetupInfo");

      if (v7)
      {
        -[WFBuddyViewController alternateSetupFooter](self, "alternateSetupFooter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x24BEBE770];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x24BEBE770];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    v20 = 136315394;
    v21 = "-[WFBuddyViewController tableView:didSelectRowAtIndexPath:]";
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2196CC000, v8, v9, "%s: indexPath %@", (uint8_t *)&v20, 0x16u);
  }

  -[WFBuddyViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  if (v12 == 2)
  {
    -[WFBuddyViewController buddyDelegate](self, "buddyDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buddyViewControllerDidPressAlternateSetupButton:", self);

  }
  else if (!v12)
  {
    v13 = objc_msgSend(v7, "row");
    -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v13 == v15)
    {
      -[WFBuddyViewController _chooseOtherNetworkTapped:](self, "_chooseOtherNetworkTapped:", 0);
    }
    else
    {
      -[WFBuddyViewController sortedNetworks](self, "sortedNetworks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFBuddyViewController listDelegate](self, "listDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "networkListViewController:didTapRecord:", self, v18);

    }
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  if (a5 == 1)
  {
    v14 = v7;
    -[WFBuddyViewController alternateSetupFooter](self, "alternateSetupFooter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v8)
    {
      v9 = -[WFBuddyViewController showAdditionalSetupInfo](self, "showAdditionalSetupInfo");

      v7 = v14;
      if (v9)
      {
        v10 = (void *)MEMORY[0x24BEBD4B8];
        v11 = v14;
        objc_msgSend(v10, "altTextColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setTextColor:", v12);
        v7 = v14;
      }
    }
  }

}

- (void)_chooseOtherNetworkTapped:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v8 = 136315394;
    v9 = "-[WFBuddyViewController _chooseOtherNetworkTapped:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: sender %@", (uint8_t *)&v8, 0x16u);
  }

  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "networkListViewControllerDidTapOtherNetwork:", self);

}

- (void)_enableWAPISwitchChanged:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[WFBuddyViewController listDelegate](self, "listDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(v6, "networkListViewController:setWAPIEnabled:", self, v5);
}

- (UISwitch)enableWAPISwitch
{
  UISwitch *enableWAPISwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;
  UISwitch *v7;

  enableWAPISwitch = self->_enableWAPISwitch;
  if (!enableWAPISwitch)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_enableWAPISwitch;
    self->_enableWAPISwitch = v5;
    v7 = v5;

    -[UISwitch addTarget:action:forControlEvents:](self->_enableWAPISwitch, "addTarget:action:forControlEvents:", self, sel__enableWAPISwitchChanged_, 4096);
    enableWAPISwitch = self->_enableWAPISwitch;
  }
  return enableWAPISwitch;
}

- (void)_notifyBuddyWiFiPickerIsVisble:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFBuddyViewController _notifyBuddyWiFiPickerIsVisble:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: visible %d", (uint8_t *)&v7, 0x12u);
  }

  v6 = _notifyBuddyWiFiPickerIsVisble__token;
  if (_notifyBuddyWiFiPickerIsVisble__token != -1
    || (notify_register_check("com.apple.airportsettingsvisible", &_notifyBuddyWiFiPickerIsVisble__token),
        v6 = _notifyBuddyWiFiPickerIsVisble__token,
        _notifyBuddyWiFiPickerIsVisble__token != -1))
  {
    notify_set_state(v6, v3);
    notify_post("com.apple.airportsettingsvisible");
  }
}

- (id)_nameOfSection:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("invalid section");
  else
    return off_24DB38260[a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_debugSectionStringFromSections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(obj);
        -[WFBuddyViewController _nameOfSection:](self, "_nameOfSection:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%lu: %@"), v9 + i, v12);

        if (1 - v6 + v9 + i)
          objc_msgSend(v5, "appendString:", CFSTR(", "));
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 += i;
    }
    while (v8);
  }

  return v5;
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1240, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (BOOL)showOtherNetwork
{
  return self->showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->showOtherNetwork = a3;
}

- (BOOL)showNetworkSettings
{
  return self->_showNetworkSettings;
}

- (BOOL)networkListVisible
{
  return self->_networkListVisible;
}

- (void)setNetworkListVisible:(BOOL)a3
{
  self->_networkListVisible = a3;
}

- (BOOL)showAdditionalSetupInfo
{
  return self->_showAdditionalSetupInfo;
}

- (BOOL)supportsCellularActivation
{
  return self->_supportsCellularActivation;
}

- (WFBuddyViewControllerDelegate)buddyDelegate
{
  return (WFBuddyViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_buddyDelegate);
}

- (void)setBuddyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buddyDelegate, a3);
}

- (NSArray)sortedNetworks
{
  return self->_sortedNetworks;
}

- (void)setSortedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_sortedNetworks, a3);
}

- (WFNetworkListDelegate)listDelegate
{
  return (WFNetworkListDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (NSString)alternateSetupTitle
{
  return self->_alternateSetupTitle;
}

- (void)setAlternateSetupTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (NSString)alternateSetupFooter
{
  return self->_alternateSetupFooter;
}

- (void)setAlternateSetupFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (UIView)buddyIPadContainerView
{
  return self->_buddyIPadContainerView;
}

- (void)setBuddyIPadContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buddyIPadContainerView, a3);
}

- (NSOrderedSet)sections
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1312);
}

- (void)setEnableWAPISwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enableWAPISwitch, a3);
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

- (BOOL)tableReloadRequestQueued
{
  return self->_tableReloadRequestQueued;
}

- (void)setTableReloadRequestQueued:(BOOL)a3
{
  self->_tableReloadRequestQueued = a3;
}

- (NSArray)pendingNetworks
{
  return self->_pendingNetworks;
}

- (void)setPendingNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNetworks, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_pendingNetworks, 0);
  objc_storeStrong((id *)&self->_enableWAPISwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_buddyIPadContainerView, 0);
  objc_storeStrong((id *)&self->_alternateSetupFooter, 0);
  objc_storeStrong((id *)&self->_alternateSetupTitle, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sortedNetworks, 0);
  objc_destroyWeak((id *)&self->_buddyDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end
