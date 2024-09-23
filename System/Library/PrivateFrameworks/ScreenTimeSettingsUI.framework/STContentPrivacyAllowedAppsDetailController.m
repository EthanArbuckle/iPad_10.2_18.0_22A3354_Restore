@implementation STContentPrivacyAllowedAppsDetailController

- (STContentPrivacyAllowedAppsDetailController)init
{
  STContentPrivacyAllowedAppsDetailController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
  v2 = -[STContentPrivacyAllowedAppsDetailController init](&v7, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AADC_AllowedAppsAndFeaturesSpecifierName"), &stru_24DB8A1D0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyAllowedAppsDetailController setTitle:](v2, "setTitle:", v5);

  }
  return v2;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  objc_class *v28;
  uint64_t v29;
  void *v30;
  id v31;

  -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLoaded");

  if (v6)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AADC_AllowedAppsAndFeaturesSpecifierHeader"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A68]);

    objc_msgSend(v8, "addObject:", v9);
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

    -[STContentPrivacyAllowedAppsDetailController _addBlacklistAppSpecifier:bundleID:](self, "_addBlacklistAppSpecifier:bundleID:", v8, CFSTR("com.apple.mobilemail"));
    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("legacy.restrictions.apps"), CFSTR("allowSafari"), CFSTR("com.apple.mobilesafari"));
    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("legacy.restrictions.apps"), CFSTR("allowVideoConferencing"), CFSTR("com.apple.facetime"));
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SharePlaySpecifierName"), &stru_24DB8A1D0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("SharePlay"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", CFSTR("legacy.restrictions.apps"), CFSTR("allowGroupActivity"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("system.camera"), CFSTR("allowCamera"), CFSTR("com.apple.camera"));
    PSSiriImage();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", 0x24DB8DC50, 0x24DB8DD70, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

    -[STContentPrivacyAllowedAppsDetailController _addBlacklistAppSpecifier:bundleID:](self, "_addBlacklistAppSpecifier:bundleID:", v8, CFSTR("com.apple.Passbook"));
    PSAirDropImage();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", CFSTR("system.airdrop"), CFSTR("allowAirDrop"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v22);

    v23 = (void *)MEMORY[0x24BEBD640];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageNamed:inBundle:", CFSTR("stark"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", CFSTR("system.carplay"), CFSTR("allowVehicleUI"), 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v26);

    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v27);

    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("legacy.restrictions.apps"), CFSTR("allowiTunes"), CFSTR("com.apple.MobileStore"));
    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("media.settings"), CFSTR("allowBookstore"), CFSTR("com.apple.iBooks"));
    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("legacy.restrictions.apps"), CFSTR("allowPodcasts"), CFSTR("com.apple.podcasts"));
    -[STContentPrivacyAllowedAppsDetailController _addBooleanAppSpecifier:configuration:key:bundleID:](self, "_addBooleanAppSpecifier:configuration:key:bundleID:", v8, CFSTR("legacy.restrictions.apps"), CFSTR("allowNews"), CFSTR("com.apple.news"));
    -[STContentPrivacyAllowedAppsDetailController _addBlacklistAppSpecifier:bundleID:](self, "_addBlacklistAppSpecifier:bundleID:", v8, CFSTR("com.apple.Health"));
    -[STContentPrivacyAllowedAppsDetailController _addBlacklistAppSpecifier:bundleID:](self, "_addBlacklistAppSpecifier:bundleID:", v8, CFSTR("com.apple.Fitness"));
    -[STContentPrivacyAllowedAppsDetailController _addBlacklistAppSpecifier:bundleID:](self, "_addBlacklistAppSpecifier:bundleID:", v8, CFSTR("com.apple.GenerativePlaygroundApp"));
    v28 = (objc_class *)objc_msgSend(v8, "copy");
    v29 = (int)*MEMORY[0x24BE756E0];
    v30 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = v28;

    v31 = *(id *)((char *)&self->super.super.super.super.super.isa + v29);
  }
  else
  {
    v31 = (id)MEMORY[0x24BDBD1A8];
  }
  return v31;
}

- (id)getItemSpecifierValue:(id)a3
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
  id v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentPrivacyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "restrictionType");
  objc_msgSend(v8, "valuesByRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == 2)
  {

    objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCD0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "containsObject:", v13) ^ 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(v8, "defaultValueForRestriction:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v12 = v10;
      goto LABEL_7;
    }
    v14 = v11;
    v13 = v14;
    v12 = v10;
  }
  v15 = v14;
LABEL_7:

  return v15;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  STContentPrivacyAllowedAppsDetailController *v31;
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v12;
  if (objc_msgSend(v8, "restrictionType") == 2)
  {
    objc_msgSend(v11, "valuesByRestriction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = (void *)MEMORY[0x24BDBD1A8];
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    objc_msgSend(v7, "objectForKeyedSubscript:", 0x24DB8DCD0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "BOOLValue"))
      objc_msgSend(v20, "removeObject:", v19);
    else
      objc_msgSend(v20, "addObject:", v19);
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke;
    v27[3] = &unk_24DB86E30;
    v28 = v10;
    v29 = v13;
    v30 = v8;
    v31 = self;
    v32 = v7;
    v22 = v7;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v27);

    v23 = v28;
  }
  else
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_95;
    v25[3] = &unk_24DB86690;
    v25[4] = self;
    v26 = v7;
    v24 = v7;
    objc_msgSend(v10, "saveRestrictionValue:forItem:completionHandler:", v13, v8, v25);
    v23 = v26;
  }

}

void __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2;
    v5[3] = &unk_24DB86690;
    v4 = *(_QWORD *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    objc_msgSend(v2, "saveRestrictionValue:forItem:completionHandler:", v3, v4, v5);

  }
}

uint64_t __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v5 = objc_msgSend(v2, "saveContext:error:", v4, &v15);
    v6 = v15;

    if ((v5 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifier_, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_95(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v5 = objc_msgSend(v2, "saveContext:error:", v4, &v15);
    v6 = v15;

    if ((v5 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifier_, *(_QWORD *)(a1 + 40), 0);
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5 icon:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75AC8]);

  return v12;
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentPrivacyCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visibleRestrictionWithConfiguration:key:", v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uiLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_24DB8A1D0, v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v8;
  }
  v19 = v18;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, sel_setItemSpecifierValue_specifier_, sel_getItemSpecifierValue_, 0, 6, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD16E0];
  -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentPrivacyCoordinator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "viewModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithBool:", objc_msgSend(v24, "restrictionsEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE75A18]);

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, 0x24DB8DCB0);
  return v20;
}

- (id)nameForInstalledSystemApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInfoForBundleIdentifier:localOnly:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "source") == 2)
  {
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "System app %@ is not installed, not showing restriction switch", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (void)_addBooleanAppSpecifier:(id)a3 configuration:(id)a4 key:(id)a5 bundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[STContentPrivacyAllowedAppsDetailController nameForInstalledSystemApp:](self, "nameForInstalledSystemApp:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageForBundleIdentifier:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", v10, v11, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v16);

    }
  }

}

- (void)_addBlacklistAppSpecifier:(id)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[STContentPrivacyAllowedAppsDetailController nameForInstalledSystemApp:](self, "nameForInstalledSystemApp:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageForBundleIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[STContentPrivacyAllowedAppsDetailController defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:](self, "defaultSwitchSpecifierWithConfiguration:key:fallbackLabel:icon:", CFSTR("legacy.restrictions.apps"), CFSTR("blacklistedAppBundleIDs"), v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, 0x24DB8DCD0);
      objc_msgSend(v11, "addObject:", v10);

    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STRootViewModelCoordinator contentPrivacyCoordinator](self->_coordinator, "contentPrivacyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("AllowedAppsViewModelLoadedContext"));

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
  -[STContentPrivacyAllowedAppsDetailController dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  STRootViewModelCoordinator *v5;
  STRootViewModelCoordinator *coordinator;
  void *v7;
  void *v8;
  STRootViewModelCoordinator *v9;

  v5 = (STRootViewModelCoordinator *)a3;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    v9 = v5;
    -[STRootViewModelCoordinator contentPrivacyCoordinator](coordinator, "contentPrivacyCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("AllowedAppsViewModelLoadedContext"));

    objc_storeStrong((id *)&self->_coordinator, a3);
    -[STRootViewModelCoordinator contentPrivacyCoordinator](self->_coordinator, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isLoaded"), 0, CFSTR("AllowedAppsViewModelLoadedContext"));

    v5 = v9;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  if (a6 == CFSTR("AllowedAppsViewModelLoadedContext"))
  {
    -[STContentPrivacyAllowedAppsDetailController coordinator](self, "coordinator", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLoaded");

    if (v10)
      -[STContentPrivacyAllowedAppsDetailController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
    -[STContentPrivacyAllowedAppsDetailController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)didCancelEnteringPIN
{
  -[PSListController st_didCancelEnteringPIN](self, "st_didCancelEnteringPIN");
  -[STContentPrivacyAllowedAppsDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

void __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "Failed to save content and privacy settings: %{public}@", a5, a6, a7, a8, 2u);
}

@end
