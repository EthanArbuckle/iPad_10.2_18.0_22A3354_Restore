@implementation STCommunicationGroupSpecifierProvider

- (STCommunicationGroupSpecifierProvider)init
{
  STCommunicationGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)STCommunicationGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v25, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);

    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsSpecifierName"), &stru_24DB8A1D0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, v2, 0, 0, 0, 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", CFSTR("COMMUNICATION_LIMITS"));
    v23 = *MEMORY[0x24BE75D50];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24);
    -[STCommunicationGroupSpecifierProvider _communicationLimitsDetailText](v2, "_communicationLimitsDetailText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE75D28];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D28]);

    v10 = objc_opt_class();
    v11 = *MEMORY[0x24BE75948];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75948]);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("Communication"), v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BE75AC8];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75AC8]);

    objc_msgSend(v7, "setControllerLoadAction:", sel__showCommunicationLimitsViewController_);
    -[STCommunicationGroupSpecifierProvider setCommunicationLimitsSpecifier:](v2, "setCommunicationLimitsSpecifier:", v7);
    objc_msgSend(v22, "addObject:", v7);
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyTitle"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationGroupSpecifierProvider _communicationSafetyDetailText](v2, "_communicationSafetyDetailText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, v2, 0, 0, 0, 2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", CFSTR("COMMUNICATION_SAFETY"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v23);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v9);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("COMMUNICATION_SAFETY"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_opt_class(), v11);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("CommunicationSafety"), v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v14);

    objc_msgSend(v17, "setControllerLoadAction:", sel_showCommunicationSafetyViewController_);
    -[STCommunicationGroupSpecifierProvider setCommunicationSafetySpecifier:](v2, "setCommunicationSafetySpecifier:", v17);
    objc_msgSend(v22, "addObject:", v17);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCommunicationGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v6 = CFSTR("viewModel.isLocalOrRemotelyManagedUser");
  else
    v6 = CFSTR("viewModel.screenTimeEnabled");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v6, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("viewModel.me.isRemoteUser"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("viewModel.me.type"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"));
  v14.receiver = self;
  v14.super_class = (Class)STCommunicationGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v14, sel_setCoordinator_, v4);
  objc_msgSend(v5, "contentPrivacyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "communicationLimits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "communicationLimits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationGroupSpecifierProvider _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v9, v12);

  -[STCommunicationGroupSpecifierProvider _communicationSafetyDidChange](self, "_communicationSafetyDidChange");
  if (_os_feature_enabled_impl())
    v13 = CFSTR("viewModel.isLocalOrRemotelyManagedUser");
  else
    v13 = CFSTR("viewModel.screenTimeEnabled");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v13, 4, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.me.isRemoteUser"), 7, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.me.type"), 5, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 3, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"), 5, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"), 5, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled"), 5, "STCommunicationGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"), 5, "STCommunicationGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v10 = a3;
  v11 = a5;
  if (a6 == "STCommunicationGroupSpecifierProviderObservationContext")
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl()
      && objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isLocalOrRemotelyManagedUser")))
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "viewModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isLocalOrRemotelyManagedUser") & 1) != 0)
      {
        -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
          v18 = v13 == 2;
        else
          v18 = 1;
        v19 = v18;
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v19);

      }
      else
      {
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
      }

    }
    else if ((_os_feature_enabled_impl() & 1) != 0
           || !objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.screenTimeEnabled")))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.me.type")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 == v23)
        {

          v22 = 0;
        }
        -[STCommunicationGroupSpecifierProvider _userTypeDidChange:](self, "_userTypeDidChange:", objc_msgSend(v22, "unsignedIntegerValue"));
      }
      else
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.me.isRemoteUser")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 == v24)
          {

            v22 = 0;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 == v26)
          {

            v25 = 0;
          }
          -[STCommunicationGroupSpecifierProvider _isRemoteUserDidChangeFrom:to:](self, "_isRemoteUserDidChangeFrom:to:", objc_msgSend(v22, "BOOLValue"), objc_msgSend(v25, "BOOLValue"));
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits")))
          {
            if ((objc_msgSend(v10, "isEqualToString:", CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted")) & 1) != 0|| (objc_msgSend(v10, "isEqualToString:", CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted")) & 1) != 0|| (objc_msgSend(v10, "isEqualToString:", CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled")) & 1) != 0|| objc_msgSend(v10, "isEqualToString:", CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled")))
            {
              -[STCommunicationGroupSpecifierProvider _communicationSafetyDidChange](self, "_communicationSafetyDidChange");
            }
            goto LABEL_41;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 == v27)
          {

            v22 = 0;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 == v28)
          {

            v25 = 0;
          }
          -[STCommunicationGroupSpecifierProvider _communicationLimitsDidChangeFrom:to:](self, "_communicationLimitsDidChangeFrom:to:", v22, v25);
        }

      }
    }
    else
    {
      objc_msgSend(v14, "viewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isScreenTimeEnabled");

      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v21 ^ 1u);
    }
LABEL_41:

    goto LABEL_42;
  }
  v29.receiver = self;
  v29.super_class = (Class)STCommunicationGroupSpecifierProvider;
  -[STCommunicationGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v29, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_42:

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isLocalOrRemotelyManagedUser") & 1) != 0)
    {
      -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
        v9 = v6 == 2;
      else
        v9 = 1;
      v10 = v9;
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v10);

    }
    else
    {
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
    }

  }
}

- (void)_userTypeDidChange:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;

  if (!a3)
  {
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationGroupSpecifierProvider communicationLimitsSpecifier](self, "communicationLimitsSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isLocalOrRemotelyManagedUser") & 1) != 0)
      {
        -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          v10 = v7 == 2;
        else
          v10 = 1;
        v11 = v10;
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v11);

      }
      else
      {
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
      }

    }
    else
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isScreenTimeEnabled");

      -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
        v15 = v14 ^ 1u;
      else
        v15 = 1;
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v15);
    }

  }
}

- (void)_isRemoteUserDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
    -[STCommunicationGroupSpecifierProvider _resetCommunicationLimitsDetailText](self, "_resetCommunicationLimitsDetailText");
}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 != v6 && (objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
    -[STCommunicationGroupSpecifierProvider _resetCommunicationLimitsDetailText](self, "_resetCommunicationLimitsDetailText");

}

- (void)_resetCommunicationLimitsDetailText
{
  void *v3;
  id v4;

  -[STCommunicationGroupSpecifierProvider communicationLimitsSpecifier](self, "communicationLimitsSpecifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STCommunicationGroupSpecifierProvider _communicationLimitsDetailText](self, "_communicationLimitsDetailText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75D28]);

  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 0);
}

- (id)_communicationLimitsDetailText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v11;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentPrivacyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "screenTimeCommunicationLimit") || objc_msgSend(v5, "downtimeCommunicationLimit"))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("CommunicationLimitsOnDetailText");
  }
  else if (objc_msgSend(v5, "contactManagementState") || !objc_msgSend(v5, "contactsEditable"))
  {
    v11 = objc_msgSend(v5, "contactManagementState");
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v11)
      v8 = CFSTR("CommunicationLimitsManagingContactsDetailText");
    else
      v8 = CFSTR("CommunicationLimitsContactEditingDetailText");
  }
  else
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("AADC_CommunicationLimitsDetailText");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_showCommunicationLimitsViewController:(id)a3
{
  void *v4;
  STCommunicationLimitsListController *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!-[STCommunicationGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[STCommunicationLimitsListController initWithRootViewModelCoordinator:]([STCommunicationLimitsListController alloc], "initWithRootViewModelCoordinator:", v4);
    objc_msgSend(v4, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "me");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRemoteUser");

    if (v8)
      objc_msgSend(MEMORY[0x24BDBAC78], "requestAccountSyncWithOptions:", 1);
    -[STGroupSpecifierProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsListController setParentController:](v5, "setParentController:", v9);
    objc_msgSend(v9, "rootController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationLimitsListController setRootController:](v5, "setRootController:", v10);

    -[STCommunicationLimitsListController setSpecifier:](v5, "setSpecifier:", v11);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v5, 1);

  }
}

- (void)showCommunicationSafetyViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[STCommunicationGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    v4 = (void *)objc_opt_new();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCoordinator:", v5);

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentController:", v6);
    objc_msgSend(v6, "rootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootController:", v7);

    objc_msgSend(v4, "setSpecifier:", v8);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

  }
}

- (void)_communicationSafetyDidChange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219AB4000, log, OS_LOG_TYPE_DEBUG, "Reloading Communication Safety specifier", v1, 2u);
}

- (id)_communicationSafetyDetailText
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "communicationSafetyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCommunicationSafetySendingRestricted");

  +[STUILog communicationSafety](STUILog, "communicationSafety");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[STCommunicationGroupSpecifierProvider _communicationSafetyDetailText].cold.1(v5, v6);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = CFSTR("CommunicationSafetyOnSubtitle");
  else
    v9 = CFSTR("CommunicationSafetyOffSubtitle");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)showDemoModeAlertIfNeeded
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  if (v3)
    -[STGroupSpecifierProvider showStoreDemoAlert](self, "showStoreDemoAlert");
  return v3;
}

- (PSSpecifier)communicationLimitsSpecifier
{
  return self->_communicationLimitsSpecifier;
}

- (void)setCommunicationLimitsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_communicationLimitsSpecifier, a3);
}

- (PSSpecifier)communicationSafetySpecifier
{
  return self->_communicationSafetySpecifier;
}

- (void)setCommunicationSafetySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_communicationSafetySpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationSafetySpecifier, 0);
  objc_storeStrong((id *)&self->_communicationLimitsSpecifier, 0);
}

- (void)_communicationSafetyDetailText
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
  _os_log_debug_impl(&dword_219AB4000, a2, OS_LOG_TYPE_DEBUG, "Top-level specifier fetching 'communication safety sending restricted' flag from viewmodel: %@", (uint8_t *)&v4, 0xCu);

}

@end
