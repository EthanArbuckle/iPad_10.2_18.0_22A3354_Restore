@implementation STSetUpForFamilyGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "providerWithCoordinator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresenter:", v6);

  objc_msgSend(v8, "setCoordinator:", v7);
  return v8;
}

- (STSetUpForFamilyGroupSpecifierProvider)init
{
  STSetUpForFamilyGroupSpecifierProvider *v2;
  STSetUpForFamilyGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *setupFamilySpecifier;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SetUpForFamilyFooterText"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](v3, "groupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SetUpForFamilyButtonName"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v3, 0, 0, 0, 13, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setButtonAction:", sel_presentAppleAccountSetupFamilyController_);
    if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
      objc_msgSend(v8, "setButtonAction:", sel_showStoreDemoAlert);
    setupFamilySpecifier = v3->_setupFamilySpecifier;
    v3->_setupFamilySpecifier = (PSSpecifier *)v8;
    v10 = v8;

    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "registerObserver:", v3);
    -[STSetUpForFamilyGroupSpecifierProvider _updateEnabledValue](v3, "_updateEnabledValue");

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
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
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canSetUpFamily"), CFSTR("STSetUpForFamilyGroupSpecifierProviderObservationContext"));
  v6.receiver = self;
  v6.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canSetUpFamily"), 4, CFSTR("STSetUpForFamilyGroupSpecifierProviderObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  STSetUpForFamilyGroupSpecifierProvider *v22;
  id v23;
  objc_super v24;

  if (a6 != CFSTR("STSetUpForFamilyGroupSpecifierProviderObservationContext"))
  {
    v24.receiver = self;
    v24.super_class = (Class)STSetUpForFamilyGroupSpecifierProvider;
    v10 = a3;
    -[STSetUpForFamilyGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);

    return;
  }
  v11 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("viewModel.canSetUpFamily"));
  if (v12)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

      -[STSetUpForFamilyGroupSpecifierProvider presenter](self, "presenter");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "canSetUpFamily") ^ 1;
        if (v14 == 2)
          v18 = 1;
        else
          v18 = v17;
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v18);

        goto LABEL_16;
      }
      v21 = v14 == 2;
      v22 = self;
    }
    else
    {
      -[STSetUpForFamilyGroupSpecifierProvider presenter](self, "presenter");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "viewModel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v20, "canSetUpFamily") ^ 1);

LABEL_16:
        return;
      }
      v22 = self;
      v21 = 0;
    }
    -[STGroupSpecifierProvider setIsHidden:](v22, "setIsHidden:", v21);
    goto LABEL_16;
  }
}

- (void)_updateEnabledValue
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]) != 2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STSetUpForFamilyGroupSpecifierProvider setupFamilySpecifier](self, "setupFamilySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A18]);

}

- (void)presentAppleAccountSetupFamilyController:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  FACircleStateController *v9;
  FACircleStateController *controller;
  void *v11;
  objc_class *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getFACircleStateControllerClass_softClass;
  v27 = getFACircleStateControllerClass_softClass;
  if (!getFACircleStateControllerClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = (uint64_t)__getFACircleStateControllerClass_block_invoke;
    v22 = &unk_24DB87CD0;
    v23 = &v24;
    __getFACircleStateControllerClass_block_invoke((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  v7 = [v6 alloc];
  -[STSetUpForFamilyGroupSpecifierProvider presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (FACircleStateController *)objc_msgSend(v7, "initWithPresenter:", v8);
  controller = self->_controller;
  self->_controller = v9;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v11 = (void *)getFACircleContextClass_softClass;
  v27 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = (uint64_t)__getFACircleContextClass_block_invoke;
    v22 = &unk_24DB87CD0;
    v23 = &v24;
    __getFACircleContextClass_block_invoke((uint64_t)&v19);
    v11 = (void *)v25[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v24, 8);
  v13 = [v12 alloc];
  v19 = 0;
  v20 = (uint64_t)&v19;
  v21 = 0x2020000000;
  v14 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  v22 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
  {
    v15 = (void *)FamilyCircleUILibrary();
    v14 = dlsym(v15, "FACircleEventTypeInitiate");
    *(_QWORD *)(v20 + 24) = v14;
    getFACircleEventTypeInitiateSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v19, 8);
  if (!v14)
    -[STSetUpForFamilyGroupSpecifierProvider presentAppleAccountSetupFamilyController:].cold.1();
  v16 = (void *)objc_msgSend(v13, "initWithEventType:", *v14);
  v19 = 0;
  v20 = (uint64_t)&v19;
  v21 = 0x2020000000;
  v17 = (_QWORD *)getFACircleClientNameScreenTimeSymbolLoc_ptr;
  v22 = (void *)getFACircleClientNameScreenTimeSymbolLoc_ptr;
  if (!getFACircleClientNameScreenTimeSymbolLoc_ptr)
  {
    v18 = (void *)FamilyCircleUILibrary();
    v17 = dlsym(v18, "FACircleClientNameScreenTime");
    *(_QWORD *)(v20 + 24) = v17;
    getFACircleClientNameScreenTimeSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v19, 8);
  if (!v17)
    -[STSetUpForFamilyGroupSpecifierProvider presentAppleAccountSetupFamilyController:].cold.2();
  objc_msgSend(v16, "setClientName:", *v17);
  -[FACircleStateController performWithContext:completion:](self->_controller, "performWithContext:completion:", v16, &__block_literal_global_17);

}

void __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_msgSend(v2, "success") & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke_cold_1(v2);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;

  -[STSetUpForFamilyGroupSpecifierProvider _updateEnabledValue](self, "_updateEnabledValue", a3, a4);
  -[STSetUpForFamilyGroupSpecifierProvider setupFamilySpecifier](self, "setupFamilySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 1);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STSetUpForFamilyGroupSpecifierProvider presenter](self, "presenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "canSetUpFamily") ^ 1;
      if (v7 == 2)
        v11 = 1;
      else
        v11 = v10;
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v11);

    }
    else
    {
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v7 == 2);
    }

  }
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (PSSpecifier)setupFamilySpecifier
{
  return self->_setupFamilySpecifier;
}

- (FACircleStateController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_setupFamilySpecifier, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

- (void)presentAppleAccountSetupFamilyController:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getFACircleEventTypeInitiate(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("STSetUpForFamilyGroupSpecifierProvider.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)presentAppleAccountSetupFamilyController:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getFACircleClientNameScreenTime(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("STSetUpForFamilyGroupSpecifierProvider.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

void __83__STSetUpForFamilyGroupSpecifierProvider_presentAppleAccountSetupFamilyController___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to initiate family: %{public}@", (uint8_t *)&v2, 0xCu);

}

@end
