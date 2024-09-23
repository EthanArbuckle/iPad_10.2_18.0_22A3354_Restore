@implementation STUsageDetailListController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextUsageDetailListController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.devices"), "KVOContextUsageDetailListController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), "KVOContextUsageDetailListController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextUsageDetailListController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isCloudSyncEnabled"), "KVOContextUsageDetailListController");

  v4.receiver = self;
  v4.super_class = (Class)STUsageDetailListController;
  -[STListViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  STNoUsageDataView *v12;
  STNoUsageDataView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  STNoUsageDataView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[16];
  objc_super v44;
  _QWORD v45[3];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x24BDAC8D0];
  -[STPINListViewController coordinator](self, "coordinator");
  v3 = objc_claimAutoreleasedReturnValue();
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STTestGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setTestProvider:](self, "setTestProvider:", v4);
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STSegmentedControlGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setSegmentedControlProvider:](self, "setSegmentedControlProvider:", v5);
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STScreenTimeUsageGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setScreenTimeProvider:](self, "setScreenTimeProvider:", v6);
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STAllowanceProgressGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v7 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setAllowancesProvider:](self, "setAllowancesProvider:", v7);
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STMostUsedGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setMostUsedProvider:](self, "setMostUsedProvider:", v8);
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STDevicePickupsUsageGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v9 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setPickupsProvider:](self, "setPickupsProvider:", v9);
  v42 = (void *)v3;
  +[STUsageGroupSpecifierProvider providerWithCoordinator:](STNotificationsUsageGroupSpecifierProvider, "providerWithCoordinator:", v3);
  v10 = objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController setNotificationsProvider:](self, "setNotificationsProvider:", v10);
  v40 = (void *)v5;
  v41 = (void *)v4;
  v46[0] = v4;
  v46[1] = v5;
  v38 = (void *)v7;
  v39 = (void *)v6;
  v46[2] = v6;
  v46[3] = v7;
  v36 = (void *)v9;
  v37 = (void *)v8;
  v46[4] = v8;
  v46[5] = v9;
  v35 = (void *)v10;
  v46[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListViewController setSpecifierProviders:](self, "setSpecifierProviders:", v11);

  v44.receiver = self;
  v44.super_class = (Class)STUsageDetailListController;
  -[STUsageDetailListController viewDidLoad](&v44, sel_viewDidLoad);
  v12 = [STNoUsageDataView alloc];
  v13 = -[STNoUsageDataView initWithPreferredFontTextStyle:](v12, "initWithPreferredFontTextStyle:", *MEMORY[0x24BEBE1D0]);
  -[STNoUsageDataView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = v13;
  -[STUsageDetailListController setNoUsageDataView:](self, "setNoUsageDataView:", v13);
  v14 = (void *)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateWithCoordinator:", v15);

  -[STUsageDetailListController setDatePickerBar:](self, "setDatePickerBar:", v14);
  -[STUsageDetailListController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v14);
  objc_msgSend(v16, "readableContentGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v20 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v20;
  -[STUsageDetailListController setDatePickerTopConstraint:](self, "setDatePickerTopConstraint:", v20);
  objc_msgSend(v14, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v18;
  objc_msgSend(v21, "constraintEqualToAnchor:", v18);
  v22 = objc_claimAutoreleasedReturnValue();

  -[STUsageDetailListController setDatePickerBottomConstraint:](self, "setDatePickerBottomConstraint:", v22);
  v23 = (void *)MEMORY[0x24BDD1628];
  v31 = (void *)v22;
  v45[0] = v22;
  objc_msgSend(v14, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v26;
  objc_msgSend(v14, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v30);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidLoad", buf, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STUsageDetailListController;
  -[STUsageDetailListController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[STPINListViewController coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageDetailsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startRefreshingUsageData");

  -[STUsageDetailListController mostUsedProvider](self, "mostUsedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshUsageSpecifiersWithUpdates:", 0);

  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController segmentedControlProvider](self, "segmentedControlProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinator:", v7);

  -[STUsageDetailListController screenTimeProvider](self, "screenTimeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadSpecifier_, v10, 0.0);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewWillAppear", v11, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  uint8_t buf[16];
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)STUsageDetailListController;
  -[STPINListViewController viewDidAppear:](&v24, sel_viewDidAppear_, a3);
  -[STPINListViewController coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController segmentedControlProvider](self, "segmentedControlProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCoordinator:", v4);

  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController _reportCoreAnalyticsEventWithUser:currentDate:calendar:](self, "_reportCoreAnalyticsEventWithUser:currentDate:calendar:", v8, v9, v10);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidAppear", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/SCREEN_TIME_SUMMARY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithKey:table:locale:bundleURL:", CFSTR("AllDevicesTitle"), CFSTR("Localizable"), v13, v15);

  v17 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenTimeControllerTitle"), CFSTR("Localizable"), v18, v20);

  v25[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v16, v22, v11);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageDetailsCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopRefreshingUsageData");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STUsageDetailListController;
  -[STUsageDetailListController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STUsageDetailListController;
  -[STUsageDetailListController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[STUsageDetailListController datePickerBar](self, "datePickerBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_barHairlineShadowColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v4, "setShadowOffset:", 0.0, 3.0);
  LODWORD(v6) = 1050253722;
  objc_msgSend(v4, "setShadowOpacity:", v6);
  v7 = (void *)MEMORY[0x24BEBD420];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v7, "bezierPathWithRect:");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setShadowPath:", objc_msgSend(v8, "CGPath"));

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STUsageDetailListController.viewDidLayoutSubviews", v9, 2u);
  }

}

- (void)setCoordinator:(id)a3
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
  objc_super v13;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextUsageDetailListController");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isCloudSyncEnabled"), "KVOContextUsageDetailListController");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.devices"), "KVOContextUsageDetailListController");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), "KVOContextUsageDetailListController");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextUsageDetailListController");
  v13.receiver = self;
  v13.super_class = (Class)STUsageDetailListController;
  -[STPINListViewController setCoordinator:](&v13, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), 5, "KVOContextUsageDetailListController");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isCloudSyncEnabled"), 7, "KVOContextUsageDetailListController");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.devices"), 7, "KVOContextUsageDetailListController");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), 5, "KVOContextUsageDetailListController");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextUsageDetailListController");
  -[STUsageDetailListController datePickerBar](self, "datePickerBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithCoordinator:", v4);

  -[STUsageDetailListController segmentedControlProvider](self, "segmentedControlProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v4);

  -[STUsageDetailListController screenTimeProvider](self, "screenTimeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinator:", v4);

  -[STUsageDetailListController allowancesProvider](self, "allowancesProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCoordinator:", v4);

  -[STUsageDetailListController mostUsedProvider](self, "mostUsedProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCoordinator:", v4);

  -[STUsageDetailListController pickupsProvider](self, "pickupsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCoordinator:", v4);

  -[STUsageDetailListController notificationsProvider](self, "notificationsProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCoordinator:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
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
  objc_super v25;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextUsageDetailListController")
  {
    -[STPINListViewController coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasUsageData")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STUsageDetailListController _hasUsageDataDidChange:](self, "_hasUsageDataDidChange:", objc_msgSend(v12, "BOOLValue"));
    }
    else
    {
      -[STPINListViewController coordinator](self, "coordinator");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.devices")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v14)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v16)
        {

          v15 = 0;
        }
        -[STUsageDetailListController _devicesDidChangeFrom:to:](self, "_devicesDidChangeFrom:to:", v12, v15);
      }
      else
      {
        -[STPINListViewController coordinator](self, "coordinator");

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v17)
          {

            v12 = 0;
          }
          -[STUsageDetailListController setTitle:](self, "setTitle:", v12);
          goto LABEL_18;
        }
        -[STPINListViewController coordinator](self, "coordinator");

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v18)
          {

            v12 = 0;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v19)
          {

            v15 = 0;
          }
          v20 = (void *)objc_opt_class();
          -[STUsageDetailListController datePickerBar](self, "datePickerBar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[STPINListViewController coordinator](self, "coordinator");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "selectedUsageReportDidChangeFrom:to:datePickerBar:coordinator:", v12, v15, v21, v22);

        }
        else
        {
          -[STPINListViewController coordinator](self, "coordinator");

          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isCloudSyncEnabled")))
            goto LABEL_19;
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v23)
          {

            v12 = 0;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v24)
          {

            v15 = 0;
          }
          -[STUsageDetailListController _isCloudSyncEnabledDidChangeFrom:to:](self, "_isCloudSyncEnabledDidChangeFrom:to:", v12, v15);
        }
      }

    }
LABEL_18:

    goto LABEL_19;
  }
  v25.receiver = self;
  v25.super_class = (Class)STUsageDetailListController;
  -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v25, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_19:

}

- (void)_hasUsageDataDidChange:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[8];

  v3 = a3;
  v36[6] = *MEMORY[0x24BDAC8D0];
  -[STUsageDetailListController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailListController noUsageDataView](self, "noUsageDataView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8 == v3)
  {
    if (v3)
    {
      objc_msgSend(v6, "removeFromSuperview");
      -[STUsageDetailListController table](self, "table");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setScrollEnabled:", 1);

    }
    else
    {
      -[STUsageDetailListController table](self, "table");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setScrollEnabled:", 0);

      -[STUsageDetailListController setDatePickerHidden:](self, "setDatePickerHidden:", 1);
      -[STPINListViewController coordinator](self, "coordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "usageDetailsCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLocalDevice:", objc_msgSend(v13, "isLocalDevice"));

      objc_msgSend(v5, "addSubview:", v6);
      objc_msgSend(v5, "layoutMarginsGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v6, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:", v34);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v33;
      objc_msgSend(v6, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v14;
      objc_msgSend(v14, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v31);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v29;
      objc_msgSend(v6, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v25;
      objc_msgSend(v6, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v15;
      objc_msgSend(v6, "centerXAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerXAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[4] = v18;
      objc_msgSend(v6, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36[5] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activateConstraints:", v22);

    }
  }

}

- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("identifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v7) & 1) == 0)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDevicesMenu updateWithCoordinator:viewController:](STDevicesMenu, "updateWithCoordinator:viewController:", v8, self);

  }
}

- (void)_isCloudSyncEnabledDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  LODWORD(a3) = objc_msgSend(a3, "BOOLValue");
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((_DWORD)a3 != v7)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "usageDetailsCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke;
    v10[3] = &unk_24DB866E0;
    v10[4] = self;
    objc_msgSend(v9, "loadViewModelWithCompletionHandler:", v10);

  }
}

void __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke_cold_1((uint64_t)v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDevicesMenu updateWithCoordinator:viewController:](STDevicesMenu, "updateWithCoordinator:viewController:", v4, *(_QWORD *)(a1 + 32));

  }
}

+ (void)selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4 datePickerBar:(id)a5 coordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  _BOOL8 v48;
  void *v49;
  _BOOL8 v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;

  v76 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10 && (objc_msgSend(v76, "isEqual:", v10) & 1) == 0)
  {
    objc_msgSend(v10, "reportDateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "type");
    v17 = v16;
    if (v16 == 1)
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "setFormattingContext:", 2);
      objc_msgSend(v23, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMd"));
      objc_msgSend(v23, "stringFromDate:", v14);
      v24 = objc_claimAutoreleasedReturnValue();
      v71 = v13;
      v72 = v23;
      v74 = (void *)v24;
      v75 = v14;
      if (objc_msgSend(v15, "isDateInToday:", v14))
      {
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("TodayScreenTimeFormat"), &stru_24DB8A1D0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v24;
        v30 = (void *)v28;
        v31 = (void *)objc_msgSend(v27, "initWithFormat:locale:", v26, v28, v29);
        objc_msgSend(v11, "dateLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", v31);

        objc_msgSend(v11, "rightArrowButton");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setEnabled:", 0);

      }
      else
      {
        if (objc_msgSend(v15, "isDateInYesterday:", v14))
        {
          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("YesterdayScreenTimeFormat"), &stru_24DB8A1D0, 0);
          v36 = objc_claimAutoreleasedReturnValue();

          v37 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v68 = v24;
          v38 = (void *)v36;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v37, "initWithFormat:locale:", v36, v68);
          objc_msgSend(v11, "dateLabel");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setText:", v39);
        }
        else
        {
          v53 = objc_msgSend(v15, "component:fromDate:", 512, v14);
          objc_msgSend(v15, "standaloneWeekdaySymbols");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", v53 - 1);
          v55 = objc_claimAutoreleasedReturnValue();

          +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("WeekdayScreenTimeFormat"), &stru_24DB8A1D0, 0);
          v57 = objc_claimAutoreleasedReturnValue();

          v58 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)v57;
          v40 = (void *)objc_msgSend(v58, "initWithFormat:locale:", v57, v39, v55, v74);
          objc_msgSend(v11, "dateLabel");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setText:", v40);

          v38 = (void *)v55;
          v17 = 1;
        }

        objc_msgSend(v11, "rightArrowButton");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setEnabled:", 1);
      }

      objc_msgSend(v12, "usageDetailsCoordinator");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "viewModel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = objc_msgSend(v44, "selectedWeek");
      objc_msgSend(v44, "weekUsageReports");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count");

      v64 = objc_msgSend(v15, "component:fromDate:", 512, v75);
      v65 = v63 && v61 != v63 - 1 || v64 != objc_msgSend(v15, "firstWeekday");
      v52 = v74;
      objc_msgSend(v11, "leftArrowButton");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setEnabled:", v65);
      v13 = v71;
      goto LABEL_26;
    }
    if (v16)
    {
LABEL_27:
      objc_msgSend(v12, "viewModel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "me");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_setSelectedUsageReportType:user:", v17, v67);

      goto LABEL_28;
    }
    v18 = objc_opt_new();
    objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v18, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v70 = v13;
    v72 = (void *)v18;
    v73 = (void *)v19;
    v75 = v14;
    if (objc_msgSend(v15, "isDate:equalToDate:toUnitGranularity:", v14, v18, 0x2000))
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("DatePickerTitleThisWeek");
    }
    else
    {
      if (!objc_msgSend(v15, "isDate:equalToDate:toUnitGranularity:", v14, v19, 0x2000))
      {
        v21 = (void *)objc_opt_new();
        objc_msgSend(v21, "setDateTemplate:", CFSTR("MMMMddy"));
        objc_msgSend(v21, "stringFromDateInterval:", v13);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("DatePickerTitleLastWeek");
    }
    objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_24DB8A1D0, 0);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v41 = (void *)v34;
    objc_msgSend(v11, "dateLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setText:", v41);

    objc_msgSend(v12, "usageDetailsCoordinator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "viewModel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend(v44, "selectedWeek");
    objc_msgSend(v44, "weekUsageReports");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    v48 = v45 < v47 - 1 && v47 != 0;
    objc_msgSend(v11, "leftArrowButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setEnabled:", v48);

    v50 = v45 != 0;
    objc_msgSend(v11, "rightArrowButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setEnabled:", v50);
    v13 = v70;
    v52 = v73;
LABEL_26:

    v14 = v75;
    goto LABEL_27;
  }
LABEL_28:

}

+ (void)_setSelectedUsageReportType:(unint64_t)a3 user:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "isRemoteUser"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator setDefaultUsageReportType:childDSID:](STUsageDetailsViewModelCoordinator, "setDefaultUsageReportType:childDSID:", v5, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator setDefaultUsageReportTypeForLocalUser:](STUsageDetailsViewModelCoordinator, "setDefaultUsageReportTypeForLocalUser:", v5);
  }

}

+ (id)_getDevicesDropDownMenuWithCoordinator:(id)a3 viewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id val;
  void *v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id location;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  val = a4;
  v28 = v5;
  objc_msgSend(v5, "usageDetailsCoordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "selectedDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  objc_initWeak(&location, val);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained(&location);
        +[STUsageDetailListController _getUIActionForDevice:deviceIndentifier:coordinator:weakSelf:](STUsageDetailListController, "_getUIActionForDevice:deviceIndentifier:coordinator:weakSelf:", v14, v13, v28, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "isEqualToString:", v13))
          objc_msgSend(v16, "setState:", 1);
        objc_msgSend(v8, "addObject:", v16);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(obj, "count") >= 2)
  {
    objc_msgSend(v26, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasAggregateUsageData");

    if (v19)
    {
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AllDevicesTitle"), &stru_24DB8A1D0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_loadWeakRetained(&location);
      +[STUsageDetailListController _getUIActionForDevice:deviceIndentifier:coordinator:weakSelf:](STUsageDetailListController, "_getUIActionForDevice:deviceIndentifier:coordinator:weakSelf:", v20, 0, v28, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        objc_msgSend(v22, "setState:", 1);
      objc_msgSend(v8, "addObject:", v22);

    }
  }
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v23;
}

+ (id)_getUIActionForDevice:(id)a3 deviceIndentifier:(id)a4 coordinator:(id)a5 weakSelf:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BEBD388];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__STUsageDetailListController__getUIActionForDevice_deviceIndentifier_coordinator_weakSelf___block_invoke;
  v18[3] = &unk_24DB88140;
  v19 = v11;
  v20 = v9;
  v21 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", a3, 0, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __92__STUsageDetailListController__getUIActionForDevice_deviceIndentifier_coordinator_weakSelf___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = v1;
    +[STUsageDetailListController _setSelectedDeviceIdentifier:coordinator:](STUsageDetailListController, "_setSelectedDeviceIdentifier:coordinator:", v3, v4);
    +[STUsageDetailListController _getDevicesDropDownMenuWithCoordinator:viewController:](STUsageDetailListController, "_getDevicesDropDownMenuWithCoordinator:viewController:", a1[6], a1[4]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v8);

  }
}

+ (void)_setSelectedDeviceIdentifier:(id)a3 coordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v5, "usageDetailsCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedDeviceIdentifier:", v10);

  objc_msgSend(v5, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isRemoteUser"))
  {
    objc_msgSend(v8, "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator setDefaultDeviceIdentifier:childDSID:](STUsageDetailsViewModelCoordinator, "setDefaultDeviceIdentifier:childDSID:", v10, v9);

  }
  else
  {
    +[STUsageDetailsViewModelCoordinator setDefaultDeviceIdentifierForLocalUser:](STUsageDetailsViewModelCoordinator, "setDefaultDeviceIdentifierForLocalUser:", v10);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  double MaxY;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  v14 = a3;
  -[STUsageDetailListController segmentedControlProvider](self, "segmentedControlProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75AB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "frame");
      MaxY = CGRectGetMaxY(v15);
      objc_msgSend(v14, "contentOffset");
      v12 = v11;
      objc_msgSend(v14, "adjustedContentInset");
      -[STUsageDetailListController setDatePickerHidden:](self, "setDatePickerHidden:", v12 + v13 < MaxY);
    }
  }

}

- (BOOL)isDatePickerHidden
{
  void *v3;
  char v4;
  void *v5;

  -[STUsageDetailListController datePickerTopConstraint](self, "datePickerTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isActive") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[STUsageDetailListController datePickerBottomConstraint](self, "datePickerBottomConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isActive");

  }
  return v4;
}

- (void)setDatePickerHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];

  v3 = a3;
  if (-[STUsageDetailListController isDatePickerHidden](self, "isDatePickerHidden") != a3)
  {
    -[STUsageDetailListController datePickerTopConstraint](self, "datePickerTopConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActive:", v3 ^ 1);

    -[STUsageDetailListController datePickerBottomConstraint](self, "datePickerBottomConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", v3);

    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__STUsageDetailListController_setDatePickerHidden___block_invoke;
    v10[3] = &unk_24DB86440;
    v10[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x20000, v10, 0, 0.6, 0.0);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __51__STUsageDetailListController_setDatePickerHidden___block_invoke_2;
    v8[3] = &unk_24DB86AB8;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x20000, v8, 0, 0.2, 0.0);
  }
}

void __51__STUsageDetailListController_setDatePickerHidden___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __51__STUsageDetailListController_setDatePickerHidden___block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "datePickerBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_reportCoreAnalyticsEventWithUser:(id)a3 currentDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend(v8, "type");
  if (v9 > 7)
    v10 = 0;
  else
    v10 = qword_219BA4DC8[v9];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ScreenTimeAgent"));
  objc_msgSend(v11, "objectForKey:", CFSTR("LastViewedAllActivityDate"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = v19;
  objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("LastViewedAllActivityDate"));
  objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v12, v19, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "day");
  v15 = objc_alloc(MEMORY[0x24BE84688]);
  v16 = objc_msgSend(v8, "isManaged");
  v17 = objc_msgSend(v8, "isRemoteUser");

  v18 = (void *)objc_msgSend(v15, "initWithDaysSinceLastView:userAgeGroup:userIsManaged:userIsRemote:", v14 & ~(v14 >> 63), v10, v16, v17);
  objc_msgSend(MEMORY[0x24BE84558], "reportEvent:", v18);

}

- (STTestGroupSpecifierProvider)testProvider
{
  return (STTestGroupSpecifierProvider *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setTestProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (STSegmentedControlGroupSpecifierProvider)segmentedControlProvider
{
  return (STSegmentedControlGroupSpecifierProvider *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setSegmentedControlProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (STScreenTimeUsageGroupSpecifierProvider)screenTimeProvider
{
  return (STScreenTimeUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setScreenTimeProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (STAllowanceProgressGroupSpecifierProvider)allowancesProvider
{
  return (STAllowanceProgressGroupSpecifierProvider *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setAllowancesProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (STMostUsedGroupSpecifierProvider)mostUsedProvider
{
  return (STMostUsedGroupSpecifierProvider *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setMostUsedProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (STNotificationsUsageGroupSpecifierProvider)notificationsProvider
{
  return (STNotificationsUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setNotificationsProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (STDevicePickupsUsageGroupSpecifierProvider)pickupsProvider
{
  return (STDevicePickupsUsageGroupSpecifierProvider *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setPickupsProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1456);
}

- (STNoUsageDataView)noUsageDataView
{
  return (STNoUsageDataView *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setNoUsageDataView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1464);
}

- (STDatePickerBar)datePickerBar
{
  return (STDatePickerBar *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setDatePickerBar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (NSLayoutConstraint)datePickerTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setDatePickerTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1480);
}

- (NSLayoutConstraint)datePickerBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setDatePickerBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePickerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerBar, 0);
  objc_storeStrong((id *)&self->_noUsageDataView, 0);
  objc_storeStrong((id *)&self->_pickupsProvider, 0);
  objc_storeStrong((id *)&self->_notificationsProvider, 0);
  objc_storeStrong((id *)&self->_mostUsedProvider, 0);
  objc_storeStrong((id *)&self->_allowancesProvider, 0);
  objc_storeStrong((id *)&self->_screenTimeProvider, 0);
  objc_storeStrong((id *)&self->_segmentedControlProvider, 0);
  objc_storeStrong((id *)&self->_testProvider, 0);
}

void __67__STUsageDetailListController__isCloudSyncEnabledDidChangeFrom_to___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error isCloudSyncEnabledDidChangeFrom: %@", (uint8_t *)&v1, 0xCu);
}

@end
