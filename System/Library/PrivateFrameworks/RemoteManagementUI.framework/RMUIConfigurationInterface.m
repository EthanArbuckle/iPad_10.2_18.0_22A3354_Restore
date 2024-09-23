@implementation RMUIConfigurationInterface

- (RMUIConfigurationInterface)initWithScope:(int64_t)a3
{
  RMUIConfigurationInterface *v4;
  void *v5;
  RMUILegacyProfilesViewModelProvider *v6;
  RMUILegacyProfilesViewModelProvider *legacyProfilesProvider;
  uint64_t v8;
  RMUIPluginViewModelProvider *pluginProvider;
  NSArray *privProfileViewModels;
  NSArray *v11;
  NSArray *privPluginSectionViewModels;
  NSArray *privPluginViewModels;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RMUIConfigurationInterface;
  v4 = -[RMUIConfigurationInterface init](&v15, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_reloadNotificationPosted_, *MEMORY[0x24BE7EC88], 0);

    v4->_scope = a3;
    v6 = -[RMUILegacyProfilesViewModelProvider initWithScope:]([RMUILegacyProfilesViewModelProvider alloc], "initWithScope:", -[RMUIConfigurationInterface _rmStoreScope](v4, "_rmStoreScope"));
    legacyProfilesProvider = v4->_legacyProfilesProvider;
    v4->_legacyProfilesProvider = v6;

    v8 = objc_opt_new();
    pluginProvider = v4->_pluginProvider;
    v4->_pluginProvider = (RMUIPluginViewModelProvider *)v8;

    privProfileViewModels = v4->_privProfileViewModels;
    v11 = (NSArray *)MEMORY[0x24BDBD1A8];
    v4->_privProfileViewModels = (NSArray *)MEMORY[0x24BDBD1A8];

    privPluginSectionViewModels = v4->_privPluginSectionViewModels;
    v4->_privPluginSectionViewModels = v11;

    privPluginViewModels = v4->_privPluginViewModels;
    v4->_privPluginViewModels = v11;

  }
  return v4;
}

- (RMUIConfigurationInterface)initWithStore:(id)a3
{
  id v5;
  RMUIConfigurationInterface *v6;
  RMUIConfigurationInterface *v7;

  v5 = a3;
  v6 = -[RMUIConfigurationInterface initWithScope:](self, "initWithScope:", objc_msgSend(v5, "scope"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observerStore, a3);
    -[RMUILegacyProfilesViewModelProvider setObserverStore:](v7->_legacyProfilesProvider, "setObserverStore:", v5);
    -[RMUIPluginViewModelProvider setObserverStore:](v7->_pluginProvider, "setObserverStore:", v5);
    -[RMUIConfigurationInterface reloadNotificationPosted:](v7, "reloadNotificationPosted:", 0);
  }

  return v7;
}

- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4
{
  return -[RMUIConfigurationInterface initWithAccount:scope:initialLoad:](self, "initWithAccount:scope:initialLoad:", a3, a4, 1);
}

- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  RMUIConfigurationInterface *v10;
  RMUIConfigurationInterface *v11;

  v5 = a5;
  v9 = a3;
  v10 = -[RMUIConfigurationInterface initWithScope:](self, "initWithScope:", a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rmAccount, a3);
    if (v5)
      -[RMUIConfigurationInterface reloadNotificationPosted:](v11, "reloadNotificationPosted:", 0);
  }

  return v11;
}

- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  return -[RMUIConfigurationInterface initWithMDMProfileIdentifier:scope:initialLoad:](self, "initWithMDMProfileIdentifier:scope:initialLoad:", a3, a4, 1);
}

- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  RMUIConfigurationInterface *v10;
  RMUIConfigurationInterface *v11;

  v5 = a5;
  v9 = a3;
  v10 = -[RMUIConfigurationInterface initWithScope:](self, "initWithScope:", a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mdmProfileIdentifier, a3);
    if (v5)
      -[RMUIConfigurationInterface reloadNotificationPosted:](v11, "reloadNotificationPosted:", 0);
  }

  return v11;
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4
{
  return -[RMUIConfigurationInterface initWithDeclarationsPayloadIdentifier:scope:initialLoad:](self, "initWithDeclarationsPayloadIdentifier:scope:initialLoad:", a3, a4, 1);
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  RMUIConfigurationInterface *v11;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RMUIConfigurationInterface initWithDeclarationsPayloadIdentifiers:scope:initialLoad:](self, "initWithDeclarationsPayloadIdentifiers:scope:initialLoad:", v10, a4, v5, v13, v14);
  return v11;
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifiers:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  RMUIConfigurationInterface *v10;
  RMUIConfigurationInterface *v11;

  v5 = a5;
  v9 = a3;
  v10 = -[RMUIConfigurationInterface initWithScope:](self, "initWithScope:", a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_declarationsPayloadIdentifiers, a3);
    if (v5)
      -[RMUIConfigurationInterface reloadNotificationPosted:](v11, "reloadNotificationPosted:", 0);
  }

  return v11;
}

- (id)initForTest:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMUIConfigurationInterface;
  result = -[RMUIConfigurationInterface init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (id)viewModels
{
  void *v3;
  id v4;
  NSArray *privProfileViewModels;
  void *v6;
  void *v7;
  RMUIConfigurationViewModels *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__RMUIConfigurationInterface_viewModels__block_invoke;
  v10[3] = &unk_24DA084E0;
  v11 = v3;
  v4 = v3;
  -[RMUIConfigurationInterface refreshWithCompletion:](self, "refreshWithCompletion:", v10);
  objc_msgSend(v4, "waitForCompletion");
  privProfileViewModels = self->_privProfileViewModels;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](privProfileViewModels, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RMUIConfigurationViewModels initWithProfileViewModels:pluginSectionViewModels:pluginViewModels:]([RMUIConfigurationViewModels alloc], "initWithProfileViewModels:pluginSectionViewModels:pluginViewModels:", v7, self->_privPluginSectionViewModels, self->_privPluginViewModels);
  return v8;
}

uint64_t __40__RMUIConfigurationInterface_viewModels__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

uint64_t __40__RMUIConfigurationInterface_viewModels__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInteractiveProfile") ^ 1;
}

- (int64_t)_rmManagementScope
{
  return -[RMUIConfigurationInterface scope](self, "scope") != 0;
}

- (int64_t)_rmStoreScope
{
  return -[RMUIConfigurationInterface scope](self, "scope") != 0;
}

- (NSString)scopeHeading
{
  if (-[RMUIConfigurationInterface scope](self, "scope"))
    return (NSString *)CFSTR("Device Declarations");
  else
    return (NSString *)CFSTR("User Declarations");
}

- (NSString)profileDeclarationsHeading
{
  return (NSString *)CFSTR("Profiles");
}

- (id)accountDeclarationsHeading
{
  return CFSTR("Account");
}

- (NSString)pluginDeclarationsHeading
{
  return (NSString *)CFSTR("Declarations");
}

- (void)_reloadUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RMUIConfigurationInterface__reloadUIWithCompletion___block_invoke;
  block[3] = &unk_24DA08548;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__RMUIConfigurationInterface__reloadUIWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v22 = WeakRetained;
    objc_msgSend(WeakRetained, "observerStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v22, "legacyProfilesProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "profileViewModels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");

      objc_msgSend(v22, "pluginProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pluginSectionViewModels");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAllObjects");

      objc_msgSend(v22, "pluginProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pluginViewModels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

    }
    objc_msgSend(v22, "willChangeValueForKey:", CFSTR("profileViewModels"));
    objc_msgSend(v22, "legacyProfilesProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "profileViewModels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v22, "setPrivProfileViewModels:", v13);

    objc_msgSend(v22, "didChangeValueForKey:", CFSTR("profileViewModels"));
    objc_msgSend(v22, "willChangeValueForKey:", CFSTR("pluginSectionViewModels"));
    objc_msgSend(v22, "pluginProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pluginSectionViewModels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v22, "setPrivPluginSectionViewModels:", v16);

    objc_msgSend(v22, "didChangeValueForKey:", CFSTR("pluginSectionViewModels"));
    objc_msgSend(v22, "willChangeValueForKey:", CFSTR("pluginViewModels"));
    objc_msgSend(v22, "pluginProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pluginViewModels");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v22, "setPrivPluginViewModels:", v19);

    objc_msgSend(v22, "didChangeValueForKey:", CFSTR("pluginViewModels"));
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("RMUIConfigurationsDidChangeNotification"), 0);

    v21 = *(_QWORD *)(a1 + 32);
    v3 = v22;
    if (v21)
    {
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
      v3 = v22;
    }
  }

}

- (void)_reloadViewModelsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[RMUIConfigurationInterface legacyProfilesProvider](self, "legacyProfilesProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke;
  v16[3] = &unk_24DA084E0;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "loadProfilesFromConfigurationsWithCompletionHandler:", v16);

  dispatch_group_enter(v8);
  -[RMUIConfigurationInterface pluginProvider](self, "pluginProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_2;
  v14[3] = &unk_24DA084E0;
  v15 = v8;
  v10 = v8;
  objc_msgSend(v9, "loadPluginsFromConfigurationsWithCompletionHandler:", v14);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_3;
  v12[3] = &unk_24DA08570;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], v12);

}

void __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUIWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)refreshWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RMUIConfigurationInterface observerStore](self, "observerStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_3;
  }
  -[RMUIConfigurationInterface mdmProfileIdentifier](self, "mdmProfileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[RMUIConfigurationInterface rmAccount](self, "rmAccount"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    -[RMUIConfigurationInterface _loadObserverStoreWithCompletion:](self, "_loadObserverStoreWithCompletion:", v9);
    goto LABEL_9;
  }
  -[RMUIConfigurationInterface declarationsPayloadIdentifiers](self, "declarationsPayloadIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_8;
LABEL_3:
  -[RMUIConfigurationInterface observerStore](self, "observerStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5)
  {
    -[RMUIConfigurationInterface _reloadViewModelsWithCompletion:](self, "_reloadViewModelsWithCompletion:", v9);
LABEL_9:
    v6 = v9;
  }

}

- (void)reloadNotificationPosted:(id)a3
{
  -[RMUIConfigurationInterface refreshWithCompletion:](self, "refreshWithCompletion:", 0);
}

- (void)_loadObserverStoreWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RMUIConfigurationInterface declarationsPayloadIdentifiers](self, "declarationsPayloadIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[RMUIConfigurationInterface _loadObserverStoreForDeclarationsPayloadWithCompletion:](self, "_loadObserverStoreForDeclarationsPayloadWithCompletion:", v5);
  else
    -[RMUIConfigurationInterface _loadObserverStoreForDDMWithCompletion:](self, "_loadObserverStoreForDDMWithCompletion:", v5);

}

- (void)_loadObserverStoreForDDMWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE7EB28], "isActiveForScope:", -[RMUIConfigurationInterface _rmManagementScope](self, "_rmManagementScope")) & 1) != 0)
  {
    -[RMUIConfigurationInterface mdmProfileIdentifier](self, "mdmProfileIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[RMUIConfigurationInterface rmAccount](self, "rmAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dmc_managementProfileIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setScheme:", CFSTR("mdm"));
    objc_msgSend(v10, "setPath:", v7);
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x24BE7EC60];
    v13 = -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke;
    v16[3] = &unk_24DA08598;
    objc_copyWeak(&v20, &location);
    v14 = v7;
    v17 = v14;
    v19 = v4;
    v15 = v11;
    v18 = v15;
    objc_msgSend(v12, "storesWithScope:completionHandler:", v13, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  else
  {
    +[RMUILog configurationInterface](RMUILog, "configurationInterface");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RMUIConfigurationInterface _loadObserverStoreForDDMWithCompletion:].cold.1(v8);

    -[RMUIConfigurationInterface _reloadUIWithCompletion:](self, "_reloadUIWithCompletion:", v4);
  }

}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_21;
  if (!v5)
  {
    +[RMUILog configurationInterface](RMUILog, "configurationInterface");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_1();
LABEL_20:

    objc_msgSend(WeakRetained, "_reloadUIWithCompletion:", *(_QWORD *)(a1 + 48));
    goto LABEL_21;
  }
  v21 = v6;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v9)
  {
LABEL_11:

LABEL_16:
    +[RMUILog configurationInterface](RMUILog, "configurationInterface");
    v20 = objc_claimAutoreleasedReturnValue();
    v6 = v21;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_2();
    goto LABEL_20;
  }
  v10 = v9;
  v11 = *(_QWORD *)v23;
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
    objc_msgSend(v13, "enrollmentURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", *(_QWORD *)(a1 + 40));

    if ((v15 & 1) != 0)
      break;
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v16 = v13;

  if (!v16)
    goto LABEL_16;
  +[RMUILog configurationInterface](RMUILog, "configurationInterface");
  v17 = objc_claimAutoreleasedReturnValue();
  v6 = v21;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(v16, v17);

  objc_msgSend(WeakRetained, "setObserverStore:", v16);
  objc_msgSend(WeakRetained, "legacyProfilesProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObserverStore:", v16);

  objc_msgSend(WeakRetained, "pluginProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObserverStore:", v16);

  objc_msgSend(WeakRetained, "_reloadViewModelsWithCompletion:", *(_QWORD *)(a1 + 48));
LABEL_21:

}

- (void)_loadObserverStoreForDeclarationsPayloadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE7EC68], "profileStoreForOwner:scope:", *MEMORY[0x24BE7EC90], -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke;
  v8[3] = &unk_24DA085E8;
  v9 = v5;
  v10 = v4;
  v8[4] = self;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "observerStoreWithCompletionHandler:", v8);

}

void __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  +[RMUILog configurationInterface](RMUILog, "configurationInterface");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "setObserverStore:", v3);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "declarationsPayloadIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_38;
    v8[3] = &unk_24DA085C0;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "declarationIdentifiersForProfilePayloadIdentifiers:completionHandler:", v7, v8);

  }
  else
  {
    if (v5)
      __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_cold_1(a1, v4);

    objc_msgSend(*(id *)(a1 + 32), "_reloadUIWithCompletion:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "legacyProfilesProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObserverStore:", v3);

  objc_msgSend(*(id *)(a1 + 32), "legacyProfilesProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilterDeclarationIdentifiers:", v5);

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pluginProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObserverStore:", v8);

  objc_msgSend(*(id *)(a1 + 32), "pluginProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilterDeclarationIdentifiers:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_reloadViewModelsWithCompletion:", *(_QWORD *)(a1 + 48));
}

- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "toggleViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setToggleState:", v6);

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke;
  v23[3] = &unk_24DA08638;
  v11 = v8;
  v24 = v11;
  v26 = v6;
  v12 = v9;
  v25 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A22AA0](v23);
  objc_msgSend(v11, "declaration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "declarationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    +[RMUILog configurationInterface](RMUILog, "configurationInterface");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:].cold.1(v6, v21);

    +[RMUIError legacyProfilesNoDeclarationToSetActivated:](RMUIError, "legacyProfilesNoDeclarationToSetActivated:", v6);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[RMUIConfigurationInterface observerStore](self, "observerStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMUILog configurationInterface](RMUILog, "configurationInterface");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:].cold.2();

    +[RMUIError legacyProfilesNoObserverStoreForDeclarationID:](RMUIError, "legacyProfilesNoObserverStoreForDeclarationID:", v15);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v22;
    v13[2](v13, 0, v22);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:].cold.3();

  objc_msgSend(v11, "declaration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMUIConfigurationInterface observerStore](self, "observerStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[RMUIConfigurationInterface _activateConfiguration:observerStore:completionHandler:](self, "_activateConfiguration:observerStore:completionHandler:", v19, v20, v13);
  else
    -[RMUIConfigurationInterface _deactivateConfiguration:observerStore:completionHandler:](self, "_deactivateConfiguration:observerStore:completionHandler:", v19, v20, v13);

LABEL_16:
}

void __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke_2;
  block[3] = &unk_24DA08610;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 48);
  v12 = v7;
  v13 = v5;
  v14 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  RMUIInteractiveProfileErrorViewModel *v4;
  void *v5;
  RMUIInteractiveProfileErrorViewModel *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_BYTE *)(a1 + 64) == 0;
    objc_msgSend(*(id *)(a1 + 40), "toggleViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToggleState:", v2);

    v4 = -[RMUIInteractiveProfileErrorViewModel initWithError:isActivating:]([RMUIInteractiveProfileErrorViewModel alloc], "initWithError:isActivating:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setInteractiveProfileActive:profileIdentifier:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:options:", *MEMORY[0x24BE7EC88], 0, 0, 3);

    v4 = 0;
  }
  v6 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_activateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "declarationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadProfileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BE7EC78], "newProfileControllerWithPrefix:scope:", *MEMORY[0x24BE7EC48], -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke;
      v17[3] = &unk_24DA08660;
      v18 = v13;
      v19 = v10;
      objc_msgSend(v14, "downloadAndInstallProfileDeclaration:store:fromURL:completionHandler:", v8, v9, v18, v17);

    }
    else
    {
      +[RMUILog configurationInterface](RMUILog, "configurationInterface");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[RMUIConfigurationInterface _activateConfiguration:observerStore:completionHandler:].cold.2();

      +[RMUIError legacyProfilesInvalidURLForDeclarationID:urlString:](RMUIError, "legacyProfilesInvalidURLForDeclarationID:urlString:", v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    +[RMUILog configurationInterface](RMUILog, "configurationInterface");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RMUIConfigurationInterface _activateConfiguration:observerStore:completionHandler:].cold.1();

    +[RMUIError legacyProfilesInvalidURLForDeclarationID:urlString:](RMUIError, "legacyProfilesInvalidURLForDeclarationID:urlString:", v11, &stru_24DA08920);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);
  }

}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a2;
  +[RMUILog configurationInterface](RMUILog, "configurationInterface");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_deactivateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BE7EC78];
  v10 = *MEMORY[0x24BE7EC48];
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(v9, "newProfileControllerWithPrefix:scope:", v10, -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
  objc_msgSend(v13, "profileIdentifierForDeclaration:store:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke;
  v17[3] = &unk_24DA08688;
  v18 = v14;
  v19 = v8;
  v15 = v8;
  v16 = v14;
  objc_msgSend(v13, "uninstallProfileWithIdentifier:store:completionHandler:", v16, v11, v17);

}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  +[RMUILog configurationInterface](RMUILog, "configurationInterface");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)scope
{
  return self->_scope;
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (NSString)passcodeDeclarationsHeading
{
  return self->_passcodeDeclarationsHeading;
}

- (RMObserverStore)observerStore
{
  return (RMObserverStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)mdmProfileIdentifier
{
  return self->_mdmProfileIdentifier;
}

- (NSArray)declarationsPayloadIdentifiers
{
  return self->_declarationsPayloadIdentifiers;
}

- (NSSet)filterDeclarationIdentifiers
{
  return self->_filterDeclarationIdentifiers;
}

- (RMUILegacyProfilesViewModelProvider)legacyProfilesProvider
{
  return self->_legacyProfilesProvider;
}

- (void)setLegacyProfilesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_legacyProfilesProvider, a3);
}

- (RMUIPluginViewModelProvider)pluginProvider
{
  return self->_pluginProvider;
}

- (void)setPluginProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pluginProvider, a3);
}

- (NSArray)privProfileViewModels
{
  return self->_privProfileViewModels;
}

- (void)setPrivProfileViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_privProfileViewModels, a3);
}

- (NSArray)privPluginSectionViewModels
{
  return self->_privPluginSectionViewModels;
}

- (void)setPrivPluginSectionViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_privPluginSectionViewModels, a3);
}

- (NSArray)privPluginViewModels
{
  return self->_privPluginViewModels;
}

- (void)setPrivPluginViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_privPluginViewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privPluginViewModels, 0);
  objc_storeStrong((id *)&self->_privPluginSectionViewModels, 0);
  objc_storeStrong((id *)&self->_privProfileViewModels, 0);
  objc_storeStrong((id *)&self->_pluginProvider, 0);
  objc_storeStrong((id *)&self->_legacyProfilesProvider, 0);
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_declarationsPayloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_mdmProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_passcodeDeclarationsHeading, 0);
  objc_storeStrong((id *)&self->_rmAccount, 0);
}

- (void)_loadObserverStoreForDDMWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218DA5000, log, OS_LOG_TYPE_DEBUG, "DDM not enabled", v1, 2u);
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_218DA5000, v0, v1, "Failed to find RMObserverStore for MDM profile: %{public}@, %{public}@");
  OUTLINED_FUNCTION_2();
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_218DA5000, v1, v2, "No RMObserverStore for MDM profile: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_218DA5000, a2, v4, "Found RMObserverStore: %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

void __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "declarationsPayloadIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_218DA5000, a2, v4, "No RMObserverStore for profile payloads: %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_5();
}

- (void)setConfigurationActivated:(char)a1 forViewModel:(NSObject *)a2 completionHandler:.cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67240192;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_218DA5000, a2, OS_LOG_TYPE_ERROR, "No declaration to set activation %{public}d", (uint8_t *)v2, 8u);
}

- (void)setConfigurationActivated:forViewModel:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_218DA5000, v0, OS_LOG_TYPE_ERROR, "No observer store to set activation %{public}d for declaration %{public}@", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)setConfigurationActivated:forViewModel:completionHandler:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_218DA5000, v0, OS_LOG_TYPE_DEBUG, "RMUIConfigurationInterface set activation %{public}d for declaration %{public}@", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_activateConfiguration:observerStore:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[14];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v2 = 0;
  _os_log_error_impl(&dword_218DA5000, v0, OS_LOG_TYPE_ERROR, "Missing profile URL for declaration %{public}@: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_activateConfiguration:observerStore:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_218DA5000, v0, v1, "Invalid profile URL for declaration %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_218DA5000, v1, v2, "Installed configuration from %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_218DA5000, v0, v1, "Error downloading and installing configuration from %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_218DA5000, v1, v2, "Uninstalled profile with identifier %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_218DA5000, v0, v1, "Error uninstalling profile with identifier %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
