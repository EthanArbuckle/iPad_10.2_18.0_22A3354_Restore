@implementation STRootViewController

- (STRootViewController)initWithRootViewModelCoordinator:(id)a3
{
  return -[STRootViewController initWithRootViewModelCoordinator:presentedAsModal:](self, "initWithRootViewModelCoordinator:presentedAsModal:", a3, 0);
}

- (STRootViewController)initWithRootViewModelCoordinator:(id)a3 presentedAsModal:(BOOL)a4
{
  STRootViewModelCoordinator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  STRootViewController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  STEnableScreenTimeGroupSpecifierProvider *enableScreenTimeGroupSpecifierProvider;
  uint64_t v16;
  STScreenTimeGroupSpecifierProvider *screenTimeGroupSpecifierProvider;
  uint64_t v18;
  STNoUsageReportedGroupSpecifierProvider *noUsageReportedGroupSpecifierProvider;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[24];

  v42[22] = *MEMORY[0x24BDAC8D0];
  v6 = (STRootViewModelCoordinator *)a3;
  if (!v6)
  {
    +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForLocalUser](STUsageDetailsViewModelCoordinator, "defaultDeviceIdentifierForLocalUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForLocalUser](STUsageDetailsViewModelCoordinator, "defaultUsageReportTypeForLocalUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", 0, v7, v8, 0);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[STRootViewController initWithRootViewModelCoordinator:presentedAsModal:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("STRootViewController.m"), 74, CFSTR("RootViewModelCoordinator could not be created. This is a fatal error for ScreenTime."));

    }
  }
  v41.receiver = self;
  v41.super_class = (Class)STRootViewController;
  v11 = -[STPINListViewController initWithRootViewModelCoordinator:](&v41, sel_initWithRootViewModelCoordinator_, v6);
  if (v11)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ScreenTimeControllerTitle"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewController setTitle:](v11, "setTitle:", v13);

    v11->_presentedAsModal = a4;
    +[STEnableScreenTimeGroupSpecifierProvider providerWithCoordinator:rootViewController:](STEnableScreenTimeGroupSpecifierProvider, "providerWithCoordinator:rootViewController:", v6, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    enableScreenTimeGroupSpecifierProvider = v11->_enableScreenTimeGroupSpecifierProvider;
    v11->_enableScreenTimeGroupSpecifierProvider = (STEnableScreenTimeGroupSpecifierProvider *)v14;

    +[STRootGroupSpecifierProvider providerWithCoordinator:](STScreenTimeGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    screenTimeGroupSpecifierProvider = v11->_screenTimeGroupSpecifierProvider;
    v11->_screenTimeGroupSpecifierProvider = (STScreenTimeGroupSpecifierProvider *)v16;

    +[STRootGroupSpecifierProvider providerWithCoordinator:](STNoUsageReportedGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    noUsageReportedGroupSpecifierProvider = v11->_noUsageReportedGroupSpecifierProvider;
    v11->_noUsageReportedGroupSpecifierProvider = (STNoUsageReportedGroupSpecifierProvider *)v18;

    +[STRootGroupSpecifierProvider providerWithCoordinator:](STAboutScreenTimeGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v40;
    v42[1] = v11->_enableScreenTimeGroupSpecifierProvider;
    +[STEnableRemoteManagementGroupSpecifierProvider providerWithCoordinator:rootViewController:](STEnableRemoteManagementGroupSpecifierProvider, "providerWithCoordinator:rootViewController:", v6, v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v39;
    v42[3] = v11->_screenTimeGroupSpecifierProvider;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STUsageSharingGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v38;
    +[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider providerWithCoordinator:rootViewController:](STCommunicationSafetyAnalyticsTipGroupSpecifierProvider, "providerWithCoordinator:rootViewController:", v6, v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v37;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STAskForTimeGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v36;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STManageContactsGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v35;
    v42[8] = v11->_noUsageReportedGroupSpecifierProvider;
    +[STLimitUsageGroupSpecifierProvider providerWithCoordinator:rootViewController:](STLimitUsageGroupSpecifierProvider, "providerWithCoordinator:rootViewController:", v6, v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[9] = v34;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STCommunicationGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[10] = v33;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STRestrictionsGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[11] = v32;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STRestrictingApplicationsGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[12] = v31;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STIncludeWebsiteDataGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[13] = v30;
    +[STFamilyMemberGroupSpecifierProvider providerWithCoordinator:rootViewController:](STFamilyMemberGroupSpecifierProvider, "providerWithCoordinator:rootViewController:", v6, v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[14] = v29;
    +[STPasscodeGroupSpecifierProvider providerWithCoordinator:listController:](STPasscodeGroupSpecifierProvider, "providerWithCoordinator:listController:", v6, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[15] = v20;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STSignInToiCloudGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[16] = v21;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STCloudSyncDataGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[17] = v22;
    +[STSetUpForFamilyGroupSpecifierProvider providerWithCoordinator:presenter:](STSetUpForFamilyGroupSpecifierProvider, "providerWithCoordinator:presenter:", v6, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[18] = v23;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STDisableAppAndWebsiteActivityGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[19] = v24;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STDisableScreenTimeGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[20] = v25;
    +[STRootGroupSpecifierProvider providerWithCoordinator:](STStopSharingScreenTimeGroupSpecifierProvider, "providerWithCoordinator:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[21] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListViewController setSpecifierProviders:](v11, "setSpecifierProviders:", v27);

    -[STRootViewController _startObservingCoordinator](v11, "_startObservingCoordinator");
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[STRootViewController _stopObservingCoordinator](self, "_stopObservingCoordinator");
  v3.receiver = self;
  v3.super_class = (Class)STRootViewController;
  -[STListViewController dealloc](&v3, sel_dealloc);
}

- (void)setSpecifier:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)STRootViewController;
  -[STRootViewController setSpecifier:](&v22, sel_setSpecifier_, v4);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewController setTitle:](self, "setTitle:", v7);

    objc_msgSend(v6, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForChild:](STUsageDetailsViewModelCoordinator, "defaultDeviceIdentifierForChild:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForChild:](STUsageDetailsViewModelCoordinator, "defaultUsageReportTypeForChild:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPINListViewController coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinatorForChild:deviceIdentifier:usageReportType:", v6, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[STRootViewController _stopObservingCoordinator](self, "_stopObservingCoordinator");
    -[STPINListViewController setCoordinator:](self, "setCoordinator:", v12);
    -[STRootViewController _startObservingCoordinator](self, "_startObservingCoordinator");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[STListViewController specifierProviders](self, "specifierProviders", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "setCoordinator:", v12);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)_stopObservingCoordinator
{
  id v3;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator"), "STRootViewControllerObservationContext");

}

- (void)_startObservingCoordinator
{
  id v3;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");

  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator"), 2, "STRootViewControllerObservationContext");
}

- (void)setShouldRefreshUsageData:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_shouldRefreshUsageData != a3)
  {
    v3 = a3;
    self->_shouldRefreshUsageData = a3;
    -[STPINListViewController coordinator](self, "coordinator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "usageDetailsCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "startRefreshingUsageData");
    else
      objc_msgSend(v4, "stopRefreshingUsageData");

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)STRootViewController;
  -[STRootViewController viewDidLoad](&v9, sel_viewDidLoad);
  if (-[STRootViewController presentedAsModal](self, "presentedAsModal"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonAction_);
    v11[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItems:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("NewUsageToggle"));

    if (!v7)
      return;
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("ant"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v3, 0, self, sel__toggleNewUsageAction_);
    v10 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRootViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItems:", v5);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STRootViewController;
  -[STPINListViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenTimeControllerTitle"), CFSTR("Localizable"), v6, v8);

  -[STRootViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, MEMORY[0x24BDBD1A8], v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STRootViewController;
  -[STRootViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[STRootViewController setShouldRefreshUsageData:](self, "setShouldRefreshUsageData:", 1);
  -[STPINListViewController coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) == 0
    && -[STRootViewController isMovingToParentViewController](self, "isMovingToParentViewController")
    && (objc_msgSend(v4, "hasShownMiniBuddy") & 1) == 0)
  {
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isScreenTimeEnabled") & 1) == 0)
    {
      objc_msgSend(v4, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canStartScreenTime");

      if (!v7)
        goto LABEL_8;
      -[STRootViewController enableScreenTimeGroupSpecifierProvider](self, "enableScreenTimeGroupSpecifierProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setupScreenTime:", 0);
    }

  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STRootViewController.viewWillAppear", v8, 2u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STRootViewController;
  -[STRootViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[STRootViewController setShouldRefreshUsageData:](self, "setShouldRefreshUsageData:", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STRootViewController.viewWillDisappear", v4, 2u);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  objc_super v21;

  v10 = a5;
  if (a6 == "STRootViewControllerObservationContext")
  {
    v12 = a3;
    -[STPINListViewController coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("usageDetailsCoordinator"));
    if (v13 && -[STRootViewController shouldRefreshUsageData](self, "shouldRefreshUsageData"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPINListViewController coordinator](self, "coordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "usageDetailsCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v14);

      if ((v18 & 1) == 0)
        objc_msgSend(v14, "stopRefreshingUsageData");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v16);

      if ((v20 & 1) == 0)
        objc_msgSend(v16, "startRefreshingUsageData");

    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)STRootViewController;
    v11 = a3;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)STRootViewController;
  -[STListViewController tableView:cellForRowAtIndexPath:](&v28, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootViewController noUsageReportedGroupSpecifierProvider](self, "noUsageReportedGroupSpecifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v9))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.circle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageByApplyingSymbolConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithString:", v19);

    objc_msgSend(v20, "insertAttributedString:atIndex:", v16, 0);
    objc_msgSend(MEMORY[0x24BEBD728], "cellConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttributedText:", v20);
    objc_msgSend(v21, "textProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 0);

    objc_msgSend(v21, "textProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLineBreakMode:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setColor:", v24);

    objc_msgSend(v5, "setContentConfiguration:", v21);
  }
  if (objc_msgSend(v5, "type") == 13 || objc_msgSend(v5, "type") == 6)
  {
    objc_msgSend(v5, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", 0);
    objc_msgSend(v26, "setLineBreakMode:", 0);

  }
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[STRootViewController noUsageReportedGroupSpecifierProvider](self, "noUsageReportedGroupSpecifierProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[STRootViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v10),
        v11,
        v12))
  {
    v13 = *MEMORY[0x24BEBE770];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STRootViewController;
    -[STRootViewController tableView:heightForRowAtIndexPath:](&v16, sel_tableView_heightForRowAtIndexPath_, v6, v7);
    v13 = v14;
  }

  return v13;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__STRootViewController_handleURL_withCompletion___block_invoke;
  v9[3] = &unk_24DB87908;
  v9[4] = self;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
  v8.receiver = self;
  v8.super_class = (Class)STRootViewController;
  -[STRootViewController handleURL:withCompletion:](&v8, sel_handleURL_withCompletion_, v7, v6);

}

void __49__STRootViewController_handleURL_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v12, "containsString:", *MEMORY[0x24BE84798]))
    {
      objc_msgSend(*(id *)(a1 + 32), "coordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "usageDetailsCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectToday");

      *a4 = 1;
    }
    else if (objc_msgSend(v12, "containsString:", *MEMORY[0x24BE847A0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "coordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "usageDetailsCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setSelectedWeek:", 0);
      objc_msgSend(v11, "setSelectedDay:", 0x7FFFFFFFFFFFFFFFLL);
      *a4 = 1;

    }
  }

}

- (void)doneButtonAction:(id)a3
{
  id v3;

  -[STRootViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_toggleNewUsageAction:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "BOOLForKey:", 0x24DB93050) ^ 1;
  objc_msgSend(v8, "setBool:forKey:", v4, 0x24DB93050);
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageDetailsCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHasDeviceActivityData:", v4);

  objc_msgSend(v6, "loadViewModelWithCompletionHandler:", 0);
}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (STEnableScreenTimeGroupSpecifierProvider)enableScreenTimeGroupSpecifierProvider
{
  return (STEnableScreenTimeGroupSpecifierProvider *)objc_getProperty(self, a2, 1416, 1);
}

- (STNoUsageReportedGroupSpecifierProvider)noUsageReportedGroupSpecifierProvider
{
  return (STNoUsageReportedGroupSpecifierProvider *)objc_getProperty(self, a2, 1424, 1);
}

- (STScreenTimeGroupSpecifierProvider)screenTimeGroupSpecifierProvider
{
  return (STScreenTimeGroupSpecifierProvider *)objc_getProperty(self, a2, 1432, 1);
}

- (BOOL)shouldRefreshUsageData
{
  return self->_shouldRefreshUsageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_noUsageReportedGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_enableScreenTimeGroupSpecifierProvider, 0);
}

@end
