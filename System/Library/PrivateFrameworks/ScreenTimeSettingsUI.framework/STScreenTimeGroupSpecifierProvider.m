@implementation STScreenTimeGroupSpecifierProvider

- (STScreenTimeGroupSpecifierProvider)init
{
  STScreenTimeGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  PSSpecifier **p_usageSummarySpecifier;
  PSSpecifier *usageSummarySpecifier;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PSSpecifier *screenTimeReportSpecifier;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  PSSpecifier *seeAllActivitySpecifier;
  int v19;
  char **v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)STScreenTimeGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v23, sel_init);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A30]);

  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v4);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, sel__usageDetailsCoordinator_, 0, -1, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  p_usageSummarySpecifier = &v2->_usageSummarySpecifier;
  usageSummarySpecifier = v2->_usageSummarySpecifier;
  v2->_usageSummarySpecifier = (PSSpecifier *)v7;

  v10 = objc_opt_class();
  v11 = *MEMORY[0x24BE75948];
  -[PSSpecifier setObject:forKeyedSubscript:](v2->_usageSummarySpecifier, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75948]);
  v12 = *MEMORY[0x24BE75A18];
  -[PSSpecifier setObject:forKeyedSubscript:](v2->_usageSummarySpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, sel__rootViewModelCoordinator_, 0, -1, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    screenTimeReportSpecifier = v2->_screenTimeReportSpecifier;
    v2->_screenTimeReportSpecifier = (PSSpecifier *)v13;

    -[PSSpecifier setObject:forKeyedSubscript:](v2->_screenTimeReportSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), v11);
    -[PSSpecifier setObject:forKeyedSubscript:](v2->_screenTimeReportSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v12);
    -[PSSpecifier setControllerLoadAction:](v2->_screenTimeReportSpecifier, "setControllerLoadAction:", sel__showScreenTimeReportViewController_);
  }
  if (_os_feature_enabled_impl())
    v15 = CFSTR("SeeAllAppAndWebsiteActivityControlTitle");
  else
    v15 = CFSTR("SeeAllActivityControlTitle");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, v2, 0, 0, 0, 2, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  seeAllActivitySpecifier = v2->_seeAllActivitySpecifier;
  v2->_seeAllActivitySpecifier = (PSSpecifier *)v17;

  -[PSSpecifier setIdentifier:](v2->_seeAllActivitySpecifier, "setIdentifier:", CFSTR("SCREEN_TIME_SUMMARY"));
  v19 = _os_feature_enabled_impl();
  v20 = &selRef__showScreenTimeReportViewController_;
  if (!v19)
    v20 = &selRef__showUsageDetailListController_;
  -[PSSpecifier setControllerLoadAction:](v2->_seeAllActivitySpecifier, "setControllerLoadAction:", *v20);
  -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    p_usageSummarySpecifier = &v2->_screenTimeReportSpecifier;
  objc_msgSend(v21, "addObject:", *p_usageSummarySpecifier);
  objc_msgSend(v21, "addObject:", v2->_seeAllActivitySpecifier);

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.screenTimeEnabled"), "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"), "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.refreshing"), "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.hasWatchOSDevicesOnly"), "KVOContextScreenTimeGroupSpecifierProvider");
  if (_os_feature_enabled_impl())
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasDeviceActivityData"), "KVOContextScreenTimeGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STScreenTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.screenTimeEnabled"), 5, "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"), 7, "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), 7, "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.refreshing"), 5, "KVOContextScreenTimeGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.hasWatchOSDevicesOnly"), 5, "KVOContextScreenTimeGroupSpecifierProvider");
  if (_os_feature_enabled_impl())
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasDeviceActivityData"), 5, "KVOContextScreenTimeGroupSpecifierProvider");

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
  objc_super v23;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextScreenTimeGroupSpecifierProvider")
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.screenTimeEnabled")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STScreenTimeGroupSpecifierProvider _screenTimeEnabledDidChange:](self, "_screenTimeEnabledDidChange:", objc_msgSend(v13, "BOOLValue"));
      goto LABEL_20;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v15)
      {

        v13 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 == v17)
      {

        v16 = 0;
      }
      -[STScreenTimeGroupSpecifierProvider _usageReportDidChangeFrom:to:](self, "_usageReportDidChangeFrom:to:", v13, v16);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName")))
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.refreshing")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v20)
          {

            v13 = 0;
          }
          -[STScreenTimeGroupSpecifierProvider _refreshingDidChange:](self, "_refreshingDidChange:", objc_msgSend(v13, "BOOLValue"));
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.hasWatchOSDevicesOnly")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v21)
          {

            v13 = 0;
          }
          -[STScreenTimeGroupSpecifierProvider _hasWatchOSDevicesOnlyDidChange:](self, "_hasWatchOSDevicesOnlyDidChange:", objc_msgSend(v13, "BOOLValue"));
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasDeviceActivityData")))goto LABEL_21;
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v22)
          {

            v13 = 0;
          }
          -[STScreenTimeGroupSpecifierProvider _hasDeviceActivityDataDidChange:](self, "_hasDeviceActivityDataDidChange:", objc_msgSend(v13, "BOOLValue"));
        }
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v18)
      {

        v13 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 == v19)
      {

        v16 = 0;
      }
      -[STScreenTimeGroupSpecifierProvider _displayNameDidChangeFrom:to:](self, "_displayNameDidChangeFrom:to:", v13, v16);
    }

    goto LABEL_20;
  }
  v23.receiver = self;
  v23.super_class = (Class)STScreenTimeGroupSpecifierProvider;
  -[STScreenTimeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_22:

}

- (void)_screenTimeEnabledDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasWatchOSDevicesOnly");

  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", !v3 | v7);
}

- (void)_usageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (!v6 || (objc_msgSend(v24, "isEqual:", v6) & 1) != 0)
    goto LABEL_15;
  if (_os_feature_enabled_impl())
  {
    v7 = (void *)MEMORY[0x24BE84580];
    objc_msgSend(v6, "reportDateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastUpdatedDateFor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NoLastUpdatedDate"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTimeStyle:", 1);
    objc_msgSend(v10, "setDateStyle:", 2);
    objc_msgSend(v10, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(v10, "setFormattingContext:", 5);
    objc_msgSend(v10, "stringFromDate:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LastUpdatedDateFormat"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:locale:", v13, v15, v11);

  }
  else
  {
    objc_msgSend(v6, "lastUpdatedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NoLastUpdatedDate"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setTimeStyle:", 1);
    objc_msgSend(v9, "setDateStyle:", 2);
    objc_msgSend(v9, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(v9, "setFormattingContext:", 5);
    objc_msgSend(v9, "stringFromDate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LastUpdatedDateFormat"), &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v18, "initWithFormat:locale:", v11, v13, v10);
  }

LABEL_10:
LABEL_11:

  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE75A68];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v20);
  if (v21)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE75A78]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadFromSpecifier");

  }
  else
  {
    -[STGroupSpecifierProvider reloadSectionHeaderFootersWithAnimation:](self, "reloadSectionHeaderFootersWithAnimation:", 0);
  }
  -[STScreenTimeGroupSpecifierProvider usageSummarySpecifier](self, "usageSummarySpecifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v23, 1);

LABEL_15:
}

- (void)_displayNameDidChangeFrom:(id)a3 to:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;

  v11 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  if (v11 != v6 && (-[__CFString isEqual:](v11, "isEqual:", v6) & 1) == 0)
  {
    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = v6;
    else
      v9 = CFSTR(" ");
    objc_msgSend(v7, "setName:", v9);
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR(" ")))
      v10 = 5;
    else
      v10 = 0;
    -[STGroupSpecifierProvider reloadSectionHeaderFootersWithAnimation:](self, "reloadSectionHeaderFootersWithAnimation:", v10);

  }
}

- (void)_refreshingDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a3;
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE75A68];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "usageDetailsCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialUsageFetchDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setTimeStyle:", 1);
      objc_msgSend(v10, "setDateStyle:", 2);
      objc_msgSend(v10, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v10, "setFormattingContext:", 5);
      objc_msgSend(v10, "stringFromDate:", v9);
      v20 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LastUpdatedDateFormat"), &stru_24DB8A1D0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFormat:locale:", v13, v15, v11);

      v7 = v20;
    }
    else
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NoLastUpdatedDate"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

    -[STGroupSpecifierProvider reloadSectionHeaderFootersWithAnimation:](self, "reloadSectionHeaderFootersWithAnimation:", 0);
  }
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE75A78]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v19, "startAnimatingSpinner");
  else
    objc_msgSend(v19, "stopAnimatingSpinner");

}

- (void)_hasWatchOSDevicesOnlyDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isScreenTimeEnabled");

  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v7 ^ 1 | v3);
}

- (void)_hasDeviceActivityDataDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char **v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v3 = a3;
  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeGroupSpecifierProvider screenTimeReportSpecifier](self, "screenTimeReportSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v16, "indexOfObject:", v5);
  if ((((v6 == 0x7FFFFFFFFFFFFFFFLL) ^ v3) & 1) == 0)
  {
    v7 = v6;
    -[STScreenTimeGroupSpecifierProvider usageSummarySpecifier](self, "usageSummarySpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeGroupSpecifierProvider seeAllActivitySpecifier](self, "seeAllActivitySpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v16, "indexOfObject:", v8), v5);
      v10 = &selRef__showScreenTimeReportViewController_;
    }
    else
    {
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", v7, v8);
      v10 = &selRef__showUsageDetailListController_;
    }
    objc_msgSend(v9, "setControllerLoadAction:", *v10);
    -[STGroupSpecifierProvider delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "visibleViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 0);
      if (v3)
        -[STScreenTimeGroupSpecifierProvider _createScreenTimeReportControllerWithSpecifier:](self, "_createScreenTimeReportControllerWithSpecifier:", v9);
      else
        -[STScreenTimeGroupSpecifierProvider _createUsageDetailListControllerWithSpecifier:](self, "_createUsageDetailListControllerWithSpecifier:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v15, 0);

    }
  }

}

- (id)_usageDetailsCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_showUsageDetailListController:(id)a3
{
  id v4;

  -[STScreenTimeGroupSpecifierProvider _createUsageDetailListControllerWithSpecifier:](self, "_createUsageDetailListControllerWithSpecifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

}

- (id)_createUsageDetailListControllerWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCoordinator:", v6);

  -[STGroupSpecifierProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentController:", v7);
  objc_msgSend(v7, "rootController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRootController:", v8);

  objc_msgSend(v5, "setSpecifier:", v4);
  return v5;
}

- (void)_showScreenTimeReportViewController:(id)a3
{
  id v4;

  -[STScreenTimeGroupSpecifierProvider _createScreenTimeReportControllerWithSpecifier:](self, "_createScreenTimeReportControllerWithSpecifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

}

- (id)_createScreenTimeReportControllerWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STScreenTimeReportController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STScreenTimeReportController *v13;
  void *v14;

  v4 = a3;
  -[STScreenTimeGroupSpecifierProvider reportController](self, "reportController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "setCoordinator:", v6);
    v8 = v5;
  }
  else
  {
    objc_msgSend(v6, "usageDetailsCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedItemDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[STScreenTimeReportController initWithTitle:coordinator:pinControllerDelegate:]([STScreenTimeReportController alloc], "initWithTitle:coordinator:pinControllerDelegate:", v11, v7, v12);
    -[STScreenTimeReportController setParentController:](v13, "setParentController:", v12);
    objc_msgSend(v12, "rootController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController setRootController:](v13, "setRootController:", v14);

    -[STScreenTimeReportController setSpecifier:](v13, "setSpecifier:", v4);
    -[STScreenTimeGroupSpecifierProvider setReportController:](self, "setReportController:", v13);
    v8 = v13;

  }
  return v8;
}

- (PSSpecifier)usageSummarySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (PSSpecifier)screenTimeReportSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 56, 1);
}

- (PSSpecifier)seeAllActivitySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 64, 1);
}

- (STScreenTimeReportController)reportController
{
  return (STScreenTimeReportController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReportController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportController, 0);
  objc_storeStrong((id *)&self->_seeAllActivitySpecifier, 0);
  objc_storeStrong((id *)&self->_screenTimeReportSpecifier, 0);
  objc_storeStrong((id *)&self->_usageSummarySpecifier, 0);
}

@end
