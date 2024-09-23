@implementation WKWebsiteDataStore(SafariSharedExtras)

+ (uint64_t)safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 1, 1);
}

+ (void)safari_fetchExistingDataStoresForProfilesWithIdentifiers:()SafariSharedExtras completionHandler:
{
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D8A2D8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __117__WKWebsiteDataStore_SafariSharedExtras__safari_fetchExistingDataStoresForProfilesWithIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E5449458;
  v15 = v8;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(a1, "_fetchAllIdentifiers:", v11);

}

+ (id)_safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras createIfNecessary:cacheNewDataStoreInMemory:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;

  v7 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0D8A2D8], "isEqualToString:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "_dataStoresByProfileIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = 1;
    else
      v11 = a4 == 0;
    if (!v11)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CEF650], "_newDataStoreForProfileIdentifier:", v7);
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CEF650], "_dataStoresByProfileIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v7);

      }
    }
    v8 = v10;

  }
  return v8;
}

+ (id)safari_allPersistentDataStores
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEF650], "_dataStoresByProfileIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)safari_defaultDataStore
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)safari_defaultDataStore_dataStore;
  if (!safari_defaultDataStore_dataStore)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CEF738]);
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_setCommonProperties:", v1);
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF650]), "_initWithConfiguration:", v1);
    v3 = (void *)safari_defaultDataStore_dataStore;
    safari_defaultDataStore_dataStore = v2;

    v0 = (void *)safari_defaultDataStore_dataStore;
  }
  return v0;
}

+ (void)safari_setCommonProperties:()SafariSharedExtras
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setFastServerTrustEvaluationEnabled:", 1);
  objc_msgSend(v3, "setNetworkCacheSpeculativeValidationEnabled:", 1);

}

+ (id)_dataStoresByProfileIdentifier
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
  if (!_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
    _dataStoresByProfileIdentifier_dataStoresByProfileIdentifier = v1;

    v0 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
  }
  return v0;
}

+ (id)safari_allDataTypes
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEF650], "allWebsiteDataTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF8A0]);
  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF898]);
  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF8A8]);
  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF890]);
  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF880]);
  objc_msgSend(v1, "addObject:", *MEMORY[0x1E0CEF888]);
  return v1;
}

+ (void)safari_clearHSTSSuperCookies
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v0 = (id)_CFNetworkCopyHSTSPolicies();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(v0);
        v5 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v5, "hasSuffix:", CFSTR("ctoid.net")) & 1) != 0
          || objc_msgSend(v5, "hasSuffix:", CFSTR("ar1d.net")))
        {
          objc_msgSend(v0, "objectForKeyedSubscript:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_kCFNetworkHSTSPreloaded"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
          {
            v8 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@/"), v5);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "URLWithString:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            _CFNetworkResetHSTS();
          }

        }
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v2);
  }

}

+ (uint64_t)safari_dataStoreWithoutCachingForProfileWithIdentifier:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 1, 0);
}

+ (uint64_t)safari_dataStoreForProfileWithIdentifierIfExists:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 0, 0);
}

+ (void)safari_removeDataStoreForProfileWithIdentifier:()SafariSharedExtras completionHandler:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CEF650];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "_dataStoresByProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v7);

  v9 = (void *)MEMORY[0x1E0CEF650];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);

  objc_msgSend(v9, "_removeDataStoreWithIdentifier:completionHandler:", v10, v6);
}

+ (uint64_t)_newDataStoreForProfileIdentifier:()SafariSharedExtras
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CEF738];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);

  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_setCommonProperties:", v7);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF650]), "_initWithConfiguration:", v7);

  return v8;
}

+ (id)safari_nonPersistentDataStore
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF738]), "initNonPersistentConfiguration");
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_setCommonProperties:", v0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF650]), "_initWithConfiguration:", v0);

  return v1;
}

+ (id)safari_dataStoreWithConfiguration:()SafariSharedExtras
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CEF650];
  v4 = a3;
  objc_msgSend(v3, "safari_setCommonProperties:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF650]), "_initWithConfiguration:", v4);

  return v5;
}

- (id)safari_profileIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)*MEMORY[0x1E0D8A2D8];
  v5 = v3;

  return v5;
}

@end
