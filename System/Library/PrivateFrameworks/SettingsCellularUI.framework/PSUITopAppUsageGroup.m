@implementation PSUITopAppUsageGroup

- (PSUITopAppUsageGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 dataUsageStatisticsCache:(id)a5 carrierSpaceManager:(id)a6 appsAndCategoriesSubgroup:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PSUITopAppUsageGroup *v17;
  PSUITopAppUsageGroup *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PSSpecifier *loadingGroupSpecifier;
  uint64_t v24;
  PSSpecifier *spinnerSpecifier;
  id v27;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PSUITopAppUsageGroup;
  v17 = -[PSUITopAppUsageGroup init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_hostController, a3);
    objc_storeStrong((id *)&v18->_managementCache, a4);
    objc_storeStrong((id *)&v18->_statisticsCache, a5);
    objc_storeStrong((id *)&v18->_carrierSpaceManager, a6);
    objc_storeStrong((id *)&v18->_appsAndCategoriesSubgroup, a7);
    v19 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE"), &stru_24D5028C8, CFSTR("Cellular"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "groupSpecifierWithID:name:", CFSTR("APP_DATA_USAGE"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    loadingGroupSpecifier = v18->_loadingGroupSpecifier;
    v18->_loadingGroupSpecifier = (PSSpecifier *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", &stru_24D5028C8, 0, 0, 0, 0, 15, 0);
    spinnerSpecifier = v18->_spinnerSpecifier;
    v18->_spinnerSpecifier = (PSSpecifier *)v24;

    v18->_specifierCreationInProgress = 0;
  }

  return v18;
}

- (id)specifiers
{
  NSArray *createdSpecifiers;
  PSSpecifier *spinnerSpecifier;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  createdSpecifiers = self->_createdSpecifiers;
  if (createdSpecifiers && -[NSArray count](createdSpecifiers, "count"))
    return self->_createdSpecifiers;
  -[PSUITopAppUsageGroup createSpecifiers](self, "createSpecifiers");
  spinnerSpecifier = self->_spinnerSpecifier;
  v6[0] = self->_loadingGroupSpecifier;
  v6[1] = spinnerSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)createSpecifiers
{
  PSUITopAppUsageGroup *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_specifierCreationInProgress)
  {
    -[PSUITopAppUsageGroup getLogger](v2, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
    }

    objc_sync_exit(v2);
  }
  else
  {
    v2->_specifierCreationInProgress = 1;
    objc_sync_exit(v2);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v2);
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke;
    v5[3] = &unk_24D501A20;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = v2;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  PSUITotalCellularUsageSubgroup *v29;
  void *v30;
  PSUITotalCellularUsageSubgroup *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  NSObject *v38;
  uint64_t i;
  void *v40;
  unint64_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  _QWORD block[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(WeakRetained, "managementCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasManagedCellularData");

    if (v5)
    {
      v6 = objc_loadWeakRetained(v1);
      objc_msgSend(v6, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEBUG, "Cellular Data is Managed, showing MDM Management Explanation group.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATA_USAGE_MANAGED_GROUP"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "managementCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mdmName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE_MANAGED"), &stru_24D5028C8, CFSTR("Cellular"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v8);
    }
    objc_msgSend(WeakRetained, "groupSpecifierTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
        v20 = CFSTR("APP_WIRELESS_DATA_USAGE");
      else
        v20 = CFSTR("APP_DATA_USAGE");
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24D5028C8, CFSTR("Cellular"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setGroupSpecifierTitle:", v21);

    }
    v22 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(WeakRetained, "groupSpecifierTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "groupSpecifierWithID:name:", CFSTR("APP_DATA_USAGE"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v24);
    objc_msgSend(WeakRetained, "statisticsCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "useCalendarMonthBillingCycle"))
    {

    }
    else
    {
      objc_msgSend(WeakRetained, "statisticsCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "billingCycleSupported") & 1) != 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(WeakRetained, "carrierSpaceManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "capabilities");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "supportsUsage");

      if ((v50 & 1) != 0)
      {
LABEL_20:
        objc_msgSend(WeakRetained, "appsAndCategoriesSubgroup");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[CTUIDataUsageSorting usageComparator](CTUIDataUsageSorting, "usageComparator");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "specifiersWithSortComparator:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_msgSend(v35, "count");
        if (v36 < 5)
        {
          v41 = v36;
          v42 = objc_loadWeakRetained(v1);
          objc_msgSend(v42, "getLogger");
          v43 = objc_claimAutoreleasedReturnValue();

          if (!v41)
          {
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2161C6000, v43, OS_LOG_TYPE_DEFAULT, "No app usage specifiers, adding No Usage specifier", buf, 2u);
            }

            objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "sf_isChinaRegionCellularDevice");
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if (v52)
              v55 = CFSTR("APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE");
            else
              v55 = CFSTR("APPS_APPEAR_AFTER_CELLULAR_USAGE");
            objc_msgSend(v53, "localizedStringForKey:value:table:", v55, &stru_24D5028C8, CFSTR("Cellular"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v47, 0, 0, 0, 0, 3, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
            objc_msgSend(v3, "addObject:", v56);
            objc_msgSend(WeakRetained, "setCreatedSpecifiers:", v3);
            objc_msgSend(WeakRetained, "setSpecifierCreationInProgress:", 0);
            v60[0] = MEMORY[0x24BDAC760];
            v60[1] = 3221225472;
            v60[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_22;
            v60[3] = &unk_24D501A20;
            objc_copyWeak(&v62, v1);
            v61 = WeakRetained;
            dispatch_async(MEMORY[0x24BDAC9B8], v60);

            objc_destroyWeak(&v62);
            goto LABEL_31;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v64 = v41;
            _os_log_debug_impl(&dword_2161C6000, v43, OS_LOG_TYPE_DEBUG, "Adding %lu app specifiers", buf, 0xCu);
          }

          objc_msgSend(v3, "addObjectsFromArray:", v35);
        }
        else
        {
          v37 = objc_loadWeakRetained(v1);
          objc_msgSend(v37, "getLogger");
          v38 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v64 = 5;
            _os_log_debug_impl(&dword_2161C6000, v38, OS_LOG_TYPE_DEBUG, "Adding %lu app specifiers", buf, 0xCu);
          }

          for (i = 0; i != 5; ++i)
          {
            objc_msgSend(v35, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v40);

          }
        }
        v44 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL"), &stru_24D5028C8, CFSTR("Cellular"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v46, 0, 0, 0, objc_opt_class(), 2, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "setIdentifier:", CFSTR("SHOW_ALL"));
        objc_msgSend(v3, "addObject:", v47);
        objc_msgSend(WeakRetained, "setCreatedSpecifiers:", v3);
        objc_msgSend(WeakRetained, "setSpecifierCreationInProgress:", 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_27;
        block[3] = &unk_24D501A20;
        objc_copyWeak(&v59, v1);
        v58 = WeakRetained;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(&v59);
LABEL_31:

        goto LABEL_32;
      }
    }
    v26 = objc_loadWeakRetained(v1);
    objc_msgSend(v26, "getLogger");
    v27 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEBUG, "Adding Total Usage specifiers", buf, 2u);
    }

    objc_msgSend(WeakRetained, "totalUsageSubgroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v29 = [PSUITotalCellularUsageSubgroup alloc];
      objc_msgSend(WeakRetained, "statisticsCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PSUITotalCellularUsageSubgroup initWithStatisticsCache:andBillingPeriodSource:](v29, "initWithStatisticsCache:andBillingPeriodSource:", v30, 0);
      objc_msgSend(WeakRetained, "setTotalUsageSubgroup:", v31);

    }
    objc_msgSend(WeakRetained, "totalUsageSubgroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "specifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v32);
    goto LABEL_19;
  }
LABEL_32:

}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Top App Usage Group specifier creation complete, asking host to reload.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiers");

}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Top App Usage Group specifier creation complete, asking host to reload.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiers");

}

- (void)clearStoredSpecifiers
{
  NSArray *createdSpecifiers;

  createdSpecifiers = self->_createdSpecifiers;
  self->_createdSpecifiers = 0;

}

- (void)setGroupSpecifierTitle:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifierTitle, a3);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PSUITopAppUsageGroup"));
}

- (PSListController)hostController
{
  return self->_hostController;
}

- (void)setHostController:(id)a3
{
  objc_storeStrong((id *)&self->_hostController, a3);
}

- (PSCellularManagementCache)managementCache
{
  return self->_managementCache;
}

- (void)setManagementCache:(id)a3
{
  objc_storeStrong((id *)&self->_managementCache, a3);
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsCache, a3);
}

- (PSUICarrierSpaceManager)carrierSpaceManager
{
  return self->_carrierSpaceManager;
}

- (void)setCarrierSpaceManager:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceManager, a3);
}

- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup
{
  return self->_totalUsageSubgroup;
}

- (void)setTotalUsageSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_totalUsageSubgroup, a3);
}

- (PSUIAppsAndCategoriesDataUsageSubgroup)appsAndCategoriesSubgroup
{
  return self->_appsAndCategoriesSubgroup;
}

- (void)setAppsAndCategoriesSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_appsAndCategoriesSubgroup, a3);
}

- (NSString)groupSpecifierTitle
{
  return self->_groupSpecifierTitle;
}

- (PSSpecifier)loadingGroupSpecifier
{
  return self->_loadingGroupSpecifier;
}

- (void)setLoadingGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_loadingGroupSpecifier, a3);
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerSpecifier, a3);
}

- (NSArray)createdSpecifiers
{
  return self->_createdSpecifiers;
}

- (void)setCreatedSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_createdSpecifiers, a3);
}

- (BOOL)specifierCreationInProgress
{
  return self->_specifierCreationInProgress;
}

- (void)setSpecifierCreationInProgress:(BOOL)a3
{
  self->_specifierCreationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdSpecifiers, 0);
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_loadingGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifierTitle, 0);
  objc_storeStrong((id *)&self->_appsAndCategoriesSubgroup, 0);
  objc_storeStrong((id *)&self->_totalUsageSubgroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
  objc_storeStrong((id *)&self->_hostController, 0);
}

@end
