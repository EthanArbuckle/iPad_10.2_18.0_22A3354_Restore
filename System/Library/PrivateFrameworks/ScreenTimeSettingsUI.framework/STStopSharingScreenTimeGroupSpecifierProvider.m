@implementation STStopSharingScreenTimeGroupSpecifierProvider

- (STStopSharingScreenTimeGroupSpecifierProvider)init
{
  STStopSharingScreenTimeGroupSpecifierProvider *v2;
  STStopSharingScreenTimeGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StopSharingScreenTimeButtonName"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "deleteButtonSpecifierWithName:target:action:", v5, v3, sel_confirmStopSharingScreenTime_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v6, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75C60]);

      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24DBBECB8, *MEMORY[0x24BE75E18]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24DBBECD0, *MEMORY[0x24BE75860]);
    -[STStopSharingScreenTimeGroupSpecifierProvider setStopSharingScreenTimeSpecifier:](v3, "setStopSharingScreenTimeSpecifier:", v6);
    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerObserver:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
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
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canStopSharingScreenTime"), CFSTR("STStopSharingScreenTimeGroupSpecifierProviderObservationContext"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.me.isRemoteUser"), CFSTR("STStopSharingScreenTimeGroupSpecifierProviderObservationContext"));
  v6.receiver = self;
  v6.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canStopSharingScreenTime"), 4, CFSTR("STStopSharingScreenTimeGroupSpecifierProviderObservationContext"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.me.isRemoteUser"), 4, CFSTR("STStopSharingScreenTimeGroupSpecifierProviderObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  if (a6 == CFSTR("STStopSharingScreenTimeGroupSpecifierProviderObservationContext"))
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.canStopSharingScreenTime"));
    v12 = _os_feature_enabled_impl();
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "canStopSharingScreenTime") ^ 1;
        if (v14 == 2)
          v18 = 1;
        else
          v18 = v17;
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v18);

      }
      else
      {
        -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v19, "canStopSharingScreenTime") ^ 1);

      }
    }
    else if (v12)
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.me.isRemoteUser")))
        -[STStopSharingScreenTimeGroupSpecifierProvider updateStopSharingScreenTimeSpecifier](self, "updateStopSharingScreenTimeSpecifier");
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
    -[STStopSharingScreenTimeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canStopSharingScreenTime") ^ 1;
    if (v6 == 2)
      v9 = 1;
    else
      v9 = v8;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v9);

  }
}

- (void)confirmStopSharingScreenTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = (void *)objc_opt_new();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = *MEMORY[0x24BE75990];
    -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeButtonName](self, "stopSharingScreenTimeButtonName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v22[1] = *MEMORY[0x24BE75988];
    -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeConfirmationPrompt](self, "stopSharingScreenTimeConfirmationPrompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v8;
    v22[2] = *MEMORY[0x24BE75980];
    -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeButtonName](self, "stopSharingScreenTimeButtonName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v9;
    v22[3] = *MEMORY[0x24BE75970];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setupWithDictionary:", v11);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
    objc_msgSend(v5, "setTarget:", self);
    objc_msgSend(v5, "setConfirmationAction:", sel_disableManagement_);
    -[STGroupSpecifierProvider showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v5);
  }
  else
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "sf_isiPad");

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StopSharingScreenTimeButtonName"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __78__STStopSharingScreenTimeGroupSpecifierProvider_confirmStopSharingScreenTime___block_invoke;
    v20[3] = &unk_24DB868F8;
    v20[4] = self;
    v21 = v4;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v16);

    v17 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v19);

    -[STGroupSpecifierProvider presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

uint64_t __78__STStopSharingScreenTimeGroupSpecifierProvider_confirmStopSharingScreenTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disableScreenTime:", *(_QWORD *)(a1 + 40));
}

- (id)stopSharingScreenTimeConfirmationPrompt
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
    v14 = CFSTR("StopSharingScreenTimeFooterText");
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
    v14 = CFSTR("StopSharingScreenTimeRemoteGenericFooterText");
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
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StopSharingScreenTimeRemoteFooterText"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (void)updateStopSharingScreenTimeSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeSpecifier](self, "stopSharingScreenTimeSpecifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRemoteUser");

  if ((v6 & 1) != 0)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75C60]);

    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DBBECB8, *MEMORY[0x24BE75E18]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
  }
  else
  {
    objc_msgSend(v15, "removePropertyForKey:", *MEMORY[0x24BE75C60]);
    objc_msgSend(v15, "removePropertyForKey:", *MEMORY[0x24BE75E18]);
    objc_msgSend(v15, "removePropertyForKey:", 0x24DB91010);
  }
  -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeButtonName](self, "stopSharingScreenTimeButtonName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v9) & 1) == 0)
    objc_msgSend(v15, "setName:", v9);
  if (_os_feature_enabled_impl())
  {
    -[STStopSharingScreenTimeGroupSpecifierProvider stopSharingScreenTimeFooterText](self, "stopSharingScreenTimeFooterText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE75A68];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v11) & 1) == 0)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);
      -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v12, 1);
    }

  }
}

- (id)stopSharingScreenTimeButtonName
{
  void *v2;
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
  const __CFString *v14;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isRemoteUser");
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) == 0)
  {
    v14 = CFSTR("StopSharingScreenTimeButtonName");
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
    v14 = CFSTR("StopSharingScreenTimeRemoteGenericButtonName");
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
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StopSharingScreenTimeRemoteButtonName"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (id)stopSharingScreenTimeFooterText
{
  void *v2;
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
  const __CFString *v14;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isRemoteUser");
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) == 0)
  {
    v14 = CFSTR("StopSharingScreenTimeFooterText");
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
    v14 = CFSTR("StopSharingScreenTimeRemoteGenericFooterText");
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
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StopSharingScreenTimeRemoteFooterText"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (void)disableManagement:(id)a3
{
  id v3;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setManagementEnabled:completionHandler:", 0, &__block_literal_global_18);

}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)disableScreenTime:(id)a3
{
  id v3;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScreenTimeEnabled:completionHandler:", 0, &__block_literal_global_51);

}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (PSSpecifier)stopSharingScreenTimeSpecifier
{
  return self->_stopSharingScreenTimeSpecifier;
}

- (void)setStopSharingScreenTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_stopSharingScreenTimeSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopSharingScreenTimeSpecifier, 0);
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "failed to set management disabled: %{public}@", a5, a6, a7, a8, 2u);
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "failed to set screen time disabled: %{public}@", a5, a6, a7, a8, 2u);
}

@end
