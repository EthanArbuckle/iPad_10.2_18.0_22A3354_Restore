@implementation STCommunicationSafetyListController

- (STCommunicationSafetyListController)init
{
  STCommunicationSafetyListController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyListController;
  v2 = -[STPINListViewController init](&v6, sel_init);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationSafetyListController setTitle:](v2, "setTitle:", v4);

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STCommunicationSafetyListController setCoordinator:](self, "setCoordinator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationSafetyListController;
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
  v16.super_class = (Class)STCommunicationSafetyListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/COMMUNICATION_SAFETY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("CommunicationSafetyTitle"), CFSTR("Localizable"), v6, v8);

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
  -[STCommunicationSafetyListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"), "STCommunicationSafetyListControllerObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"), "STCommunicationSafetyListControllerObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"), "STCommunicationSafetyListControllerObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyListController;
  -[STPINListViewController setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"), 3, "STCommunicationSafetyListControllerObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"), 3, "STCommunicationSafetyListControllerObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"), 3, "STCommunicationSafetyListControllerObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  if (a6 == "STCommunicationSafetyListControllerObservationContext")
  {
    v11 = *MEMORY[0x24BDD0E80];
    v12 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = objc_msgSend(v14, "BOOLValue");
    if ((_DWORD)v12 != objc_msgSend(v13, "BOOLValue"))
    {
      -[STCommunicationSafetyListController _disableAnalyticsIfNeeded](self, "_disableAnalyticsIfNeeded");
      -[STCommunicationSafetyListController reloadSpecifiers](self, "reloadSpecifiers");
    }

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STCommunicationSafetyListController;
    v10 = a5;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
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
  objc_class *v14;
  void *v15;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[STCommunicationSafetyListController _createUnsafePhotosGroupSpecifier](self, "_createUnsafePhotosGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[STCommunicationSafetyListController _createCheckForUnsafePhotosSpecifier](self, "_createCheckForUnsafePhotosSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyListController setCheckSpecifier:](self, "setCheckSpecifier:", v7);

    -[STCommunicationSafetyListController checkSpecifier](self, "checkSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    -[STCommunicationSafetyListController _createViewChildSafetyResourcesGroupSpecifier](self, "_createViewChildSafetyResourcesGroupSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    -[STCommunicationSafetyListController _createViewChildSafetyResourcesSpecifier](self, "_createViewChildSafetyResourcesSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    -[STCommunicationSafetyListController _createEnableAnalyticsGroupSpecifier](self, "_createEnableAnalyticsGroupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    -[STCommunicationSafetyListController _createEnableAnalyticsSpecifier](self, "_createEnableAnalyticsSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyListController setEnableAnalyticsSpecifier:](self, "setEnableAnalyticsSpecifier:", v12);

    -[STCommunicationSafetyListController enableAnalyticsSpecifier](self, "enableAnalyticsSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    -[STCommunicationSafetyListController _disableAnalyticsIfNeeded](self, "_disableAnalyticsIfNeeded");
    v14 = (objc_class *)objc_msgSend(v5, "copy");
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v14;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_createUnsafePhotosGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSRange v17;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEnableFeatureGroupSpecifierTitle"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEnableFeatureGroupSpecifierFooter"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyLearnMoreFooterLink"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A68]);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A30]);

  v17.location = objc_msgSend(v10, "rangeOfString:", v9);
  NSStringFromRange(v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A50]);

  NSStringFromSelector(sel__openChildSafetyWebsite);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A38]);

  return v6;
}

- (void)_openChildSafetyWebsite
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212850"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

}

- (id)_createCheckForUnsafePhotosSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEnableFeatureSpecifierTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setCheckForUnsafePhotos_specifier_, sel__checkForUnsafePhotos_, 0, 6, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v5);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91030);

  return v5;
}

- (id)_createEnableAnalyticsSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEnableAnalyticsSpecifierTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setEnableAnalytics_specifier_, sel__getEnableAnalytics_, 0, 6, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v5);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91030);

  return v5;
}

- (id)_createEnableAnalyticsGroupSpecifier
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
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSRange v19;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyAnalyticsGroupSpecifierTitle"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyAnalyticsGroupSpecifierFooter"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.improveCommSafety"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "flow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A68]);
    v19.location = objc_msgSend(v12, "rangeOfString:", v11);
    NSStringFromRange(v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A40]);

    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A30]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A50]);

    NSStringFromSelector(sel__openAboutAnalytics);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A38]);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, &stru_24DB8A1D0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A68]);
  }

  return v6;
}

- (void)_openAboutAnalytics
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveCommSafety"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setPresentingViewController:", self);
    objc_msgSend(v4, "present");
    v3 = v4;
  }

}

- (id)_createViewChildSafetyResourcesGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyViewResourcesGroupSpecifierFooter"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75A68]);

  return v2;
}

- (void)_disableAnalyticsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "communicationSafetyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isCommunicationSafetySendingRestricted")
    && (objc_msgSend(v7, "isCommunicationSafetyReceivingRestricted") & 1) != 0)
  {
    -[STCommunicationSafetyListController enableAnalyticsSpecifier](self, "enableAnalyticsSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

  }
  else
  {
    -[STCommunicationSafetyListController enableAnalyticsSpecifier](self, "enableAnalyticsSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);

    objc_msgSend(v7, "setIsCommunicationSafetyAnalyticsEnabled:", 0);
  }

}

- (id)_createViewChildSafetyResourcesSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyViewResourcesSpecifierTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isRemoteUser"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v8);
  }
  objc_msgSend(v8, "setButtonAction:", sel__showChildSafetyResources);

  return v8;
}

- (void)_showChildSafetyResources
{
  void *v3;
  void *v4;
  STActivityIndicatingWebView *v5;
  id v6;
  void *v7;
  id v8;
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
  STActivityIndicatingWebView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  objc_msgSend(v3, "setWebsiteDataStore:", v4);

  v5 = -[STActivityIndicatingWebView initWithConfiguration:]([STActivityIndicatingWebView alloc], "initWithConfiguration:", v3);
  v6 = objc_alloc(MEMORY[0x24BDD1840]);
  objc_msgSend((id)objc_opt_class(), "resourcesURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v6, "initWithURL:", v7);

  v8 = (id)-[STActivityIndicatingWebView loadRequest:](v5, "loadRequest:", v37);
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissChildSafetyResourcesView_);
  objc_msgSend(v9, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  objc_msgSend(v9, "setEdgesForExtendedLayout:", 0);
  -[STActivityIndicatingWebView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v5);

  v27 = (void *)MEMORY[0x24BDD1628];
  -[STActivityIndicatingWebView leadingAnchor](v5, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v32;
  -[STActivityIndicatingWebView topAnchor](v5, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v26;
  v29 = v5;
  -[STActivityIndicatingWebView trailingAnchor](v5, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v16;
  -[STActivityIndicatingWebView bottomAnchor](v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v21);

  objc_msgSend(v9, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STActivityIndicatingWebView hostActivityIndicatorInView:](v29, "hostActivityIndicatorInView:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
  objc_msgSend(v23, "setModalPresentationStyle:", 2);
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "configureWithOpaqueBackground");
  objc_msgSend(v23, "navigationBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScrollEdgeAppearance:", v24);

  -[STCommunicationSafetyListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
}

- (void)_dismissChildSafetyResourcesView:(id)a3
{
  -[STCommunicationSafetyListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_setCheckForUnsafePhotos:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasPasscode"))
  {

    goto LABEL_5;
  }
  v11 = objc_msgSend(v8, "hasAlreadyEnteredPINForSession");

  if ((v11 & 1) != 0)
  {
LABEL_5:
    -[STCommunicationSafetyListController _setCheckForUnsafePhotos:](self, "_setCheckForUnsafePhotos:", v7);
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__STCommunicationSafetyListController__setCheckForUnsafePhotos_specifier___block_invoke;
  v12[3] = &unk_24DB86A90;
  v12[4] = self;
  v14 = v7;
  v13 = v6;
  -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v13, v12);

LABEL_6:
}

uint64_t __74__STCommunicationSafetyListController__setCheckForUnsafePhotos_specifier___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_setCheckForUnsafePhotos:", *(unsigned __int8 *)(a1 + 48));
  else
    return objc_msgSend(v3, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_setCheckForUnsafePhotos:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STCommunicationSafetyListController _setCheckForUnsafePhotos:].cold.1(v3, v5);

  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationSafetyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsCommunicationSafetySendingRestricted:", v3);
  objc_msgSend(v8, "setIsCommunicationSafetyReceivingRestricted:", v3);
  if (v3)
  {
    -[STCommunicationSafetyListController _disableAnalyticsIfNeeded](self, "_disableAnalyticsIfNeeded");
    -[STCommunicationSafetyListController _persistSettings](self, "_persistSettings");
    -[STCommunicationSafetyListController _showCommunicationSafetyCompatibilityAlertIfNeeded](self, "_showCommunicationSafetyCompatibilityAlertIfNeeded");
  }
  else
  {
    objc_msgSend(v8, "setIsCommunicationSafetyNotificationEnabled:", 0);
    -[STCommunicationSafetyListController _disableAnalyticsIfNeeded](self, "_disableAnalyticsIfNeeded");
    -[STCommunicationSafetyListController _persistSettings](self, "_persistSettings");
  }
  -[STCommunicationSafetyListController enableAnalyticsSpecifier](self, "enableAnalyticsSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationSafetyListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v9, 1);

}

- (id)_checkForUnsafePhotos:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationSafetyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "isCommunicationSafetySendingRestricted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STCommunicationSafetyListController _checkForUnsafePhotos:].cold.1();

  return v7;
}

- (void)_setEnableAnalytics:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[STPINListViewController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasPasscode"))
  {

    goto LABEL_5;
  }
  v11 = objc_msgSend(v8, "hasAlreadyEnteredPINForSession");

  if ((v11 & 1) != 0)
  {
LABEL_5:
    -[STCommunicationSafetyListController _setEnableAnalytics:](self, "_setEnableAnalytics:", v7);
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__STCommunicationSafetyListController__setEnableAnalytics_specifier___block_invoke;
  v12[3] = &unk_24DB86A90;
  v12[4] = self;
  v14 = v7;
  v13 = v6;
  -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v13, v12);

LABEL_6:
}

uint64_t __69__STCommunicationSafetyListController__setEnableAnalytics_specifier___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_setEnableAnalytics:", *(unsigned __int8 *)(a1 + 48));
  else
    return objc_msgSend(v3, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_setEnableAnalytics:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STCommunicationSafetyListController _setEnableAnalytics:].cold.1(v3, v5);

  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationSafetyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsCommunicationSafetyAnalyticsEnabled:", v3);
  -[STCommunicationSafetyListController _persistSettings](self, "_persistSettings");
  if (v3)
    -[STCommunicationSafetyListController _acknowledgeAnalyticsTip](self, "_acknowledgeAnalyticsTip");

}

- (id)_getEnableAnalytics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationSafetyCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "isCommunicationSafetyAnalyticsEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STCommunicationSafetyListController _getEnableAnalytics:].cold.1();

  return v7;
}

- (void)_persistSettings
{
  void *v2;
  id v3;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "communicationSafetyCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistCommunicationSafetySettingsWithCompletionHandler:", &__block_literal_global_5);

}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;

  v2 = a2;
  if (v2)
  {
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_2();
  }
  else
  {
    if (!_os_feature_enabled_impl())
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = objc_msgSend(v4, "saveContext:error:", v6, &v9);
    v3 = v9;

    if ((v7 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_1();

    }
  }

LABEL_5:
}

- (void)viewWillAppear:(BOOL)a3
{
  STCommunicationSafetyOnboardingController *v4;
  void *v5;
  STCommunicationSafetyOnboardingController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, int, int, uint64_t);
  void *v11;
  STCommunicationSafetyListController *v12;
  id v13;
  id location[2];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STCommunicationSafetyListController;
  -[STCommunicationSafetyListController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  if (-[STCommunicationSafetyListController _isAnyCommunicationSafetySettingEnabled](self, "_isAnyCommunicationSafetySettingEnabled"))
  {
    -[STCommunicationSafetyListController _acknowledgeIntroScreens](self, "_acknowledgeIntroScreens");
  }
  if (!-[STCommunicationSafetyListController _hasAcknowledgedIntroScreens](self, "_hasAcknowledgedIntroScreens"))
  {
    v4 = [STCommunicationSafetyOnboardingController alloc];
    -[STPINListViewController coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[STCommunicationSafetyOnboardingController initWithCoordinator:](v4, "initWithCoordinator:", v5);
    -[STCommunicationSafetyListController setOnboardingController:](self, "setOnboardingController:", v6);

    objc_initWeak(location, self);
    -[STCommunicationSafetyListController onboardingController](self, "onboardingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __54__STCommunicationSafetyListController_viewWillAppear___block_invoke;
    v11 = &unk_24DB86D40;
    objc_copyWeak(&v13, location);
    v12 = self;
    objc_msgSend(v7, "presentOverViewController:skipFeatureEnablement:completionBlock:", self, 0, &v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  if (-[STCommunicationSafetyListController _isCommunicationSafetyAnalyticsEnabled](self, "_isCommunicationSafetyAnalyticsEnabled", v8, v9, v10, v11))
  {
    -[STCommunicationSafetyListController _acknowledgeAnalyticsTip](self, "_acknowledgeAnalyticsTip");
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationSafetyListController.viewWillAppear", (uint8_t *)location, 2u);
  }
}

void __54__STCommunicationSafetyListController_viewWillAppear___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    if (a2 || (objc_msgSend(WeakRetained, "_acknowledgeIntroScreens"), !a3))
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);
    }
    else
    {
      objc_msgSend(v13, "_acknowledgeAnalyticsTip");
      objc_msgSend(v13, "coordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "communicationSafetyCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setIsCommunicationSafetySendingRestricted:", 1);
      objc_msgSend(v11, "setIsCommunicationSafetyReceivingRestricted:", 1);
      objc_msgSend(v11, "setIsCommunicationSafetyAnalyticsEnabled:", a4);
      objc_msgSend(v13, "_persistSettings");
    }

    WeakRetained = v13;
  }

}

- (BOOL)_isAnyCommunicationSafetySettingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[STPINListViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "communicationSafetyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isCommunicationSafetySendingRestricted") & 1) != 0
    || (objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted") & 1) != 0
    || (objc_msgSend(v4, "isCommunicationSafetyNotificationEnabled") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isCommunicationSafetyAnalyticsEnabled");
  }

  return v5;
}

- (BOOL)_hasAcknowledgedIntroScreens
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ScreenTimeCommunicationSafetyIntroAcknowledged"));

  return v3;
}

- (void)_acknowledgeIntroScreens
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("ScreenTimeCommunicationSafetyIntroAcknowledged"));

}

- (BOOL)_isCommunicationSafetyAnalyticsEnabled
{
  void *v2;
  void *v3;
  void *v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "communicationSafetyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isCommunicationSafetyAnalyticsEnabled");
  return (char)v2;
}

- (void)_showCommunicationSafetyCompatibilityAlertIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldShowCompatibilityAlerts"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("HasShownCommunicationSafetyCompatibilityAlertByDSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) == 0)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isRemoteUser"))
      {
        objc_msgSend(v5, "givenName");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitleFormat"), &stru_24DB8A1D0, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v23, v14, v13);
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyChildCompatibilityAlertMessageFormat"), &stru_24DB8A1D0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v16, v14, v13);

LABEL_9:
          objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v15, v17, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v21, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addAction:", v22);
          objc_msgSend(v20, "setPreferredAction:", v22);
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __89__STCommunicationSafetyListController__showCommunicationSafetyCompatibilityAlertIfNeeded__block_invoke;
          v24[3] = &unk_24DB86440;
          v25 = v5;
          -[STCommunicationSafetyListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, v24);

          goto LABEL_10;
        }
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UpdateChildDevicesAlertTitle"), &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("CommunicationSafetyChildCompatibilityAlertMessage");
        v18 = v12;
      }
      else
      {
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UpdateOtherDevicesAlertTitle"), &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CommunicationSafetyCompatibilityAlertMessage"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        v19 = v13;
      }
      objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_24DB8A1D0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __89__STCommunicationSafetyListController__showCommunicationSafetyCompatibilityAlertIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HasShownCommunicationSafetyCompatibilityAlertByDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v5);

  }
  else
  {
    v7 = v5;
    v8[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("HasShownCommunicationSafetyCompatibilityAlertByDSID"));

}

- (void)_acknowledgeAnalyticsTip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[STPINListViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:](STCommunicationSafetyAnalyticsTipCell, "acknowledgeTipViewForDSID:", v5);
}

- (PSSpecifier)checkSpecifier
{
  return self->_checkSpecifier;
}

- (void)setCheckSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_checkSpecifier, a3);
}

- (PSSpecifier)enableAnalyticsSpecifier
{
  return self->_enableAnalyticsSpecifier;
}

- (void)setEnableAnalyticsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_enableAnalyticsSpecifier, a3);
}

- (STCommunicationSafetyOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_enableAnalyticsSpecifier, 0);
  objc_storeStrong((id *)&self->_checkSpecifier, 0);
}

- (void)_setCheckForUnsafePhotos:(char)a1 .cold.1(char a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219AB4000, a2, v4, "Setting 'communication safety sending restricted' and 'communication safety receiving restricted' flags on viewmodel: %@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_checkForUnsafePhotos:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219AB4000, v0, v1, "Fetching 'communication safety sending restricted' flag from viewmodel: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_setEnableAnalytics:(char)a1 .cold.1(char a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219AB4000, a2, v4, "Setting Improve Communication Safety on viewmodel: %@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_getEnableAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219AB4000, v0, v1, "Fetching Improve Communication Safety Analytics state: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Error saving managed object contet: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_219AB4000, v0, v1, "Could not save Communication Safety settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
