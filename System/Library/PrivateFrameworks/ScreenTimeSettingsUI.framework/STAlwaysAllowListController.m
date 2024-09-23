@implementation STAlwaysAllowListController

- (STAlwaysAllowListController)init
{
  STAlwaysAllowListController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STAlwaysAllowListController;
  v2 = -[STPINListViewController init](&v8, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowTitle"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAlwaysAllowListController setTitle:](v2, "setTitle:", v4);

  }
  v7.receiver = v2;
  v7.super_class = (Class)STAlwaysAllowListController;
  -[STPINListViewController coordinator](&v7, sel_coordinator);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("timeAllowancesCoordinator.viewModel.alwaysAllowList"), 3, "KVOContextAlwaysAllowedListController");
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 3, "KVOContextAlwaysAllowedListController");

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.alwaysAllowList"), "KVOContextAlwaysAllowedListController");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), "KVOContextAlwaysAllowedListController");

  v4.receiver = self;
  v4.super_class = (Class)STAlwaysAllowListController;
  -[STListViewController dealloc](&v4, sel_dealloc);
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
  objc_super v12;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.alwaysAllowList"), "KVOContextAlwaysAllowedListController");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), "KVOContextAlwaysAllowedListController");
  v12.receiver = self;
  v12.super_class = (Class)STAlwaysAllowListController;
  -[STPINListViewController setCoordinator:](&v12, sel_setCoordinator_, v4);
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "communicationLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "communicationLimits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v8, v11);

  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.alwaysAllowList"), 3, "KVOContextAlwaysAllowedListController");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 3, "KVOContextAlwaysAllowedListController");

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
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextAlwaysAllowedListController")
  {
    -[STPINListViewController coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STAlwaysAllowListController _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v12, v14);

    }
    else
    {
      -[STPINListViewController coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("timeAllowancesCoordinator.viewModel.alwaysAllowList")))goto LABEL_14;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      -[STAlwaysAllowListController _alwaysAllowListDidChange:](self, "_alwaysAllowListDidChange:", v12);
    }

    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STAlwaysAllowListController;
  -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_14:

}

- (void)_alwaysAllowListDidChange:(id)a3
{
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v4 = (void *)MEMORY[0x24BDBCF20];
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  if (v31)
  {
    objc_msgSend(v31, "allowedBundleIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)objc_opt_new();
  }
  if ((objc_msgSend(v7, "isEqualToSet:", v10) & 1) == 0)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeAllowancesCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alwaysAllowList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAlwaysAllowListController setAlwaysAllowList:](self, "setAlwaysAllowList:", v14);

    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE15820], "systemUnblockableBundleIdentifiersForDeviceFamily:", 102);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v15, "unionSet:", v16);
    }
    else
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v15, "unionSet:", v17);

    }
    objc_msgSend(MEMORY[0x24BE15820], "systemBlockableBundleIdentifiersForDeviceFamily:", 102);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v15, "unionSet:", v18);
    }
    else
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v15, "unionSet:", v19);

    }
    objc_msgSend(MEMORY[0x24BE15820], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v15, "unionSet:", v20);
    }
    else
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v15, "unionSet:", v21);

    }
    v22 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedBundleIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithArray:", v24);

    objc_msgSend(v25, "unionSet:", v15);
    -[STPINListViewController coordinator](self, "coordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "viewModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "installedBundleIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAlwaysAllowListController setInstalledBundleIDs:](self, "setInstalledBundleIDs:", v28);
    v29 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v29, "minusSet:", v25);
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAlwaysAllowListController setChooseBundleIDs:](self, "setChooseBundleIDs:", v30);

    -[STAlwaysAllowListController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 != v6 && (objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    -[STAlwaysAllowListController allowedContactsSpecifier](self, "allowedContactsSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAlwaysAllowListController reloadSpecifier:](self, "reloadSpecifier:", v7);

  }
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAlwaysAllowListController;
  -[STAlwaysAllowListController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3), "setEditing:", 1);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3), "setAllowsSelectionDuringEditing:", 1);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAlwaysAllowListController.viewDidLoad", v4, 2u);
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
  v16.super_class = (Class)STAlwaysAllowListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/ALWAYS_ALLOWED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("AlwaysAllowTitle"), CFSTR("Localizable"), v6, v8);

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
  -[STAlwaysAllowListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  -[STAlwaysAllowListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alwaysAllowListController:didFinishEditingAlwaysAllowList:", self, v6);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAlwaysAllowListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STAlwaysAllowListController;
  -[STAlwaysAllowListController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);

}

- (void)willResignActive
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STAlwaysAllowListController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alwaysAllowListController:didFinishEditingAlwaysAllowList:", self, v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)STAlwaysAllowListController;
  -[STAlwaysAllowListController willResignActive](&v5, sel_willResignActive);

}

- (id)specifiers
{
  uint64_t v3;
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD aBlock[5];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v5 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v8;
  v52 = v6;
  if (objc_msgSend(v8, "type"))
  {
    v9 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowedContactsGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupSpecifierWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isRemoteUser"))
    {
      if (v12)
      {
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowedContactsGroupSpecifierRemoteHeader"), &stru_24DB8A1D0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithFormat:locale:", v13, v16, v12);

LABEL_10:
        v18 = *MEMORY[0x24BE75AA8];
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75AA8]);
        objc_msgSend(v5, "addObject:", v11);
        v20 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AllowedContactsSpecifierName"), &stru_24DB8A1D0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v11;
        v22 = objc_opt_class();
        objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, sel__allowedContactsDuringDowntimeText_, v22, 2, objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE75C60]);

        objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_24DBBE6B8, *MEMORY[0x24BE75E18]);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __41__STAlwaysAllowListController_specifiers__block_invoke;
        aBlock[3] = &unk_24DB86728;
        aBlock[4] = self;
        v26 = _Block_copy(aBlock);
        v27 = _Block_copy(v26);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, 0x24DB90C10);

        objc_msgSend(v23, "setObject:forKeyedSubscript:", v53, 0x24DB91230);
        -[STAlwaysAllowListController setAllowedContactsSpecifier:](self, "setAllowedContactsSpecifier:", v23);
        objc_msgSend(v5, "addObject:", v23);

        v6 = v52;
        goto LABEL_11;
      }
      v19 = CFSTR("AllowedContactsGroupSpecifierRemoteGenericHeader");
    }
    else
    {
      v19 = CFSTR("AllowedContactsGroupSpecifierLocalHeader");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v19, &stru_24DB8A1D0, 0);
    v14 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v18 = *MEMORY[0x24BE75AA8];
LABEL_11:
  v28 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowedAppsGroupSpecifierName"), &stru_24DB8A1D0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "groupSpecifierWithName:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowedAppsGroupSpecifierFooter"), &stru_24DB8A1D0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, v18);

  -[STAlwaysAllowListController setAllowedAppsGroupSpecifier:](self, "setAllowedAppsGroupSpecifier:", v30);
  objc_msgSend(v5, "addObject:", v30);
  v32 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ChooseAppsGroupSpecifierName"), &stru_24DB8A1D0, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "groupSpecifierWithName:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController setChooseAppsGroupSpecifier:](self, "setChooseAppsGroupSpecifier:", v34);

  -[STAlwaysAllowListController createAllowedAppsSpecifiers](self, "createAllowedAppsSpecifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController setAllowedAppsSpecifiers:](self, "setAllowedAppsSpecifiers:", v35);

  -[STAlwaysAllowListController allowedAppsSpecifiers](self, "allowedAppsSpecifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v36);

  -[STAlwaysAllowListController chooseAppsGroupSpecifier](self, "chooseAppsGroupSpecifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v37);

  -[STAlwaysAllowListController createChooseAppsSpecifiers](self, "createChooseAppsSpecifiers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController setChooseAppsSpecifiers:](self, "setChooseAppsSpecifiers:", v38);

  -[STAlwaysAllowListController chooseAppsSpecifiers](self, "chooseAppsSpecifiers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v39);

  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_msgSend(v40, "shouldAllowEditing");

  if ((v33 & 1) == 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v5;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v55;
      v45 = *MEMORY[0x24BE75A18];
      v46 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "setObject:forKeyedSubscript:", v46, v45);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v43);
    }

    v6 = v52;
  }
  v48 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  return v4;
}

void __41__STAlwaysAllowListController_specifiers__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "table");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "allowedContactsSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForSpecifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableView:didSelectRowAtIndexPath:", v7, v6);

  }
}

- (id)_allowedContactsDuringDowntimeText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  -[STPINListViewController coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "communicationLimits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "downtimeCommunicationLimit");

  switch(v7)
  {
    case 0:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("AllowEveryoneSpecifierName");
      goto LABEL_7;
    case 1:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("AllowGroupsWithOneContactSpecifierName");
      goto LABEL_7;
    case 2:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("AllowContactsOnlySpecifierName");
      goto LABEL_7;
    case 3:
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("AllowSpecificContactsSpecifierName");
LABEL_7:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

- (id)createAllowedAppsSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE84510], "defaultAlwaysAllowBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (_QWORD)v19))
        {
          objc_msgSend(v6, "removeObject:", v13);
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[STAlwaysAllowListController appSpecifiersForBundleIDs:](self, "appSpecifiersForBundleIDs:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController appSpecifiersForBundleIDs:](self, "appSpecifiersForBundleIDs:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "sortUsingSelector:", sel_titleCompare_);
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createChooseAppsSpecifiers
{
  void *v3;
  void *v4;
  void *v5;

  -[STAlwaysAllowListController chooseBundleIDs](self, "chooseBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController appSpecifiersForBundleIDs:](self, "appSpecifiersForBundleIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "sortUsingSelector:", sel_titleCompare_);
  return v5;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v5 = -[STAlwaysAllowListController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilephone")) ^ 1;

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;

  v5 = -[STAlwaysAllowListController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cellType");
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 3 && (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) == 0)
  {
    -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allowedBundleIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    if (v13)
      v10 = 1;
    else
      v10 = 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[STAlwaysAllowListController allowedContactsSpecifier](self, "allowedContactsSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[STAlwaysAllowListController allowedContactsSpecifier](self, "allowedContactsSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STAlwaysAllowListController;
  v6 = a4;
  -[STListViewController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController allowedContactsSpecifier](self, "allowedContactsSpecifier", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
    objc_msgSend(v7, "setEditingAccessoryType:", 1);
  return v7;
}

- (id)removeMessagesConfirmationPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isRemoteUser");
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v4)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCloudSyncEnabled");

    if (!v14)
    {
      v15 = CFSTR("AlwaysAllowRemoveMessagesConfirmPromptLocal");
      goto LABEL_7;
    }
LABEL_5:
    v15 = CFSTR("AlwaysAllowRemoveMessagesConfirmPromptCloud");
LABEL_7:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v5, "givenName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowRemoveMessagesConfirmPromptRemote"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v7 = -[STAlwaysAllowListController indexForIndexPath:](self, "indexForIndexPath:", a5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPINListViewController coordinator](self, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isPasscodeEnabled"))
      v10 = objc_msgSend(v9, "hasAlreadyEnteredPINForSession") ^ 1;
    else
      v10 = 0;
    if (a4 == 1)
    {
      if (!v10)
      {
        -[STAlwaysAllowListController _removeAllowedAppSpecifier:](self, "_removeAllowedAppSpecifier:", v8);
        goto LABEL_14;
      }
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
      v12[3] = &unk_24DB864E8;
      v12[4] = self;
      v13 = v8;
      -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v13, v12);
      v11 = v13;
    }
    else
    {
      if (a4 != 2)
      {
LABEL_14:

        return;
      }
      if (!v10)
      {
        -[STAlwaysAllowListController _insertAllowedAppSpecifier:](self, "_insertAllowedAppSpecifier:", v8);
        goto LABEL_14;
      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v14[3] = &unk_24DB864E8;
      v14[4] = self;
      v15 = v8;
      -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v15, v14);
      v11 = v15;
    }

    goto LABEL_14;
  }
}

uint64_t __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_insertAllowedAppSpecifier:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_removeAllowedAppSpecifier:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_insertAllowedAppSpecifier:(id)a3
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController chooseBundleIDs](self, "chooseBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v5);
  v30 = v7;
  v8 = (void *)objc_msgSend(v7, "copy");
  -[STAlwaysAllowListController setChooseBundleIDs:](self, "setChooseBundleIDs:", v8);

  -[STAlwaysAllowListController chooseAppsSpecifiers](self, "chooseAppsSpecifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v4);
  -[STAlwaysAllowListController setChooseAppsSpecifiers:](self, "setChooseAppsSpecifiers:", v10);
  -[STAlwaysAllowListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v4, 1);
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addObject:", v5);
  v14 = (void *)objc_msgSend(v13, "copy");
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowedBundleIDs:", v14);

  -[STAlwaysAllowListController createAllowedAppsSpecifiers](self, "createAllowedAppsSpecifiers");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v28 = v13;
    v29 = v10;
    v19 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v5);

        if (v23)
        {
          v24 = objc_msgSend(v16, "indexOfObject:", v21);
          goto LABEL_11;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v18)
        continue;
      break;
    }
    v24 = 0;
LABEL_11:
    v13 = v28;
    v10 = v29;
  }
  else
  {
    v24 = 0;
  }

  -[STAlwaysAllowListController allowedAppsSpecifiers](self, "allowedAppsSpecifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "insertObject:atIndex:", v4, v24);
  -[STAlwaysAllowListController setAllowedAppsSpecifiers:](self, "setAllowedAppsSpecifiers:", v26);
  if (v24)
    objc_msgSend(v26, "objectAtIndexedSubscript:", v24 - 1);
  else
    -[STAlwaysAllowListController allowedAppsGroupSpecifier](self, "allowedAppsGroupSpecifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v4, v27, 1);

}

- (void)_removeAllowedAppSpecifier:(id)a3
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
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowRemoveMessagesConfirmTitle"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAlwaysAllowListController removeMessagesConfirmationPrompt](self, "removeMessagesConfirmationPrompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowRemove"), &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__STAlwaysAllowListController__removeAllowedAppSpecifier___block_invoke;
    v16[3] = &unk_24DB86840;
    v16[4] = self;
    v17 = v5;
    v18 = v4;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

    -[STAlwaysAllowListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    -[STAlwaysAllowListController removeAllowedIdentifier:withSpecifier:](self, "removeAllowedIdentifier:withSpecifier:", v5, v4);
  }

}

uint64_t __58__STAlwaysAllowListController__removeAllowedAppSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllowedIdentifier:withSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeAllowedIdentifier:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v6);
  v32 = v10;
  v11 = (void *)objc_msgSend(v10, "copy");
  -[STAlwaysAllowListController alwaysAllowList](self, "alwaysAllowList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowedBundleIDs:", v11);

  -[STAlwaysAllowListController allowedAppsSpecifiers](self, "allowedAppsSpecifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObject:", v7);
  -[STAlwaysAllowListController setAllowedAppsSpecifiers:](self, "setAllowedAppsSpecifiers:", v14);
  -[STAlwaysAllowListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v7, 0);
  -[STAlwaysAllowListController chooseBundleIDs](self, "chooseBundleIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "addObject:", v6);
  v17 = (void *)objc_msgSend(v16, "copy");
  -[STAlwaysAllowListController setChooseBundleIDs:](self, "setChooseBundleIDs:", v17);

  -[STAlwaysAllowListController createChooseAppsSpecifiers](self, "createChooseAppsSpecifiers");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v30 = v16;
    v31 = v14;
    v21 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", v6);

        if (v25)
        {
          v26 = objc_msgSend(v18, "indexOfObject:", v23);
          goto LABEL_11;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v20)
        continue;
      break;
    }
    v26 = 0;
LABEL_11:
    v16 = v30;
    v14 = v31;
  }
  else
  {
    v26 = 0;
  }

  -[STAlwaysAllowListController chooseAppsSpecifiers](self, "chooseAppsSpecifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v28, "insertObject:atIndex:", v7, v26);
  -[STAlwaysAllowListController setChooseAppsSpecifiers:](self, "setChooseAppsSpecifiers:", v28);
  if (v26)
    objc_msgSend(v28, "objectAtIndexedSubscript:", v26 - 1);
  else
    -[STAlwaysAllowListController chooseAppsGroupSpecifier](self, "chooseAppsGroupSpecifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAlwaysAllowListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v7, v29, 1);

}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowRemove"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appSpecifiersForBundleIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v7 = *MEMORY[0x24BE84718];
    v26 = *MEMORY[0x24BE75C60];
    v25 = *MEMORY[0x24BE75E18];
    v22 = *MEMORY[0x24BE84700];
    v20 = (const __CFString *)*MEMORY[0x24BE75B70];
    v21 = *MEMORY[0x24BE75B88];
    v24 = *MEMORY[0x24BE75948];
    v8 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "isEqualToString:", v7);
        objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appInfoForBundleIdentifier:localOnly:", v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((_DWORD)v11 && objc_msgSend(v13, "source") != 2)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v10;
            _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Not showing %@ because it's been deleted", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v13, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 3, objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v26);

          objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DBBE6B8, v25);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, 0x24DB91010);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, 0x24DB91030);
          objc_msgSend(v15, "setIdentifier:", v10);
          objc_msgSend(v15, "setUserInfo:", v10);
          if (objc_msgSend(v13, "source") == 2 && (objc_msgSend(v10, "isEqualToString:", v22) & 1) == 0)
          {
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v21);
            v18 = v20;
          }
          else
          {
            objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_opt_class(), v24);
            v18 = CFSTR("STAppBundleID");
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v18);
          objc_msgSend(v28, "addObject:", v15);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }

  return v28;
}

- (STAlwaysAllowListControllerDelegate)delegate
{
  return (STAlwaysAllowListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STAlwaysAllowList)alwaysAllowList
{
  return self->_alwaysAllowList;
}

- (void)setAlwaysAllowList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (NSArray)chooseBundleIDs
{
  return self->_chooseBundleIDs;
}

- (void)setChooseBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (NSSet)installedBundleIDs
{
  return self->_installedBundleIDs;
}

- (void)setInstalledBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (PSSpecifier)allowedContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setAllowedContactsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (PSSpecifier)allowedAppsGroupSpecifier
{
  return self->_allowedAppsGroupSpecifier;
}

- (void)setAllowedAppsGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAppsGroupSpecifier, a3);
}

- (NSArray)allowedAppsSpecifiers
{
  return self->_allowedAppsSpecifiers;
}

- (void)setAllowedAppsSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAppsSpecifiers, a3);
}

- (PSSpecifier)chooseAppsGroupSpecifier
{
  return self->_chooseAppsGroupSpecifier;
}

- (void)setChooseAppsGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_chooseAppsGroupSpecifier, a3);
}

- (NSArray)chooseAppsSpecifiers
{
  return self->_chooseAppsSpecifiers;
}

- (void)setChooseAppsSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_chooseAppsSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chooseAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_chooseAppsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_allowedAppsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong((id *)&self->_chooseBundleIDs, 0);
  objc_storeStrong((id *)&self->_alwaysAllowList, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
