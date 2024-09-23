@implementation PUINetworkController

- (PUINetworkController)init
{
  PUINetworkController *v2;
  PUINetworkController *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  PUINetworkController *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUINetworkController;
  v2 = -[PUINetworkController init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = 0;
    -[PUINetworkController setReusesCells:](v2, "setReusesCells:", 1);
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __28__PUINetworkController_init__block_invoke;
    v13[3] = &unk_1EA26B740;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "setChangedQueue:andHandler:", v5, v13);

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __28__PUINetworkController_init__block_invoke_3;
    v11[3] = &unk_1EA26CDD8;
    objc_copyWeak(&v12, &location);
    -[PUINetworkController loadConfigurationsForceRefresh:completionHandler:](v3, "loadConfigurationsForceRefresh:completionHandler:", 0, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_dnsConfigurationChanged_, CFSTR("PUINetworkDNSChangedNotification"), 0);

    v9 = v3;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __28__PUINetworkController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PUINetworkController_init__block_invoke_2;
  v6[3] = &unk_1EA26CDD8;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "loadConfigurationsForceRefresh:completionHandler:", 1, v6);

  objc_destroyWeak(&v7);
}

void __28__PUINetworkController_init__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[1376])
    {
      WeakRetained[1376] = 0;
    }
    else
    {
      v2 = WeakRetained;
      objc_msgSend(WeakRetained, "reloadSpecifiers");
      WeakRetained = v2;
    }
  }

}

void __28__PUINetworkController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSpecifiers");
    WeakRetained = v2;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUINetworkController;
  -[PUINetworkController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUINetworkController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("LOCAL_NETWORK"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCAL_NETWORK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINetworkController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.internet-sharing"), v7, v11, v12);

}

- (void)dnsConfigurationChanged:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PUINetworkController_dnsConfigurationChanged___block_invoke;
  v5[3] = &unk_1EA26CDD8;
  objc_copyWeak(&v6, &location);
  -[PUINetworkController loadConfigurationsForceRefresh:completionHandler:](self, "loadConfigurationsForceRefresh:completionHandler:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __48__PUINetworkController_dnsConfigurationChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSpecifiers");
    WeakRetained = v2;
  }

}

- (void)saveConfiguration
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  -[PUINetworkController pathControllerConfiguration](self, "pathControllerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PUINetworkController_saveConfiguration__block_invoke;
  v6[3] = &unk_1EA26B380;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "saveConfiguration:withCompletionQueue:handler:", v4, MEMORY[0x1E0C80D38], v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.NetworkConfigChanged"), 0);

}

void __41__PUINetworkController_saveConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136446722;
      v7 = "-[PUINetworkController saveConfiguration]_block_invoke";
      v8 = 2114;
      v9 = v3;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Save error %{public}@ for %{public}@", (uint8_t *)&v6, 0x20u);
    }

  }
}

- (void)loadConfigurationsForceRefresh:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v6 = a4;
  -[PUINetworkController pathControllerConfiguration](self, "pathControllerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || v4)
  {
    objc_msgSend(MEMORY[0x1E0CD07F0], "sharedManagerForAllUsers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke;
    v14[3] = &unk_1EA26CE00;
    v14[4] = self;
    v15 = v6;
    v11 = v6;
    objc_msgSend(v10, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v14);

    v9 = v15;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke_30;
    block[3] = &unk_1EA26B718;
    v13 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = v13;
  }

}

void __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "-[PUINetworkController loadConfigurationsForceRefresh:completionHandler:]_block_invoke";
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Failed to load with error %{public}@", buf, 0x16u);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "setDnsConfigurations:", v8);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "name", (_QWORD)v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.preferences.networkprivacy")) & 1) != 0)
        {
          objc_msgSend(v14, "pathController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "setPathControllerConfiguration:", v14);
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v14, "dnsSettings");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = objc_msgSend(v14, "grade");

          if (v19 == 2)
          {
            objc_msgSend(*(id *)(a1 + 32), "dnsConfigurations");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v14);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "dnsConfigurations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "dnsConfigurations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortUsingFunction:context:", compareConfigurationNames, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__PUINetworkController_loadConfigurationsForceRefresh_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)eligibleApplications
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, _BYTE *);
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUINetworkController pathControllerConfiguration](self, "pathControllerConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "pathRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v12, "multicastPreferenceSet"))
        {
          objc_msgSend(v12, "matchSigningIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v4, "count"))
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __44__PUINetworkController_eligibleApplications__block_invoke;
    v22 = &unk_1EA26CE28;
    v23 = v4;
    v14 = v3;
    v24 = v14;
    v15 = (void *)MEMORY[0x1DF0AB308](&v19);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enumerateApplicationsOfType:block:", 0, v15);
    objc_msgSend(v16, "enumerateApplicationsOfType:block:", 1, v15);
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v14, "sortUsingFunction:context:", compareAppNames, 0);
    v17 = v14;

  }
  return v3;
}

void __44__PUINetworkController_eligibleApplications__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  *a3 = 0;

}

- (id)networkConfigurationEnabled:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PUINetworkConfigurationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dnsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEnabled"))
    v5 = CFSTR("On");
  else
    v5 = CFSTR("Off");
  PUI_LocalizedStringForPrivacy(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)specifiers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  id obj;
  void *v24;
  PUINetworkController *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v22 = (int)*MEMORY[0x1E0D80590];
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("LOCAL_NETWORK_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x1E0D80848]);

    v24 = v4;
    v21 = v5;
    objc_msgSend(v4, "addObject:", v5);
    v25 = self;
    -[PUINetworkController eligibleApplications](self, "eligibleApplications");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      v10 = *MEMORY[0x1E0D808D0];
      v11 = *MEMORY[0x1E0D808C0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v13, "localizedName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, v25, sel_setLocalNetworkEnabled_specifier_, sel_isLocalNetworkEnabled_, objc_opt_class(), 6, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setProperty:forKey:", v18, v10);

          objc_msgSend(v17, "setProperty:forKey:", v14, v11);
          objc_msgSend(v17, "setProperty:forKey:", v14, CFSTR("PUINetworkApplicationKey"));
          objc_msgSend(v24, "addObject:", v17);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }
    v19 = *(Class *)((char *)&v25->super.super.super.super.super.isa + v22);
    *(Class *)((char *)&v25->super.super.super.super.super.isa + v22) = (Class)v24;

    v3 = *(Class *)((char *)&v25->super.super.super.super.super.isa + v22);
  }
  return v3;
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUINetworkController pathControllerConfiguration](self, "pathControllerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "pathRules", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "matchSigningIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
        {
          v17 = v14;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (v4)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0838]), "initWithSigningIdentifier:", v6);
    objc_msgSend(v8, "pathRules");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "pathRules");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPathRules:", v19);

    }
    else
    {
      v25 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPathRules:", v9);
    }
LABEL_13:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("PUINetworkApplicationKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUINetworkController pathRuleForBundleID:create:](self, "pathRuleForBundleID:create:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v7, "setDenyMulticast:", v8 ^ 1u);
  objc_msgSend(v7, "setMulticastPreferenceSet:", 1);
  -[PUINetworkController saveConfiguration](self, "saveConfiguration");
  self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = 1;

}

- (id)isLocalNetworkEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PUINetworkApplicationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINetworkController pathRuleForBundleID:create:](self, "pathRuleForBundleID:create:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v5, "denyMulticast") ^ 1);

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUINetworkController;
  -[PUINetworkController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (NEConfiguration)pathControllerConfiguration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setPathControllerConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (NSMutableArray)dnsConfigurations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setDnsConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (BOOL)isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle
{
  return self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle;
}

- (void)setIsWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle:(BOOL)a3
{
  self->_isWaitingForNetworkConfigurationDidChangeInResponseToUserInteractionWithToggle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsConfigurations, 0);
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
}

@end
