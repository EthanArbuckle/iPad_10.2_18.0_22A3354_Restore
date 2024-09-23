@implementation WeatherCloudPreferences

- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3
{
  id v4;
  void *v5;
  WeatherCloudPreferences *v6;

  v4 = a3;
  +[WeatherCloudPersistence cloudPersistenceWithDelegate:](WeatherCloudPersistence, "cloudPersistenceWithDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WeatherCloudPreferences initWithLocalPreferences:persistence:](self, "initWithLocalPreferences:persistence:", v4, v5);

  return v6;
}

- (WeatherCloudPreferences)initWithLocalPreferences:(id)a3 persistence:(id)a4
{
  id v6;
  id v7;
  WeatherCloudPreferences *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  WeatherCloudPreferences *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (+[WeatherCloudPersistence processIsWhitelistedForSync](WeatherCloudPersistence, "processIsWhitelistedForSync")&& (v16.receiver = self, v16.super_class = (Class)WeatherCloudPreferences, v8 = -[WeatherCloudPreferences init](&v16, sel_init), (self = v8) != 0))
  {
    -[WeatherCloudPreferences setLocalPreferences:](v8, "setLocalPreferences:", v6);
    -[WeatherCloudPreferences setCloudStore:](self, "setCloudStore:", v7);
    -[WeatherCloudPreferences purgeLegacyCloudCities](self, "purgeLegacyCloudCities");
    objc_opt_class();
    v9 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherCloudPreferences cloudStore](self, "cloudStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_cloudCitiesChangedExternally_, CFSTR("WeatherCloudStoreChangedExternally"), v13);

    self = self;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)purgeLegacyCloudCities
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WeatherCloudPreferences cloudStore](self, "cloudStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CloudCities"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[WeatherCloudPreferences cloudStore](self, "cloudStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("CloudCities"));

    -[WeatherCloudPreferences cloudStore](self, "cloudStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronize");

  }
}

- (void)setSyncDelegate:(id)a3
{
  id v4;
  SynchronizedDefaultsDelegate **p_syncDelegate;
  id WeakRetained;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_syncDelegate = &self->_syncDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_syncDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)p_syncDelegate, v4);
    WALogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] CloudPreferences setting syncDelegate to %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (id)cloudRepresentationFromCities:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_11);
}

id __57__WeatherCloudPreferences_cloudRepresentationFromCities___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cloudDictionaryRepresentationOfCity:](CityPersistenceConversions, "cloudDictionaryRepresentationOfCity:", a2);
}

- (id)citiesByEnforcingSizeLimitOnResults:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 0x14)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 20, objc_msgSend(v3, "count") - 20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WALogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] City list exceeds size limit after sync, dropping %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "subarrayWithRange:", 0, 20);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)areCloudCities:(id)a3 equalToLocalCities:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "na_filter:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v5, "na_map:", &__block_literal_global_8_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "count");
  if (v10 == objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isDuplicateOfCity:", v13);

        if ((v14 & 1) == 0)
          break;
        ++v11;
      }
      while (v11 < objc_msgSend(v7, "count"));
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    WALogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_21AAEC000, v15, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Cloud and local cities arrays are different lengths.\nConverted cloud cities: %@\nConverted local cities: %@\n", (uint8_t *)&v17, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

uint64_t __61__WeatherCloudPreferences_areCloudCities_equalToLocalCities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalWeatherCity") ^ 1;
}

id __61__WeatherCloudPreferences_areCloudCities_equalToLocalCities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityFromCloudDictionary:](CityPersistenceConversions, "cityFromCloudDictionary:", a2);
}

- (void)cloudCitiesChangedExternally:(id)a3
{
  id v4;
  NSObject *v5;
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
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  WALogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] CloudCitiesChangedExternally received", buf, 2u);
  }

  v6 = (void *)MEMORY[0x24BDBCEB8];
  -[WeatherCloudPreferences localPreferences](self, "localPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadSavedCities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WeatherCloudPreferences cloudStore](self, "cloudStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CloudCities_v2.0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("WeatherCloudStoreIsInitialSyncKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  -[WeatherCloudPreferences reconcileCloudCities:withLocal:isInitialSync:](self, "reconcileCloudCities:withLocal:isInitialSync:", v11, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WeatherCloudPreferences areCloudCities:equalToLocalCities:](self, "areCloudCities:equalToLocalCities:", v11, v9)|| (_DWORD)v14)
  {
    -[WeatherCloudPreferences updateLocalStoreWithRemoteChanges:](self, "updateLocalStoreWithRemoteChanges:", v15);
    if ((_DWORD)v14)
      -[WeatherCloudPreferences saveCitiesToCloud:](self, "saveCitiesToCloud:", v15);
  }
  else
  {
    WALogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] No changes after reconciling cloud with local", v17, 2u);
    }

  }
}

- (void)updateLocalStoreWithRemoteChanges:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Updating local store with reconciled changes: %@", (uint8_t *)&v8, 0xCu);
  }

  -[WeatherCloudPreferences localPreferences](self, "localPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveToDiskWithCities:activeCity:", v4, 0);

  -[WeatherCloudPreferences syncDelegate](self, "syncDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ubiquitousDefaultsDidChange:", v4);

}

- (id)reconcileCloudCities:(id)a3 withLocal:(id)a4 isInitialSync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  WALogForCategory(5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "na_map:", &__block_literal_global_10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v11;
    _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Preparing to reconcile local data with cities from cloud: %@", buf, 0xCu);

  }
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("AlwaysUseLocallyAvailableSavedCities"));

  if (v13)
  {
    WALogForCategory(5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "[WeatherKVS] AlwaysUseLocallyAvailableSavedCities = 1, drop cloud cities and use saved cities.";
LABEL_10:
      _os_log_impl(&dword_21AAEC000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!v8 && v5)
  {
    WALogForCategory(5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "[WeatherKVS] No cities present in cloud on initial sync. Keeping local cities.";
      goto LABEL_10;
    }
LABEL_11:

    v16 = v9;
    goto LABEL_28;
  }
  if (v8 || v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WeatherCloudPreferences prepareLocalCitiesForReconciliation:isInitialSync:](self, "prepareLocalCitiesForReconciliation:isInitialSync:", v9, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_15;
      v34[3] = &unk_24DD9D768;
      v22 = v19;
      v35 = v22;
      objc_msgSend(v20, "na_each:", v34);
      WALogForCategory(5);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v20;
        _os_log_impl(&dword_21AAEC000, v23, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Initial sync - merging data from cloud with local cities: %@", buf, 0xCu);
      }

      v29 = v21;
      v30 = 3221225472;
      v31 = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_17;
      v32 = &unk_24DD9D740;
      v24 = v20;
      v33 = v24;
      objc_msgSend(v22, "na_filter:", &v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v24, v29, v30, v31, v32);
      objc_msgSend(v18, "addObjectsFromArray:", v25);
      WALogForCategory(5);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl(&dword_21AAEC000, v26, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Initial sync - merge results: %@", buf, 0xCu);
      }

      -[WeatherCloudPreferences citiesByEnforcingSizeLimitOnResults:](self, "citiesByEnforcingSizeLimitOnResults:", v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WALogForCategory(5);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AAEC000, v27, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] Not initial sync, so replacing local cities with list from cloud", buf, 2u);
      }

      objc_msgSend(v18, "addObjectsFromArray:", v19);
      -[WeatherCloudPreferences citiesByEnforcingSizeLimitOnResults:](self, "citiesByEnforcingSizeLimitOnResults:", v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    WALogForCategory(5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v17, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] All cities deleted from cloud. Resetting local store to the default city list", buf, 2u);
    }

    -[WeatherCloudPreferences localPreferences](self, "localPreferences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_defaultCities");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_28:
  return v16;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BEC2158]);
}

id __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    +[CityPersistenceConversions cityFromCloudDictionary:](CityPersistenceConversions, "cityFromCloudDictionary:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  objc_msgSend(v11, "searchTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2;
    v12[3] = &unk_24DD9D740;
    v6 = v11;
    v13 = v6;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "searchTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSearchTitle:", v9);

      objc_msgSend(v8, "searchSubtitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSearchSubtitle:", v10);

    }
    v4 = v11;
  }

}

BOOL __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "isDuplicateOfCity:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "searchTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2_18;
  v8[3] = &unk_24DD9D740;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

uint64_t __72__WeatherCloudPreferences_reconcileCloudCities_withLocal_isInitialSync___block_invoke_2_18(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDuplicateOfCity:", a2);
}

- (id)prepareLocalCitiesForReconciliation:(id)a3 isInitialSync:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v4 = a4;
  v6 = a3;
  if (v4
    && (-[WeatherCloudPreferences localPreferences](self, "localPreferences"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[WeatherCloudPreferences cloudRepresentationFromCities:](self, "cloudRepresentationFromCities:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "areCitiesDefault:", v8),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (void)forceSync
{
  -[WeatherCloudPreferences _synchronize:](self, "_synchronize:", 1);
}

- (void)cloudPersistenceDidSynchronize:(id)a3
{
  -[WeatherCloudPreferences _synchronize:](self, "_synchronize:", 0);
}

- (void)_synchronize:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  -[WeatherCloudPreferences cloudStore](self, "cloudStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CloudCities_v2.0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WeatherCloudPreferences localPreferences](self, "localPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadSavedCities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WALogForCategory(5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "valueForKeyPath:", *MEMORY[0x24BEC2158]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[WeatherCloudPreferences _synchronize:]";
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_INFO, "%s Cloud cities: %@", (uint8_t *)&v16, 0x16u);

  }
  WALogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[WeatherCloudPreferences _synchronize:]";
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_21AAEC000, v11, OS_LOG_TYPE_INFO, "%s Local cities: %@", (uint8_t *)&v16, 0x16u);

  }
  if (!-[WeatherCloudPreferences areCloudCities:equalToLocalCities:](self, "areCloudCities:equalToLocalCities:", v6, v8))
  {
    WALogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_DEFAULT, "[WeatherKVS] New cloud data detected after synchronizing", (uint8_t *)&v16, 2u);
    }

    -[WeatherCloudPreferences prepareLocalCitiesForReconciliation:isInitialSync:](self, "prepareLocalCitiesForReconciliation:isInitialSync:", v8, v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherCloudPreferences reconcileCloudCities:withLocal:isInitialSync:](self, "reconcileCloudCities:withLocal:isInitialSync:", v6, v14, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherCloudPreferences updateLocalStoreWithRemoteChanges:](self, "updateLocalStoreWithRemoteChanges:", v15);

  }
}

- (void)setCloudStoreCities:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_22);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WeatherCloudPreferences cloudStore](self, "cloudStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("CloudCities_v2.0"));

}

BOOL __47__WeatherCloudPreferences_setCloudStoreCities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

- (void)saveCitiesToCloud:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "na_filter:", &__block_literal_global_23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WeatherCloudPreferences shouldWriteCitiesToCloud:](self, "shouldWriteCitiesToCloud:", v4))
  {
    -[WeatherCloudPreferences cloudRepresentationFromCities:](self, "cloudRepresentationFromCities:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherCloudPreferences setCloudStoreCities:](self, "setCloudStoreCities:", v5);

    -[WeatherCloudPreferences cloudStore](self, "cloudStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronize");

    WALogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      v8 = "[WeatherKVS] Saved cities to cloud store: %@";
      v9 = v7;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    WALogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v8 = "[WeatherKVS] Skipping cloud save request - cloud already matches local.";
      v9 = v7;
      v10 = 2;
      goto LABEL_6;
    }
  }

}

uint64_t __45__WeatherCloudPreferences_saveCitiesToCloud___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalWeatherCity") ^ 1;
}

- (BOOL)shouldWriteCitiesToCloud:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WeatherCloudPreferences localPreferences](self, "localPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherCloudPreferences cloudRepresentationFromCities:](self, "cloudRepresentationFromCities:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "areCitiesDefault:", v6);

  if ((v7 & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    -[WeatherCloudPreferences cloudStore](self, "cloudStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("CloudCities_v2.0"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = !-[WeatherCloudPreferences areCloudCities:equalToLocalCities:](self, "areCloudCities:equalToLocalCities:", v10, v4);

  }
  return v8;
}

- (WeatherPreferencesPersistence)cloudStore
{
  return self->_cloudStore;
}

- (void)setCloudStore:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStore, a3);
}

- (SynchronizedDefaultsDelegate)syncDelegate
{
  return (SynchronizedDefaultsDelegate *)objc_loadWeakRetained((id *)&self->_syncDelegate);
}

- (WeatherPreferences)localPreferences
{
  return (WeatherPreferences *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPreferences, 0);
  objc_destroyWeak((id *)&self->_syncDelegate);
  objc_storeStrong((id *)&self->_cloudStore, 0);
}

@end
