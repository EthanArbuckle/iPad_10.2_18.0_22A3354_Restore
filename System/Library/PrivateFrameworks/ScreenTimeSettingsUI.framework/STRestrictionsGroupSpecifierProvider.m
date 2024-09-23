@implementation STRestrictionsGroupSpecifierProvider

- (STRestrictionsGroupSpecifierProvider)init
{
  STRestrictionsGroupSpecifierProvider *v2;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v15, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RestrictionsGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v7);

    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ContentPrivacySpecifierName"), &stru_24DB8A1D0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v2, 0, 0, objc_opt_class(), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", CFSTR("CONTENT_PRIVACY"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D50]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("CONTENT_PRIVACY"), *MEMORY[0x24BE75AC0]);
    -[STRestrictionsGroupSpecifierProvider contentPrivacyDetailText](v2, "contentPrivacyDetailText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75D28]);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("ContentPrivacy"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75AC8]);

    if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
      objc_msgSend(v9, "setButtonAction:", sel_showStoreDemoAlert);
    -[STRestrictionsGroupSpecifierProvider setContentPrivacySpecifier:](v2, "setContentPrivacySpecifier:", v9);
    objc_msgSend(v4, "addObject:", v9);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  objc_super v10;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v6 = CFSTR("viewModel.isLocalOrRemotelyManagedUser");
  else
    v6 = CFSTR("viewModel.screenTimeEnabled");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v6, "STRestrictionsGroupSpecifierProviderObservationContext");
  v10.receiver = self;
  v10.super_class = (Class)STRestrictionsGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v10, sel_setCoordinator_, v4);
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictionsGroupSpecifierProvider contentPrivacySpecifier](self, "contentPrivacySpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, 0x24DB91230);

  if (_os_feature_enabled_impl())
    v9 = CFSTR("viewModel.isLocalOrRemotelyManagedUser");
  else
    v9 = CFSTR("viewModel.screenTimeEnabled");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v9, 4, "STRestrictionsGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  int v19;
  objc_super v20;

  v10 = a3;
  if (a6 == "STRestrictionsGroupSpecifierProviderObservationContext")
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl()
      && (-[STRootGroupSpecifierProvider coordinator](self, "coordinator"),
          (id)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isLocalOrRemotelyManagedUser"))))
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isLocalOrRemotelyManagedUser") ^ 1;
      if (v13 == 2)
        v17 = 1;
      else
        v17 = v16;
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v17);

    }
    else if ((_os_feature_enabled_impl() & 1) == 0
           && objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.screenTimeEnabled")))
    {
      objc_msgSend(v11, "viewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isScreenTimeEnabled");

      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v19 ^ 1u);
    }

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STRestrictionsGroupSpecifierProvider;
    -[STRestrictionsGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
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
    v8 = objc_msgSend(v7, "isLocalOrRemotelyManagedUser") ^ 1;
    if (v6 == 2)
      v9 = 1;
    else
      v9 = v8;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v9);

  }
}

- (id)contentPrivacyDetailText
{
  void *v2;
  void *v3;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AADC_ContentPrivacyDetailText"), &stru_24DB8A1D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PSSpecifier)contentPrivacySpecifier
{
  return self->_contentPrivacySpecifier;
}

- (void)setContentPrivacySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_contentPrivacySpecifier, a3);
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return self->_informativeTextGroupSpecifier;
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_contentPrivacySpecifier, 0);
}

@end
