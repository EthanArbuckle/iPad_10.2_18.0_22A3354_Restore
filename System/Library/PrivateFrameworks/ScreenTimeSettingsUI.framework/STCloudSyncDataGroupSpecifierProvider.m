@implementation STCloudSyncDataGroupSpecifierProvider

- (STCloudSyncDataGroupSpecifierProvider)init
{
  STCloudSyncDataGroupSpecifierProvider *v2;
  STCloudSyncDataGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  PSSpecifier *toggleCloudSyncDataSpecifier;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CloudSyncDataFooterText"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](v3, "groupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CloudSyncDataSpecifierName"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v3, sel_setCloudSyncData_specifier_, sel_cloudSyncData_, 0, 6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75C60]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24DBBE760, *MEMORY[0x24BE75E18]);
    v11 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, 0x24DB91030);
    if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    toggleCloudSyncDataSpecifier = v3->_toggleCloudSyncDataSpecifier;
    v3->_toggleCloudSyncDataSpecifier = (PSSpecifier *)v8;
    v13 = v8;

    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "registerObserver:", v3);
    -[STCloudSyncDataGroupSpecifierProvider _updateEnabledValue](v3, "_updateEnabledValue");

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
  v4.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
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
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canToggleCloudSyncData"), "STCloudSyncDataGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isCloudSyncEnabled"), "STCloudSyncDataGroupSpecifierProviderObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canToggleCloudSyncData"), 4, "STCloudSyncDataGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isCloudSyncEnabled"), 4, "STCloudSyncDataGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  if (a6 == "STCloudSyncDataGroupSpecifierProviderObservationContext")
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canToggleCloudSyncData")))
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "canToggleCloudSyncData") ^ 1;
        if (v12 == 2)
          v16 = 1;
        else
          v16 = v15;
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v16);

      }
      else
      {
        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewModel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v17, "canToggleCloudSyncData") ^ 1);

      }
    }
    else
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isCloudSyncEnabled")))
        goto LABEL_13;
      -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v13, 1);
    }

    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  -[STCloudSyncDataGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
LABEL_13:

}

- (void)setCloudSyncData:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPasscodeEnabled")
    && (objc_msgSend(v8, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__STCloudSyncDataGroupSpecifierProvider_setCloudSyncData_specifier___block_invoke;
    v9[3] = &unk_24DB864E8;
    v9[4] = self;
    v10 = v6;
    -[STGroupSpecifierProvider showPINSheet:completion:](self, "showPINSheet:completion:", v7, v9);

  }
  else
  {
    -[STCloudSyncDataGroupSpecifierProvider changeCloudSyncData:](self, "changeCloudSyncData:", objc_msgSend(v6, "BOOLValue"));
  }

}

void __68__STCloudSyncDataGroupSpecifierProvider_setCloudSyncData_specifier___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v2, "changeCloudSyncData:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    objc_msgSend(*(id *)(a1 + 32), "coordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasAlreadyEnteredPINForSession:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleCloudSyncDataSpecifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadSpecifier:animated:");
  }

}

- (void)changeCloudSyncData:(BOOL)a3
{
  _BOOL8 v3;
  STCloudSyncDataGroupSpecifierProvider *v5;
  _BOOL8 v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = self;
    v6 = v3;
  }
  else
  {
    if (v3)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __61__STCloudSyncDataGroupSpecifierProvider_changeCloudSyncData___block_invoke;
      v7[3] = &unk_24DB86B58;
      v7[4] = self;
      v8 = v3;
      -[STCloudSyncDataGroupSpecifierProvider performHSA2RepairIfNeeded:](self, "performHSA2RepairIfNeeded:", v7);
      return;
    }
    v5 = self;
    v6 = 0;
  }
  -[STCloudSyncDataGroupSpecifierProvider setScreenTimeSyncing:](v5, "setScreenTimeSyncing:", v6);
}

void __61__STCloudSyncDataGroupSpecifierProvider_changeCloudSyncData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleCloudSyncDataSpecifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadSpecifier:animated:", v3, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setScreenTimeSyncing:", *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)setScreenTimeSyncing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setCloudSync:withCompletion:", v3, &__block_literal_global_3);
  }
  else
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScreenTimeSyncingEnabled:completionHandler:", v3, &__block_literal_global_46);
  }

}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_cold_1();

  }
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_45_cold_1();

  }
}

- (void)performHSA2RepairIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDB9030];
  objc_msgSend(MEMORY[0x24BDB9030], "remotemanagement_mirroringContainerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke;
  v9[3] = &unk_24DB86BC0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "accountInfoWithCompletionHandler:", v9);

}

void __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject *v12;

  v5 = a3;
  if (v5)
  {
    +[STUILog persistence](STUILog, "persistence");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke_cold_1();
  }
  else if (objc_msgSend(a2, "supportsDeviceToDeviceEncryption"))
  {
    +[STUILog persistence](STUILog, "persistence");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_INFO, "Not performing HSA2 repair because device is already ready", (uint8_t *)v10, 2u);
    }

    v6 = *(id *)(a1 + 40);
    if (v6)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        ((void (*)(NSObject *, _QWORD))v6[2].isa)(v6, 0);
      }
      else
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __STUICallCompletionHandlerOnMainThread_block_invoke;
        v10[3] = &unk_24DB86C38;
        v9 = v6;
        v11 = 0;
        v12 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], v10);

      }
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v6 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v8, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_presentHSA2RepairUI_, v6, 0);
  }

}

- (void)presentHSA2RepairUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  STSpinnerViewController *v11;
  NSObject *v12;
  id v13;
  STSpinnerViewController *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  STSpinnerViewController *v18;
  STCloudSyncDataGroupSpecifierProvider *v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA20]), "initWithAltDSID:", v7);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CloudSyncDataFeatureName"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeatureName:", v10);

  v11 = -[STSpinnerViewController initWithNibName:bundle:]([STSpinnerViewController alloc], "initWithNibName:bundle:", 0, 0);
  +[STUILog persistence](STUILog, "persistence");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, v12, OS_LOG_TYPE_DEFAULT, "Performing HSA2 repair", buf, 2u);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke;
  v16[3] = &unk_24DB86C10;
  v17 = v8;
  v18 = v11;
  v19 = self;
  v20 = v4;
  v13 = v4;
  v14 = v11;
  v15 = v8;
  -[STGroupSpecifierProvider presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, v16);

}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setPresentingViewController:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", *(_QWORD *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2;
  v5[3] = &unk_24DB86BE8;
  v4 = *(int8x16_t *)(a1 + 40);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v5);

}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:", 1);
  if (v4)
  {
    +[STUILog persistence](STUILog, "persistence");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)cloudSyncData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isCloudSyncEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[STCloudSyncDataGroupSpecifierProvider toggleCloudSyncDataSpecifier](self, "toggleCloudSyncDataSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A18]);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  -[STCloudSyncDataGroupSpecifierProvider _updateEnabledValue](self, "_updateEnabledValue", a3, a4);
  -[STCloudSyncDataGroupSpecifierProvider toggleCloudSyncDataSpecifier](self, "toggleCloudSyncDataSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 1);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canToggleCloudSyncData") ^ 1;
    if (v7 == 2)
      v10 = 1;
    else
      v10 = v9;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v10);

  }
}

- (PSSpecifier)toggleCloudSyncDataSpecifier
{
  return self->_toggleCloudSyncDataSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleCloudSyncDataSpecifier, 0);
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to enabled cloud sync: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "failed to toggle screen time syncing: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Failed to fetch CloudKit account: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_219AB4000, v0, OS_LOG_TYPE_ERROR, "Failed to perform HSA2 repair: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
