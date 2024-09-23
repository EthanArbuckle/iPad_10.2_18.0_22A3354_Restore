@implementation ICSKeychainSyncViewController

- (ICSKeychainSyncViewController)initWithAccountManager:(id)a3
{
  id v4;
  ICSKeychainSyncViewController *v5;
  _TtC14iCloudSettings22ICSAnalyticsController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _TtC14iCloudSettings22ICSAnalyticsController *analyticsController;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSKeychainSyncViewController;
  v5 = -[ICSKeychainSyncViewController init](&v12, sel_init);
  if (v5)
  {
    v6 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    objc_msgSend(v4, "accounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICSAnalyticsController initWithAccount:](v6, "initWithAccount:", v8);
    analyticsController = v5->_analyticsController;
    v5->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v9;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSKeychainSyncViewController _stopListeningForKeychainSyncStatusChangeNotification](self, "_stopListeningForKeychainSyncStatusChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)ICSKeychainSyncViewController;
  -[ICSKeychainSyncViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSKeychainSyncViewController;
  -[ICSKeychainSyncViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_NAV_BAR_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSKeychainSyncViewController setTitle:](self, "setTitle:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id restrictionChangeNotificationObserver;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICSKeychainSyncViewController;
  -[ICSKeychainSyncViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[ICSKeychainSyncViewController _registerForKeychainSyncStatusChangeNotification](self, "_registerForKeychainSyncStatusChangeNotification");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE63BA0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__ICSKeychainSyncViewController_viewDidAppear___block_invoke;
  v9[3] = &unk_251C60FA8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v6, 0, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_restrictionChangeNotificationObserver = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __47__ICSKeychainSyncViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id restrictionChangeNotificationObserver;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self->_restrictionChangeNotificationObserver);

  restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_restrictionChangeNotificationObserver = 0;

  v7.receiver = self;
  v7.super_class = (Class)ICSKeychainSyncViewController;
  -[ICSKeychainSyncViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[ICSKeychainSyncViewController _tobleroneKeychainSpecifiers](self, "_tobleroneKeychainSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_tobleroneKeychainSpecifiers
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PSSpecifier *v20;
  PSSpecifier *switchCellSpecifier;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATACLASS_HEADER_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_DATACLASS_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_DATACLASS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75D28]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ICLOUD_KEYCHAIN_KB_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("AAUIDataclassAttributedLink"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("AAUIDataclassAttributedLinkText"));

  objc_msgSend(v7, "setProperty:forKey:", &unk_251C83D00, *MEMORY[0x24BE75860]);
  objc_msgSend(MEMORY[0x24BEBD640], "imageForDataclassWithType:", CFSTR("com.apple.graphic-icon.passwords"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v16, *MEMORY[0x24BE75AC8]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DATACLASS_CELL_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, sel__setKeychainSyncEnabled_withSpecifier_, sel__isKeychainSyncEnabledForSpecifier_, 0, 6, 0);
  v20 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  switchCellSpecifier = self->_switchCellSpecifier;
  self->_switchCellSpecifier = v20;

  v22 = *MEMORY[0x24BE75A18];
  -[PSSpecifier setObject:forKeyedSubscript:](self->_switchCellSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v23, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE638C8]);

  if ((_DWORD)v18)
    -[PSSpecifier setObject:forKeyedSubscript:](self->_switchCellSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v22);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_switchCellSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v24 = *MEMORY[0x24BDB3E30];
  -[PSSpecifier setObject:forKeyedSubscript:](self->_switchCellSpecifier, "setObject:forKeyedSubscript:", *MEMORY[0x24BDB3E30], *MEMORY[0x24BE75AC0]);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_switchCellSpecifier, "setObject:forKeyedSubscript:", v24, CFSTR("com.apple.accountsui.dataclass"));
  v27[0] = v3;
  v27[1] = v7;
  v27[2] = self->_switchCellSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_specifierForKeychainSwitchCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_KEYCHAIN_LABEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setKeychainSyncEnabled_withSpecifier_, sel__isKeychainSyncEnabledForSpecifier_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v6;
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  objc_msgSend(a3, "ics_startSpinner");
}

- (void)_stopSpinnerInActiveSpecifier:(id)a3
{
  objc_msgSend(a3, "ics_stopSpinner");
}

- (BOOL)_isLocalizedForWLAN
{
  return MGGetBoolAnswer();
}

- (id)_isKeychainSyncEnabledForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[ICSKeychainSyncController isKeychainSyncEnabled](ICSKeychainSyncController, "isKeychainSyncEnabled", a3));
}

- (void)_setKeychainSyncEnabled:(id)a3 withSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v6 = a3;
  -[ICSKeychainSyncViewController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", a4);
  -[ICSKeychainSyncViewController _sendToggleInitiated:](self, "_sendToggleInitiated:", objc_msgSend(v6, "BOOLValue"));
  if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
  {
    v7 = (void *)MEMORY[0x24BE04A90];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_NOT_AVAILABLE_IN_DEMO_MODE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v9, 0, v11, 0, &__block_literal_global_5);

    -[ICSKeychainSyncViewController _keychainSyncStatusDidChange](self, "_keychainSyncStatusDidChange");
    -[ICSKeychainSyncViewController _sendToggleCompleted:](self, "_sendToggleCompleted:", objc_msgSend(v6, "BOOLValue"));
  }
  else
  {
    self->_isTogglingKeychainSync = 1;
    if (objc_msgSend(v6, "BOOLValue"))
    {
      v12 = objc_alloc(MEMORY[0x24BE1A490]);
      objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithContext:", v13);

      v19 = 0;
      v15 = objc_msgSend(v14, "isManateeAvailable:", &v19);
      v16 = v19;
      if ((v15 & 1) != 0)
      {
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_2;
        v18[3] = &unk_251C619F8;
        v18[4] = self;
        objc_msgSend(MEMORY[0x24BE1A440], "setUserVisibleKeychainSyncEnabled:withCompletion:", 1, v18);
      }
      else
      {
        -[ICSKeychainSyncViewController _beginManateeUpgradeAndEnableKeychain](self, "_beginManateeUpgradeAndEnableKeychain");
      }

    }
    else
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_3;
      v17[3] = &unk_251C619F8;
      v17[4] = self;
      objc_msgSend(MEMORY[0x24BE1A440], "setUserVisibleKeychainSyncEnabled:withCompletion:", 0, v17);
    }
  }

}

void __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE1A368]))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v6, "code");

  if (v5 != -5700)
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_keychainSyncStatusDidChange");
    objc_msgSend(*(id *)(a1 + 32), "_sendToggleCompleted:", 1);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_beginManateeUpgradeAndEnableKeychain");
LABEL_6:

}

uint64_t __71__ICSKeychainSyncViewController__setKeychainSyncEnabled_withSpecifier___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_keychainSyncStatusDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "_sendToggleCompleted:", 0);
}

- (void)_beginManateeUpgradeAndEnableKeychain
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICSKeychainSyncViewController *v15;

  self->_isTogglingKeychainSync = 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04DB0]), "initWithNibName:bundle:", 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
  v5 = objc_alloc(MEMORY[0x24BE1AA20]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAccountAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithAltDSID:", v7);

  objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
  objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UPGRADE_ACCOUNT_SECURITY_FEATURE_KEYCHAIN"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeatureName:", v10);

  objc_msgSend(v8, "setPresentingViewController:", self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke;
  v13[3] = &unk_251C61A20;
  v14 = v4;
  v15 = self;
  v12 = v4;
  objc_msgSend(v11, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v13);

}

uint64_t __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke(uint64_t a1, int a2)
{
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 40), "_stopSpinnerInActiveSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1376));
  if (a2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke_2;
    v5[3] = &unk_251C619F8;
    v5[4] = *(_QWORD *)(a1 + 40);
    return objc_msgSend(MEMORY[0x24BE1A440], "setUserVisibleKeychainSyncEnabled:withCompletion:", 1, v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1392) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_keychainSyncStatusDidChange");
    return objc_msgSend(*(id *)(a1 + 40), "_sendToggleCancelled:", 1);
  }
}

uint64_t __70__ICSKeychainSyncViewController__beginManateeUpgradeAndEnableKeychain__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_keychainSyncStatusDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "_sendToggleCompleted:", 1);
}

- (void)_reloadParentSpecifier
{
  void *v3;
  id v4;

  -[ICSKeychainSyncViewController parentController](self, "parentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSKeychainSyncViewController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifier:", v3);

}

- (void)_keychainSyncStatusDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ICSKeychainSyncViewController__keychainSyncStatusDidChange__block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__ICSKeychainSyncViewController__keychainSyncStatusDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t result;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1392);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Received Keychain Sync status change notification. In the middle of toggling the switch? %d", (uint8_t *)v5, 8u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 1392))
  {
    objc_msgSend((id)result, "_stopSpinnerInActiveSpecifier:", *(_QWORD *)(result + 1376));
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
    return objc_msgSend(*(id *)(a1 + 32), "_reloadParentSpecifier");
  }
  return result;
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD handler[4];
  id v15;
  id buf[2];

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "Registering for Keychain Sync status change notification.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = (const char *)*MEMORY[0x24BDE8518];
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke;
  handler[3] = &unk_251C612D8;
  objc_copyWeak(&v15, buf);
  notify_register_dispatch(v4, &self->_keychainSyncNotificationToken, v5, handler);

  v8 = (const char *)*MEMORY[0x24BDE8EE0];
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_2;
  v12[3] = &unk_251C612D8;
  objc_copyWeak(&v13, buf);
  notify_register_dispatch(v8, &self->_keychainSyncNotificationToken, v5, v12);

  v9 = (const char *)*MEMORY[0x24BDE8EF0];
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_3;
  v10[3] = &unk_251C612D8;
  objc_copyWeak(&v11, buf);
  notify_register_dispatch(v9, &self->_keychainViewNotificationToken, v5, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStatusDidChange");

}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStatusDidChange");

}

void __81__ICSKeychainSyncViewController__registerForKeychainSyncStatusChangeNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStatusDidChange");

}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
  NSObject *v3;
  uint8_t v4[16];

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for Keychain Sync status change notification.", v4, 2u);
  }

  notify_cancel(self->_keychainSyncNotificationToken);
}

- (void)_sendToggleInitiated:(BOOL)a3
{
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", *MEMORY[0x24BDB3E30], 0, a3);
}

- (void)_sendToggleCompleted:(BOOL)a3
{
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", *MEMORY[0x24BDB3E30], 1, a3);
}

- (void)_sendToggleCancelled:(BOOL)a3
{
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", *MEMORY[0x24BDB3E30], 2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_switchCellSpecifier, 0);
}

@end
