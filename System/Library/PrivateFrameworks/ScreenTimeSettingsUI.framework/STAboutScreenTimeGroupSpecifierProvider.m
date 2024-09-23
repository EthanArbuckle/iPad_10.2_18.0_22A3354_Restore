@implementation STAboutScreenTimeGroupSpecifierProvider

- (STAboutScreenTimeGroupSpecifierProvider)init
{
  STAboutScreenTimeGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v20;
  void *v21;
  void *v23;
  objc_super v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v24, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AboutScreenTimeTitle"), &stru_24DB8A1D0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, v2, 0, 0, 0, -1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", CFSTR("ABOUT_SCREEN_TIME"));
    v23 = (void *)v5;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75D50]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("ABOUT_SCREEN_TIME"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AboutScreenTimeDetailText"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75D28]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A68]), "initWithSymbolName:bundleURL:", CFSTR("hourglass"), 0);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A50]), "initWithSystemColor:", 11);
    v26[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSymbolColors:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A50]), "initWithSystemColor:", 8);
    v25 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnclosureColors:", v13);

    objc_msgSend(v9, "setRenderingMode:", 3);
    objc_msgSend(v8, "imageForGraphicSymbolDescriptor:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", objc_msgSend(v14, "CGImage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75AC8]);
    -[STAboutScreenTimeGroupSpecifierProvider setAboutScreenTimeSpecifier:](v2, "setAboutScreenTimeSpecifier:", v6);
    v16 = v4;
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v17, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    if ((_DWORD)v5 == 2)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ScreenTimeRestrictedFooterText"), &stru_24DB8A1D0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[STGroupSpecifierProvider groupSpecifier](v2, "groupSpecifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A68]);

      }
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
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
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled"), "STAboutScreenTimeGroupSpecifierObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled"), 4, "STAboutScreenTimeGroupSpecifierObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  objc_super v17;

  if (a6 == "STAboutScreenTimeGroupSpecifierObservationContext")
  {
    v11 = (void *)MEMORY[0x24BE63CB0];
    v12 = a3;
    objc_msgSend(v11, "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v12, "isEqualToString:", CFSTR("viewModel.isLocalOrRemotelyManagedUserWithScreenTimeDisabled"));

    if ((_DWORD)v13)
    {
      if (v14 == 2)
      {
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 0);
      }
      else
      {
        objc_msgSend(v16, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v15, "isLocalOrRemotelyManagedUserWithScreenTimeDisabled") ^ 1);

      }
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
    v10 = a3;
    -[STAboutScreenTimeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);

  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  id v13;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

  if (v6 == 2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ScreenTimeRestrictedFooterText"), &stru_24DB8A1D0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75A68];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 1;
  else
    v11 = v13 == 0;
  if (!v11 || (v10 ? (v12 = v13 == 0) : (v12 = 0), v12))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v9);
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v8, 1);
  }

}

- (BOOL)isHidden
{
  objc_super v4;

  if (!_os_feature_enabled_impl())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STAboutScreenTimeGroupSpecifierProvider;
  return -[STGroupSpecifierProvider isHidden](&v4, sel_isHidden);
}

- (PSSpecifier)aboutScreenTimeSpecifier
{
  return self->_aboutScreenTimeSpecifier;
}

- (void)setAboutScreenTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_aboutScreenTimeSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutScreenTimeSpecifier, 0);
}

@end
