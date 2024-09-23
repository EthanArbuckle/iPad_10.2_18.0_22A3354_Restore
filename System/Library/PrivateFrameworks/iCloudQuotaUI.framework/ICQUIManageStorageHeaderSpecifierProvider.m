@implementation ICQUIManageStorageHeaderSpecifierProvider

- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQUIManageStorageHeaderSpecifierProvider initWithAccountManager:storageSummary:](self, "initWithAccountManager:storageSummary:", a3, 0);
}

- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3 storageSummary:(id)a4
{
  id v7;
  id v8;
  ICQUIManageStorageHeaderSpecifierProvider *v9;
  ICQUIManageStorageHeaderSpecifierProvider *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQUIManageStorageHeaderSpecifierProvider;
  v9 = -[ICQUIManageStorageHeaderSpecifierProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_storageSummary, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__fetchStorageSummaryAndRefreshSpecifiers, CFSTR("QuotaDidChange"), 0);

  }
  return v10;
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
  v2 = "-[ICQUIManageStorageHeaderSpecifierProvider dealloc]";
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

- (NSArray)specifiers
{
  NSArray *specifiers;
  NSArray *v3;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICQUIManageStorageHeaderSpecifierProvider makeThermometerSpecifiers](self, "makeThermometerSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    -[ICQUIManageStorageHeaderSpecifierProvider makeFamilyAndPlanManagementSpecifiers](self, "makeFamilyAndPlanManagementSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = (NSArray *)objc_msgSend(v5, "copy");
    v9 = self->_specifiers;
    self->_specifiers = v8;

    v3 = self->_specifiers;
  }
  return v3;
}

- (id)makeThermometerSpecifiers
{
  id v3;
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
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MANAGE_STORAGE_THERMOMETER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manageStoragePage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storageGraphFooterText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);
  objc_msgSend(v3, "addObject:", v4);
  -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x24BE75590];
    -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel__valueForStorageGraphSpecifier_, 0, -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIManageStorageHeaderSpecifierProvider setStorageSpecifier:](self, "setStorageSpecifier:", v12);

    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIdentifier:", CFSTR("CLOUD_STORAGE_GRAPH"));

    v14 = objc_opt_class();
    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75948]);

    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE75A18];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", self, *MEMORY[0x24BE75D18]);

    v19 = (void *)MEMORY[0x24BDD16E0];
    -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", v20 != 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v17);

    -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE75D50]);

  }
  -[ICQUIManageStorageHeaderSpecifierProvider storageSpecifier](self, "storageSpecifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)objc_msgSend(v3, "copy");
  return v27;
}

- (void)setSpecifiers:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v5 = (void *)-[NSArray copy](self->_specifiers, "copy");
    objc_storeStrong((id *)&self->_specifiers, a3);
    -[ICQUIManageStorageHeaderSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

  }
  else
  {
    -[ICQUIManageStorageHeaderSpecifierProvider _fetchStorageSummaryAndRefreshSpecifiers](self, "_fetchStorageSummaryAndRefreshSpecifiers");
  }

}

- (id)_valueForStorageGraphSpecifier:(id)a3
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

  v4 = a3;
  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE04C90]);

  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "freeStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE04C88]);

  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "usedStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE04CA0]);

  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icqui_AAUIiCloudMediaUsageInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE04C98]);

  return 0;
}

- (id)makeFamilyAndPlanManagementSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id obj;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICQUIManageStorageHeaderSpecifierProvider storageSummary](self, "storageSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manageStoragePage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (!v6)
    goto LABEL_19;
  v7 = v6;
  v8 = *(_QWORD *)v28;
  v26 = *MEMORY[0x24BE75948];
  v25 = *MEMORY[0x24BE75868];
  v22 = *MEMORY[0x24BE75D28];
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
      objc_msgSend(v10, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "title");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13 || (objc_msgSend(v12, "title"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v14 = -[ICQUIManageStorageHeaderSpecifierProvider cellTypeForSpecifierInfo:](self, "cellTypeForSpecifierInfo:", v10);
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIdentifier:", v13);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_opt_class(), v26);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("ACTION_INFO"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v25);
        if (v14 == 1)
        {
          objc_msgSend(v10, "subtitle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v22);

          objc_msgSend(v15, "setControllerLoadAction:", sel_launchActionFromSpecifier_);
          if (!v15)
            goto LABEL_13;
LABEL_12:
          objc_msgSend(v24, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v15, "setButtonAction:", sel_launchActionFromSpecifier_);
          if (v15)
            goto LABEL_12;
        }
LABEL_13:

        goto LABEL_14;
      }
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_error_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_ERROR, "Specifier info is missing a title! %@", buf, 0xCu);
      }
LABEL_14:

      ++v9;
    }
    while (v7 != v9);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    v7 = v17;
  }
  while (v17);
LABEL_19:

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MANAGE_STORAGE_HEADER_ACTIONS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

- (int64_t)cellTypeForSpecifierInfo:(id)a3
{
  void *v3;

  objc_msgSend(a3, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  else
    return 13;
}

- (int64_t)cellTypeForAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 112) > 9)
    return 13;
  else
    return qword_21F4600F8[a3 - 112];
}

- (void)launchActionFromSpecifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICQUIManageStorageHeaderSpecifierProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:loadActionFromSpecifier:", self, v4);

}

- (void)refreshHeaderSpecifiersWithSummary:(id)a3
{
  NSArray *specifiers;
  void *v5;
  id v6;

  -[ICQUIManageStorageHeaderSpecifierProvider setStorageSummary:](self, "setStorageSummary:", a3);
  v6 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[ICQUIManageStorageHeaderSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v6, 1);

}

- (void)_fetchStorageSummaryAndRefreshSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQUIManageStorageHeaderSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "initWithAccount:", v4);

  v5 = (void *)v8[5];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke;
  v6[3] = &unk_24E3F3938;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "fetchStorageSummaryWithCompletion:", v6);
  _Block_object_dispose(&v7, 8);

}

void __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  __int128 v7;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2;
  block[3] = &unk_24E3F3910;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "refreshHeaderSpecifiersWithSummary:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

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

- (ICQCloudStorageSummary)storageSummary
{
  return self->_storageSummary;
}

- (void)setStorageSummary:(id)a3
{
  objc_storeStrong((id *)&self->_storageSummary, a3);
}

- (PSSpecifier)storageSpecifier
{
  return self->_storageSpecifier;
}

- (void)setStorageSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_storageSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageSpecifier, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
