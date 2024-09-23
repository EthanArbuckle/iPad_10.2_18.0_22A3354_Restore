@implementation STAllowanceListController

- (STAllowanceListController)init
{
  STAllowanceListController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STAllowanceListController;
  v2 = -[STPINListViewController init](&v6, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AppLimitsSpecifierName"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceListController setTitle:](v2, "setTitle:", v4);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), "STAllowanceObservationContext");
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.hasWatchOSDevices"), "STAllowanceObservationContext");
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.devices"), "STAllowanceObservationContext");
  v3.receiver = self;
  v3.super_class = (Class)STAllowanceListController;
  -[STListViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)STAllowanceListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/APP_LIMITS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("AppLimitsSpecifierName"), CFSTR("Localizable"), v6, v8);

  v10 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenTimeControllerTitle"), CFSTR("Localizable"), v11, v13);

  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)setCoordinator:(id)a3
{
  STRootViewModelCoordinator *v4;
  STRootViewModelCoordinator *coordinator;
  STRootViewModelCoordinator *v6;
  id v7;

  v4 = (STRootViewModelCoordinator *)a3;
  -[STAllowanceListController coordinator](self, "coordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), "STAllowanceObservationContext");
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.hasWatchOSDevices"), "STAllowanceObservationContext");
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.devices"), "STAllowanceObservationContext");
  coordinator = self->_coordinator;
  self->_coordinator = v4;
  v6 = v4;

  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), 0, "STAllowanceObservationContext");
  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.hasWatchOSDevices"), 1, "STAllowanceObservationContext");
  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.devices"), 1, "STAllowanceObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == "STAllowanceObservationContext")
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier")))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.hasWatchOSDevices")))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
        {

          v13 = 0;
        }
        -[STAllowanceListController _hasWatchOSDevicesDidChange:coordinator:](self, "_hasWatchOSDevicesDidChange:coordinator:", objc_msgSend(v13, "BOOLValue"), v11);
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.devices")))
          goto LABEL_3;
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v15)
        {

          v13 = 0;
        }
        -[STAllowanceListController _devicesDidChange:coordinator:](self, "_devicesDidChange:coordinator:", v13, v11);
      }

      goto LABEL_3;
    }
    if (-[STAllowanceListController isViewLoaded](self, "isViewLoaded"))
      -[STAllowanceListController _allowancesDidChange](self, "_allowancesDidChange");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STAllowanceListController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_3:

}

- (void)_allowancesDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[STAllowanceListController reloadSpecifiers](self, "reloadSpecifiers");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[STAllowanceListController allowanceSpecifiers](self, "allowanceSpecifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[STAllowanceListController _adjustCellHeightForAllowanceSpecifier:](self, "_adjustCellHeightForAllowanceSpecifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_hasWatchOSDevicesDidChange:(BOOL)a3 coordinator:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (-[STAllowanceListController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(v9, "usageDetailsCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceListController _informativeTextWithDevices:hasWatchOSDevices:](self, "_informativeTextWithDevices:hasWatchOSDevices:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAllowanceListController _reloadInformativeTextGroupSpecifierIfNeeded:](self, "_reloadInformativeTextGroupSpecifierIfNeeded:", v8);
  }

}

- (void)_devicesDidChange:(id)a3 coordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[STAllowanceListController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceListController _informativeTextWithDevices:hasWatchOSDevices:](self, "_informativeTextWithDevices:hasWatchOSDevices:", v9, objc_msgSend(v7, "hasWatchOSDevices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAllowanceListController _reloadInformativeTextGroupSpecifierIfNeeded:](self, "_reloadInformativeTextGroupSpecifierIfNeeded:", v8);
  }

}

- (void)_reloadInformativeTextGroupSpecifierIfNeeded:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[STAllowanceListController informativeTextGroupSpecifier](self, "informativeTextGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE75A68];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);
    -[STAllowanceListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[STAllowanceListController allowanceSpecifiers](self, "allowanceSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[STAllowanceListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v10, 0);
        -[STAllowanceListController _adjustCellHeightForAllowanceSpecifier:](self, "_adjustCellHeightForAllowanceSpecifier:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceListController.viewWillAppear", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceListController;
  -[STAllowanceListController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
}

- (void)_adjustCellHeightForAllowanceSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AllowanceCustomScheduleDetailText"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", v6))
    -[STAllowanceListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v7, 0);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  objc_class *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v49 = (int)*MEMORY[0x24BE756E0];
    v54 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceListController coordinator](self, "coordinator");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "usageDetailsCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceListController _informativeTextWithDevices:hasWatchOSDevices:](self, "_informativeTextWithDevices:hasWatchOSDevices:", v5, objc_msgSend(v6, "hasWatchOSDevices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    -[STAllowanceListController setInformativeTextGroupSpecifier:](self, "setInformativeTextGroupSpecifier:", v51);
    objc_msgSend(v54, "addObject:", v51);
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("AddLimitSpecifierName"), &stru_24DB8A1D0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 13, objc_opt_class());
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "setButtonAction:", sel_addAllowance_);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x24BE75C60];
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v11);

    v12 = *MEMORY[0x24BE75E18];
    objc_msgSend(v56, "setObject:forKeyedSubscript:", &unk_24DBBE640, *MEMORY[0x24BE75E18]);
    objc_msgSend(v56, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
    if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
      objc_msgSend(v56, "setButtonAction:", sel_showStoreDemoAlert);
    objc_msgSend(v55, "timeAllowancesCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allowancesByIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v52, "count"))
    {
      v15 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("EnableAllAppLimitsSpecifierName"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel__setAllAllowancesEnabled_specifier_, sel__allAllowancesEnabled_, 0, 6, objc_opt_class());
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v18, v46);

      objc_msgSend(v48, "setObject:forKeyedSubscript:", &unk_24DBBE640, v12);
      v19 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v48, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v19, 0x24DB91030);
      -[STAllowanceListController setEnableAllAllowancesSpecifier:](self, "setEnableAllAllowancesSpecifier:", v48);
      objc_msgSend(v54, "addObject:", v48);
      -[STAllowanceListController coordinator](self, "coordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeAllowancesCoordinator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "allAllowancesEnabled");

      if (v23)
      {
        objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v24);

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v52, "count"));
        v69 = 0;
        v70 = &v69;
        v71 = 0x3032000000;
        v72 = __Block_byref_object_copy_;
        v73 = __Block_byref_object_dispose_;
        v74 = 0;
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __39__STAllowanceListController_specifiers__block_invoke;
        v65[3] = &unk_24DB86600;
        v65[4] = self;
        v26 = v25;
        v66 = v26;
        v47 = v54;
        v67 = v47;
        v68 = &v69;
        objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v65);
        -[STAllowanceListController setAllowanceSpecifiers:](self, "setAllowanceSpecifiers:", v26);
        v45 = v26;
        objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAllowanceListController allowanceSpecifiersByBundleIdentifier](self, "allowanceSpecifiersByBundleIdentifier");
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v62 != v30)
                objc_enumerationMutation(v28);
              v32 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend((id)v70[5], "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (v34)
                objc_msgSend(v27, "removeObserver:bundleIdentifier:", self, v32);
            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
          }
          while (v29);
        }

        -[STAllowanceListController setAllowanceSpecifiersByBundleIdentifier:](self, "setAllowanceSpecifiersByBundleIdentifier:", v70[5]);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v35 = (id)v70[5];
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v58 != v37)
                objc_enumerationMutation(v35);
              v39 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
              objc_msgSend(v28, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40 == 0;

              if (v41)
                objc_msgSend(v27, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfo_, v39);
            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
          }
          while (v36);
        }

        objc_msgSend(v47, "addObject:", v50);
        objc_msgSend(v47, "addObject:", v56);

        _Block_object_dispose(&v69, 8);
      }

      v42 = (objc_class *)v54;
    }
    else
    {
      v42 = (objc_class *)v54;
      objc_msgSend(v54, "addObject:", v50);
      objc_msgSend(v54, "addObject:", v56);
    }
    v43 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49) = v42;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49);
  }
  return v3;
}

void __39__STAllowanceListController_specifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_specifierForAllowance:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  objc_msgSend(v4, "bundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v18 = v4;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
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
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v16, "addObject:", v5);
          }
          else
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v5, 0);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v17, v15);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v4 = v18;
  }

}

- (id)_informativeTextWithDevices:(id)a3 hasWatchOSDevices:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && objc_msgSend(v5, "count"))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AppLimitsFooterFormat"), &stru_24DB8A1D0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForKeyPath:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AppLimitsFooterText"), &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)_setAllAllowancesEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[STAllowanceListController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPasscodeEnabled")
    && (objc_msgSend(v8, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_67;
    v10[3] = &unk_24DB86668;
    v12 = v7;
    v10[4] = self;
    v11 = &__block_literal_global;
    -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v6, v10);

  }
  else
  {
    objc_msgSend(v8, "timeAllowancesCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveAllAllowancesEnabled:completionHandler:", v7, &__block_literal_global);

  }
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_cold_1();

  }
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_67(uint64_t a1, int a2)
{
  void *v2;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeAllowancesCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveAllAllowancesEnabled:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enableAllAllowancesSpecifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadSpecifier:animated:");
  }

}

- (id)_allAllowancesEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[STAllowanceListController coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeAllowancesCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "allAllowancesEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_specifierForAllowance:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)MEMORY[0x24BE84510];
  v5 = a3;
  objc_msgSend(v5, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 2, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v11);

  objc_msgSend(v10, "setControllerLoadAction:", sel__showAllowanceDetailController_);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[STAllowanceListController _subtitleTextForAllowance:](self, "_subtitleTextForAllowance:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75D28]);

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75C60]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24DBBE640, *MEMORY[0x24BE75E18]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  objc_msgSend(v5, "timeByDay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AllowanceCustomScheduleDetailText"), &stru_24DB8A1D0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, 0x24DB94290);

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24DBBE658, 0x24DB942B0);
  }

  return v10;
}

- (id)_subtitleTextForAllowance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "allowanceEnabled") & 1) != 0)
  {
    objc_msgSend(v3, "scheduleText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AppLimitOff"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_showAllowanceDetailController:(id)a3
{
  void *v4;
  STAllowanceDetailListController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[STAllowanceListController shouldShowConfirmDeletionAlert](self, "shouldShowConfirmDeletionAlert"))
  {
    -[STAllowanceListController coordinator](self, "coordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[STAllowanceDetailListController initWithCoordinator:]([STAllowanceDetailListController alloc], "initWithCoordinator:", v4);
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeAllowancesCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowancesByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController setAllowance:](v5, "setAllowance:", v10);

    -[STAllowanceDetailListController setDelegate:](v5, "setDelegate:", self);
    -[STAllowanceDetailListController setParentController:](v5, "setParentController:", self);
    -[STAllowanceListController rootController](self, "rootController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController setRootController:](v5, "setRootController:", v11);

    -[STAllowanceDetailListController setSpecifier:](v5, "setSpecifier:", v12);
    -[STAllowanceListController showController:animate:](self, "showController:animate:", v5, 1);

  }
}

- (void)addAllowance:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *, void *);
  void *v19;
  STAllowanceListController *v20;
  id v21;

  v4 = a3;
  v5 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], 0x24DB8A510);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, 0x24DB8A530);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, 0x24DB8A550);
  -[STAllowanceListController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, 0x24DB91230);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AllowanceNextBarButtonItemTitle"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, 0x24DB8A570);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __42__STAllowanceListController_addAllowance___block_invoke;
  v19 = &unk_24DB863F0;
  v20 = self;
  v21 = v4;
  v9 = v4;
  v10 = _Block_copy(&v16);
  v11 = _Block_copy(v10);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, 0x24DB8A590, v16, v17, v18, v19, v20);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setParentController:", self);
  -[STAllowanceListController rootController](self, "rootController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRootController:", v13);

  objc_msgSend(v12, "setSpecifier:", v9);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setParentController:", v12);
  objc_msgSend(v12, "rootController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRootController:", v15);

  objc_msgSend(v14, "setSpecifier:", v9);
  objc_msgSend(v12, "showController:", v14);
  -[STAllowanceListController showController:](self, "showController:", v12);

}

void __42__STAllowanceListController_addAllowance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  STAllowanceDetailListController *v14;
  void *v15;
  id v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v16 = (id)objc_opt_new();
  objc_msgSend(v16, "setBundleIdentifiers:", v11);

  objc_msgSend(v16, "setWebDomains:", v10);
  objc_msgSend(v16, "setCategoryIdentifiers:", v9);

  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBehaviorType:", objc_msgSend(v13, "isPasscodeEnabled"));
  v14 = -[STAllowanceDetailListController initWithCoordinator:]([STAllowanceDetailListController alloc], "initWithCoordinator:", v13);
  -[STAllowanceDetailListController setDelegate:](v14, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[STAllowanceDetailListController setAllowance:](v14, "setAllowance:", v16);
  -[STAllowanceDetailListController setIsSetupController:](v14, "setIsSetupController:", 1);
  -[STAllowanceDetailListController setUseBackButton:](v14, "setUseBackButton:", 1);
  -[STAllowanceDetailListController setCreatingNewAllowance:](v14, "setCreatingNewAllowance:", 1);
  -[STAllowanceDetailListController setParentController:](v14, "setParentController:", v12);
  objc_msgSend(v12, "rootController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController setRootController:](v14, "setRootController:", v15);

  -[STAllowanceDetailListController setSpecifier:](v14, "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v12, "showController:animate:", v14, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[STAllowanceListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[STAllowanceListController allowanceSpecifiers](self, "allowanceSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

    if (v10)
      -[STAllowanceListController setShouldShowConfirmDeletionAlert:](self, "setShouldShowConfirmDeletionAlert:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceListController;
  -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  int64_t v8;

  -[STAllowanceListController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[STAllowanceListController allowanceSpecifiers](self, "allowanceSpecifiers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v5),
        v6,
        v7))
  {
    v8 = 1;
    -[STAllowanceListController setShouldShowConfirmDeletionAlert:](self, "setShouldShowConfirmDeletionAlert:", 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;

  v7 = -[STAllowanceListController indexForIndexPath:](self, "indexForIndexPath:", a5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      v9 = v8;
      -[STAllowanceListController confirmDeletion:](self, "confirmDeletion:", v8);
      v8 = v9;
    }

  }
}

- (void)confirmDeletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[STAllowanceListController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPasscodeEnabled")
    && (objc_msgSend(v5, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__STAllowanceListController_confirmDeletion___block_invoke;
    v6[3] = &unk_24DB864E8;
    v6[4] = self;
    v7 = v4;
    -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v7, v6);

  }
  else
  {
    -[STAllowanceListController _showConfirmDeletionView:](self, "_showConfirmDeletionView:", v4);
  }

}

uint64_t __45__STAllowanceListController_confirmDeletion___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_showConfirmDeletionView:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_showConfirmDeletionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x24BE75990];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowanceDeleteSpecifierName"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v15[1] = *MEMORY[0x24BE75988];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowanceDeletionPrompt"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = *MEMORY[0x24BE75980];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "sf_isiPad"))
    v10 = CFSTR("ConfirmationTitleDelete");
  else
    v10 = CFSTR("AllowanceDeleteSpecifierName");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v15[3] = *MEMORY[0x24BE75970];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupWithDictionary:", v13);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUserInfo:", v14);
  objc_msgSend(v5, "setTarget:", self);
  objc_msgSend(v5, "setConfirmationAction:", sel_deleteAllowance_);
  -[STAllowanceListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v5);
  -[STAllowanceListController setShouldShowConfirmDeletionAlert:](self, "setShouldShowConfirmDeletionAlert:", 0);

}

- (void)deleteAllowance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[STAllowanceListController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeAllowancesCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowancesByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__STAllowanceListController_deleteAllowance___block_invoke;
    v11[3] = &unk_24DB86690;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v6, "deleteAllowance:completionHandler:", v10, v11);

  }
}

void __45__STAllowanceListController_deleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "removeSpecifierID:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  STAllowanceListController *v13;

  v6 = a3;
  v7 = a4;
  -[STAllowanceListController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeAllowancesCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_24DB86690;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v9, "saveAllowance:completionHandler:", v7, v11);

}

void __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1();

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSetupController"))
    objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePropertyForKey:", 0x24DB8A590);

}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[STAllowanceListController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeAllowancesCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__STAllowanceListController_allowanceDetailController_didDeleteAllowance___block_invoke;
  v11[3] = &unk_24DB86690;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "deleteAllowance:completionHandler:", v7, v11);

}

void __74__STAllowanceListController_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 40), "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePropertyForKey:", 0x24DB8A590);

}

- (void)_didFetchAppInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  void *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE84778]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[STAllowanceListController allowanceSpecifiersByBundleIdentifier](self, "allowanceSpecifiersByBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAllowanceListController.m"), 542, CFSTR("Unexpected allowance specifier without an identifier: %@"), v12);

        }
        -[STAllowanceListController coordinator](self, "coordinator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeAllowancesCoordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allowancesByIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x24BE84510];
        objc_msgSend(v18, "categoryIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "webDomains");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setName:", v23);

        if (-[STAllowanceListController containsSpecifier:](self, "containsSpecifier:", v12))
          -[STAllowanceListController reloadSpecifier:](self, "reloadSpecifier:", v12);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

}

- (void)showStoreDemoAlert
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerForFeatureNotAvailable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STAllowanceListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (NSArray)allowanceSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setAllowanceSpecifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1432);
}

- (PSSpecifier)enableAllAllowancesSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setEnableAllAllowancesSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (BOOL)shouldShowConfirmDeletionAlert
{
  return self->_shouldShowConfirmDeletionAlert;
}

- (void)setShouldShowConfirmDeletionAlert:(BOOL)a3
{
  self->_shouldShowConfirmDeletionAlert = a3;
}

- (NSDictionary)allowanceSpecifiersByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setAllowanceSpecifiersByBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowanceSpecifiersByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_enableAllAllowancesSpecifier, 0);
  objc_storeStrong((id *)&self->_allowanceSpecifiers, 0);
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to save allAllowancesEnabled state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to delete allowance: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to save edited allowance: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
