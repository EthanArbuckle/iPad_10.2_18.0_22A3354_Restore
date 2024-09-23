@implementation STDisableAppAndWebsiteActivityGroupSpecifierProvider

- (id)passcodeGatedDeleteButtonSpecifierWithName:(id)a3 action:(SEL)a4
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE75590], "deleteButtonSpecifierWithName:target:action:", a3, self, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v4, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24DBBE778, *MEMORY[0x24BE75E18]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24DBBE790, *MEMORY[0x24BE75860]);
  if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
    objc_msgSend(v4, "setButtonAction:", sel_showStoreDemoAlert);
  return v4;
}

- (STDisableAppAndWebsiteActivityGroupSpecifierProvider)init
{
  STDisableAppAndWebsiteActivityGroupSpecifierProvider *v2;
  STDisableAppAndWebsiteActivityGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DisableAppAndWebsiteActivityFooterText"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](v3, "groupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DisableAppAndWebsiteActivityButtonName"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDisableAppAndWebsiteActivityGroupSpecifierProvider passcodeGatedDeleteButtonSpecifierWithName:action:](v3, "passcodeGatedDeleteButtonSpecifierWithName:action:", v7, sel_confirmDisableAppAndWebsiteActivity_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDisableAppAndWebsiteActivityGroupSpecifierProvider setDisableAppAndWebsiteActivitySpecifier:](v3, "setDisableAppAndWebsiteActivitySpecifier:", v8);

    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDisableAppAndWebsiteActivityGroupSpecifierProvider disableAppAndWebsiteActivitySpecifier](v3, "disableAppAndWebsiteActivitySpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v4)
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canStopScreenTime"), "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext");
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canStopScreenTimeWithoutPasscode"), "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext");
    v7.receiver = self;
    v7.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
    -[STRootGroupSpecifierProvider setCoordinator:](&v7, sel_setCoordinator_, v4);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canStopScreenTime"), 4, "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext");
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canStopScreenTimeWithoutPasscode"), 4, "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v10 = a3;
  if (a6 == "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext")
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canStopScreenTime"));
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v14, "canStopScreenTime") ^ 1);

    }
    else
    {

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canStopScreenTimeWithoutPasscode")))
        -[STDisableAppAndWebsiteActivityGroupSpecifierProvider updateDisableAppAndWebsiteActivitySpecifier](self, "updateDisableAppAndWebsiteActivitySpecifier");
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
    -[STDisableAppAndWebsiteActivityGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)confirmDisableAppAndWebsiteActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x24BE75990];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DisableAppAndWebsiteActivityButtonName"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x24BE75988];
  -[STDisableAppAndWebsiteActivityGroupSpecifierProvider disableAppAndWebsiteActivityConfirmationPrompt](self, "disableAppAndWebsiteActivityConfirmationPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = *MEMORY[0x24BE75980];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DisableAppAndWebsiteActivityButtonName"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  v11[3] = *MEMORY[0x24BE75970];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupWithDictionary:", v10);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v4, "setTarget:", self);
  objc_msgSend(v4, "setConfirmationAction:", sel_disableAppAndWebsiteActivity_);
  -[STGroupSpecifierProvider showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v4);

}

- (void)updateDisableAppAndWebsiteActivitySpecifier
{
  void *v3;
  void *v4;
  int v5;
  objc_class *v6;
  void *v7;
  id v8;

  -[STDisableAppAndWebsiteActivityGroupSpecifierProvider disableAppAndWebsiteActivitySpecifier](self, "disableAppAndWebsiteActivitySpecifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canStopScreenTimeWithoutPasscode");

  if (v5)
  {
    objc_msgSend(v8, "removePropertyForKey:", *MEMORY[0x24BE75C60]);
    objc_msgSend(v8, "removePropertyForKey:", *MEMORY[0x24BE75E18]);
    objc_msgSend(v8, "removePropertyForKey:", 0x24DB91010);
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75C60]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24DBBE778, *MEMORY[0x24BE75E18]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  }

}

- (id)disableAppAndWebsiteActivityConfirmationPrompt
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
  const __CFString *v14;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isRemoteUser") & 1) == 0)
  {
    v14 = CFSTR("DisableAppAndWebsiteActivityConfirmPrompt");
LABEL_8:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v14, &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v14 = CFSTR("DisableAppAndWebsiteActivityRemoteGenericConfirmPrompt");
    goto LABEL_8;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personNameComponentsFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_7;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DisableAppAndWebsiteActivityRemoteConfirmPrompt"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (void)disableAppAndWebsiteActivity:(id)a3
{
  id v3;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScreenTimeEnabled:completionHandler:", 0, &__block_literal_global_4);

}

void __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke_cold_1((uint64_t)v2, v3);

  }
}

- (BOOL)isHidden
{
  objc_super v4;

  if (!_os_feature_enabled_impl())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
  return -[STGroupSpecifierProvider isHidden](&v4, sel_isHidden);
}

- (PSSpecifier)disableAppAndWebsiteActivitySpecifier
{
  return self->_disableAppAndWebsiteActivitySpecifier;
}

- (void)setDisableAppAndWebsiteActivitySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_disableAppAndWebsiteActivitySpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableAppAndWebsiteActivitySpecifier, 0);
}

void __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "failed to set screen time disabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
