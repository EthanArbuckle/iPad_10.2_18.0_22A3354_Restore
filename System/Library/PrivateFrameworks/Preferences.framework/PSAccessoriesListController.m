@implementation PSAccessoriesListController

- (void)viewDidLoad
{
  NSString *v3;
  NSString *appBundleID;
  DASession *v5;
  DASession *appSession;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSAccessoriesListController;
  -[PSListController viewDidLoad](&v13, sel_viewDidLoad);
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("bundleID"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleID = self->_appBundleID;
  self->_appBundleID = v3;

  if (!self->_appSession)
  {
    v5 = (DASession *)objc_alloc_init((Class)getDADaemonSessionClass());
    appSession = self->_appSession;
    self->_appSession = v5;

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __42__PSAccessoriesListController_viewDidLoad__block_invoke;
    v10 = &unk_1E4A67D68;
    objc_copyWeak(&v11, &location);
    -[DASession setEventHandler:](self->_appSession, "setEventHandler:", &v7);
    -[DASession activate](self->_appSession, "activate", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__PSAccessoriesListController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSessionEvent:", v3);

}

- (id)specifierForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, NSClassFromString(CFSTR("ASAccessoryInfoViewController")), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  objc_msgSend(v4, "bluetoothOTAName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("cellSubtitleText"));
  }
  else
  {
    objc_msgSend(v4, "SSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("cellSubtitleText"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("cellClass"));
  objc_msgSend(v6, "setProperty:forKey:", v4, CFSTR("device"));
  objc_msgSend(v6, "setProperty:forKey:", self->_appSession, CFSTR("session"));

  return v6;
}

- (id)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("ACCESSORIES_GROUP"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_DEVICES_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sf_isiPhone");
    v9 = CFSTR("iPad");
    if (v8)
      v9 = CFSTR("iPhone");
    objc_msgSend(v5, "stringWithFormat:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("footerText"));

    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->super._specifiers;
    self->super._specifiers = v11;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "eventType");
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
    -[PSAccessoriesListController refreshDADevices](self, "refreshDADevices");
}

- (void)refreshDADevices
{
  DASession *appSession;
  _QWORD v3[5];

  appSession = self->_appSession;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke;
  v3[3] = &unk_1E4A67DB0;
  v3[4] = self;
  -[DASession getDevicesWithFlags:completionHandler:](appSession, "getDevicesWithFlags:completionHandler:", 8, v3);
}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1E4A66370;
  v10 = v6;
  v11 = v5;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _PSLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Error while trying to fetch accessories: %@", buf, 0xCu);
    }

  }
  v17 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "appAccessInfoMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1376));

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 48), "specifierForDevice:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_24);
  objc_msgSend(*(id *)(a1 + 48), "removeContiguousSpecifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1392));
  v14 = objc_msgSend(v17, "copy");
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(v15 + 1392);
  *(_QWORD *)(v15 + 1392) = v14;

  objc_msgSend(*(id *)(a1 + 48), "insertContiguousSpecifiers:afterSpecifierID:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1392), CFSTR("ACCESSORIES_GROUP"));
}

uint64_t __47__PSAccessoriesListController_refreshDADevices__block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_appSession, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end
