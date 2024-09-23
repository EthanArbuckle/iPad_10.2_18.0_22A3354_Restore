@implementation PSUIAppsAndCategoriesDataUsageSubgroup

- (PSUIAppsAndCategoriesDataUsageSubgroup)initWithPolicySpecifierDelegate:(id)a3 statisticsCache:(id)a4
{
  id v6;
  id v7;
  PSUIAppsAndCategoriesDataUsageSubgroup *v8;
  PSUIAppsAndCategoriesDataUsageSubgroup *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIAppsAndCategoriesDataUsageSubgroup;
  v8 = -[PSUIAppsAndCategoriesDataUsageSubgroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_specifierDelegate, v6);
    objc_storeStrong((id *)&v9->_statisticsCache, a4);
  }

  return v9;
}

- (id)specifiersWithSortComparator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PSDataUsageStatisticsCache bundleIDsForAppType:](self->_statisticsCache, "bundleIDsForAppType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count") + 4);
  -[PSUIAppsAndCategoriesDataUsageSubgroup usageSpecifiersForAppType:bundleIDs:](self, "usageSpecifiersForAppType:bundleIDs:", 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  -[PSUIAppsAndCategoriesDataUsageSubgroup addDataUsageCategorySpecifierToSpecifiers:appType:](self, "addDataUsageCategorySpecifierToSpecifiers:appType:", v6, 2);
  -[PSUIAppsAndCategoriesDataUsageSubgroup addDataUsageCategorySpecifierToSpecifiers:appType:](self, "addDataUsageCategorySpecifierToSpecifiers:appType:", v6, 3);
  -[PSUIAppsAndCategoriesDataUsageSubgroup addDataUsageCategorySpecifierToSpecifiers:appType:](self, "addDataUsageCategorySpecifierToSpecifiers:appType:", v6, 1);
  -[PSUIAppsAndCategoriesDataUsageSubgroup addDataUsageCategorySpecifierToSpecifiers:appType:](self, "addDataUsageCategorySpecifierToSpecifiers:appType:", v6, 4);
  if (v4)
    objc_msgSend(v6, "sortUsingComparator:", v4);

  return v6;
}

- (void)addDataUsageCategorySpecifierToSpecifiers:(id)a3 appType:(unint64_t)a4
{
  void *v6;
  void *v7;
  PSUIDataUsageCategorySpecifier *v8;
  id v9;

  v9 = a3;
  -[PSDataUsageStatisticsCache bundleIDsForAppType:](self->_statisticsCache, "bundleIDsForAppType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppsAndCategoriesDataUsageSubgroup usageSpecifiersForAppType:bundleIDs:](self, "usageSpecifiersForAppType:bundleIDs:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[PSUIDataUsageCategorySpecifier initWithType:subSpecifiers:]([PSUIDataUsageCategorySpecifier alloc], "initWithType:subSpecifiers:", a4, v7);
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (id)usageSpecifiersForAppType:(unint64_t)a3 bundleIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  PSDataUsageStatisticsCache *statisticsCache;
  uint64_t v32;
  id v34;
  void *v35;
  unint64_t v36;
  PSUIAppsAndCategoriesDataUsageSubgroup *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    -[PSDataUsageStatisticsCache displayNamesForBundleIDs:appType:](self->_statisticsCache, "displayNamesForBundleIDs:appType:", v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v34 = v6;
    obj = v6;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v42)
    {
      v9 = *(_QWORD *)v44;
      v40 = *(_QWORD *)v44;
      v36 = a3;
      v37 = self;
      v35 = v7;
      v38 = v8;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          v14 = &stru_24D5028C8;
          if (v12)
            v14 = (__CFString *)v12;
          v15 = v14;

          switch(a3)
          {
            case 0uLL:
              objc_msgSend(MEMORY[0x24BE85670], "appSpecifierWithBundleID:name:statisticsCache:", v11, v15, self->_statisticsCache);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[PSUIAppsAndCategoriesDataUsageSubgroup specifierDelegate](self, "specifierDelegate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setDelegate:", v17);

              break;
            case 1uLL:
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85690]), "initWithType:bundleID:name:statisticsCache:", 1, v11, v15, self->_statisticsCache);
              -[PSDataUsageStatisticsCache usageForBundleID:inPeriod:](self->_statisticsCache, "usageForBundleID:inPeriod:", v11, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "native");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v39, "cellularHome");
                objc_msgSend(v19, "native");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "cellularRoaming") + v20;
                objc_msgSend(v19, "proxied");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "cellularHome");
                objc_msgSend(v19, "proxied");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v22 + v24 + objc_msgSend(v25, "cellularRoaming");

                self = v37;
                -[PSUIAppsAndCategoriesDataUsageSubgroup getLogger](v37, "getLogger");
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26)
                {
                  v9 = v40;
                  if (v28)
                  {
                    *(_DWORD *)buf = 138478083;
                    v48 = v11;
                    v49 = 2048;
                    v50 = v26;
                    _os_log_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@ is an uninstalled app using %zu bytes", buf, 0x16u);
                  }
                  v7 = v35;
                  a3 = v36;
                }
                else
                {
                  v7 = v35;
                  v9 = v40;
                  if (v28)
                  {
                    *(_DWORD *)buf = 138477827;
                    v48 = v11;
                    _os_log_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@ is an uninstalled app using zero bytes", buf, 0xCu);
                  }
                  a3 = v36;
                }
              }
              else
              {
                -[PSUIAppsAndCategoriesDataUsageSubgroup getLogger](self, "getLogger");
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138477827;
                  v48 = v11;
                  _os_log_error_impl(&dword_2161C6000, v27, OS_LOG_TYPE_ERROR, "%{private}@ is an uninstalled app without usage?", buf, 0xCu);
                }
              }

              v8 = v38;
              break;
            case 2uLL:
              objc_msgSend(MEMORY[0x24BE856B0], "appSpecifierWithBundleID:name:statisticsCache:", v11, v15, self->_statisticsCache);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[PSUIAppsAndCategoriesDataUsageSubgroup specifierDelegate](self, "specifierDelegate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setDelegate:", v29);

              v9 = v40;
              break;
            case 3uLL:
              v30 = objc_alloc(MEMORY[0x24BE85690]);
              statisticsCache = self->_statisticsCache;
              v32 = 3;
              goto LABEL_19;
            case 4uLL:
              v30 = objc_alloc(MEMORY[0x24BE85690]);
              statisticsCache = self->_statisticsCache;
              v32 = 4;
LABEL_19:
              v16 = (void *)objc_msgSend(v30, "initWithType:bundleID:name:statisticsCache:", v32, v11, v15, statisticsCache);
              break;
            default:
              v16 = 0;
              break;
          }
          objc_msgSend(v7, "addObject:", v16);

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v42);
    }

    v6 = v34;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppsAndCategoriesDataUsage"));
}

- (PSAppCellularUsageSpecifierDelegate)specifierDelegate
{
  return (PSAppCellularUsageSpecifierDelegate *)objc_loadWeakRetained((id *)&self->_specifierDelegate);
}

- (void)setSpecifierDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_specifierDelegate, a3);
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_specifierDelegate);
}

@end
