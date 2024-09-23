@implementation PSUIAppDataUsageGroup

- (PSUIAppDataUsageGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIAppDataUsageGroup *v8;
  PSUIAppDataUsageGroup *v9;
  CTUIListLoadingGroup *v10;
  CTUIListLoadingGroup *loadingGroup;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUIAppDataUsageGroup;
  v8 = -[PSUIAppDataUsageGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    v10 = -[CTUIListLoadingGroup initWithHostController:groupSpecifier:]([CTUIListLoadingGroup alloc], "initWithHostController:groupSpecifier:", v6, v7);
    loadingGroup = v9->_loadingGroup;
    v9->_loadingGroup = v10;

  }
  return v9;
}

- (id)specifiers
{
  void *v2;
  void *v3;

  -[PSUIAppDataUsageGroup loadingGroup](self, "loadingGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prefetchResourcesFor:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "performGetter");
}

- (void)didFailToSetPolicyForSpecifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__PSUIAppDataUsageGroup_didFailToSetPolicyForSpecifier___block_invoke;
  v6[3] = &unk_24D501638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __56__PSUIAppDataUsageGroup_didFailToSetPolicyForSpecifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

}

- (void)calculateUsage
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke;
  v4[3] = &unk_24D5016B0;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "fetchDeviceDataUsageWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  PSUIAppsAndCategoriesDataUsageSubgroup *v3;
  uint64_t v4;
  void *v5;
  PSUIAppsAndCategoriesDataUsageSubgroup *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[6];
  id v20;
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t v27[4];
  const char *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s creating specifiers", (uint8_t *)&buf, 0xCu);
  }

  v3 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PSUIAppsAndCategoriesDataUsageSubgroup initWithPolicySpecifierDelegate:statisticsCache:](v3, "initWithPolicySpecifierDelegate:statisticsCache:", v4, v5);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  +[CTUIDataUsageSorting userSelectedComparator](CTUIDataUsageSorting, "userSelectedComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppsAndCategoriesDataUsageSubgroup specifiersWithSortComparator:](v6, "specifiersWithSortComparator:", v7);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 136315138;
    v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s prefetching policies", v27, 0xCu);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "prefetchResourcesFor:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
  v16 = *(void **)(a1 + 32);
  if (v15)
  {
    objc_msgSend(v16, "getLogger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke_2";
      _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "%s dispatching app specifiers update to main thread", v27, 0xCu);
    }

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_12;
    v19[3] = &unk_24D501688;
    v19[4] = *(_QWORD *)(a1 + 32);
    v19[5] = &buf;
    objc_copyWeak(&v20, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x24BDAC9B8], v19);
    objc_destroyWeak(&v20);
  }
  else
  {
    objc_msgSend(v16, "getLogger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
      _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "%s no apps to show", v27, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_4;
    block[3] = &unk_24D501660;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  _Block_object_dispose(&buf, 8);

}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "groupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", &stru_24D5028C8);

  objc_msgSend(*(id *)(a1 + 32), "groupSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v4, *MEMORY[0x24BE75A68]);

}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Sort options"), 0, 0, 0, 0, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USE_WIRELESS_DATA"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "groupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v8);

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s updating app specifiers on main thread", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "loadingGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSpecifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppDataUsageGroup"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (CTUIListLoadingGroup)loadingGroup
{
  return self->_loadingGroup;
}

- (void)setLoadingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_loadingGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
