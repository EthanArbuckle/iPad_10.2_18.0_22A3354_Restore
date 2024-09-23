@implementation STEyeReliefListController

- (STEyeReliefListController)init
{
  STEyeReliefListController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefListController;
  v2 = -[STPINListViewController init](&v6, sel_init);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceViewControllerTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STEyeReliefListController setTitle:](v2, "setTitle:", v4);

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STEyeReliefListController setCoordinator:](self, "setCoordinator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STEyeReliefListController;
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
  v16.super_class = (Class)STEyeReliefListController;
  -[STPINListViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/EYE_DISTANCE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenDistanceViewControllerTitle"), CFSTR("Localizable"), v6, v8);

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
  -[STEyeReliefListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("eyeReliefCoordinator.viewModel.isEyeReliefEnabled"), "STEyeReliefListControllerObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefListController;
  -[STPINListViewController setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("eyeReliefCoordinator.viewModel.isEyeReliefEnabled"), 3, "STEyeReliefListControllerObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  if (a6 == "STEyeReliefListControllerObservationContext")
  {
    v11 = *MEMORY[0x24BDD0E80];
    v12 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = objc_msgSend(v14, "BOOLValue");
    if ((_DWORD)v12 != objc_msgSend(v13, "BOOLValue"))
      -[STEyeReliefListController reloadSpecifiers](self, "reloadSpecifiers");

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STEyeReliefListController;
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
  objc_class *v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[STEyeReliefListController _createEnableScreenDistanceGroupSpecifier](self, "_createEnableScreenDistanceGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[STEyeReliefListController _createEnableScreenDistanceSpecifer](self, "_createEnableScreenDistanceSpecifer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STEyeReliefListController setEnableScreenDistanceSpecifier:](self, "setEnableScreenDistanceSpecifier:", v7);

    -[STEyeReliefListController enableScreenDistanceSpecifier](self, "enableScreenDistanceSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v9 = (objc_class *)objc_msgSend(v5, "copy");
    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_createEnableScreenDistanceGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ScreenDistanceEnableFeatureGroupSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEnableFeatureGroupSpecifierFooterText"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75A68]);

  return v3;
}

- (id)_createEnableScreenDistanceSpecifer
{
  void *v3;
  void *v4;
  void *v5;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceEnableFeatureSpecifierTitle"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setScreenDistance_specifier_, sel__checkScreenDistanceState_, 0, 6, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController setUpPasscodeAndLineWrapBehaviorForSpecifier:](self, "setUpPasscodeAndLineWrapBehaviorForSpecifier:", v5);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91030);

  return v5;
}

- (void)_setScreenDistance:(id)a3 specifier:(id)a4
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
    -[STEyeReliefListController _setScreenDistance:](self, "_setScreenDistance:", v7);
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__STEyeReliefListController__setScreenDistance_specifier___block_invoke;
  v12[3] = &unk_24DB86A90;
  v12[4] = self;
  v14 = v7;
  v13 = v6;
  -[STPINListViewController showPINSheet:completion:](self, "showPINSheet:completion:", v13, v12);

LABEL_6:
}

uint64_t __58__STEyeReliefListController__setScreenDistance_specifier___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_setScreenDistance:", *(unsigned __int8 *)(a1 + 48));
  else
    return objc_msgSend(v3, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_setScreenDistance:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  v3 = a3;
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STEyeReliefListController _setScreenDistance:].cold.1(v3, v5);

  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eyeReliefCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__STEyeReliefListController__setScreenDistance___block_invoke;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v9 = v3;
  objc_msgSend(v7, "persistEyeReliefState:withCompletionHandler:", v3, v8);

}

void __48__STEyeReliefListController__setScreenDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v3 = a2;
  if (v3)
  {
    +[STUILog eyeRelief](STUILog, "eyeRelief");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v14 = objc_msgSend(v11, "saveContext:error:", v13, &v24);
      v15 = v24;

      if ((v14 & 1) == 0)
      {
        +[STUILog eyeRelief](STUILog, "eyeRelief");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

      }
    }
    v23 = (void *)MEMORY[0x24BE84558];
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE84598]), "initWithEyeReliefEnabled:", *(unsigned __int8 *)(a1 + 32));
    objc_msgSend(v23, "reportEvent:", v4);
  }

}

- (id)_checkScreenDistanceState:(id)a3
{
  _BOOL8 v3;
  NSObject *v4;

  v3 = -[STEyeReliefListController _isScreenDistanceEnabled](self, "_isScreenDistanceEnabled", a3);
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[STEyeReliefListController _checkScreenDistanceState:].cold.1(v3, v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isScreenDistanceEnabled
{
  void *v2;
  void *v3;
  void *v4;

  -[STPINListViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eyeReliefCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isEyeReliefEnabled");
  return (char)v2;
}

- (PSSpecifier)enableScreenDistanceSpecifier
{
  return self->_enableScreenDistanceSpecifier;
}

- (void)setEnableScreenDistanceSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_enableScreenDistanceSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableScreenDistanceSpecifier, 0);
}

- (void)_setScreenDistance:(char)a1 .cold.1(char a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_219AB4000, a2, OS_LOG_TYPE_DEBUG, "Setting Eye Distance on viewModel: %@", (uint8_t *)&v4, 0xCu);

}

void __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Error saving managed object contet: %@", a5, a6, a7, a8, 2u);
}

void __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Could not save Eye Distance settings: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_checkScreenDistanceState:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_219AB4000, a2, OS_LOG_TYPE_DEBUG, "Fetching Eye Distance state from viewModel: %d", (uint8_t *)v2, 8u);
}

@end
