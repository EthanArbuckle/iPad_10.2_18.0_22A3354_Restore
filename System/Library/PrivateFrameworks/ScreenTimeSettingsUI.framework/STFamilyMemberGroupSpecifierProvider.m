@implementation STFamilyMemberGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[STRootGroupSpecifierProvider providerWithCoordinator:](STFamilyMemberGroupSpecifierProvider, "providerWithCoordinator:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRootViewController:", v5);

  return v6;
}

+ (id)providerWithCoordinator:(id)a3 presentedAsModal:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  objc_super v7;

  v4 = a4;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___STFamilyMemberGroupSpecifierProvider;
  objc_msgSendSuper2(&v7, sel_providerWithCoordinator_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentedAsModal:", v4);
  return v5;
}

- (STFamilyMemberGroupSpecifierProvider)init
{
  STFamilyMemberGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BE75590];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FamilyGroupName"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIdentifier:", CFSTR("FAMILY"));
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_imageDidUpdate_, *MEMORY[0x24BE84838], 0);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
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
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.screenTimeEnabled"), "STFamilyMemberGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.children"), "STFamilyMemberGroupSpecifierProviderObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.children"), 4, "STFamilyMemberGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.screenTimeEnabled"), 4, "STFamilyMemberGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v13;

  if (a6 == "STFamilyMemberGroupSpecifierProviderObservationContext")
  {
    -[STFamilyMemberGroupSpecifierProvider familySpecifiers](self, "familySpecifiers", a3, a4, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    if (objc_msgSend(v12, "count"))
      v9 = v8 == 2;
    else
      v9 = 1;
    v10 = v9;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v10);
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v11, "count"), v12);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STFamilyMemberGroupSpecifierProvider;
    -[STFamilyMemberGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

  -[STGroupSpecifierProvider specifiers](self, "specifiers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v7 = v6 == 2;
  else
    v7 = 1;
  v8 = v7;
  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v8);

}

- (id)createSpecifierForUser:(id)a3 shouldWarn:(BOOL)a4
{
  id v5;
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
  NSString *v16;
  double v17;
  void *v18;

  v5 = a3;
  v6 = _os_feature_enabled_impl();
  v7 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_totalChildUsageTime_, 0, 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setControllerLoadAction:", sel_showChildOnboardingOrChildRootViewController_);
  }
  else
  {
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_totalChildUsageTime_, objc_opt_class(), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CHILD_%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v11);

    objc_msgSend(v9, "setUserInfo:", v5);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE84848]);
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personImageWithDSID:fullName:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75AC8]);

  }
  else
  {
    objc_msgSend(v9, "setUserInfo:", v5);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE84848]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE75AC8]);
  }
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v16))
    v17 = *MEMORY[0x24BEBE770];
  else
    PSRoundToPixel();
  objc_msgSend(v15, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75D10]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24DBBF0A0, *MEMORY[0x24BE04C70]);

  return v9;
}

- (id)familySpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "children", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[STFamilyMemberGroupSpecifierProvider createSpecifierForUser:shouldWarn:](self, "createSpecifierForUser:shouldWarn:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "hasDeviceWithoutUsageReported"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)imageDidUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE84848];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE84848]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STGroupSpecifierProvider specifiers](self, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("properties.%K == %@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v13, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE84850]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75AC8]);
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v10, 0);

  }
}

- (id)totalChildUsageTime:(id)a3
{
  return &stru_24DB8A1D0;
}

- (void)showChildOnboardingOrChildRootViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  STFamilyMemberGroupSpecifierProvider *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v5, "dsid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_15;
  v8 = (void *)v7;
  v20 = v6;
  v21 = self;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "dsid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToNumber:", v8);

        if (v19)
          v14 = objc_msgSend(v17, "isManaged");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v6 = v20;
  self = v21;
  if ((v14 & 1) != 0)
    -[STFamilyMemberGroupSpecifierProvider showChildRootViewController:](v21, "showChildRootViewController:", v4);
  else
LABEL_15:
    -[STFamilyMemberGroupSpecifierProvider showChildOnboardingFlow:](self, "showChildOnboardingFlow:", v4);

}

- (void)showChildOnboardingFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STIntroductionController *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  char v20;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentController:", v6);
  objc_msgSend(v6, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRootController:", v7);

  objc_msgSend(v5, "setSpecifier:", v4);
  objc_msgSend(v5, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasShownMiniBuddy:", 1);
  v9 = -[STIntroductionController initWithNewUserRootViewModelCoordinator:]([STIntroductionController alloc], "initWithNewUserRootViewModelCoordinator:", v8);
  objc_msgSend(v8, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "me");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRemoteUser");

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke;
  v16[3] = &unk_24DB872A0;
  v13 = v8;
  v17 = v13;
  v20 = v12;
  objc_copyWeak(&v19, &location);
  v14 = v5;
  v18 = v14;
  -[STIntroductionController setCompletionBlock:](v9, "setCompletionBlock:", v16);
  -[STFamilyMemberGroupSpecifierProvider rootViewController](self, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroductionController presentOverViewController:](v9, "presentOverViewController:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

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
    v10[2] = __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2;
    v10[3] = &unk_24DB87278;
    v15 = *(_BYTE *)(a1 + 56);
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enableManagementWithPIN:recoveryAltDSID:completionHandler:", v8, v9, v10);

    objc_destroyWeak(&v14);
  }

}

void __64__STFamilyMemberGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    +[STUILog budgets](STUILog, "budgets");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1((uint64_t)v3, v4);

  }
  else
  {
    if (*(_BYTE *)(a1 + 64) || objc_msgSend(*(id *)(a1 + 32), "deviceForChild"))
      objc_msgSend(*(id *)(a1 + 40), "applyIntroductionViewModel:withCompletionHandler:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "showController:animated:", *(_QWORD *)(a1 + 48), 1);

  }
}

- (void)showChildRootViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParentController:", v5);
  objc_msgSend(v5, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRootController:", v6);

  objc_msgSend(v7, "setSpecifier:", v4);
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v7, 1);

}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (void)setPresentedAsModal:(BOOL)a3
{
  self->_presentedAsModal = a3;
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
}

@end
