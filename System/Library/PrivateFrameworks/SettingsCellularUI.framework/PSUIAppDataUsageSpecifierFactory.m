@implementation PSUIAppDataUsageSpecifierFactory

- (PSUIAppDataUsageSpecifierFactory)initWithGroupSpecifierTitle:(id)a3 managementCache:(id)a4 statisticsCache:(id)a5 carrierSpaceManager:(id)a6 billingCycleDelegate:(id)a7 policySpecifierDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PSUIAppDataUsageSpecifierFactory *v20;
  PSUIAppDataUsageSpecifierFactory *v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PSUIAppDataUsageSpecifierFactory;
  v20 = -[PSUIAppDataUsageSpecifierFactory init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_managementCache, a4);
    objc_storeStrong((id *)&v21->_statisticsCache, a5);
    objc_storeStrong((id *)&v21->_carrierSpaceManager, a6);
    objc_storeWeak((id *)&v21->_billingCycleDelegate, v18);
    objc_storeWeak((id *)&v21->_policySpecifierDelegate, v19);
    objc_storeStrong((id *)&v21->_groupSpecifierTitle, a3);
  }

  return v21;
}

- (id)headerSpecifiers
{
  NSArray *savedHeaderSpecifiers;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;

  savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  if (!savedHeaderSpecifiers)
  {
    v4 = (NSArray *)objc_opt_new();
    if (-[PSCellularManagementCache hasManagedCellularData](self->_managementCache, "hasManagedCellularData"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATA_USAGE_MANAGED_GROUP"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSCellularManagementCache mdmName](self->_managementCache, "mdmName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE_MANAGED"), &stru_24D5028C8, CFSTR("Cellular"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);

      -[NSArray addObject:](v4, "addObject:", v5);
    }
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("APP_DATA_USAGE"), self->_groupSpecifierTitle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v11);
    v12 = self->_savedHeaderSpecifiers;
    self->_savedHeaderSpecifiers = v4;

    savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  }
  return savedHeaderSpecifiers;
}

- (id)contentSpecifiers
{
  PSUIAppDataUsageSpecifierFactory *v2;
  NSObject *v3;
  PSUICellularUsageContentSpecifiers *v4;
  PSUICellularUsageContentSpecifiers *savedContentSpecifiers;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_savedContentSpecifiers)
  {
    if (-[PSDataUsageStatisticsCache billingCycleSupported](v2->_statisticsCache, "billingCycleSupported"))-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:](v2->_billingPeriodSelectorSpecifier, "refreshSelectorWithStatisticsCache:", v2->_statisticsCache);
  }
  else
  {
    -[PSUIAppDataUsageSpecifierFactory getLogger](v2, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Creating app usage specifiers", buf, 2u);
    }

    v4 = objc_alloc_init(PSUICellularUsageContentSpecifiers);
    -[PSUIAppDataUsageSpecifierFactory addLeadingSpecifiersToContentSpecifiers:](v2, "addLeadingSpecifiersToContentSpecifiers:", v4);
    -[PSUIAppDataUsageSpecifierFactory addAppUsageSpecifiersToContentSpecifiers:](v2, "addAppUsageSpecifiersToContentSpecifiers:", v4);
    -[PSUIAppDataUsageSpecifierFactory addTrailingSpecifiersToContentSpecifiers:](v2, "addTrailingSpecifiersToContentSpecifiers:", v4);
    savedContentSpecifiers = v2->_savedContentSpecifiers;
    v2->_savedContentSpecifiers = v4;

  }
  objc_sync_exit(v2);

  -[PSUIAppDataUsageSpecifierFactory getLogger](v2, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Returning saved specifiers", v8, 2u);
  }

  -[PSUICellularUsageContentSpecifiers specifiers](v2->_savedContentSpecifiers, "specifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addLeadingSpecifiersToContentSpecifiers:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  PSBillingPeriodSelectorSpecifier *v9;
  PSBillingPeriodSelectorSpecifier *billingPeriodSelectorSpecifier;
  id WeakRetained;
  NSObject *v12;
  PSUITotalCellularUsageSubgroup *totalUsageSubgroup;
  PSUITotalCellularUsageSubgroup **p_totalUsageSubgroup;
  PSBillingPeriodSelectorSpecifier *v15;
  void *v16;
  char v17;
  NSObject *v18;
  PSUITotalCellularUsageSubgroup *v19;
  PSDataUsageStatisticsCache *statisticsCache;
  PSBillingPeriodSelectorSpecifier *v21;
  PSUITotalCellularUsageSubgroup *v22;
  PSUITotalCellularUsageSubgroup *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[PSDataUsageStatisticsCache billingCycleSupported](self->_statisticsCache, "billingCycleSupported");
  -[PSUIAppDataUsageSpecifierFactory getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Billing cycle supported, adding billing period selector.", buf, 2u);
    }

    if (!self->_billingPeriodSelectorSpecifier)
    {
      v9 = (PSBillingPeriodSelectorSpecifier *)objc_msgSend(objc_alloc(MEMORY[0x24BE85680]), "initWithStatisticsCache:", self->_statisticsCache);
      billingPeriodSelectorSpecifier = self->_billingPeriodSelectorSpecifier;
      self->_billingPeriodSelectorSpecifier = v9;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_billingCycleDelegate);
    -[PSBillingPeriodSelectorSpecifier setDelegate:](self->_billingPeriodSelectorSpecifier, "setDelegate:", WeakRetained);

    objc_msgSend(v5, "insertObject:atIndex:", self->_billingPeriodSelectorSpecifier, 0);
    if (-[PSDataUsageStatisticsCache useCalendarMonthBillingCycle](self->_statisticsCache, "useCalendarMonthBillingCycle"))
    {
      -[PSUIAppDataUsageSpecifierFactory getLogger](self, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "Using calendar month billing cycle and adding total usage subgroup", v29, 2u);
      }

      p_totalUsageSubgroup = &self->_totalUsageSubgroup;
      totalUsageSubgroup = self->_totalUsageSubgroup;
      if (totalUsageSubgroup)
      {
        v15 = self->_billingPeriodSelectorSpecifier;
LABEL_18:
        -[PSUITotalCellularUsageSubgroup setBillingPeriodSource:](totalUsageSubgroup, "setBillingPeriodSource:", v15);
LABEL_22:
        -[PSUITotalCellularUsageSubgroup specifiers](*p_totalUsageSubgroup, "specifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v24);

        goto LABEL_23;
      }
      v19 = [PSUITotalCellularUsageSubgroup alloc];
      statisticsCache = self->_statisticsCache;
      v21 = self->_billingPeriodSelectorSpecifier;
      goto LABEL_21;
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Billing cycle not supported, adding standard total app usage headers.", v28, 2u);
    }

    -[PSUICarrierSpaceManager capabilities](self->_carrierSpaceManager, "capabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "supportsUsage");

    if ((v17 & 1) == 0)
    {
      -[PSUIAppDataUsageSpecifierFactory getLogger](self, "getLogger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "carrier space usage not supported, adding local total usage headers", v27, 2u);
      }

      p_totalUsageSubgroup = &self->_totalUsageSubgroup;
      totalUsageSubgroup = self->_totalUsageSubgroup;
      if (totalUsageSubgroup)
      {
        v15 = 0;
        goto LABEL_18;
      }
      v19 = [PSUITotalCellularUsageSubgroup alloc];
      statisticsCache = self->_statisticsCache;
      v21 = 0;
LABEL_21:
      v22 = -[PSUITotalCellularUsageSubgroup initWithStatisticsCache:andBillingPeriodSource:](v19, "initWithStatisticsCache:andBillingPeriodSource:", statisticsCache, v21);
      v23 = self->_totalUsageSubgroup;
      self->_totalUsageSubgroup = v22;

      goto LABEL_22;
    }
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Sort options"), 0, 0, 0, 0, 4, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "addObject:", v25);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingContentSpecifiers:", v26);

}

- (void)addAppUsageSpecifiersToContentSpecifiers:(id)a3
{
  PSUIAppsAndCategoriesDataUsageSubgroup *v4;
  id WeakRetained;
  PSUIAppsAndCategoriesDataUsageSubgroup *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSArray *bundleIDs;
  PSUIAppsAndCategoriesDataUsageSubgroup *v22;
  id v23;
  NSArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_policySpecifierDelegate);
  v6 = -[PSUIAppsAndCategoriesDataUsageSubgroup initWithPolicySpecifierDelegate:statisticsCache:](v4, "initWithPolicySpecifierDelegate:statisticsCache:", WeakRetained, self->_statisticsCache);

  +[CTUIDataUsageSorting userSelectedComparator](CTUIDataUsageSorting, "userSelectedComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  -[PSUIAppsAndCategoriesDataUsageSubgroup specifiersWithSortComparator:](v6, "specifiersWithSortComparator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "setBillingPeriodSource:", self->_billingPeriodSelectorSpecifier);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v14, "subcategorySpecifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "setBillingPeriodSource:", self->_billingPeriodSelectorSpecifier);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v17);
          }
        }
        else
        {
          objc_msgSend(v14, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v24, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAppSpecifiers:", v20);

  bundleIDs = self->_bundleIDs;
  self->_bundleIDs = v24;

}

- (void)addTrailingSpecifiersToContentSpecifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "appSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[PSUIAppDataUsageSpecifierFactory getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "No app usage specifiers, adding No Usage specifier", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v13 = CFSTR("APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE");
    else
      v13 = CFSTR("APPS_APPEAR_AFTER_CELLULAR_USAGE");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D5028C8, CFSTR("Cellular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, 0, 0, 0, 0, 3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v5, "addObject:", v15);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingContentSpecifiers:", v16);

}

- (void)refreshOrderingOfContentSpecifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  -[PSUIAppDataUsageSpecifierFactory getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Sorting app specifiers", v6, 2u);
  }

  -[PSUICellularUsageContentSpecifiers appSpecifiers](self->_savedContentSpecifiers, "appSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CTUIDataUsageSorting userSelectedComparator](CTUIDataUsageSorting, "userSelectedComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingComparator:", v5);

}

- (void)setGroupSpecifierTitle:(id)a3
{
  PSUICellularUsageContentSpecifiers *savedContentSpecifiers;
  NSArray *savedHeaderSpecifiers;
  id v7;

  objc_storeStrong((id *)&self->_groupSpecifierTitle, a3);
  v7 = a3;
  savedContentSpecifiers = self->_savedContentSpecifiers;
  self->_savedContentSpecifiers = 0;

  savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  self->_savedHeaderSpecifiers = 0;

}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PSUICellularUsageLayoutGroup"));
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

- (PSBillingPeriodSelectorSpecifierDelegate)billingCycleDelegate
{
  return (PSBillingPeriodSelectorSpecifierDelegate *)objc_loadWeakRetained((id *)&self->_billingCycleDelegate);
}

- (void)setBillingCycleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_billingCycleDelegate, a3);
}

- (PSAppCellularUsageSpecifierDelegate)policySpecifierDelegate
{
  return (PSAppCellularUsageSpecifierDelegate *)objc_loadWeakRetained((id *)&self->_policySpecifierDelegate);
}

- (void)setPolicySpecifierDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_policySpecifierDelegate, a3);
}

- (NSString)groupSpecifierTitle
{
  return self->_groupSpecifierTitle;
}

- (NSArray)savedHeaderSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSavedHeaderSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PSUICellularUsageContentSpecifiers)savedContentSpecifiers
{
  return (PSUICellularUsageContentSpecifiers *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSavedContentSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup
{
  return self->_totalUsageSubgroup;
}

- (void)setTotalUsageSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_totalUsageSubgroup, a3);
}

- (PSBillingPeriodSelectorSpecifier)billingPeriodSelectorSpecifier
{
  return self->_billingPeriodSelectorSpecifier;
}

- (void)setBillingPeriodSelectorSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_billingPeriodSelectorSpecifier, a3);
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_billingPeriodSelectorSpecifier, 0);
  objc_storeStrong((id *)&self->_totalUsageSubgroup, 0);
  objc_storeStrong((id *)&self->_savedContentSpecifiers, 0);
  objc_storeStrong((id *)&self->_savedHeaderSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifierTitle, 0);
  objc_destroyWeak((id *)&self->_policySpecifierDelegate);
  objc_destroyWeak((id *)&self->_billingCycleDelegate);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
}

@end
