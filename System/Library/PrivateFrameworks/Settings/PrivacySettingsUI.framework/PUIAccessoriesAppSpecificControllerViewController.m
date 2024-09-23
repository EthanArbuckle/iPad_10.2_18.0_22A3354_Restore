@implementation PUIAccessoriesAppSpecificControllerViewController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = (int)*MEMORY[0x1E0D80590];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("ACCESSORIES_GROUP"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    return v4;
  }
  else
  {
    _PUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", v10, 2u);
    }

    return MEMORY[0x1E0C9AA60];
  }
}

- (void)viewDidLoad
{
  NSString *v3;
  NSString *appBundleID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUIAccessoriesAppSpecificControllerViewController;
  -[PUIAccessoriesAppSpecificControllerViewController viewDidLoad](&v12, sel_viewDidLoad);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "propertyForKey:", CFSTR("bundleID"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    appBundleID = self->_appBundleID;
    self->_appBundleID = v3;

    -[PUIAccessoriesAppSpecificControllerViewController session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[PUIAccessoriesAppSpecificControllerViewController setSession:](self, "setSession:", v6);

      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v10, &location);
      -[PUIAccessoriesAppSpecificControllerViewController session](self, "session", v9, 3221225472, __64__PUIAccessoriesAppSpecificControllerViewController_viewDidLoad__block_invoke, &unk_1EA26BE40);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEventHandler:", &v9);

      -[PUIAccessoriesAppSpecificControllerViewController session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activate");

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PUIAccessoriesAppSpecificControllerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSessionEvent:", v3);

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifierForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, NSClassFromString(CFSTR("ASAccessoryInfoViewController")), 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v8);

  objc_msgSend(v4, "bluetoothOTAName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D80950]);
  }
  else
  {
    objc_msgSend(v4, "SSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D80950]);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v7, "setProperty:forKey:", v4, CFSTR("device"));
  objc_msgSend(v7, "setProperty:forKey:", self->_session, CFSTR("session"));

  return v7;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "eventType");
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
    -[PUIAccessoriesAppSpecificControllerViewController refreshDADevices](self, "refreshDADevices");
}

- (void)refreshDADevices
{
  void *v3;
  _QWORD v4[5];

  -[PUIAccessoriesAppSpecificControllerViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke;
  v4[3] = &unk_1EA26BE88;
  v4[4] = self;
  objc_msgSend(v3, "getDevicesWithFlags:completionHandler:", 8, v4);

}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v10 = v6;
  v11 = v5;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _PUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2_cold_1(v2, v3);

  }
  v19 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "appAccessInfoMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1376));

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 48), "specifierForDevice:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global_20);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(v14, "accessorySpecifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeContiguousSpecifiers:", v15);

  v16 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(*(id *)(a1 + 48), "setAccessorySpecifiers:", v16);

  v17 = *(void **)(a1 + 48);
  objc_msgSend(v17, "accessorySpecifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertContiguousSpecifiers:afterSpecifierID:", v18, CFSTR("ACCESSORIES_GROUP"));

}

uint64_t __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_16(uint64_t a1, void *a2, void *a3)
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

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleID, a3);
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSArray)accessorySpecifiers
{
  return self->_accessorySpecifiers;
}

- (void)setAccessorySpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

void __69__PUIAccessoriesAppSpecificControllerViewController_refreshDADevices__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[PUIAccessoriesAppSpecificControllerViewController refreshDADevices]_block_invoke_2";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "%s: Error getting devices: %@", (uint8_t *)&v3, 0x16u);
}

@end
