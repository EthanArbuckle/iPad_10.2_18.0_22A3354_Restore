@implementation ICQUIManageStorageListSpecifierProvider

- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQUIManageStorageListSpecifierProvider initWithAccountManager:navigationItem:](self, "initWithAccountManager:navigationItem:", a3, 0);
}

- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3 navigationItem:(id)a4
{
  id v7;
  id v8;
  ICQUIManageStorageListSpecifierProvider *v9;
  ICQUIManageStorageListSpecifierProvider *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICQUIManageStorageListSpecifierProvider;
  v9 = -[ICQUIManageStorageListSpecifierProvider init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_navigationItem, v8);
    -[ICQUIManageStorageListSpecifierProvider _refreshAppList](v10, "_refreshAppList");
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__ICQUIManageStorageListSpecifierProvider_initWithAccountManager_navigationItem___block_invoke;
    v15[3] = &unk_24E3F3B40;
    objc_copyWeak(&v16, &location);
    v13 = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("QuotaDidChange"), 0, v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __81__ICQUIManageStorageListSpecifierProvider_initWithAccountManager_navigationItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshAppList");

}

- (void)dealloc
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[ICQUIManageStorageListSpecifierProvider dealloc]";
  v3 = 2112;
  v4 = CFSTR("QuotaDidChange");
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "%s: Unregistering from notification: %@", (uint8_t *)&v1, 0x16u);
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_refreshAppList
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Already fetching app list", v1, 2u);
}

void __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_cold_1(v6, v7);

  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "apps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v5, "apps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Received apps count %lu, apps: %@", buf, 0x16u);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_24;
  v13[3] = &unk_24E3F34D8;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v12 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icqui_hideNavigationBarSpinner");

  objc_msgSend(*(id *)(a1 + 32), "setIsFetching:", 0);
  objc_msgSend(*(id *)(a1 + 40), "apps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "setFailedToFetchAppList:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setStorageApps:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)_reloadSpecifiers
{
  NSArray *specifiers;
  void *v4;
  id v5;

  v5 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[ICQUIManageStorageListSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MANAGE_STORAGE_APP_LIST"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  -[ICQUIManageStorageListSpecifierProvider storageApps](self, "storageApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "apps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v25 = v6;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ICQUIManageStorageListSpecifierProvider storageApps](self, "storageApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "apps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v16, "action");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "icqLink");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "action");

          if (v19 == 126)
            -[ICQUIManageStorageListSpecifierProvider nativeSpecifierForAppInfo:](self, "nativeSpecifierForAppInfo:", v16);
          else
            -[ICQUIManageStorageListSpecifierProvider serverUISpecifierForAppInfo:](self, "serverUISpecifierForAppInfo:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v5, "addObject:", v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    v6 = v25;
  }
  else if (-[ICQUIManageStorageListSpecifierProvider failedToFetchAppList](self, "failedToFetchAppList"))
  {

    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);
    -[ICQUIManageStorageListSpecifierProvider _refreshAppList](self, "_refreshAppList");

  }
  v22 = (NSArray *)objc_msgSend(v5, "copy");
  v23 = self->_specifiers;
  self->_specifiers = v22;

  v24 = self->_specifiers;
  return v24;
}

- (void)setSpecifiers:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)-[NSArray copy](self->_specifiers, "copy");
  if (v7)
    objc_storeStrong((id *)&self->_specifiers, a3);
  else
    -[ICQUIManageStorageListSpecifierProvider _refreshAppList](self, "_refreshAppList");
  -[ICQUIManageStorageListSpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

}

- (id)serverUISpecifierForAppInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = -1;

  v8 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUIManageStorageListSpecifierProvider addDecorationToSpecifier:usingAppInfo:](self, "addDecorationToSpecifier:usingAppInfo:", v10, v4);
  objc_msgSend(v10, "setControllerLoadAction:", sel_loadDrilldownFromSpecifier_);
  return v10;
}

- (id)nativeSpecifierForAppInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icqLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("afuiSettings")))
  {
    +[ICQPreferencesRemoteUIDelegate afuiSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "afuiSettingsSpecifier");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("healthSettings")))
  {
    +[ICQPreferencesRemoteUIDelegate healthSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "healthSettingsSpecifier");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("messagesSettings")))
  {
    +[ICQPreferencesRemoteUIDelegate messagesSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "messagesSettingsSpecifier");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[ICQUIManageStorageListSpecifierProvider nativeSpecifierForAppInfo:].cold.1((uint64_t)v8, v12, v13);

  v10 = 0;
LABEL_8:
  -[ICQUIManageStorageListSpecifierProvider addDecorationToSpecifier:usingAppInfo:](self, "addDecorationToSpecifier:usingAppInfo:", v10, v4);

  return v10;
}

- (void)addDecorationToSpecifier:(id)a3 usingAppInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if (v17)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "bundleIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(v5, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR("APP_LIST_CELL_%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", v10);

    if (!v8)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, CFSTR("DRILLDOWN_APP_INFO"));
    objc_msgSend(v5, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75D50]);

    objc_msgSend(v5, "detailLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75D28]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75D10]);

    v14 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
    objc_msgSend(v5, "iconURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75B98]);

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75868]);
  }

}

- (void)loadDrilldownFromSpecifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICQUIManageStorageListSpecifierProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:loadActionFromSpecifier:", self, v4);

}

- (ICQUIManageStorageSpecifierProviderDelegate)delegate
{
  return (ICQUIManageStorageSpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (ICQCloudStorageApps)storageApps
{
  return self->_storageApps;
}

- (void)setStorageApps:(id)a3
{
  objc_storeStrong((id *)&self->_storageApps, a3);
}

- (BOOL)isFetching
{
  return self->_isFetching;
}

- (void)setIsFetching:(BOOL)a3
{
  self->_isFetching = a3;
}

- (BOOL)failedToFetchAppList
{
  return self->_failedToFetchAppList;
}

- (void)setFailedToFetchAppList:(BOOL)a3
{
  self->_failedToFetchAppList = a3;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_navigationItem);
}

- (void)setNavigationItem:(id)a3
{
  objc_storeWeak((id *)&self->_navigationItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_storeStrong((id *)&self->_storageApps, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v4, "Error retrieving list of apps: %@", (uint8_t *)&v5);

}

- (void)nativeSpecifierForAppInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, a3, "Unknown native drilldown identifier: %@", (uint8_t *)&v3);
}

@end
