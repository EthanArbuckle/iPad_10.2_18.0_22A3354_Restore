@implementation WFPickerViewController

- (WFPickerViewController)init
{
  WFPickerViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFPickerViewController;
  result = -[WFPickerViewController init](&v3, sel_init);
  result->_showCurrentNetworkTop = 0;
  result->_dismissed = 0;
  return result;
}

- (void)loadView
{
  id v3;
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
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)WFPickerViewController;
  -[WFPickerViewController loadView](&v29, sel_loadView);
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  -[WFPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDataSource:", self);
  -[WFPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[WFPickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFPickerViewController setTableView:](self, "setTableView:", v5);
  -[WFPickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFPickerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[WFPickerViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[WFPickerViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[WFPickerViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFPickerViewController;
  -[WFPickerViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD7B0], "nibWithNibName:bundle:", CFSTR("WFNetworkListCell"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerNib:forCellReuseIdentifier:", v4, CFSTR("WFNetworkCell"));

  objc_msgSend(MEMORY[0x24BEBD7B0], "nibWithNibName:bundle:", CFSTR("WFHotspotCell"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerNib:forCellReuseIdentifier:", v6, CFSTR("WFHotspotCell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  WFPickerViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WFPickerViewController;
  -[WFPickerViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WFPickerViewController refresh](self, "refresh");
  -[WFPickerViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkListViewControllerDidAppear:", self);

  WFLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPickerViewController viewWillAppear:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: %@", buf, 0x16u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  WFPickerViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WFPickerViewController;
  -[WFPickerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[WFPickerViewController listDelegate](self, "listDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkListViewControllerDidDisappear:", self);

  WFLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPickerViewController viewDidDisappear:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: %@", buf, 0x16u);
  }

}

- (void)didReceiveMemoryWarning
{
  NSObject *v3;
  os_log_type_t v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  WFPickerViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)WFPickerViewController;
  -[WFPickerViewController didReceiveMemoryWarning](&v5, sel_didReceiveMemoryWarning);
  WFLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[WFPickerViewController didReceiveMemoryWarning]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: %@", buf, 0x16u);
  }

}

- (void)setNetworks:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSArray *v10;
  void *v11;
  _BOOL4 showCurrentNetworkTop;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *sortedNetworks;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(3uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v18 = 136315650;
      v19 = "-[WFPickerViewController setNetworks:]";
      v20 = 2048;
      v21 = objc_msgSend(v4, "count");
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2196CC000, v7, v6, "%s: networks (%lu): %@", (uint8_t *)&v18, 0x20u);
    }

  }
  if (-[WFPickerViewController dismissed](self, "dismissed"))
  {
    WFLogForCategory(3uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      v18 = 136315138;
      v19 = "-[WFPickerViewController setNetworks:]";
      _os_log_impl(&dword_2196CC000, v8, v9, "%s: disregarding call to set networks, this view controller is no longer visible", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    if (v4)
    {
      v10 = (NSArray *)objc_msgSend(v4, "mutableCopy");
      -[WFPickerViewController currentNetwork](self, "currentNetwork");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        showCurrentNetworkTop = self->_showCurrentNetworkTop;

        if (!showCurrentNetworkTop)
        {
          -[WFPickerViewController currentNetwork](self, "currentNetwork");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v10, "addObject:", v13);

        }
      }
      -[NSArray allObjects](v10, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WFScanRecordDefaultSortCompartor();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingComparator:", v15);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sortedNetworks = self->_sortedNetworks;
      self->_sortedNetworks = v16;

    }
    else
    {
      v10 = self->_sortedNetworks;
      self->_sortedNetworks = 0;
    }

    -[WFPickerViewController refresh](self, "refresh");
  }

}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  self->_currentNetworkScaledRSSI = a3;
  -[WFPickerViewController refresh](self, "refresh");
}

- (void)setCurrentNetwork:(id)a3
{
  id v5;
  float v6;
  float v7;

  objc_storeStrong((id *)&self->_currentNetwork, a3);
  v5 = a3;
  objc_msgSend(v5, "scaledRSSI");
  v7 = v6;

  self->_currentNetworkScaledRSSI = v7;
  self->_currentNetworkState = 0;
  -[WFPickerViewController refresh](self, "refresh");
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  self->_currentNetworkState = a3;
  -[WFPickerViewController refresh](self, "refresh");
}

- (void)refresh
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[WFPickerViewController dismissed](self, "dismissed"))
    {
      WFLogForCategory(3uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        v7 = "-[WFPickerViewController refresh]";
        _os_log_impl(&dword_2196CC000, v3, v4, "%s: disregarding call to refresh, this view controller is no longer visible", buf, 0xCu);
      }

    }
    else
    {
      -[WFPickerViewController tableView](self, "tableView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadData");

    }
  }
  else
  {
    -[WFPickerViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_refresh, 0, 0);
  }
}

- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled
{
  return 1;
}

- (BOOL)shouldPromptWhenCarPlaySessionIsActive
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int64_t showCurrentNetworkTop;
  void *v9;
  uint64_t v10;

  -[WFPickerViewController listDelegate](self, "listDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "networkListViewControllerCurrentPowerState:", self);

  if (!v5)
    return 0;
  -[WFPickerViewController currentNetwork](self, "currentNetwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    showCurrentNetworkTop = self->_showCurrentNetworkTop;

  }
  else
  {
    showCurrentNetworkTop = 0;
  }
  -[WFPickerViewController sortedNetworks](self, "sortedNetworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    return showCurrentNetworkTop + 1;
  else
    return showCurrentNetworkTop;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  _BOOL4 showCurrentNetworkTop;

  v6 = a3;
  if (!a4
    && (-[WFPickerViewController currentNetwork](self, "currentNetwork"),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (showCurrentNetworkTop = self->_showCurrentNetworkTop, v11, showCurrentNetworkTop))
  {
    v10 = 1;
  }
  else
  {
    -[WFPickerViewController sortedNetworks](self, "sortedNetworks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[WFPickerViewController sortedNetworks](self, "sortedNetworks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[WFPickerViewController sortedNetworks](self, "sortedNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFPickerViewController _cellForNetworkRecord:tableView:indexPath:](self, "_cellForNetworkRecord:tableView:indexPath:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFHotspotDetails *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  int v22;
  float v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "setTitle:", v11);

  if (objc_msgSend(v8, "isInstantHotspot"))
  {
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFHotspotCell"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    objc_msgSend(v12, "hotspotDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = objc_alloc_init(WFHotspotDetails);
      objc_msgSend(v8, "hotspotBatteryLife");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHotspotDetails setBatteryLife:](v15, "setBatteryLife:", v16);

      objc_msgSend(v8, "hotspotCellularProtocol");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHotspotDetails setCellularProtocolString:](v15, "setCellularProtocolString:", v17);

      objc_msgSend(v8, "hotspotSignalStrength");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHotspotDetails setSignalStrength:](v15, "setSignalStrength:", v18);

      objc_msgSend(v12, "setHotspotDetails:", v15);
    }
  }
  else
  {
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFNetworkCell"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v19);

    objc_msgSend(v12, "setSubtitle:", 0);
    objc_msgSend(v12, "setPersonalHotspot:", objc_msgSend(v8, "iOSHotspot"));
    objc_msgSend(v12, "setSecure:", objc_msgSend(v8, "isSecure"));
    objc_msgSend(v8, "scaledRSSI");
    objc_msgSend(v12, "setBars:", WFSignalBarsFromScaledRSSI(v20));
    objc_msgSend(v12, "setLayoutMargins:", 0.0, 0.0, 0.0, 60.0);
  }
  -[WFPickerViewController currentNetwork](self, "currentNetwork");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "isEqual:", v21);

  if (v22)
  {
    -[WFPickerViewController currentNetworkScaledRSSI](self, "currentNetworkScaledRSSI");
    objc_msgSend(v12, "setBars:", WFSignalBarsFromScaledRSSI(v23));
    objc_msgSend(v12, "setState:", self->_currentNetworkState);
  }
  objc_msgSend(v12, "setAccessoryType:", 0);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[WFPickerViewController listDelegate](self, "listDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPickerViewController sortedNetworks](self, "sortedNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "networkListViewController:didTapRecord:", self, v9);
  if (self->_showCurrentNetworkTop)
  {
    -[WFPickerViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollToRowAtIndexPath:atScrollPosition:animated:", v11, 1, 1);

  }
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 976, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (BOOL)showOtherNetwork
{
  return self->showOtherNetwork;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
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

- (BOOL)showCurrentNetworkTop
{
  return self->_showCurrentNetworkTop;
}

- (void)setShowCurrentNetworkTop:(BOOL)a3
{
  self->_showCurrentNetworkTop = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sortedNetworks, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end
