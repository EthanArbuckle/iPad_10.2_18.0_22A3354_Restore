@implementation FedStatsCohortQueryInstalledApps

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0E0DD0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)INTENT_MEDIA_SUPPORTED_CATEGORIES;
    INTENT_MEDIA_SUPPORTED_CATEGORIES = v2;

    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObjects:", v14, v7, v9, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)INTENT_MEDIA_SUPPORTED_INTENTS;
    INTENT_MEDIA_SUPPORTED_INTENTS = v12;

  }
}

- (FedStatsCohortQueryInstalledApps)init
{
  FedStatsCohortQueryInstalledApps *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *domainToInstalledApps;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)FedStatsCohortQueryInstalledApps;
  v2 = -[FedStatsCohortQueryInstalledApps init](&v10, sel_init);
  if (v2)
  {
    v11[0] = CFSTR("media");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("phone");
    v12[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    domainToInstalledApps = v2->_domainToInstalledApps;
    v2->_domainToInstalledApps = (NSDictionary *)v5;

    -[FedStatsCohortQueryInstalledApps resolveDomainToBundleIds](v2, "resolveDomainToBundleIds");
    -[NSDictionary objectForKeyedSubscript:](v2->_domainToInstalledApps, "objectForKeyedSubscript:", CFSTR("media"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numOfMediaApps = objc_msgSend(v7, "count");

    -[NSDictionary objectForKeyedSubscript:](v2->_domainToInstalledApps, "objectForKeyedSubscript:", CFSTR("phone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numOfPhoneApps = objc_msgSend(v8, "count");

  }
  return v2;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid call to FedStatsCohortQueryInstalledApps#.cohortKeyForParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a4;
  *a4 = v6;

  return 0;
}

+ (id)cohortInstance
{
  return objc_alloc_init((Class)a1);
}

- (void)resolveDomainToBundleIds
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSDictionary *domainToInstalledApps;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  NSObject *v10;
  int v11;
  NSDictionary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[_PFLLog framework](_PFLLog, "framework");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_213C25000, v3, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds start.", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCohortQueryInstalledApps lsAppRecords](self, "lsAppRecords");
  -[FedStatsCohortQueryInstalledApps lsPluginKitExtensions](self, "lsPluginKitExtensions");
  -[FedStatsCohortQueryInstalledApps applyFilteringForMediaDomain](self, "applyFilteringForMediaDomain");
  +[_PFLLog framework](_PFLLog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    domainToInstalledApps = self->_domainToInstalledApps;
    v11 = 138412290;
    v12 = domainToInstalledApps;
    _os_log_impl(&dword_213C25000, v5, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds resolved domain to bundle ids: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v4);
  v9 = v8;

  +[_PFLLog framework](_PFLLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v9;
    _os_log_impl(&dword_213C25000, v10, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds complete in %fms", (uint8_t *)&v11, 0xCu);
  }

}

- (void)lsAppRecords
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  InstalledApp *v13;
  void *v14;
  FedStatsCohortQueryInstalledApps *v15;
  id *v16;
  void *v17;
  InstalledApp *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)v4;
    v7 = (id *)&off_24D0D7000;
    *(_QWORD *)&v5 = 138412802;
    v23 = v5;
    v24 = v3;
    do
    {
      objc_msgSend(v6, "bundleIdentifier", v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v6, "supportedIntentMediaCategories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "supportedIntents");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[FedStatsCohortQueryInstalledApps _isSupportedIntentMediaApp:::](self, "_isSupportedIntentMediaApp:::", v8, v11, v12))
        {
          v13 = [InstalledApp alloc];
          objc_msgSend(v6, "supportedIntentMediaCategories");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localizedName");
          v15 = self;
          v16 = v7;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[InstalledApp initWithBundleIdentifier:supportedMediaCategories:supportedIntents:appName:](v13, "initWithBundleIdentifier:supportedMediaCategories:supportedIntents:appName:", v8, v14, v12, v17);

          v7 = v16;
          self = v15;

          -[NSDictionary objectForKeyedSubscript:](v15->_domainToInstalledApps, "objectForKeyedSubscript:", CFSTR("media"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v18);

          objc_msgSend(*v7, "framework");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v6, "supportedIntentMediaCategories");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v26 = v8;
            v27 = 2112;
            v28 = v12;
            v29 = 2112;
            v30 = v22;
            _os_log_debug_impl(&dword_213C25000, v20, OS_LOG_TYPE_DEBUG, "bundle record: %@ has supported intent %@ and supported media categories: %@", buf, 0x20u);

          }
          v3 = v24;
        }

      }
      else
      {
        objc_msgSend(*v7, "framework");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          _os_log_error_impl(&dword_213C25000, v11, OS_LOG_TYPE_ERROR, "Error enumerating app records; app record: %@ has nil bundle identifier",
            buf,
            0xCu);
        }
      }

      objc_msgSend(v3, "nextObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v21;
    }
    while (v21);
  }

}

- (void)lsPluginKitExtensions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FedStatsCohortQueryInstalledApps *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)INTENT_MEDIA_SUPPORTED_INTENTS, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD9958];
  v5 = *MEMORY[0x24BDD98C0];
  v12[0] = *MEMORY[0x24BDD0C48];
  v12[1] = v5;
  v13[0] = v4;
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke;
  v9[3] = &unk_24D0D7628;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "enumeratePluginsMatchingQuery:withBlock:", v8, v9);

}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  InstalledApp *v12;
  void *v13;
  InstalledApp *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[_PFLLog framework](_PFLLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(a1, v6, v7);
  }
  else
  {
    objc_msgSend(v5, "containingBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      INSupportedMediaCategories();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:inScope:", *MEMORY[0x24BDD98C8], objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 40), "_isSupportedIntentMediaApp:::", v7, v10, v11))
      {
        v12 = [InstalledApp alloc];
        objc_msgSend(v10, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[InstalledApp initWithBundleIdentifier:supportedMediaCategories:supportedIntents:appName:](v12, "initWithBundleIdentifier:supportedMediaCategories:supportedIntents:appName:", v7, v13, v11, 0);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", CFSTR("media"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v14);

        +[_PFLLog framework](_PFLLog, "framework");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412802;
          v19 = v17;
          v20 = 2112;
          v21 = v11;
          v22 = 2112;
          v23 = v10;
          _os_log_debug_impl(&dword_213C25000, v16, OS_LOG_TYPE_DEBUG, "pluginkit record: %@ has supported intent %@ and supported media categories: %@", (uint8_t *)&v18, 0x20u);

        }
      }

    }
    else
    {
      +[_PFLLog framework](_PFLLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1((uint64_t)v5, v9);
    }

  }
}

- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", INTENT_MEDIA_SUPPORTED_CATEGORIES);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intersectSet:", v8);
    if (objc_msgSend(v12, "count") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", INTENT_MEDIA_SUPPORTED_INTENTS);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intersectSet:", v14);

      v10 = objc_msgSend(v13, "count") != 0;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)applyFilteringForMediaDomain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FedStatsCohortQueryInstalledApps domainToInstalledApps](self, "domainToInstalledApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("media"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsPassingTest:", &__block_literal_global_60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_61);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSet:", v5);
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_24D0E0DB8, "containsObject:", v2) ^ 1;

  return v3;
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "supportedIntents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "supportedMediaCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("INMediaCategoryVideo")) ^ 1;

  return v3;
}

- (unint64_t)numOfMediaApps
{
  return self->_numOfMediaApps;
}

- (unint64_t)numOfPhoneApps
{
  return self->_numOfPhoneApps;
}

- (NSDictionary)domainToInstalledApps
{
  return self->_domainToInstalledApps;
}

- (void)setDomainToInstalledApps:(id)a3
{
  objc_storeStrong((id *)&self->_domainToInstalledApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainToInstalledApps, 0);
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_213C25000, a2, OS_LOG_TYPE_ERROR, "Error enumerating plugins; missing containing bundle of plugin: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_213C25000, a3, OS_LOG_TYPE_ERROR, "Error enumerating plugins; matching query: %@, error: %@",
    (uint8_t *)&v6,
    0x16u);

}

@end
