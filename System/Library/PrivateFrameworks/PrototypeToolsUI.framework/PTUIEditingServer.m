@implementation PTUIEditingServer

- (PTUIEditingServer)initWithDataSource:(id)a3 delegate:(id)a4 forRemoteEditing:(BOOL)a5
{
  id v8;
  id v9;
  PTUIEditingServer *v10;
  PTUIEditingServer *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *domainIDsByGroupName;
  NSMutableDictionary *v14;
  NSMutableDictionary *rootSettingsByDomainID;
  NSMutableDictionary *v16;
  NSMutableDictionary *proxyDefinitionsByDomainID;
  NSMutableDictionary *v18;
  NSMutableDictionary *testRecipeIDsByDomainID;
  uint64_t v20;
  NSMapTable *moduleControllerByDomainID;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PTUIEditingServer;
  v10 = -[PTUIEditingServer init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_forRemoteEditing = a5;
    objc_storeWeak((id *)&v10->_dataSource, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    domainIDsByGroupName = v11->_domainIDsByGroupName;
    v11->_domainIDsByGroupName = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    rootSettingsByDomainID = v11->_rootSettingsByDomainID;
    v11->_rootSettingsByDomainID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    proxyDefinitionsByDomainID = v11->_proxyDefinitionsByDomainID;
    v11->_proxyDefinitionsByDomainID = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    testRecipeIDsByDomainID = v11->_testRecipeIDsByDomainID;
    v11->_testRecipeIDsByDomainID = v18;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    moduleControllerByDomainID = v11->_moduleControllerByDomainID;
    v11->_moduleControllerByDomainID = (NSMapTable *)v20;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel_reloadDomains, *MEMORY[0x24BE7B3A0], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel_reloadTestRecipes, *MEMORY[0x24BE7B3B0], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel_proxyDefinitionChanged_, *MEMORY[0x24BE7B3A8], 0);
    -[PTUIEditingServer reloadDomains](v11, "reloadDomains");
    -[PTUIEditingServer reloadTestRecipes](v11, "reloadTestRecipes");

  }
  return v11;
}

- (void)reloadDomains
{
  NSArray *domainGroupNames;
  id WeakRetained;
  NSDictionary *v5;
  NSDictionary *domainInfoByID;
  id v7;

  domainGroupNames = self->_domainGroupNames;
  self->_domainGroupNames = 0;

  -[NSMutableDictionary removeAllObjects](self->_domainIDsByGroupName, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "domainInfoByID");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  domainInfoByID = self->_domainInfoByID;
  self->_domainInfoByID = v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PTUIEditingServerDidReloadDomainsNotification"), 0);

}

- (void)reloadTestRecipes
{
  id WeakRetained;
  NSDictionary *v4;
  NSDictionary *testRecipeInfoByID;
  id v6;

  -[NSMutableDictionary removeAllObjects](self->_testRecipeIDsByDomainID, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "testRecipeInfoByID");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  testRecipeInfoByID = self->_testRecipeInfoByID;
  self->_testRecipeInfoByID = v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("PTUIEditingServerDidReloadTestRecipesNotification"), 0);

}

- (void)proxyDefinitionChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE7B390]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_rootSettingsByDomainID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_proxyDefinitionsByDomainID, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE7B3B8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((BSEqualObjects() & 1) == 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_proxyDefinitionsByDomainID, "setObject:forKeyedSubscript:", v9, v5);
        -[PTUIEditingServer _loadRootSettingsOrProxyForDomainID:](self, "_loadRootSettingsOrProxyForDomainID:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rootSettingsByDomainID, "setObject:forKeyedSubscript:", v10, v5);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:", CFSTR("PTUIEditingServerDidReloadDomainsNotification"), 0);

      }
    }
  }

}

- (id)rootSettingsForDomainID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_rootSettingsByDomainID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PTUIEditingServer _loadRootSettingsOrProxyForDomainID:](self, "_loadRootSettingsOrProxyForDomainID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_rootSettingsByDomainID, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)domainIDForRootSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_rootSettingsByDomainID, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_rootSettingsByDomainID, "objectForKeyedSubscript:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)domainGroupNames
{
  NSArray *domainGroupNames;
  void *v4;
  NSDictionary *domainInfoByID;
  id v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[4];
  id v12;

  domainGroupNames = self->_domainGroupNames;
  if (!domainGroupNames)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    domainInfoByID = self->_domainInfoByID;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __37__PTUIEditingServer_domainGroupNames__block_invoke;
    v11[3] = &unk_24C4357A0;
    v12 = v4;
    v6 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](domainInfoByID, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_domainGroupNames;
    self->_domainGroupNames = v8;

    domainGroupNames = self->_domainGroupNames;
  }
  return domainGroupNames;
}

void __37__PTUIEditingServer_domainGroupNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "domainGroupName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)domainIDsInGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *domainInfoByID;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_domainIDsByGroupName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    domainInfoByID = self->_domainInfoByID;
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__PTUIEditingServer_domainIDsInGroup___block_invoke;
    v13[3] = &unk_24C4357C8;
    v9 = v4;
    v14 = v9;
    v15 = v6;
    v10 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](domainInfoByID, "enumerateKeysAndObjectsUsingBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __38__PTUIEditingServer_domainIDsInGroup___block_invoke_2;
    v12[3] = &unk_24C4357F0;
    v12[4] = self;
    objc_msgSend(v10, "sortedArrayUsingComparator:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_domainIDsByGroupName, "setObject:forKey:", v5, v9);

  }
  return v5;
}

void __38__PTUIEditingServer_domainIDsInGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "domainGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

uint64_t __38__PTUIEditingServer_domainIDsInGroup___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "domainName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domainName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

- (id)displayNameForDomainID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_domainInfoByID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)groupNameForDomainID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_domainInfoByID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainGroupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)testRecipeIDsForDomainID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *testRecipeInfoByID;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_testRecipeIDsByDomainID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    testRecipeInfoByID = self->_testRecipeInfoByID;
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke;
    v13[3] = &unk_24C435818;
    v9 = v4;
    v14 = v9;
    v15 = v6;
    v10 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](testRecipeInfoByID, "enumerateKeysAndObjectsUsingBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke_2;
    v12[3] = &unk_24C4357F0;
    v12[4] = self;
    objc_msgSend(v10, "sortedArrayUsingComparator:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_testRecipeIDsByDomainID, "setObject:forKey:", v5, v9);

  }
  return v5;
}

void __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

uint64_t __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

- (id)titleForTestRecipeID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_testRecipeInfoByID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)testRecipeSelectionModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PTUIEditingServer _testRecipeSection](self, "_testRecipeSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE7B338];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moduleWithTitle:contents:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)settingsEditingModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PTUIEditingServer _settingsSection](self, "_settingsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE7B338];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moduleWithTitle:contents:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PTUIEditingServer domainIDForRootSettings:](self, "domainIDForRootSettings:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v10, "_archiveValueForKeyPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "applyArchiveValue:forRootSettingsKeyPath:domainID:", v8, v6, v7);

  }
}

- (void)settingsDidRestoreDefaults:(id)a3
{
  id WeakRetained;
  id v5;

  -[PTUIEditingServer domainIDForRootSettings:](self, "domainIDForRootSettings:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "restoreDefaultValuesForDomainID:", v5);

  }
}

- (id)_loadRootSettingsOrProxyForDomainID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSString *v14;
  Class v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_domainInfoByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadSettingsClassBundleIfNecessary");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_proxyDefinitionsByDomainID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource),
        objc_msgSend(WeakRetained, "rootSettingsProxyDefinitionForDomainID:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_proxyDefinitionsByDomainID, "setObject:forKeyedSubscript:", v6, v4), v6))
  {
    objc_msgSend(MEMORY[0x24BE7B348], "settingsOrProxyWithDefinition:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v9 = (void *)v8;

    goto LABEL_5;
  }
  objc_msgSend(v5, "settingsClassName");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSClassFromString(v14);

  if (self->_forRemoteEditing
    || !v15
    || !-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BE7B350], "definitionForSettingsClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE7B348], "proxyWithDefinition:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v9 = (void *)objc_msgSend([v15 alloc], "initWithDefaultValues");
LABEL_5:
  v10 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v10, "rootSettingsArchiveForDomainID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "restoreFromArchiveDictionary:", v11);
  objc_msgSend(v9, "addKeyPathObserver:", self);
  objc_msgSend(v9, "_setRestoreDefaultsObserver:", self);
  objc_msgSend(v9, "_setObservationEnabled:", 1);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__PTUIEditingServer__loadRootSettingsOrProxyForDomainID___block_invoke;
  v16[3] = &unk_24C435840;
  v16[4] = self;
  v17 = v4;
  v12 = v4;
  _RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock(v9, 0, v16);

  return v9;
}

void __57__PTUIEditingServer__loadRootSettingsOrProxyForDomainID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "invokeOutletAtKeyPath:domainID:", v4, *(_QWORD *)(a1 + 40));

}

- (id)_testRecipeSection
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];

  v3 = MEMORY[0x24BDAC760];
  v19[1] = *MEMORY[0x24BDAC8D0];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke;
  v18[3] = &unk_24C435868;
  v18[4] = self;
  v4 = (void *)MEMORY[0x20BD36E44](v18, a2);
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_2;
  v17[3] = &unk_24C435890;
  v17[4] = self;
  v5 = (void *)MEMORY[0x20BD36E44](v17);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_3;
  v16[3] = &unk_24C4358B8;
  v16[4] = self;
  v6 = (void *)MEMORY[0x20BD36E44](v16);
  objc_msgSend(MEMORY[0x24BE7B308], "rowWithTitle:valueGetter:valueSetter:", CFSTR("Test Recipe"), v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);
  v8 = (void *)MEMORY[0x24BE7B338];
  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFooterTextGetter:", v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_reloadSection, *MEMORY[0x24BE7B398], 0);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_4;
  v14[3] = &unk_24C4358E0;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v10, "setUnregisterBlock:", v14);

  return v10;
}

__CFString *__39__PTUIEditingServer__testRecipeSection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "activeTestRecipeID");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("__NoTestRecipe__");
  v4 = v3;

  return v4;
}

void __39__PTUIEditingServer__testRecipeSection__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__NoTestRecipe__")))
  {

    v4 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "setActiveTestRecipeID:", v4);

}

id __39__PTUIEditingServer__testRecipeSection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "activeTestRecipeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PTPrototypingEventsDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Active test recipe \"%@\" is consuming %@."), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __39__PTUIEditingServer__testRecipeSection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:name:object:", a2, *MEMORY[0x24BE7B398], 0);
}

- (id)_settingsSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PTUIEditingServer domainGroupNames](self, "domainGroupNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[PTUIEditingServer _settingsGroupRow:](self, "_settingsGroupRow:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:title:", v3, CFSTR("Settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_settingsGroupRow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *, void *);
  void *v15;
  PTUIEditingServer *v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __39__PTUIEditingServer__settingsGroupRow___block_invoke;
  v15 = &unk_24C435908;
  v16 = self;
  v17 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x20BD36E44](&v12);
  +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:](PTUIPushViewControllerRowAction, "actionWithViewControllerCreator:", v6, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B318], "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "staticTitle:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__PTUIEditingServer__settingsGroupRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v4, "_settingsDomainGroupModule:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();

  v10 = (void *)objc_msgSend([v9 alloc], "_initWithModule:presentingRow:", v8, v7);
  return v10;
}

- (id)_settingsDomainGroupModule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PTUIEditingServer domainIDsInGroup:](self, "domainIDsInGroup:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        -[PTUIEditingServer _settingsDomainRow:](self, "_settingsDomainRow:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_settingsDomainRow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *, void *);
  void *v16;
  PTUIEditingServer *v17;
  id v18;

  v4 = a3;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __40__PTUIEditingServer__settingsDomainRow___block_invoke;
  v16 = &unk_24C435908;
  v17 = self;
  v18 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x20BD36E44](&v13);
  -[PTUIEditingServer displayNameForDomainID:](self, "displayNameForDomainID:", v5, v13, v14, v15, v16, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:](PTUIPushViewControllerRowAction, "actionWithViewControllerCreator:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B318], "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "staticTitle:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __40__PTUIEditingServer__settingsDomainRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "rootSettingsForDomainID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();

  v11 = (void *)objc_msgSend([v10 alloc], "initWithSettings:presentingRow:", v9, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));

  return v11;
}

- (int64_t)numberOfSectionsForChoiceRow:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__PTUIEditingServer_numberOfSectionsForChoiceRow___block_invoke;
  v7[3] = &unk_24C435930;
  v7[4] = &v8;
  -[PTUIEditingServer _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:](self, "_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __50__PTUIEditingServer_numberOfSectionsForChoiceRow___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)choiceRow:(id)a3 titleForSection:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[4];

  v6 = a3;
  if (a4)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__PTUIEditingServer_choiceRow_titleForSection___block_invoke;
    v9[3] = &unk_24C435958;
    v9[6] = &v10;
    v9[7] = a4;
    v9[4] = self;
    v9[5] = v16;
    -[PTUIEditingServer _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:](self, "_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:", v9);
    v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __47__PTUIEditingServer_choiceRow_titleForSection___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[7])
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (void *)a1[4];
    v10 = a2;
    objc_msgSend(v9, "displayNameForDomainID:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ – %@"), v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a5 = 1;
  }
}

- (int64_t)choiceRow:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v6 = a3;
  if (a4)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__PTUIEditingServer_choiceRow_numberOfRowsInSection___block_invoke;
    v9[3] = &unk_24C435980;
    v9[5] = &v10;
    v9[6] = a4;
    v9[4] = v14;
    -[PTUIEditingServer _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:](self, "_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:", v9);
    v7 = v11[3];
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __53__PTUIEditingServer_choiceRow_numberOfRowsInSection___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t v6;

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) == *(_QWORD *)(result + 48))
  {
    v6 = result;
    result = objc_msgSend(a4, "count");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = result;
    *a5 = 1;
  }
  return result;
}

- (id)choiceRow:(id)a3 valueForRow:(int64_t)a4 inSection:(int64_t)a5
{
  if (!a5)
    return CFSTR("__NoTestRecipe__");
  -[PTUIEditingServer _recipeIDForRow:inSection:](self, "_recipeIDForRow:inSection:", a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)choiceRow:(id)a3 titleForRow:(int64_t)a4 inSection:(int64_t)a5
{
  void *v6;
  __CFString *v7;

  if (a5)
  {
    -[PTUIEditingServer _recipeIDForRow:inSection:](self, "_recipeIDForRow:inSection:", a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUIEditingServer titleForTestRecipeID:](self, "titleForTestRecipeID:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("None");
  }
  return v7;
}

- (id)choiceRow:(id)a3 shortTitleForRow:(int64_t)a4 inSection:(int64_t)a5
{
  return 0;
}

- (void)_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, void *, char *);
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PTUIEditingServer domainGroupNames](self, "domainGroupNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v6 = *(_QWORD *)v25;
    v18 = v5;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[PTUIEditingServer domainIDsInGroup:](self, "domainIDsInGroup:", v8, v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              -[PTUIEditingServer testRecipeIDsForDomainID:](self, "testRecipeIDsForDomainID:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "count"))
              {
                v19 = 0;
                v4[2](v4, v8, v14, v15, &v19);
                if (v19)
                {

                  v5 = v18;
                  goto LABEL_19;
                }
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v11)
              continue;
            break;
          }
        }

        v5 = v18;
        v6 = v16;
      }
      v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }
LABEL_19:

}

- (id)_recipeIDForRow:(int64_t)a3 inSection:(int64_t)a4
{
  id v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[4];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__PTUIEditingServer__recipeIDForRow_inSection___block_invoke;
  v6[3] = &unk_24C4359A8;
  v6[4] = v13;
  v6[5] = &v7;
  v6[6] = a4;
  v6[7] = a3;
  -[PTUIEditingServer _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:](self, "_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __47__PTUIEditingServer__recipeIDForRow_inSection___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == a1[6])
  {
    objc_msgSend(a4, "objectAtIndex:", a1[7]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (BOOL)forRemoteEditing
{
  return self->_forRemoteEditing;
}

- (void)setForRemoteEditing:(BOOL)a3
{
  self->_forRemoteEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleControllerByDomainID, 0);
  objc_storeStrong((id *)&self->_testRecipeIDsByDomainID, 0);
  objc_storeStrong((id *)&self->_proxyDefinitionsByDomainID, 0);
  objc_storeStrong((id *)&self->_rootSettingsByDomainID, 0);
  objc_storeStrong((id *)&self->_domainIDsByGroupName, 0);
  objc_storeStrong((id *)&self->_domainGroupNames, 0);
  objc_storeStrong((id *)&self->_testRecipeInfoByID, 0);
  objc_storeStrong((id *)&self->_domainInfoByID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
