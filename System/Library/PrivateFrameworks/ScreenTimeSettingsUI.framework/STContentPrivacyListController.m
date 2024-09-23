@implementation STContentPrivacyListController

- (STContentPrivacyListController)init
{
  STContentPrivacyListController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STContentPrivacyListController;
  v2 = -[STPINListViewController init](&v6, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ContentPrivacySpecifierName"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyListController setTitle:](v2, "setTitle:", v4);

  }
  return v2;
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
  v16.super_class = (Class)STContentPrivacyListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/CONTENT_PRIVACY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ContentPrivacySpecifierName"), CFSTR("Localizable"), v6, v8);

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
  -[STContentPrivacyListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (BOOL)isEligibleForAppDistribution
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRemoteUser") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEligibleForAppDistribution");

  }
  return v6;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  -[STContentPrivacyListController specifierForID:](self, "specifierForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ALLOWED_APPS"))
    && !objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "containsObject:", v5))
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STContentPrivacyListController;
    v6 = -[STPINListViewController shouldDeferPushForSpecifierID:](&v8, sel_shouldDeferPushForSpecifierID_, v4);
  }

  return v6;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
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
  void *v41;
  objc_class *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  -[STContentPrivacyListController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x24DB91230);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController setCoordinator:](self, "setCoordinator:", v4);

  objc_msgSend(v4, "contentPrivacyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLoaded");

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "me");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRemoteUser");

    if ((v11 & 1) != 0)
    {
LABEL_19:
      -[STContentPrivacyListController _enableRestrictionsSwitchSpecifier](self, "_enableRestrictionsSwitchSpecifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[STContentPrivacyListController setEnableRestrictionsSwitchSpecifier:](self, "setEnableRestrictionsSwitchSpecifier:", v39);
      objc_msgSend(v8, "addObject:", v39);
      -[STContentPrivacyListController _topLevelSpecifiers](self, "_topLevelSpecifiers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v40);

      -[STContentPrivacyListController _allowChangesSpecifiers](self, "_allowChangesSpecifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v41);

      v42 = (objc_class *)objc_msgSend(v8, "copy");
      v43 = (int)*MEMORY[0x24BE756E0];
      v44 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v43);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v43) = v42;

      v18 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v43);
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installedMDMProfileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installedProfileIdentifiersWithFilterFlags:", 69);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v13)
    {
      v47 = v12;
      objc_msgSend(v15, "removeObject:", v13);
      v16 = objc_msgSend(v15, "count");
      v17 = v16 != 0;
    }
    else
    {
      v19 = objc_msgSend(v15, "count");
      v17 = v19 != 0;
      if (!v19)
      {
LABEL_18:

        goto LABEL_19;
      }
      v16 = v19;
      v47 = v12;
    }
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v13;
    v50 = v15;
    if (v13)
    {
      if (v17)
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ViewProfilesDeviceManagementFooterText"), &stru_24DB8A1D0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v48;
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE75A68]);

        v24 = CFSTR("ViewProfilesDeviceManagementButtonTitle");
      }
      else
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ViewDeviceManagementFooterText"), &stru_24DB8A1D0, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v48;
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE75A68]);

        v24 = CFSTR("ViewDeviceManagementButtonTitle");
      }
      v31 = v23;
      objc_msgSend(v20, "localizedStringForKey:value:table:", v24, &stru_24DB8A1D0, v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 13, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BDD17C8]);
      if (v16 < 2)
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ViewProfileButtonTitle"), &stru_24DB8A1D0, v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithFormat:locale:", v34, v46, v16);

        v28 = objc_alloc(MEMORY[0x24BDD17C8]);
        v29 = CFSTR("ViewProfileFooterText");
      }
      else
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ViewProfilesButtonTitle"), &stru_24DB8A1D0, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithFormat:locale:", v26, v46, v16);

        v28 = objc_alloc(MEMORY[0x24BDD17C8]);
        v29 = CFSTR("ViewProfilesFooterText");
      }
      objc_msgSend(v20, "localizedStringForKey:value:table:", v29, &stru_24DB8A1D0, v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v28, "initWithFormat:locale:", v35, v46, v16);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE75A68]);

      v31 = v48;
      v32 = v20;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 13, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = v47;

    objc_msgSend(v33, "setButtonAction:", sel__viewProfilesAndDeviceManagement_);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v8, "addObject:", v31);
    objc_msgSend(v8, "addObject:", v33);
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v37 = v31;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v38);

    v13 = v49;
    v15 = v50;
    goto LABEL_18;
  }
  v18 = (id)MEMORY[0x24BDBD1A8];
LABEL_20:

  return v18;
}

- (id)_enableRestrictionsSwitchSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ContentPrivacySpecifierName"), &stru_24DB8A1D0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setRestrictionsEnabled_specifier_, sel_getRestrictionsEnabled_, 0, 6, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentPrivacyCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldAllowEditing");

  if ((v10 & 1) == 0)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v6);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91030);

  return v6;
}

- (id)_topLevelSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (-[STContentPrivacyListController isEligibleForAppDistribution](self, "isEligibleForAppDistribution"))
    v7 = CFSTR("AppsInstallationsAndPurchasesSpecifierName");
  else
    v7 = CFSTR("ITunesAppStorePurchasesSpecifierName");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DB8A1D0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController _topLevelSpecifierWithAction:name:](self, "_topLevelSpecifierWithAction:name:", sel_showiTunesPurchasesRestrictions_, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_AllowedAppsAndFeaturesSpecifierName"), &stru_24DB8A1D0, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController _topLevelSpecifierWithAction:name:](self, "_topLevelSpecifierWithAction:name:", sel_showAllowedAppsRestrictions_, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("ALLOWED_APPS"));
  objc_msgSend(v3, "addObject:", v11);
  objc_msgSend(v3, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE75868];
  v14 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_ContentRestrictionsSpecifierName"), &stru_24DB8A1D0, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController _topLevelSpecifierWithAction:name:](self, "_topLevelSpecifierWithAction:name:", sel_showMediaRestrictions_, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  objc_msgSend(v3, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v13);

  objc_msgSend(v3, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController setContentRestrictionsSpecifier:](self, "setContentRestrictionsSpecifier:", v18);

  -[STContentPrivacyListController _privacySpecifiers](self, "_privacySpecifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v19);

  return v3;
}

- (NSArray)storeDetailSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v3 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StorePurchasesLabel"), &stru_24DB8A1D0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupSpecifierWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowAppInstallation"));
  v9 = objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowUIAppInstallation"));
  v10 = objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController getItemSpecifierValue:](self, "getItemSpecifierValue:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v39 = (void *)v10;
  -[STContentPrivacyListController getItemSpecifierValue:](self, "getItemSpecifierValue:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v12 != v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12 & v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyListController setItemSpecifierValueForUIOnly:specifier:](self, "setItemSpecifierValueForUIOnly:specifier:", v15, v9);

  }
  objc_msgSend(v3, "addObject:", v9);
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowAppRemoval"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowInAppPurchases"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  -[STPINListViewController coordinator](self, "coordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentPrivacyCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)v9;
  if (!objc_msgSend(v20, "isLocalDevice"))
    goto LABEL_6;
  v21 = (void *)MEMORY[0x24BE0ADF8];
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ams_activeiTunesAccount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "username");
  v24 = v4;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "formattedUsernameFromUsername:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v24;
  if (v26)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RequirePasswordDetailText"), &stru_24DB8A1D0, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v27, v26);
    v28 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RequirePasswordNoUserDetailText"), &stru_24DB8A1D0, v4);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v28;
  objc_msgSend(v20, "visibleRestrictionWithConfiguration:key:", CFSTR("application.store"), CFSTR("forceITunesStorePasswordEntry"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RequirePasswordLabel"), &stru_24DB8A1D0, v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v30, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AlwaysRequireSpecifierName"), &stru_24DB8A1D0, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController defaultRadioItemSpecifierWithGroup:name:value:](self, "defaultRadioItemSpecifierWithGroup:name:value:", v31, v32, MEMORY[0x24BDBD1C8]);
  v37 = v20;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DontRequireSpecifierName"), &stru_24DB8A1D0, v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController defaultRadioItemSpecifierWithGroup:name:value:](self, "defaultRadioItemSpecifierWithGroup:name:value:", v31, v34, MEMORY[0x24BDBD1C0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  return (NSArray *)v3;
}

- (NSArray)distributionStoreDetailSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v4 = objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AppInstallationsLabel"), &stru_24DB8A1D0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupSpecifierWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AppInstallationsDetailText"), &stru_24DB8A1D0, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75A68]);

  v45 = v8;
  objc_msgSend(v3, "addObject:", v8);
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowAppInstallation"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);
  v44 = (void *)v10;
  -[STContentPrivacyListController getItemSpecifierValue:](self, "getItemSpecifierValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowUIAppInstallation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE75A18];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A18]);
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
    -[STContentPrivacyListController setItemSpecifierValueForUIOnly:specifier:](self, "setItemSpecifierValueForUIOnly:specifier:", v11, v12);
  v43 = v12;
  objc_msgSend(v3, "addObject:", v12);
  if (_os_feature_enabled_impl())
  {
    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowWebDistributionAppInstallation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v13);
    if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
      -[STContentPrivacyListController setItemSpecifierValueForUIOnly:specifier:](self, "setItemSpecifierValueForUIOnly:specifier:", v11, v14);
    objc_msgSend(v3, "addObject:", v14);

  }
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowMarketplaceAppInstallation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v13);
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
    -[STContentPrivacyListController setItemSpecifierValueForUIOnly:specifier:](self, "setItemSpecifierValueForUIOnly:specifier:", v11, v15);
  v40 = v11;
  v42 = v15;
  objc_msgSend(v3, "addObject:", v15);
  v16 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PurchasesLabel"), &stru_24DB8A1D0, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "groupSpecifierWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowInAppPurchases"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  -[STPINListViewController coordinator](self, "coordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentPrivacyCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v22;
  if (!objc_msgSend(v22, "isLocalDevice"))
    goto LABEL_12;
  v23 = (void *)MEMORY[0x24BE0ADF8];
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ams_activeiTunesAccount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "username");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "formattedUsernameFromUsername:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RequirePasswordDetailText"), &stru_24DB8A1D0, v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v28, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RequirePasswordNoUserDetailText"), &stru_24DB8A1D0, v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("forceITunesStorePasswordEntry"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AlwaysRequireSpecifierName"), &stru_24DB8A1D0, v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DontRequireSpecifierName"), &stru_24DB8A1D0, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v31;
  v46[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v33 = (void *)v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValues:titles:", &unk_24DBBF028, v34);

  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE75CD0]);
  objc_msgSend(v3, "addObject:", v30);
  v35 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AppManagementLabel"), &stru_24DB8A1D0, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "groupSpecifierWithName:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowAppRemoval"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v38);

  return (NSArray *)v3;
}

- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
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

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentPrivacyCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visibleRestrictionWithConfiguration:key:", v12, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v18, "uiLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v20, &stru_24DB8A1D0, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupSpecifierWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, 0x24DB8DCB0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE75B28]);

  if (v10)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A68]);

  return v22;
}

- (id)_privacySpecifiers
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
  uint64_t v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PrivacySpecifierName"), &stru_24DB8A1D0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isLocalDevice"))
  {
    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", 0x24DB8DC90, 0x24DB8DDB0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    v12 = objc_opt_class();
    objc_msgSend(v3, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDetailControllerClass:", v12);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DDF0, *MEMORY[0x24BE75E30]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DE30, *MEMORY[0x24BE75E28]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DEB0, *MEMORY[0x24BE75E58]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DE90, *MEMORY[0x24BE75E50]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.icloud"), CFSTR("allowFindMyFriendsModification"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DE10, *MEMORY[0x24BE75E20]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DE70, *MEMORY[0x24BE75E48]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DED0, *MEMORY[0x24BE75E60]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", 0x24DB8DC90, 0x24DB8DD90);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.web.tracking"), CFSTR("forceLimitAdTracking"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

    v24 = objc_opt_class();
    objc_msgSend(v3, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDetailControllerClass:", v24);

    objc_msgSend(v3, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("USER_TRACKING"), *MEMORY[0x24BE75AC0]);

    -[STContentPrivacyListController tccSpecifierWithCapabilityKey:id:](self, "tccSpecifierWithCapabilityKey:id:", 0x24DB8DE50, *MEMORY[0x24BE75E40]);
  }
  else
  {
    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.icloud"), CFSTR("allowFindMyFriendsModification"));
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

- (id)_allowChangesSpecifiers
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
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_AllowChangesLabel"), &stru_24DB8A1D0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyListController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("passcode.settings"), CFSTR("allowPasscodeModification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("account.settings"), CFSTR("allowAccountModification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AccountChangesFooterText"), &stru_24DB8A1D0, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75CD0]);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", 0x24DB8DC50, 0x24DB8DD30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[STPINListViewController coordinator](self, "coordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentPrivacyCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isLocalDevice");

  if (v16)
  {
    -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", 0x24DB8DC90, 0x24DB8DDD0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.donotdisturb"), CFSTR("allowDriverDoNotDisturbModifications"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_DrivingFocusSpecifierTitle"), &stru_24DB8A1D0, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BE759C0];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE759C0]);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.tvprovider"), CFSTR("allowTVProviderModification"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_TVProviderSpecifierTitle"), &stru_24DB8A1D0, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v21);

  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.settings"), CFSTR("allowAutomaticAppUpdatesModification"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AADC_BackgroundAppActivitiesSpecifierTitle"), &stru_24DB8A1D0, v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v21);

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

- (void)_viewProfilesAndDeviceManagement:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BDBCF48]);
  v5 = (id)objc_msgSend(v3, "initWithString:", *MEMORY[0x24BE63EA0]);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);

}

- (void)showiTunesPurchasesRestrictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v5);

  objc_msgSend(v7, "setContentPrivacyController:", self);
  objc_msgSend(v7, "setParentController:", self);
  -[STContentPrivacyListController rootController](self, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRootController:", v6);

  objc_msgSend(v7, "setSpecifier:", v4);
  -[STContentPrivacyListController showController:animate:](self, "showController:animate:", v7, 1);

}

- (void)showAllowedAppsRestrictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v5);

  objc_msgSend(v7, "setParentController:", self);
  -[STContentPrivacyListController rootController](self, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRootController:", v6);

  objc_msgSend(v7, "setSpecifier:", v4);
  -[STContentPrivacyListController showController:animate:](self, "showController:animate:", v7, 1);

}

- (void)showMediaRestrictions:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[STContentPrivacyListController contentRestrictionsSpecifier](self, "contentRestrictionsSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st_startSpinner");

  v6 = -[STContentPrivacyListController isEligibleForAppDistribution](self, "isEligibleForAppDistribution");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__STContentPrivacyListController_showMediaRestrictions___block_invoke;
  v8[3] = &unk_24DB86E98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[STRegionRatings loadRegionRatingsWithUnrated:completionHandler:](STRegionRatings, "loadRegionRatingsWithUnrated:completionHandler:", v6, v8);

}

void __56__STContentPrivacyListController_showMediaRestrictions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STContentPrivacyMediaRestrictionsDetailController *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "contentRestrictionsSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st_stopSpinner");

  v8 = -[STContentPrivacyMediaRestrictionsDetailController initWithRegionRatings:]([STContentPrivacyMediaRestrictionsDetailController alloc], "initWithRegionRatings:", v4);
  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController setCoordinator:](v8, "setCoordinator:", v6);

  -[STContentPrivacyMediaRestrictionsDetailController setParentController:](v8, "setParentController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController setRootController:](v8, "setRootController:", v7);

  -[STContentPrivacyMediaRestrictionsDetailController setSpecifier:](v8, "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "showController:animate:", v8, 1);

}

- (id)_topLevelSpecifierWithAction:(SEL)a3 name:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a4, self, 0, 0, 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentPrivacyCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "restrictionsEnabled") || (objc_msgSend(v9, "shouldAllowEditing") & 1) == 0)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v6, "setControllerLoadAction:", a3);

  return v6;
}

- (id)getRestrictionsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "restrictionsEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setRestrictionsEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STContentPrivacyListController *v15;
  id v16;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = a4;
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke;
  aBlock[3] = &unk_24DB866E0;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  if (objc_msgSend(v8, "isPasscodeEnabled")
    && (objc_msgSend(v8, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_208;
    v12[3] = &unk_24DB86EC0;
    v13 = v8;
    v14 = v6;
    v15 = self;
    v16 = v10;
    -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v7, v12);

    v11 = v13;
  }
  else
  {
    objc_msgSend(v8, "contentPrivacyCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveContentPrivacyEnabled:completionHandler:", objc_msgSend(v6, "BOOLValue"), v10);
  }

}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    +[STUILog persistence](STUILog, "persistence");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_2();
LABEL_4:

    goto LABEL_10;
  }
  if (!_os_feature_enabled_impl())
  {
    v4 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v9 = objc_msgSend(v6, "saveContext:error:", v8, &v10);
  v4 = v10;

  if ((v9 & 1) == 0)
  {
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1();
    goto LABEL_4;
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifiers, 0, 0);

}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_208(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentPrivacyCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveContentPrivacyEnabled:completionHandler:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    objc_msgSend(v3, "enableRestrictionsSwitchSpecifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSpecifier:animated:");
  }

}

- (id)getItemSpecifierValue:(id)a3
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

  objc_msgSend(a3, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valuesByRestriction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "defaultValueForRestriction:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v10 = v9;
  v12 = v10;

  return v12;
}

- (void)setItemSpecifierValueForUIOnly:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentPrivacyCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valuesByRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v11);

}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  STContentPrivacyListController *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke;
  v20[3] = &unk_24DB86EE8;
  v11 = v8;
  v21 = v11;
  v22 = self;
  v12 = v6;
  v23 = v12;
  objc_msgSend(v10, "saveRestrictionValue:forItem:completionHandler:", v7, v11, v20);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v16 = objc_msgSend(v13, "saveContext:error:", v15, &v19);
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1();

    }
  }

}

void __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifier_, *(_QWORD *)(a1 + 48), 0);

}

- (id)defaultRadioItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a4, self, 0, 0, 0, 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75C60]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24DBBE7D8, *MEMORY[0x24BE75E18]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  -[STPINListViewController coordinator](self, "coordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, 0x24DB91230);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, 0x24DB8DCB0);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75DA0]);
  -[STPINListViewController coordinator](self, "coordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentPrivacyCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "restrictionsEnabled") || (objc_msgSend(v17, "shouldAllowEditing") & 1) == 0)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[STContentPrivacyListController getItemSpecifierValue:](self, "getItemSpecifierValue:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToNumber:", v18))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75C20]);

  return v10;
}

- (id)defaultLinkListSpecifierWithItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
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
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24DB8A1D0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setItemSpecifierValue_specifier_, sel_getItemSpecifierValue_, objc_opt_class(), 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, 0x24DB91230);

  v12 = objc_msgSend(v5, "restrictionType");
  if (v12 == 1)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AllowLabel"), &stru_24DB8A1D0, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DontAllowLabel"), &stru_24DB8A1D0, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    v25[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = &unk_24DBBF058;
  }
  else
  {
    v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyListController.m"), 707, CFSTR("Unimplemented type %d"), v13);

      v16 = 0;
      v17 = 0;
    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AllowLabel"), &stru_24DB8A1D0, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DontAllowLabel"), &stru_24DB8A1D0, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v14;
      v26[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = &unk_24DBBF040;
    }
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, 0x24DB8DCB0);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v10, "setValues:titles:", v17, v16);
  -[STPINListViewController coordinator](self, "coordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentPrivacyCoordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v23, "restrictionsEnabled") || (objc_msgSend(v23, "shouldAllowEditing") & 1) == 0)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);

  return v10;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentPrivacyCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleRestrictionWithConfiguration:key:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[STContentPrivacyListController defaultLinkListSpecifierWithItem:](self, "defaultLinkListSpecifierWithItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tccSpecifierWithCapabilityKey:(id)a3 id:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[STContentPrivacyListController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", 0x24DB8DC90, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", 0x24DB8DE90) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", 0x24DB8DE30) & 1) == 0
    && objc_msgSend(v6, "isEqualToString:", 0x24DB8DDF0))
  {
    _os_feature_enabled_impl();
  }
  objc_msgSend(v8, "setDetailControllerClass:", objc_opt_class());
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("capability"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75AC0]);

  return v8;
}

- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, 0x24DB8DCB0);

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), CFSTR("KVOContextContentPrivacyListController"));

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyListController;
  -[STListViewController dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyListController;
    -[STPINListViewController setCoordinator:](&v7, sel_setCoordinator_, v4);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), CFSTR("KVOContextContentPrivacyListController"));
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyListController;
    -[STPINListViewController setCoordinator:](&v7, sel_setCoordinator_, v4);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"), 1, CFSTR("KVOContextContentPrivacyListController"));
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
  objc_super v16;

  v10 = a5;
  if (a6 == CFSTR("KVOContextContentPrivacyListController"))
  {
    v12 = a3;
    -[STPINListViewController coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.isLoaded"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STContentPrivacyListController _isLoadedDidChange:](self, "_isLoadedDidChange:", objc_msgSend(v14, "BOOLValue"));

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STContentPrivacyListController;
    v11 = a3;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_isLoadedDidChange:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[STContentPrivacyListController reloadSpecifiers](self, "reloadSpecifiers");
    -[STContentPrivacyListController specifierIDPendingPush](self, "specifierIDPendingPush");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[STContentPrivacyListController specifierForID:](self, "specifierForID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (-[STPINListViewController shouldShowPINSheetForSpecifier:](self, "shouldShowPINSheetForSpecifier:", v4))
      {
        -[STContentPrivacyListController setSpecifierIDPendingPush:](self, "setSpecifierIDPendingPush:", 0);
        -[STPINListViewController showPINSheet:](self, "showPINSheet:", v4);
      }
      else
      {
        -[STContentPrivacyListController handlePendingURL](self, "handlePendingURL");
      }
    }

  }
}

- (PSSpecifier)enableRestrictionsSwitchSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setEnableRestrictionsSwitchSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (PSSpecifier)contentRestrictionsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setContentRestrictionsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRestrictionsSpecifier, 0);
  objc_storeStrong((id *)&self->_enableRestrictionsSwitchSpecifier, 0);
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to save Communication Safety settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failure enabling restrictions: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_fault_impl(&dword_219AB4000, log, OS_LOG_TYPE_FAULT, "Failure saving restriction %@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
