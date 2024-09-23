@implementation STEnableRemoteManagementGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[STRootGroupSpecifierProvider providerWithCoordinator:](STEnableRemoteManagementGroupSpecifierProvider, "providerWithCoordinator:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRootViewController:", v5);

  return v6;
}

- (STEnableRemoteManagementGroupSpecifierProvider)init
{
  STEnableRemoteManagementGroupSpecifierProvider *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PSSpecifier *enableRemoteManagementSpecifier;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]) != 2;

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EnableRemoteManagementGenericButtonName"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v2, 0, 0, 0, 13, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    enableRemoteManagementSpecifier = v2->_enableRemoteManagementSpecifier;
    v2->_enableRemoteManagementSpecifier = (PSSpecifier *)v7;

    -[PSSpecifier setButtonAction:](v2->_enableRemoteManagementSpecifier, "setButtonAction:", sel_showChildOnboardingFlow_);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](v2->_enableRemoteManagementSpecifier, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75A18]);

    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v2->_enableRemoteManagementSpecifier);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isRemoteUnmanagedChild"), "STEnableRemoteManagementGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.me"), "STEnableRemoteManagementGroupSpecifierProviderObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.me"), 4, "STEnableRemoteManagementGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isRemoteUnmanagedChild"), 4, "STEnableRemoteManagementGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  if (a6 == "STEnableRemoteManagementGroupSpecifierProviderObservationContext")
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isRemoteUnmanagedChild")))
    {
      if (v12 == 2)
      {
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 0);
        goto LABEL_17;
      }
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v14, "isRemoteUnmanagedChild") ^ 1);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.me")))
        goto LABEL_17;
      -[STEnableRemoteManagementGroupSpecifierProvider enableRemoteManagementButtonName](self, "enableRemoteManagementButtonName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STEnableRemoteManagementGroupSpecifierProvider enableRemoteManagementSpecifier](self, "enableRemoteManagementSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", v13) & 1) == 0)
        objc_msgSend(v14, "setName:", v13);
      if (v12 == 2)
      {
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ScreenTimeRestrictedFooterText"), &stru_24DB8A1D0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[STEnableRemoteManagementGroupSpecifierProvider enableRemoteManagementFooterText](self, "enableRemoteManagementFooterText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BE75A68];
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", v17) & 1) == 0)
      {
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);
        -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v18, 1);
      }

    }
    goto LABEL_17;
  }
  v21.receiver = self;
  v21.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  -[STEnableRemoteManagementGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
LABEL_17:

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

  if (v6 == 2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ScreenTimeRestrictedFooterText"), &stru_24DB8A1D0, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[STEnableRemoteManagementGroupSpecifierProvider enableRemoteManagementFooterText](self, "enableRemoteManagementFooterText");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75A68];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v15) & 1) == 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v9);
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v8, 1);
  }
  -[STEnableRemoteManagementGroupSpecifierProvider enableRemoteManagementSpecifier](self, "enableRemoteManagementSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE75A18];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE75A18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((((v6 == 2) ^ objc_msgSend(v13, "BOOLValue")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 != 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v12);

    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v11, 1);
  }

}

- (id)enableRemoteManagementButtonName
{
  void *v2;
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

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personNameComponentsFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EnableRemoteManagementGenericButtonName"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EnableRemoteManagementButtonName"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (id)enableRemoteManagementFooterText
{
  void *v2;
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

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personNameComponentsFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EnableRemoteManagementGenericFooterText"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EnableRemoteManagementFooterText"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (void)showChildOnboardingFlow:(id)a3
{
  void *v4;
  STIntroductionController *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int, void *);
  void *v14;
  id v15;
  char v16;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasShownMiniBuddy:", 1);
  v5 = -[STIntroductionController initWithNewUserRootViewModelCoordinator:]([STIntroductionController alloc], "initWithNewUserRootViewModelCoordinator:", v4);
  objc_msgSend(v4, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRemoteUser");

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke;
  v14 = &unk_24DB86818;
  v15 = v4;
  v16 = v8;
  v9 = v4;
  -[STIntroductionController setCompletionBlock:](v5, "setCompletionBlock:", &v11);
  -[STEnableRemoteManagementGroupSpecifierProvider rootViewController](self, "rootViewController", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroductionController presentOverViewController:](v5, "presentOverViewController:", v10);

}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parentalControlsPasscode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recoveryAltDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2;
    v10[3] = &unk_24DB867F0;
    v13 = *(_BYTE *)(a1 + 40);
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v7, "enableManagementWithPIN:recoveryAltDSID:completionHandler:", v8, v9, v10);

  }
}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[STUILog budgets](STUILog, "budgets");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1((uint64_t)v3, v4);

  }
  if (*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(a1 + 32), "deviceForChild"))
    objc_msgSend(*(id *)(a1 + 40), "applyIntroductionViewModel:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)isHidden
{
  objc_super v4;

  if (!_os_feature_enabled_impl())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  return -[STGroupSpecifierProvider isHidden](&v4, sel_isHidden);
}

- (PSSpecifier)enableRemoteManagementSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnableRemoteManagementSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_enableRemoteManagementSpecifier, 0);
}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "failed to set management enabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
